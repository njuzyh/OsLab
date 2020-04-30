#include "x86.h"
#include "device.h"

SegDesc gdt[NR_SEGMENTS];
//TSS tss;

/*#define SECTSIZE 512

void waitDisk(void) {
	while((inByte(0x1F7) & 0xC0) != 0x40); 
}

void readSect(void *dst, int offset) {
	int i;
	waitDisk();
	
	outByte(0x1F2, 1);
	outByte(0x1F3, offset);
	outByte(0x1F4, offset >> 8);
	outByte(0x1F5, offset >> 16);
	outByte(0x1F6, (offset >> 24) | 0xE0);
	outByte(0x1F7, 0x20);

	waitDisk();
	for (i = 0; i < SECTSIZE / 4; i ++) {
		((int *)dst)[i] = inLong(0x1F0);
	}
}*/

void initSeg() {
	gdt[SEG_KCODE] = SEG(STA_X | STA_R, 0,       0xffffffff, DPL_KERN);
	gdt[SEG_KDATA] = SEG(STA_W,         0,       0xffffffff, DPL_KERN);
	gdt[SEG_UCODE] = SEG(STA_X | STA_R, 0,       0xffffffff, DPL_USER);
	gdt[SEG_UDATA] = SEG(STA_W,         0,       0xffffffff, DPL_USER);
	gdt[SEG_UCODE1] = SEG(STA_X | STA_R, 0x100000,       0xffffffff, DPL_USER);
        gdt[SEG_UDATA1] = SEG(STA_W,         0x100000,       0xffffffff, DPL_USER);
	gdt[SEG_VIDEO] = SEG(STA_W,         0xb8000,       0xffffffff, DPL_USER);
	gdt[SEG_TSS] = SEG16(STS_T32A,      &tss, sizeof(TSS)-1, DPL_KERN);
	gdt[SEG_TSS].s = 0;
	setGdt(gdt, sizeof(gdt));

	/*
	 * 初始化TSS
	 */
	//tss.esp0 = 0x200000;
	tss.esp0 = (uint32_t)(&(pcb[1].state));
	tss.ss0 = KSEL(SEG_KDATA);
	asm volatile("ltr %%ax":: "a" (KSEL(SEG_TSS)));

	/*设置正确的段寄存器*/
	asm volatile ("movw %%ax, %%gs" :: "a" (KSEL(SEG_VIDEO)));
        asm volatile ("movw %%ax, %%fs" :: "a" (KSEL(SEG_KDATA)));
        asm volatile ("movw %%ax, %%es" :: "a" (KSEL(SEG_KDATA)));
        asm volatile ("movw %%ax, %%ds" :: "a" (KSEL(SEG_KDATA)));
        asm volatile ("movw %%ax, %%ss" :: "a" (KSEL(SEG_KDATA)));

	lLdt(0);
	
}

void enterUserSpace(uint32_t entry) {
	/*
	 * Before enter user space 
	 * you should set the right segment registers here
	 * and use 'iret' to jump to ring3
	 */
	asm volatile ("pushl %0" :: "r" (USEL(SEG_UDATA)));
	asm volatile ("pushl %0" :: "r" (0x2f0000));
        asm volatile ("pushfl");
        asm volatile ("pushl %0" :: "r" (USEL(SEG_UCODE)));
        asm volatile ("pushl %0" :: "r" (entry));
        pcb[1].tf.eip = entry;
	pcb[1].state = RUNNING;
	pcb[1].tf.esp = 0x2f0000;
	asm volatile ("movw %0, %%ds" :: "r" (USEL(SEG_UDATA)));
	asm volatile("iret");
}

void loadUMain(void) {

	/*加载用户程序至内存*/
	//void (*elf)(void);
	unsigned char tmp[20000];
        /*struct ELFHeader * ELFHDR = ((struct ELFHeader *)0x210000);
	for (int i = 201; i <= 400; i++) {
		readSect((void*)(tmp + 512 * (i - 201)), i);
	}*/
	int appsize = 0;
	appsize = fs_size("/usr/app");
	//Log("appsize = %d\n", appsize);
	int inode = findinodenum("/usr/app", NULL);
	//Log("appinode = %d\n", inode);
	fs_read(inode, tmp, appsize, 0);	
	//Log("readsize = %d\n", readsize);

	struct ELFHeader * ELFHDR = ((struct ELFHeader *)tmp);
        struct ProgramHeader *ph, *eph;
        ph = (struct ProgramHeader *)((void *)ELFHDR + ELFHDR->phoff);
        eph = ph + ELFHDR->phnum;
        char *psrc;
        char *pdest;
        for (; ph < eph; ph ++) {
		pdest = (char *)ph->vaddr;
                psrc = (char *)ELFHDR + ph->off;
                for(int i = 0; i < ph->filesz; i++)
                        *pdest++ = *psrc++;
                for(int i = ph->filesz; i < ph->memsz; i++)
                        *pdest++ = 0;
        }
        //elf = (void *)ELFHDR->entry;
	
	enterUserSpace(ELFHDR->entry);

	//elf();
}
