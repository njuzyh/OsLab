#ifndef __IRQ_H__
#define __IRQ_H__

/* 中断处理相关函数 */
void initIdt(void);
void initIntr(void);
void initTimer(void);
void initProcess(void);

#endif
