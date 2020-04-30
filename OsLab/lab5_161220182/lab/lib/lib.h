#ifndef __lib_h__
#define __lib_h__
#include <types.h>

#define O_RDWR 0x1
#define O_CREAT 0x2

void printf(const char *format,...);
int fork();
int sleep(int time);
int exit();
int sem_init(sem_t *sem, uint32_t value);
int sem_post(sem_t *sem);
int sem_wait(sem_t *sem);
int sem_destroy(sem_t *sem);
int getchar(void);
char* gets(char *buf);
int scanf(const char *format,...);
int open(char *path, int flags);
int read(int fd, void *buffer, int size);
int write(int fd, void *buffer, int size);
int lseek(int fd, int offset, int whence);
int close(int fd);
int remove(char *path);
void ls(char *path);
void cat(char *path);

#endif
