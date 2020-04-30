#include "x86.h"
#include "device.h"

SegDesc gdt[NR_SEGMENTS];
TSS tss;

#define SECTSIZE 512

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
}

void initSeg() {
	gdt[SEG_KCODE] = SEG(STA_X | STA_R, 0,       0xffffffff, DPL_KERN);
	gdt[SEG_KDATA] = SEG(STA_W,         0,       0xffffffff, DPL_KERN);
	gdt[SEG_UCODE] = SEG(STA_X | STA_R, 0,       0xffffffff, DPL_USER);
	gdt[SEG_UDATA] = SEG(STA_W,         0,       0xffffffff, DPL_USER);
	gdt[SEG_VIDEO] = SEG(STA_W,         0xb8000,       0xffffffff, DPL_USER);
	gdt[SEG_TSS] = SEG16(STS_T32A,      &tss, sizeof(TSS)-1, DPL_KERN);
	gdt[SEG_TSS].s = 0;
	setGdt(gdt, sizeof(gdt));

	/*
	 * 初始化TSS
	 */
	tss.esp0 = 0x200000;
	tss.ss0 = KSEL(SEG_KDATA);
	asm volatile("ltr %%ax":: "a" (KSEL(SEG_TSS)));

	/*设置正确的段寄存器*/
	asm volatile ("movw %%ax, %%gs" :: "a" (KSEL(SEG_VIDEO)));
        asm volatile ("movw %%ax, %%fs" :: "a" (USEL(SEG_UDATA)));
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
	asm volatile ("pushl %0" :: "r" (128 << 10));
        asm volatile ("pushfl");
        asm volatile ("pushl %0" :: "r" (USEL(SEG_UCODE)));
        asm volatile ("pushl %0" :: "r" (entry));
	asm volatile ("movw %0, %%ds" :: "r" (USEL(SEG_UDATA)));

	asm volatile("iret");
}

void loadUMain(void) {

	/*加载用户程序至内存*/
	void (*elf)(void);
        //readseg((uintptr_t)ELFHDR, SECTSIZE * 8, SECTSIZE * 200);
	int tmp = 0x210000;
        struct ELFHeader * ELFHDR = ((struct ELFHeader *)0x210000);
        for(int i = 201; i <= 400; i++)
        {
                readSect((void*)tmp, i);
                tmp += SECTSIZE;
        }
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
        elf = (void *)ELFHDR->entry;
	enterUserSpace(ELFHDR->entry);
        elf();
}
