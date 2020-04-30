#include "x86.h"
#include "device.h"
extern void Log(char *temp,...);

int row = 5;
int col = 0;
int timecounter = 0;

void timeHandle(struct TrapFrame *tf);

int processnum = 1;

// idle proc
struct ProcessTable *idleproc = NULL;
// current proc
struct ProcessTable *curproc = NULL;

void proc_run(struct ProcessTable *proc);
void cpu_idle();

void kernel_thread() {
    pcb[0].tf.cs = KSEL(SEG_KCODE);
    pcb[0].tf.ds = pcb[0].tf.es = pcb[0].tf.fs = pcb[0].tf.gs = pcb[0].tf.ss= KSEL(SEG_KDATA);
    Log("%d, %d, %d\n", pcb[0].tf.cs, pcb[0].tf.ds, pcb[0].tf.ss);
    pcb[0].tf.eip = (uint32_t)cpu_idle;
    pcb[0].esp0 = (uint32_t)(&(pcb[0].state));
    pcb[0].state = RUNNABLE;
    pcb[0].timeCount = 0;
    pcb[0].sleepTime = 0;
    pcb[0].pid = 0;    
    idleproc = &pcb[0];
}

void user_process(){
    pcb[1].tf.cs = USEL(SEG_UCODE);
    pcb[1].tf.ds = pcb[1].tf.es = pcb[1].tf.fs = pcb[1].tf.gs = pcb[1].tf.ss= USEL(SEG_UDATA);
    Log("%d, %d, %d\n", pcb[1].tf.cs, pcb[1].tf.ds, pcb[1].tf.ss);
    pcb[1].state = RUNNABLE;
    pcb[1].esp0 = (uint32_t)(&(pcb[1].state));
    pcb[1].timeCount = 10;
    pcb[1].sleepTime = 0;
    pcb[1].pid = 1;  
    processnum++;
}

void schedule()
{
	Log("schedule\n");
	int i = 1;
	for(i = 1; i < processnum; i++)
	{
		if(pcb[i].state == RUNNABLE && pcb[i].pid != curproc->pid)
		{
			struct ProcessTable * proc = &pcb[i];
			Log("%d, %d, yonghu\n", i, curproc->pid);
			proc_run(proc);
			break;
		}
	}
	if(i == processnum)
	{
		proc_run(idleproc);
	}
}

void cpu_idle() {
    asm volatile("sti");
    while(1)
    {
	Log("idle\n");
	asm volatile("hlt");
    }
}

void proc_run(struct ProcessTable *proc) {
        curproc = proc;
	Log("%x\n", curproc - pcb);
	Log("%x\n", curproc->tf.eip);
	curproc->sleepTime = 0;
	curproc->timeCount = 10;
	curproc->state = RUNNING;
	tss.ss0 = KSEL(SEG_KDATA);
	tss.esp0 = (int)(&curproc->state);
	asm volatile ("movl %0, %%esp" :: "r" (&curproc->tf));
        asm volatile ("popl %gs");
        asm volatile ("popl %fs");
        asm volatile ("popl %es");
        asm volatile ("popl %ds");
        asm volatile ("popal");
	asm volatile ("addl $8, %esp");
        asm volatile ("iret");
	Log("yyyyyyy\n");
}

void initProcess()
{
    processnum = 1;
    curproc = NULL;
    idleproc = NULL;
    asm volatile ("sti");
    kernel_thread();
    user_process();
    curproc = &pcb[1];	
}

void printch(char ch)
{
	int ascii = (int) ch;
        int num = (80 * row + col) * 2;
	int tmp = 0x0c;
	asm volatile("pushal");
        asm volatile("movl %0, %%edi" :: "m" (num)); 
	asm volatile("movb %0, %%ah" :: "m" (tmp));
	asm volatile("movb %0, %%al" :: "m" (ascii));             
        asm volatile("movw %ax, %gs:(%edi)");  
	asm volatile("popal");           
}

int fs_write(int fd, char *buf, int len) {
        int i;
        for(i = 0; i < len; i ++)
 	{
		if(buf[i] == '\n')
		{
			row++;
			col = 0;
		}
                else
		{
			printch(buf[i]);
			if(col + 1 > 80)
                	{
                        	col = col % 80;
                        	row++;
                	}
                	else
                	{
                        	col++;
                	}
		}
        }
	return len;
}

