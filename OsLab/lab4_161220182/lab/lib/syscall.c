#include "lib.h"
#include "types.h"
#include "stdarg.h"

#define EOF (-1)
int32_t sysret;
/*
 * io lib here
 * 库函数写在这
 */
static int num = 0;

int str2int(char* str)
{
	int i;  
    	int n = 0;  
    	for (i = 0; str[i] >= '0' && str[i] <= '9'; ++i)  
    	{  
        	n = 10 * n + (str[i] - '0');  
    	}  
    	return n;			
}

int32_t syscall(int num, uint32_t a1, uint32_t a2, uint32_t a3, uint32_t a4, uint32_t a5)
{
	//int32_t ret = 0;
	asm volatile ("pushal");
	/* 内嵌汇编 保存 num, a1, a2, a3, a4, a5 至通用寄存器*/
	asm volatile ("movl %0, %%eax" :: "m" (num));
        asm volatile ("movl %0, %%ebx" :: "m" (a1));
        asm volatile ("movl %0, %%ecx" :: "m" (a2));
        asm volatile ("movl %0, %%edx" :: "m" (a3));
        asm volatile ("movl %0, %%edi" :: "m" (a4));
	asm volatile ("movl %0, %%esi" :: "m" (a5));
	
	asm volatile("int $0x80");
	asm volatile ("movl %%eax, %0" :: "m" (sysret));
	asm volatile("popal");	
	return sysret;
}

void printch(char ch)
{
	char *str = &ch;
	syscall(4, 1, (uint32_t)str, 1, 0, 0);
}

void printint(unsigned dec, char* str)
{
	if(dec == 0)
		return ;
	else
	{
		printint(dec / 10, str);
		str[num] = dec % 10 + '0';
		num++;
	}
}

void printstr(char *str)
{
	int i = 0;
	while(str[i]!= '\0')
	{
		i++;
	}
	syscall(4, 1, (uint32_t)str, i, 0, 0);
}

void printhex(unsigned dec, char *str)
{
	if(dec == 0)
		return;
	else
	{
		printhex(dec / 16, str);
		if(dec % 16 < 10)
			str[num] = dec % 16 + '0';
 		else
			str[num] = dec % 16 - 10 + 'a';
		num++;
      }
}

void printf(const char *format, ...)
{
	va_list ap;
	va_start(ap, format);
	while (*format)
	{
		if (*format != '%')
		{
			syscall(4, 1, (uint32_t)format, 1, 0, 0);
			format++;
		}
		else
		{
			format++;
			switch (*format)
			{
			case 'c':
			{
				char ch = va_arg(ap, int);
				syscall(4, 1, (uint32_t)(&ch), 1, 0, 0);
				format++;
				break;
			}
			case 'd':
			{
				char str[100];
				int valint = va_arg(ap, int);
				if(valint == 0)
				{
					num = 0;
					str[0] = '0';
					str[1] = '\0';
					syscall(4, 1, (uint32_t)(str), 1, 0, 0);
				}
				else if(valint < 0)
				{
					str[0] = '-';
					num = 1;
					unsigned int temp = -valint;
					printint(temp, str);
					str[num] = '\0';
					syscall(4, 1, (uint32_t)(str), num, 0, 0);
				}
				else
				{
					num = 0;
					printint(valint, str);
					str[num] = '\0';
					syscall(4, 1, (uint32_t)(str), num, 0, 0);
				}
				format++;
				break;
			}
			case 's':
			{
				char *valstr = va_arg(ap, char*);
				printstr(valstr);
				format++;
				break;
			}
			case 'x':
			{
				char str[100];
				unsigned int valhex = va_arg(ap, unsigned);
				if(valhex == 0)
				{
					str[0] = '0';
					str[1] = '\0';
                                        syscall(4, 1, (uint32_t)(str), 1, 0, 0);
				}
                                else
				{	
					num = 0;			
					printhex(valhex, str);
					str[num] = '\0';
					syscall(4, 1, (uint32_t)(str), num, 0, 0);
				}
				format++;
				break;
			}
			default:
			{
				syscall(4, 1, (uint32_t)format, 1, 0, 0);
				format++;
			}
			}
		}
	}
	va_end(ap);
}


int fork()
{
	int forkret = syscall(0, 0, 0, 0, 0, 0);
	return forkret;
}

int sleep(int time)
{
	syscall(1, time, 0, 0, 0, 0);
	return 0;
}

int exit()
{
	syscall(2, 0, 0, 0, 0, 0);
	return 0;
}

int sem_init(sem_t *sem, uint32_t value)
{
	int semret = syscall(5, value, (uint32_t)sem, 0, 0, 0);
	if(semret == 1)
		return 0;
	else
		return -1;
}

int sem_wait(sem_t *sem)
{
	int semret = syscall(6, 0, (uint32_t)sem, 0, 0, 0);
	if(semret == 1)
                return 0;
        else
                return -1;

}

int sem_post(sem_t *sem)
{
        int semret = syscall(7, 0, (uint32_t)sem, 0, 0, 0);
        if(semret == 1)
                return 0;
        else
                return -1;
}

int sem_destroy(sem_t *sem)
{
	int semret = syscall(8, 0, (uint32_t)sem, 0, 0, 0);
	if(semret == 1)
                return 0;
        else
                return -1;
}

int getchar(void)
{
    	char c;
    	return (syscall(3, 0, (uint32_t)&c, 1, 0, 0) == 1)?(unsigned char)c:EOF;
}

char * gets(char *buf)
{
	int i = 0;
	int temp = getchar();
	while(temp != 0xd)
	{
		buf[i] = (char)temp;
		i++;
		temp = getchar();
	}
	buf[i] = '\0';
        //syscall(3, 0, (uint32_t)buf, 0, 0, 0);
        return buf;	
}

int scanf(const char *format,...)
{
	va_list ap;
    	int retval = 0;
	char *valstr;
	int dec;
	int *valint;
	char buf[100];
    	va_start(ap, format);
    	//retval = _doscan(stdin, format, ap);	
	while (*format)
        {
                if (*format == '%')
                {	
			retval++;
                        format++;
                        switch (*format)
                        {
				case 'c':
				{
					valstr = va_arg(ap, char*);
					valstr[0] = (char)getchar();
					getchar();
				}break;
				case 'd':
				{
					int i = 0;
					int temp = getchar();
					while(temp != 32 && temp != 0xd)
					{
						buf[i] = (char)temp;
						i++;	
						temp = getchar();
					}
					buf[i] = '\0';
					dec = str2int(buf);
					valint = va_arg(ap, int*);
					valint[0] = dec;
				}break;
				case 's':
				{
					valstr = va_arg(ap, char*);
					int i = 0;
					int temp = getchar();
				        while(temp != 0xd && temp != 32)
        				{
                				valstr[i] = (char)temp;
                				i++; 
                				temp = getchar();
                                        }
					valstr[i] = '\0';
				}break;	
				default: break;
			}
		}
		format++;	
	}
    	va_end(ap);
    	return retval;	
}
