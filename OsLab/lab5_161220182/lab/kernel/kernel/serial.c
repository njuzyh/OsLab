#include "x86.h"
#include "device.h"

void initSerial(void) {
	outByte(SERIAL_PORT + 1, 0x00);
	outByte(SERIAL_PORT + 3, 0x80);
	outByte(SERIAL_PORT + 0, 0x01);
	outByte(SERIAL_PORT + 1, 0x00);
	outByte(SERIAL_PORT + 3, 0x03);
	outByte(SERIAL_PORT + 2, 0xC7);
	outByte(SERIAL_PORT + 4, 0x0B);
}

static inline int serialIdle(void) {
	return (inByte(SERIAL_PORT + 5) & 0x20) != 0;
}

void putChar(char ch) {
	while (serialIdle() != TRUE);
	outByte(SERIAL_PORT, ch);
}

#define SECTOR_SIZE 512

void waitDisk(void) {
    while ((inByte(0x1F7) & 0xC0) != 0x40)
        ;
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
    for (i = 0; i < SECTOR_SIZE / 4; i++) {
        ((int *)dst)[i] = inLong(0x1F0);
    }
}

void writeSect(void *src, int offset) {
    int i;
    waitDisk();

    outByte(0x1F2, 1);
    outByte(0x1F3, offset);
    outByte(0x1F4, offset >> 8);
    outByte(0x1F5, offset >> 16);
    outByte(0x1F6, (offset >> 24) | 0xE0);
    outByte(0x1F7, 0x30);

    waitDisk();
    for (i = 0; i < SECTOR_SIZE / 4; i++) {
        outLong(0x1F0, ((uint32_t *)src)[i]);
    }
}
