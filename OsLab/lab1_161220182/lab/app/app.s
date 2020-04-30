.code32

.global start
start:
	movl $((80*5+0)*2), %edi                #在第5行第0列打印
	movb $0x0c, %ah                         #黑底红字
	movb $0x48, %al                         #72为H的ASCII码
	movw %ax, %gs:(%edi)                    #写显存
	movl $((80*5+1)*2), %edi                #在第5行第1列打印
	movb $0x0c, %ah                         #黑底红字
	movb $0x65, %al                         #65为e的ASCII码
	movw %ax, %gs:(%edi)                    #写显存
	movl $((80*5+2)*2), %edi                #在第5行第2列打印
	movb $0x0c, %ah                         #黑底红字
	movb $0x6c, %al                         #6c为l的ASCII码
	movw %ax, %gs:(%edi)                    #写显存
	movl $((80*5+3)*2), %edi                #在第5行第3列打印
        movb $0x0c, %ah                         #黑底红字
        movb $0x6c, %al                         #6c为l的ASCII码
        movw %ax, %gs:(%edi)                    #写显存
	movl $((80*5+4)*2), %edi                #在第5行第4列打印
        movb $0x0c, %ah                         #黑底红字
        movb $0x6f, %al                         #6f为o的ASCII码
        movw %ax, %gs:(%edi)                    #写显存
	movl $((80*5+5)*2), %edi                #在第5行第5列打印
        movb $0x0c, %ah                         #黑底红字
        movb $0x2c, %al                         #2c为,的ASCII码
        movw %ax, %gs:(%edi)                    #写显存
	movl $((80*5+6)*2), %edi                #在第5行第6列打印
        movb $0x0c, %ah                         #黑底红字
        movb $0x57, %al                         #57为W的ASCII码
        movw %ax, %gs:(%edi)                    #写显存
	movl $((80*5+7)*2), %edi                #在第5行第7列打印
        movb $0x0c, %ah                         #黑底红字
        movb $0x6f, %al                         #6f为o的ASCII码
        movw %ax, %gs:(%edi)                    #写显存
	movl $((80*5+8)*2), %edi                #在第5行第8列打印
        movb $0x0c, %ah                         #黑底红字
        movb $0x72, %al                         #72为r的ASCII码
        movw %ax, %gs:(%edi)                    #写显存
	movl $((80*5+9)*2), %edi                #在第5行第9列打印
        movb $0x0c, %ah                         #黑底红字
        movb $0x6c, %al                         #6c为l的ASCII码
        movw %ax, %gs:(%edi)                    #写显存
	movl $((80*5+10)*2), %edi               #在第5行第10列打印
        movb $0x0c, %ah                         #黑底红字
        movb $0x64, %al                         #64为d的ASCII码
        movw %ax, %gs:(%edi)                    #写显存
	movl $((80*5+11)*2), %edi               #在第5行第11列打印
        movb $0x0c, %ah                         #黑底红字
        movb $0x21, %al                         #21为!的ASCII码
        movw %ax, %gs:(%edi)                    #写显存
	jmp start


