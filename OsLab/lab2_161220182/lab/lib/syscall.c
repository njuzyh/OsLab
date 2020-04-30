#include "lib.h"
#include "types.h"
#include "stdarg.h"
/*
 * io lib here
 * 库函数写在这
 */
//typedef char* va_list;
//#define _INTSIZEOF(n)	((sizeof(n)+sizeof(int)-1)&~(sizeof(int)-1))
//#define va_start(ap,v)	(ap=(va_list)&v+_INTSIZEOF(v))
//#define va_arg(ap,t)	(*(t*)((ap+=_INTSIZEOF(t)-_INTSIZEOF(t))))
//#define va_end(ap)	(ap=(va_list)0)
static int num = 0;

int32_t syscall(int num, uint32_t a1, uint32_t a2, uint32_t a3, uint32_t a4, uint32_t a5)
{
	int32_t ret = 0;
	asm volatile ("pushal");
	/* 内嵌汇编 保存 num, a1, a2, a3, a4, a5 至通用寄存器*/
	asm volatile ("movl %0, %%eax" :: "m" (num));
        asm volatile ("movl %0, %%ebx" :: "m" (a1));
        asm volatile ("movl %0, %%ecx" :: "m" (a2));
        asm volatile ("movl %0, %%edx" :: "m" (a3));
        asm volatile ("movl %0, %%edi" :: "m" (a4));
	asm volatile ("movl %0, %%esi" :: "m" (a5));
	
	asm volatile("int $0x80");
	asm volatile("popal");	
	return ret;
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
