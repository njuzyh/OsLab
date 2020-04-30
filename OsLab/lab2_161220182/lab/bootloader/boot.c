#include "boot.h"
#define SECTSIZE 512
void readSect(void *dst, int offset);

void bootMain(void) {
	/* 加载内核至内存，并跳转执行 */
	void (*elf)(void);
	int tmp = 0x8000;
	struct ELFHeader * ELFHDR = ((struct ELFHeader *)0x8000);
	for(int i = 1; i <= 200; i++)
        {
                readSect((void*)tmp, i);
		tmp += SECTSIZE;
	}	
	struct ProgramHeader *ph, *eph;
    	ph = (struct ProgramHeader *)((void *)ELFHDR + ELFHDR->phoff);
    	eph = ph + ELFHDR->phnum;
	char *psrc;
        char *pdest;
    	for(; ph < eph; ph++)
	{
		pdest = (char *)ph->vaddr;
		psrc = (char *)ELFHDR + ph->off;
		for(int i = 0; i < ph->filesz; i++)
			*pdest++ = *psrc++;
		for(int i = ph->filesz; i < ph->memsz; i++)
			*pdest++ = 0;
	}
	elf = (void *)ELFHDR->entry;
	elf();
}

void waitDisk(void) { // waiting for disk
	while((inByte(0x1F7) & 0xC0) != 0x40);
}

void readSect(void *dst, int offset) { // reading a sector of disk
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

