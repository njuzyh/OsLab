#include "x86.h" 
#include "device.h"
extern void Log(char *temp,...);

int flag = 0;

int scancode[47] = {0x1e, 0x30, 0x2e, 0x20, 0x12, 0x21, 0x22, 0x23, 0x17, 0x24, 0x25, 0x26, 0x32, 0x31, 0x18, 0x19, 0x10, 0x13, 0x1f, 0x14, 0x16, 0x2f, 0x11, 0x2d, 0x15, 0x2c, 0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7, 0x8, 0x9, 0xa, 0xb, 0xc, 0xd, 0x1a, 0x1b, 0x27, 0x28, 0x2b, 0x33, 0x34, 0x35};

int breakcode[47] = {0x9e, 0xb0, 0xae, 0xa0, 0x92, 0xa1, 0xa2, 0xa3, 0x97, 0xa4, 0xa5, 0xa6, 0xb2, 0xb1, 0x98, 0x99, 0x90, 0x93, 0x9f, 0x94, 0x96, 0xaf, 0x91, 0xad, 0x95, 0xac, 0xa9, 0x82, 0x83, 0x84, 0x85, 0x86, 0x87, 0x88, 0x89, 0x8a, 0x8b, 0x8c, 0x8d, 0x9a, 0x9b, 0xa7, 0xa8, 0xab, 0xb3, 0xb4, 0xb5};


int usascii[47] = {0x61, 0x62, 0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x6a, 0x6b, 0x6c, 0x6d, 0x6e, 0x6f, 0x70, 0x71, 0x72, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78, 0x79, 0x7a, 0x60, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39, 0x30, 0x2d, 0x3d, 0x5b, 0x5d, 0x3b, 0x27, 0x5c, 0x2c, 0x2e, 0x2f};

int sascii[47] = {0x41, 0x42, 0x43, 0x44, 0x45, 0x46, 0x47, 0x48, 0x49, 0x4a, 0x4b, 0x4c, 0x4d, 0x4e, 0x4f, 0x50, 0x51, 0x52, 0x53, 0x54, 0x55, 0x56, 0x57, 0x58, 0x59, 0x5a, 0x71, 0x21, 0x40, 0x23, 0x24, 0x25, 0x5e, 0x26, 0x2a, 0x38, 0x29, 0x5f, 0x2b, 0x7b, 0x7d, 0x3a, 0x22, 0x7c, 0x3c, 0x3e, 0x3f};

int funkeys[11][2] = {{0x0e, 0x8e}, {0x0f, 0x8f}, {0x1c, 0x9c}, {0x1d, 0x9d}, {0x2a, 0xaa}, {0x36, 0xb6}, {0x38, 0xb8}, {0x39, 0xb9}, {0x3a, 0xba}, {0xe01d, 0xe09d}, {0xe038, 0xe0b8}};

int row = 5;
int col = 0;
int timecounter = 0;

void timeHandle(struct TrapFrame *tf);
void keyboardHandle(struct TrapFrame *tf);

int processnum = 1;

struct Semaphore {
    	int value;
    	struct ProcessTable* proclist;
};

typedef struct Semaphore Semaphore;

Semaphore *sem = NULL;
//Semaphore *readsem = NULL;

struct KEYBUF {
    	char key_buf[32];
    	int next_r, next_w, len;
};

struct KEYBUF keybuf;

// idle proc
struct ProcessTable *idleproc = NULL;
// current proc
struct ProcessTable *curproc = NULL;

void proc_run(struct ProcessTable *proc);
void cpu_idle();
void syscallHandle(struct TrapFrame *tf);
void GProtectFaultHandle(struct TrapFrame *tf);

void W(Semaphore *s)
{
        s->proclist++;
        s->proclist = curproc;
        s->proclist->state = BLOCKED;
        schedule();
}

void R(Semaphore *s)
{
        s->proclist->state = RUNNABLE;
        s->proclist--;
}

void P(Semaphore *s) {
    	s->value --;
    	if (s->value < 0)
        	W(s);
}

void V(Semaphore *s) {
    	s->value ++;
    	if (s->value <= 0)
        	R(s);
}

void kernel_thread() {
    	pcb[0].tf.cs = KSEL(SEG_KCODE);
    	pcb[0].tf.ds = pcb[0].tf.es = pcb[0].tf.fs = pcb[0].tf.ss= KSEL(SEG_KDATA);
    	pcb[0].tf.gs = USEL(SEG_VIDEO);
    	//Log("%d, %d, %d\n", pcb[0].tf.cs, pcb[0].tf.ds, pcb[0].tf.ss);
    	pcb[0].tf.eip = (uint32_t)cpu_idle;
    	pcb[0].esp0 = (uint32_t)(&(pcb[0].state));
    	pcb[0].state = RUNNABLE;
    	pcb[0].timeCount = 10;
    	pcb[0].sleepTime = 0;
    	pcb[0].pid = 0;    
    	idleproc = &pcb[0];
}

