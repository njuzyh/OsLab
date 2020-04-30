#ifndef __SERIAL_H__
#define __SERIAL_H__

void initSerial(void);
void putChar(char);

void waitDisk(void);
void readSect(void *dst, int offset);
void writeSect(void *src, int offset);

#define SERIAL_PORT  0x3F8

#endif
