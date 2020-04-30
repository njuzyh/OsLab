#include "x86.h"
#include "device.h"
int row = 5;
int col = 0;

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

	switch(tf->irq) {
		case -1:
			break;
		case 0xd:
			GProtectFaultHandle(tf);
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
		case 4: sys_write(tf); break;
	}
}

void GProtectFaultHandle(struct TrapFrame *tf){
	assert(0);
	return;
}