void user_process(){
	pcb[1].tf.cs = USEL(SEG_UCODE);
    	pcb[1].tf.ds = pcb[1].tf.es = pcb[1].tf.fs = pcb[1].tf.ss= USEL(SEG_UDATA);
    	pcb[1].tf.gs = USEL(SEG_VIDEO);
    	//Log("%d, %d, %d\n", pcb[1].tf.cs, pcb[1].tf.ds, pcb[1].tf.ss);
    	pcb[1].state = RUNNABLE;
    	pcb[1].esp0 = (uint32_t)(&(pcb[1].state));
    	pcb[1].timeCount = 10;
    	pcb[1].sleepTime = 0;
    	pcb[1].pid = 1;  
    	processnum++;
}

void schedule()
{
	int i = 1;
	for(i = 1; i < processnum; i++)
	{
		if(pcb[i].state == RUNNABLE && pcb[i].pid != curproc->pid)
		{
			struct ProcessTable * proc = &pcb[i];
			//Log("%d, %d, yonghu\n", i, curproc->pid);
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
		asm volatile("hlt");
    	}
}

void proc_run(struct ProcessTable *proc) {
        pcb[0].tf.cs = KSEL(SEG_KCODE);
    	pcb[0].tf.ds = pcb[0].tf.es = pcb[0].tf.fs = pcb[0].tf.ss= KSEL(SEG_KDATA);
    	pcb[0].tf.gs = USEL(SEG_VIDEO);
    	pcb[0].tf.eip = (uint32_t)cpu_idle;
    	pcb[0].esp0 = (uint32_t)(&(pcb[0].state));
    	pcb[0].state = RUNNABLE;
    	pcb[0].timeCount = 10;
    	pcb[0].sleepTime = 0;
    	pcb[0].pid = 0;
	curproc = proc;
	//Log("run:%x, %x\n", curproc - pcb, curproc->tf.eip);
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
    	keybuf.len = 0;
    	keybuf.next_r = 0;
    	keybuf.next_w = 0;	
	//readsem->value = 0;
}

uint32_t getKeyCode() {
    	uint32_t code = inByte(0x60);
    	uint32_t val = inByte(0x61);
    	outByte(0x61, val | 0x80);
    	outByte(0x61, val);
    	return code;
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

int fs_read(int fd, char *buf) {
	char code = '0';
	code = keybuf.key_buf[keybuf.next_r];
	keybuf.next_r++;
	buf[0] = (char)code;
	buf[1] = '\0';
	//Log("%x\n", code);
	//Log("read:%c\n", (char)code);
	return 1;
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
			//Log("printf:%c\n", buf[i]);
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
	pcb[childnum].pid = childnum;
	pcb[childnum].state = RUNNABLE;
	pcb[childnum].timeCount = 10;
	pcb[childnum].sleepTime = 0;
	pcb[childnum].tf.esp = tf->esp;
	pcb[childnum].tf.eax = 0;
	pcb[childnum].tf.ebx = tf->ebx;
	pcb[childnum].tf.eip = tf->eip;
	pcb[childnum].tf.eflags = tf->eflags;
	pcb[childnum].tf.error = tf->error;
	pcb[childnum].tf.irq = tf->irq;
	pcb[childnum].tf.ecx = tf->ecx;
	pcb[childnum].tf.edx = tf->edx;
	pcb[childnum].tf.ebp = tf->ebp;
	pcb[childnum].tf.esi = tf->esi;
	pcb[childnum].tf.edi = tf->edi;
	pcb[childnum].tf.xxx = tf->xxx;
	pcb[childnum].tf.cs = USEL(SEG_UCODE1); 
	pcb[childnum].tf.ds = pcb[childnum].tf.es = pcb[childnum].tf.ss = pcb[childnum].tf.fs = USEL(SEG_UDATA1);
	pcb[childnum].tf.gs = USEL(SEG_VIDEO);
	//Log("%d, %d, %d\n", pcb[childnum].tf.cs, pcb[childnum].tf.ds, pcb[childnum].tf.ss);
	char* parentmem = (void*)0x200000;
	char* childmem = (void*)0x300000;
	for(int j = 0; j < 0x100000; j++)
		childmem[j] = parentmem[j];
	tf->eax = childnum;
}

void sys_sleep(struct TrapFrame *tf)
{
	int sleep_time = tf->ebx;
	//Log("sleep: %d, %d\n", curproc->pid, sleep_time);
	if(curproc->pid != 0)
	{
		curproc->sleepTime = sleep_time;
		curproc->state = BLOCKED;
		curproc->timeCount = 10;
		schedule();
	}
}

void sys_exit(struct TrapFrame *tf)
{
	if(curproc->pid != 0)
	{
		//Log("exit: %d\n", curproc->pid);
		curproc->state = DEAD;
		curproc->timeCount = 10;
		curproc->sleepTime = 0;
		schedule();
	}
}

void sys_read(struct TrapFrame *tf) {
        if(curproc->pid == 2)
                tf->ecx = tf->ecx + 0x100000;
        tf->eax = fs_read(tf->ebx, (char*)tf->ecx);
}

void sys_write(struct TrapFrame *tf) {
	if(curproc->pid == 2)
		tf->ecx = tf->ecx + 0x100000;
        tf->eax = fs_write(tf->ebx, (char*)tf->ecx, tf->edx);
}

void sys_seminit(struct TrapFrame *tf)
{
	if(curproc->pid == 2)
                tf->ecx = tf->ecx + 0x100000;
	uint32_t* temp = (void *)tf->ecx;
	*temp = (uint32_t)sem;
	sem->value = tf->ebx;
	tf->eax = 1;
}

void sys_semwait(struct TrapFrame *tf)
{
	if(curproc->pid == 2)
                tf->ecx = tf->ecx + 0x100000;
	uint32_t* temp = (void *)tf->ecx;
	*temp = (uint32_t)sem;
	P(sem);
 	tf->eax = 1;
}

void sys_semdestroy(struct TrapFrame *tf)
{
        if(curproc->pid == 2)
                tf->ecx = tf->ecx + 0x100000;
        uint32_t* temp = (void*)tf->ecx; 
	*temp = (uint32_t)sem;
	sem->value = 0;
	sem->proclist = NULL;
	tf->eax = 1;
}

void sys_sempost(struct TrapFrame *tf)
{
        if(curproc->pid == 2)
                tf->ecx = tf->ecx + 0x100000;
	uint32_t* temp = (void *)tf->ecx;
	*temp = (uint32_t)sem;
        V(sem);
	tf->eax = 1;
}

void irqHandle(struct TrapFrame *tf) {
	/*
	 * 中断处理程序
	 */
	/* Reassign segment register */
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
		case 0x21:
			keyboardHandle(tf);
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
		case 3: sys_read(tf); break;
		case 4: sys_write(tf); break;
		case 5: sys_seminit(tf); break;
		case 6: sys_semwait(tf); break;
		case 7: sys_sempost(tf); break;
		case 8: sys_semdestroy(tf); break;
	}
}

void GProtectFaultHandle(struct TrapFrame *tf){
	assert(0);
	return;
}

void timeHandle(struct TrapFrame *tf){
	timecounter++;
	for(int i = 1; i < processnum; i++)
	{
		if(pcb[i].state == BLOCKED)
		{
			pcb[i].sleepTime--;
			if(pcb[i].sleepTime == 0)
			{
				pcb[i].state = RUNNABLE;
			}
		}
	}
	if(curproc->pid != 0)
	{
		curproc->timeCount--;
		if(curproc->timeCount == 0)
			schedule();
	}
	else
		schedule();
}

void keyboardHandle(struct TrapFrame *tf){
	//Log("jian pan\n");
	uint32_t code = getKeyCode();
	int ascii = 0;
	int i;
	if(code == 0x3a || code == 0x2a || code == 0x36 || code == 0xaa || code == 0xb6)
	{
		if(flag == 0)
			flag = 1;
		else
			flag = 0;
	}
	else
	{
		if(code == 0x0e)
		{
			keybuf.len--;
			keybuf.next_w--;
		}
		else if(code == 0x0f)
		{
			for(int m = 0; m < 8; m++)
			{
				keybuf.key_buf[keybuf.next_w] = ' ';
                        	keybuf.len++;
                        	keybuf.next_w = (keybuf.next_w + 1) % 32;
			}
		}
		else if(code == 0x1c)
		{
			V(sem);
			keybuf.key_buf[keybuf.next_w] = (char)0x0d;
			Log("%c\n", (char)0x0d);
			keybuf.len = 0;
			keybuf.next_w = 0;
			keybuf.next_r = 0;
		}
		else if(code == 0x39)
		{
			keybuf.key_buf[keybuf.next_w] = ' ';
                        keybuf.len++;
                        keybuf.next_w = (keybuf.next_w + 1) % 32;	
		}
		else
		{	
			for(i = 0; i < 47; i++)
			{
				if(flag == 0)
				{
					if(code == scancode[i])
					{
						ascii = usascii[i];
						break;
					}
				}
				else
				{
					if(code == scancode[i])
                        		{
                                		ascii = sascii[i];
                                		break;
                        		}
				}
			}
			if(i != 47)
			{	
				if (keybuf.len < 32) 
				{
       					keybuf.key_buf[keybuf.next_w] = (char)ascii;
       					keybuf.len++;
       					keybuf.next_w = (keybuf.next_w + 1) % 32;
    				}
				else
				{
					keybuf.len = 0;
					keybuf.key_buf[keybuf.next_w] = (char)ascii;
					keybuf.len++;
                			keybuf.next_w = (keybuf.next_w + 1) % 32;	
				}
			}	
		}
	}
}
