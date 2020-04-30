#define BLOCK_SIZE 200
#include <stdarg.h>
#include "x86.h"
#include "common.h"

// #define SHOW_PROCESS_CHANGE 
void Log(char *format,...);
//extern void putChar(char ch);

//static int ptr=0;
//static char buff[BLOCK_SIZE];

int newrow = 0;
int newcol = 0;
int putwrite(char *buf, int len);
void putch(char ch)
{
        int ascii = (int) ch;
        int num = (80 * newrow + newcol) * 2;
        int tmp = 0x0c;
        asm volatile("pushal");
        asm volatile("movl %0, %%edi" :: "m" (num));
        asm volatile("movb %0, %%ah" :: "m" (tmp));
        asm volatile("movb %0, %%al" :: "m" (ascii));
        asm volatile("movw %ax, %gs:(%edi)");
        asm volatile("popal");
}

/*void addString2Buff(char *str)
{
	while(*str)
	{
		buff[ptr++]=*(str++);
	}
}


void addCh2Buff(char ch)
{
	buff[ptr++]=ch;
}

void addDec2Buff(int a)
{
	if(a<0)
	{
		if(a==-2147483648)
		{	
			addString2Buff("-2147483648");
			return;
		}
		addCh2Buff('-');
		addDec2Buff(-a);
		return ;
	}
	if(a==0)
		return ;
	addDec2Buff(a/10);
	buff[ptr++]=(a%10+'0');
}

void addHex2Buff(unsigned a)
{
	if(a==0)
		return ;
	addHex2Buff(a/16);
	a=a%16;
	if(a<10)
		buff[ptr++]=a+'0';
	else
		buff[ptr++]=a-10+'a';
}


void Log(char *format,...){
	char tempChar;
	int tempInt;
	char *tempString;



	va_list vp;
	va_start(vp,format);

	char*stepPointer=format;
	while(*stepPointer)
	{
		if(*stepPointer=='%')
		{
			stepPointer++;
			switch(*stepPointer)
			{

				case 'c':
					tempChar=(char)va_arg(vp,int);	 // need a cast here since va_arg only	
                    addCh2Buff(tempChar);				//takes fully promoted types 		
					stepPointer++;
					break;
				case 'd':
					tempInt=va_arg(vp,int);
					if(tempInt==0)
						addCh2Buff('0');
					else
						addDec2Buff(tempInt);
					stepPointer++;
					break;
				case 'x':
					tempInt=va_arg(vp,int);
					if(tempInt==0)
						addCh2Buff('0');
					else
						addHex2Buff(tempInt);
					stepPointer++;
					break;
				case 's':
					tempString = va_arg(vp, char*);
					addString2Buff(tempString);
					stepPointer++;
					break;
				case '%':
					addCh2Buff('%');
					stepPointer++;
					break;
			}
		}
		else
		{
			addCh2Buff(*(stepPointer++));
		}
	}
	va_end(vp);

	buff[ptr]='\0';
	for(int i=0;i<ptr;i++)
	{
		//putChar(buff[i]);
		if(buff[ptr] == '\n')
		{
			newrow++;
			newcol = 0;
		}
		else
		{
			putch(buff[i]);
			if(newcol + 1 > 80)
                        {
                                newcol = newcol % 80;
                                newrow++;
                        }
                        else
                        {
                                newcol++;
                        }
		}
	}
	ptr=0;
}*/
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

/*void printchar(char ch)
{
	char *str = &ch;
	putwrite(str, 1);
}*/

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
	putwrite(str, i);
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

int putwrite(char *buf, int len) {
        int i;
        for(i = 0; i < len; i ++)
        {
                if(buf[i] == '\n')
                {
                        newrow++;
                        newcol = 0;
                }
                else
                {
                        //Log("printf:%c\n", buf[i]);
                        putch(buf[i]);
                        if(newcol + 1 > 80)
                        {
                                newcol = newcol % 80;
                                newrow++;
                        }
                        else
                        {
                                newcol++;
                        }
                }
	}
        return len;
}

void Log(char *format, ...)
{
	va_list ap;
	va_start(ap, format);
	while (*format)
	{
		if (*format != '%')
		{
			putwrite(format, 1);
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
				char m[100];
				m[0] = ch;
				m[1] = '\0';
				putwrite(m, 1);
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
					putwrite(str, 1);
				}
				else if(valint < 0)
				{
					str[0] = '-';
					num = 1;
					unsigned int temp = -valint;
					printint(temp, str);
					str[num] = '\0';
					putwrite(str, num);
				}
				else
				{
					num = 0;
					printint(valint, str);
					str[num] = '\0';
					putwrite(str, num);
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
                                        putwrite(str, 1);
				}
                                else
				{	
					num = 0;			
					printhex(valhex, str);
					str[num] = '\0';
					putwrite(str, num);
				}
				format++;
				break;
			}
			default:
			{
				putwrite(format, 1);
				format++;
			}
			}
		}
	}
	va_end(ap);
}