void sys_fork(struct TrapFrame *tf)
{
	Log("kkkkk\n");
	int i = 0;
	int childnum = 0;
	for(; i < processnum; i++)
	{
		if(pcb[i].state == DEAD)
		{
			childnum = i;
			break;
		}			
	}	
	if(i == processnum)
		childnum = i;
	processnum++;
	pcb[childnum] = *curproc;
	pcb[childnum].pid = childnum;
	pcb[childnum].state = RUNNABLE;
	pcb[childnum].timeCount = 10;
	pcb[childnum].tf.esp = (int)(&pcb[childnum].state);
	pcb[childnum].tf.eax = 0;
	pcb[childnum].tf.cs = USEL(SEG_UCODE1); 
	pcb[childnum].tf.ds = USEL(SEG_UDATA1);
	pcb[childnum].tf.ss = USEL(SEG_UDATA1);
	Log("%d, %d, %d\n", pcb[childnum].tf.cs, pcb[childnum].tf.ds, pcb[childnum].tf.ss);
	char* parentmem = (void*)0x200000;
	char* childmem = (void*)0x300000;
	for(int j = 0; j < 0x100000; j++)
		childmem[j] = parentmem[j];
	tf->eax = childnum;	
	Log("%d\n", tf->eax);
}

void sys_sleep(struct TrapFrame *tf)
{
	Log("%d\n", curproc->pid);
	int sleep_time = tf->eax;
	Log("%d\n", sleep_time);
	if(curproc->pid != 0)
	{
		curproc->sleepTime = sleep_time;
		curproc->state = BLOCKED;
		curproc->timeCount = 10;
		schedule();
		Log("vvvvvvvv\n");
	}
}

void sys_exit(struct TrapFrame *tf)
{
	if(curproc->pid != 0)
	{
		Log("hhhhhhh\n");
		curproc->state = DEAD;
		curproc->timeCount = 10;
		curproc->sleepTime = 0;
		schedule();
		Log("llllllll`\n");
	}
}

void sys_write(struct TrapFrame *tf) {
        tf->eax = fs_write(tf->ebx, (char*)tf->ecx, tf->edx);
}

void syscallHandle(struct TrapFrame *tf);

void GProtectFaultHandle(struct TrapFrame *tf);

void irqHandle(struct TrapFrame *tf) {
	/*
	 * 中断处理程序
	 */
	/* Reassign segment register */
	/*asm volatile ("movw %%ax, %%gs" :: "a" (KSEL(SEG_KDATA)));
        asm volatile ("movw %%ax, %%fs" :: "a" (KSEL(SEG_KDATA)));
        asm volatile ("movw %%ax, %%es" :: "a" (KSEL(SEG_KDATA)));*/
        asm volatile ("movw %%ax, %%ds" :: "a" (KSEL(SEG_KDATA)));

	switch(tf->irq) {
		case -1:
			break;
		case 0xd:
			GProtectFaultHandle(tf);
			break;
		case 0x20:
			timeHandle(tf);
			break;
		case 0x80:
			syscallHandle(tf);
			break;
		default:assert(0);
	}
}

void syscallHandle(struct TrapFrame *tf) {
	/* 实现系统调用*/
	switch(tf->eax) {
		case 0: sys_fork(tf); break;
		case 1: sys_sleep(tf); break;
		case 2: sys_exit(tf); break;
		case 4: sys_write(tf); break;
	}
}

void GProtectFaultHandle(struct TrapFrame *tf){
	assert(0);
	return;
}

void timeHandle(struct TrapFrame *tf){
	Log("zhongduan\n");
	timecounter++;
	if(curproc->pid != 0)
		curproc->timeCount--;
	for(int i = 1; i < processnum; i++)
	{
		if(pcb[i].state == BLOCKED)
		{
			pcb[i].sleepTime--;
			if(pcb[i].sleepTime == 0)
			{
				pcb[i].state = RUNNABLE;
				if(curproc->pid == 0)
					schedule();
			}
		}
	}
	if(curproc->pid != 0 && curproc->timeCount == 0)
        {
		Log("aagaghh\n");
		curproc->state = RUNNABLE;
		curproc->timeCount = 10;
                schedule();
        }
}
