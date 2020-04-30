
kMain.elf:     file format elf32-i386


Disassembly of section .text:

00100000 <kEntry>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 08             	sub    $0x8,%esp
  100006:	e8 19 00 00 00       	call   100024 <initSerial>
  10000b:	e8 38 05 00 00       	call   100548 <initIdt>
  100010:	e8 6b 00 00 00       	call   100080 <initIntr>
  100015:	e8 4a 01 00 00       	call   100164 <initSeg>
  10001a:	e8 d5 02 00 00       	call   1002f4 <loadUMain>
  10001f:	eb fe                	jmp    10001f <kEntry+0x1f>
  100021:	66 90                	xchg   %ax,%ax
  100023:	90                   	nop

00100024 <initSerial>:
  100024:	55                   	push   %ebp
  100025:	89 e5                	mov    %esp,%ebp
  100027:	ba f9 03 00 00       	mov    $0x3f9,%edx
  10002c:	31 c0                	xor    %eax,%eax
  10002e:	ee                   	out    %al,(%dx)
  10002f:	ba fb 03 00 00       	mov    $0x3fb,%edx
  100034:	b0 80                	mov    $0x80,%al
  100036:	ee                   	out    %al,(%dx)
  100037:	ba f8 03 00 00       	mov    $0x3f8,%edx
  10003c:	b0 01                	mov    $0x1,%al
  10003e:	ee                   	out    %al,(%dx)
  10003f:	ba f9 03 00 00       	mov    $0x3f9,%edx
  100044:	31 c0                	xor    %eax,%eax
  100046:	ee                   	out    %al,(%dx)
  100047:	ba fb 03 00 00       	mov    $0x3fb,%edx
  10004c:	b0 03                	mov    $0x3,%al
  10004e:	ee                   	out    %al,(%dx)
  10004f:	ba fa 03 00 00       	mov    $0x3fa,%edx
  100054:	b0 c7                	mov    $0xc7,%al
  100056:	ee                   	out    %al,(%dx)
  100057:	ba fc 03 00 00       	mov    $0x3fc,%edx
  10005c:	b0 0b                	mov    $0xb,%al
  10005e:	ee                   	out    %al,(%dx)
  10005f:	5d                   	pop    %ebp
  100060:	c3                   	ret    
  100061:	8d 76 00             	lea    0x0(%esi),%esi

00100064 <putChar>:
  100064:	55                   	push   %ebp
  100065:	89 e5                	mov    %esp,%ebp
  100067:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10006a:	ba fd 03 00 00       	mov    $0x3fd,%edx
  10006f:	90                   	nop
  100070:	ec                   	in     (%dx),%al
  100071:	a8 20                	test   $0x20,%al
  100073:	74 fb                	je     100070 <putChar+0xc>
  100075:	ba f8 03 00 00       	mov    $0x3f8,%edx
  10007a:	88 c8                	mov    %cl,%al
  10007c:	ee                   	out    %al,(%dx)
  10007d:	5d                   	pop    %ebp
  10007e:	c3                   	ret    
  10007f:	90                   	nop

00100080 <initIntr>:
  100080:	55                   	push   %ebp
  100081:	89 e5                	mov    %esp,%ebp
  100083:	ba 21 00 00 00       	mov    $0x21,%edx
  100088:	b0 ff                	mov    $0xff,%al
  10008a:	ee                   	out    %al,(%dx)
  10008b:	ba a1 00 00 00       	mov    $0xa1,%edx
  100090:	ee                   	out    %al,(%dx)
  100091:	ba 20 00 00 00       	mov    $0x20,%edx
  100096:	b0 11                	mov    $0x11,%al
  100098:	ee                   	out    %al,(%dx)
  100099:	ba 21 00 00 00       	mov    $0x21,%edx
  10009e:	b0 20                	mov    $0x20,%al
  1000a0:	ee                   	out    %al,(%dx)
  1000a1:	b0 04                	mov    $0x4,%al
  1000a3:	ee                   	out    %al,(%dx)
  1000a4:	b0 03                	mov    $0x3,%al
  1000a6:	ee                   	out    %al,(%dx)
  1000a7:	ba a0 00 00 00       	mov    $0xa0,%edx
  1000ac:	b0 11                	mov    $0x11,%al
  1000ae:	ee                   	out    %al,(%dx)
  1000af:	ba a1 00 00 00       	mov    $0xa1,%edx
  1000b4:	b0 28                	mov    $0x28,%al
  1000b6:	ee                   	out    %al,(%dx)
  1000b7:	b0 02                	mov    $0x2,%al
  1000b9:	ee                   	out    %al,(%dx)
  1000ba:	b0 03                	mov    $0x3,%al
  1000bc:	ee                   	out    %al,(%dx)
  1000bd:	ba 20 00 00 00       	mov    $0x20,%edx
  1000c2:	b0 68                	mov    $0x68,%al
  1000c4:	ee                   	out    %al,(%dx)
  1000c5:	b0 0a                	mov    $0xa,%al
  1000c7:	ee                   	out    %al,(%dx)
  1000c8:	ba a0 00 00 00       	mov    $0xa0,%edx
  1000cd:	b0 68                	mov    $0x68,%al
  1000cf:	ee                   	out    %al,(%dx)
  1000d0:	b0 0a                	mov    $0xa,%al
  1000d2:	ee                   	out    %al,(%dx)
  1000d3:	5d                   	pop    %ebp
  1000d4:	c3                   	ret    
  1000d5:	66 90                	xchg   %ax,%ax
  1000d7:	90                   	nop

001000d8 <waitDisk>:
  1000d8:	55                   	push   %ebp
  1000d9:	89 e5                	mov    %esp,%ebp
  1000db:	ba f7 01 00 00       	mov    $0x1f7,%edx
  1000e0:	ec                   	in     (%dx),%al
  1000e1:	83 e0 c0             	and    $0xffffffc0,%eax
  1000e4:	3c 40                	cmp    $0x40,%al
  1000e6:	75 f8                	jne    1000e0 <waitDisk+0x8>
  1000e8:	5d                   	pop    %ebp
  1000e9:	c3                   	ret    
  1000ea:	66 90                	xchg   %ax,%ax

001000ec <readSect>:
  1000ec:	55                   	push   %ebp
  1000ed:	89 e5                	mov    %esp,%ebp
  1000ef:	53                   	push   %ebx
  1000f0:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  1000f3:	ba f7 01 00 00       	mov    $0x1f7,%edx
  1000f8:	ec                   	in     (%dx),%al
  1000f9:	83 e0 c0             	and    $0xffffffc0,%eax
  1000fc:	3c 40                	cmp    $0x40,%al
  1000fe:	75 f8                	jne    1000f8 <readSect+0xc>
  100100:	ba f2 01 00 00       	mov    $0x1f2,%edx
  100105:	b0 01                	mov    $0x1,%al
  100107:	ee                   	out    %al,(%dx)
  100108:	ba f3 01 00 00       	mov    $0x1f3,%edx
  10010d:	88 c8                	mov    %cl,%al
  10010f:	ee                   	out    %al,(%dx)
  100110:	89 c8                	mov    %ecx,%eax
  100112:	c1 f8 08             	sar    $0x8,%eax
  100115:	ba f4 01 00 00       	mov    $0x1f4,%edx
  10011a:	ee                   	out    %al,(%dx)
  10011b:	89 c8                	mov    %ecx,%eax
  10011d:	c1 f8 10             	sar    $0x10,%eax
  100120:	ba f5 01 00 00       	mov    $0x1f5,%edx
  100125:	ee                   	out    %al,(%dx)
  100126:	89 c8                	mov    %ecx,%eax
  100128:	c1 f8 18             	sar    $0x18,%eax
  10012b:	83 c8 e0             	or     $0xffffffe0,%eax
  10012e:	ba f6 01 00 00       	mov    $0x1f6,%edx
  100133:	ee                   	out    %al,(%dx)
  100134:	ba f7 01 00 00       	mov    $0x1f7,%edx
  100139:	b0 20                	mov    $0x20,%al
  10013b:	ee                   	out    %al,(%dx)
  10013c:	ec                   	in     (%dx),%al
  10013d:	83 e0 c0             	and    $0xffffffc0,%eax
  100140:	3c 40                	cmp    $0x40,%al
  100142:	75 f8                	jne    10013c <readSect+0x50>
  100144:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100147:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
  10014d:	ba f0 01 00 00       	mov    $0x1f0,%edx
  100152:	66 90                	xchg   %ax,%ax
  100154:	ed                   	in     (%dx),%eax
  100155:	89 01                	mov    %eax,(%ecx)
  100157:	83 c1 04             	add    $0x4,%ecx
  10015a:	39 d9                	cmp    %ebx,%ecx
  10015c:	75 f6                	jne    100154 <readSect+0x68>
  10015e:	5b                   	pop    %ebx
  10015f:	5d                   	pop    %ebp
  100160:	c3                   	ret    
  100161:	8d 76 00             	lea    0x0(%esi),%esi

00100164 <initSeg>:
  100164:	55                   	push   %ebp
  100165:	89 e5                	mov    %esp,%ebp
  100167:	b9 60 11 10 00       	mov    $0x101160,%ecx
  10016c:	66 c7 05 68 11 10 00 	movw   $0xffff,0x101168
  100173:	ff ff 
  100175:	66 c7 05 6a 11 10 00 	movw   $0x0,0x10116a
  10017c:	00 00 
  10017e:	c6 05 6c 11 10 00 00 	movb   $0x0,0x10116c
  100185:	c6 05 6d 11 10 00 9a 	movb   $0x9a,0x10116d
  10018c:	c6 05 6e 11 10 00 cf 	movb   $0xcf,0x10116e
  100193:	c6 05 6f 11 10 00 00 	movb   $0x0,0x10116f
  10019a:	66 c7 05 70 11 10 00 	movw   $0xffff,0x101170
  1001a1:	ff ff 
  1001a3:	66 c7 05 72 11 10 00 	movw   $0x0,0x101172
  1001aa:	00 00 
  1001ac:	c6 05 74 11 10 00 00 	movb   $0x0,0x101174
  1001b3:	c6 05 75 11 10 00 92 	movb   $0x92,0x101175
  1001ba:	c6 05 76 11 10 00 cf 	movb   $0xcf,0x101176
  1001c1:	c6 05 77 11 10 00 00 	movb   $0x0,0x101177
  1001c8:	66 c7 05 78 11 10 00 	movw   $0xffff,0x101178
  1001cf:	ff ff 
  1001d1:	66 c7 05 7a 11 10 00 	movw   $0x0,0x10117a
  1001d8:	00 00 
  1001da:	c6 05 7c 11 10 00 00 	movb   $0x0,0x10117c
  1001e1:	c6 05 7d 11 10 00 fa 	movb   $0xfa,0x10117d
  1001e8:	c6 05 7e 11 10 00 cf 	movb   $0xcf,0x10117e
  1001ef:	c6 05 7f 11 10 00 00 	movb   $0x0,0x10117f
  1001f6:	66 c7 05 80 11 10 00 	movw   $0xffff,0x101180
  1001fd:	ff ff 
  1001ff:	66 c7 05 82 11 10 00 	movw   $0x0,0x101182
  100206:	00 00 
  100208:	c6 05 84 11 10 00 00 	movb   $0x0,0x101184
  10020f:	c6 05 85 11 10 00 f2 	movb   $0xf2,0x101185
  100216:	c6 05 86 11 10 00 cf 	movb   $0xcf,0x101186
  10021d:	c6 05 87 11 10 00 00 	movb   $0x0,0x101187
  100224:	a1 b8 06 10 00       	mov    0x1006b8,%eax
  100229:	8b 15 bc 06 10 00    	mov    0x1006bc,%edx
  10022f:	a3 90 11 10 00       	mov    %eax,0x101190
  100234:	89 15 94 11 10 00    	mov    %edx,0x101194
  10023a:	66 c7 05 88 11 10 00 	movw   $0x63,0x101188
  100241:	63 00 
  100243:	b8 a0 11 10 00       	mov    $0x1011a0,%eax
  100248:	66 a3 8a 11 10 00    	mov    %ax,0x10118a
  10024e:	89 c2                	mov    %eax,%edx
  100250:	c1 ea 10             	shr    $0x10,%edx
  100253:	88 15 8c 11 10 00    	mov    %dl,0x10118c
  100259:	c6 05 8d 11 10 00 89 	movb   $0x89,0x10118d
  100260:	c6 05 8e 11 10 00 40 	movb   $0x40,0x10118e
  100267:	c1 e8 18             	shr    $0x18,%eax
  10026a:	a2 8f 11 10 00       	mov    %al,0x10118f
  10026f:	66 c7 05 20 11 10 00 	movw   $0x37,0x101120
  100276:	37 00 
  100278:	66 89 0d 22 11 10 00 	mov    %cx,0x101122
  10027f:	c1 e9 10             	shr    $0x10,%ecx
  100282:	66 89 0d 24 11 10 00 	mov    %cx,0x101124
  100289:	b8 20 11 10 00       	mov    $0x101120,%eax
  10028e:	0f 01 10             	lgdtl  (%eax)
  100291:	c7 05 a4 11 10 00 00 	movl   $0x200000,0x1011a4
  100298:	00 20 00 
  10029b:	c7 05 a8 11 10 00 10 	movl   $0x10,0x1011a8
  1002a2:	00 00 00 
  1002a5:	b8 28 00 00 00       	mov    $0x28,%eax
  1002aa:	0f 00 d8             	ltr    %ax
  1002ad:	b8 30 00 00 00       	mov    $0x30,%eax
  1002b2:	8e e8                	mov    %eax,%gs
  1002b4:	b8 23 00 00 00       	mov    $0x23,%eax
  1002b9:	8e e0                	mov    %eax,%fs
  1002bb:	b8 10 00 00 00       	mov    $0x10,%eax
  1002c0:	8e c0                	mov    %eax,%es
  1002c2:	8e d8                	mov    %eax,%ds
  1002c4:	8e d0                	mov    %eax,%ss
  1002c6:	31 c0                	xor    %eax,%eax
  1002c8:	0f 00 d0             	lldt   %ax
  1002cb:	5d                   	pop    %ebp
  1002cc:	c3                   	ret    
  1002cd:	8d 76 00             	lea    0x0(%esi),%esi

001002d0 <enterUserSpace>:
  1002d0:	55                   	push   %ebp
  1002d1:	89 e5                	mov    %esp,%ebp
  1002d3:	b8 23 00 00 00       	mov    $0x23,%eax
  1002d8:	50                   	push   %eax
  1002d9:	b8 00 00 02 00       	mov    $0x20000,%eax
  1002de:	50                   	push   %eax
  1002df:	9c                   	pushf  
  1002e0:	b8 1b 00 00 00       	mov    $0x1b,%eax
  1002e5:	50                   	push   %eax
  1002e6:	8b 45 08             	mov    0x8(%ebp),%eax
  1002e9:	50                   	push   %eax
  1002ea:	b8 23 00 00 00       	mov    $0x23,%eax
  1002ef:	8e d8                	mov    %eax,%ds
  1002f1:	cf                   	iret   
  1002f2:	5d                   	pop    %ebp
  1002f3:	c3                   	ret    

001002f4 <loadUMain>:
  1002f4:	55                   	push   %ebp
  1002f5:	89 e5                	mov    %esp,%ebp
  1002f7:	57                   	push   %edi
  1002f8:	56                   	push   %esi
  1002f9:	53                   	push   %ebx
  1002fa:	83 ec 0c             	sub    $0xc,%esp
  1002fd:	be c9 00 00 00       	mov    $0xc9,%esi
  100302:	bb 00 00 21 00       	mov    $0x210000,%ebx
  100307:	90                   	nop
  100308:	56                   	push   %esi
  100309:	53                   	push   %ebx
  10030a:	e8 dd fd ff ff       	call   1000ec <readSect>
  10030f:	81 c3 00 02 00 00    	add    $0x200,%ebx
  100315:	46                   	inc    %esi
  100316:	58                   	pop    %eax
  100317:	5a                   	pop    %edx
  100318:	81 fb 00 90 22 00    	cmp    $0x229000,%ebx
  10031e:	75 e8                	jne    100308 <loadUMain+0x14>
  100320:	a1 1c 00 21 00       	mov    0x21001c,%eax
  100325:	8d 88 00 00 21 00    	lea    0x210000(%eax),%ecx
  10032b:	0f b7 35 2c 00 21 00 	movzwl 0x21002c,%esi
  100332:	c1 e6 05             	shl    $0x5,%esi
  100335:	01 ce                	add    %ecx,%esi
  100337:	39 f1                	cmp    %esi,%ecx
  100339:	73 42                	jae    10037d <loadUMain+0x89>
  10033b:	90                   	nop
  10033c:	8b 51 08             	mov    0x8(%ecx),%edx
  10033f:	8b 41 04             	mov    0x4(%ecx),%eax
  100342:	8d b8 00 00 21 00    	lea    0x210000(%eax),%edi
  100348:	8b 59 10             	mov    0x10(%ecx),%ebx
  10034b:	31 c0                	xor    %eax,%eax
  10034d:	85 db                	test   %ebx,%ebx
  10034f:	74 14                	je     100365 <loadUMain+0x71>
  100351:	8d 76 00             	lea    0x0(%esi),%esi
  100354:	42                   	inc    %edx
  100355:	8a 1c 07             	mov    (%edi,%eax,1),%bl
  100358:	88 5a ff             	mov    %bl,-0x1(%edx)
  10035b:	40                   	inc    %eax
  10035c:	8b 59 10             	mov    0x10(%ecx),%ebx
  10035f:	39 c3                	cmp    %eax,%ebx
  100361:	77 f1                	ja     100354 <loadUMain+0x60>
  100363:	89 d8                	mov    %ebx,%eax
  100365:	29 c2                	sub    %eax,%edx
  100367:	39 59 14             	cmp    %ebx,0x14(%ecx)
  10036a:	76 0a                	jbe    100376 <loadUMain+0x82>
  10036c:	c6 04 02 00          	movb   $0x0,(%edx,%eax,1)
  100370:	40                   	inc    %eax
  100371:	39 41 14             	cmp    %eax,0x14(%ecx)
  100374:	77 f6                	ja     10036c <loadUMain+0x78>
  100376:	83 c1 20             	add    $0x20,%ecx
  100379:	39 ce                	cmp    %ecx,%esi
  10037b:	77 bf                	ja     10033c <loadUMain+0x48>
  10037d:	a1 18 00 21 00       	mov    0x210018,%eax
  100382:	ba 23 00 00 00       	mov    $0x23,%edx
  100387:	52                   	push   %edx
  100388:	b9 00 00 02 00       	mov    $0x20000,%ecx
  10038d:	51                   	push   %ecx
  10038e:	9c                   	pushf  
  10038f:	b9 1b 00 00 00       	mov    $0x1b,%ecx
  100394:	51                   	push   %ecx
  100395:	50                   	push   %eax
  100396:	8e da                	mov    %edx,%ds
  100398:	cf                   	iret   
  100399:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10039c:	5b                   	pop    %ebx
  10039d:	5e                   	pop    %esi
  10039e:	5f                   	pop    %edi
  10039f:	5d                   	pop    %ebp
  1003a0:	ff e0                	jmp    *%eax
  1003a2:	66 90                	xchg   %ax,%ax

001003a4 <printch>:
  1003a4:	55                   	push   %ebp
  1003a5:	89 e5                	mov    %esp,%ebp
  1003a7:	83 ec 10             	sub    $0x10,%esp
  1003aa:	0f be 45 08          	movsbl 0x8(%ebp),%eax
  1003ae:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1003b1:	a1 00 10 10 00       	mov    0x101000,%eax
  1003b6:	8d 04 80             	lea    (%eax,%eax,4),%eax
  1003b9:	c1 e0 04             	shl    $0x4,%eax
  1003bc:	03 05 28 11 10 00    	add    0x101128,%eax
  1003c2:	01 c0                	add    %eax,%eax
  1003c4:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1003c7:	c7 45 fc 0c 00 00 00 	movl   $0xc,-0x4(%ebp)
  1003ce:	60                   	pusha  
  1003cf:	8b 7d f8             	mov    -0x8(%ebp),%edi
  1003d2:	8a 65 fc             	mov    -0x4(%ebp),%ah
  1003d5:	8a 45 f4             	mov    -0xc(%ebp),%al
  1003d8:	65 66 89 07          	mov    %ax,%gs:(%edi)
  1003dc:	61                   	popa   
  1003dd:	c9                   	leave  
  1003de:	c3                   	ret    
  1003df:	90                   	nop

001003e0 <fs_write>:
  1003e0:	55                   	push   %ebp
  1003e1:	89 e5                	mov    %esp,%ebp
  1003e3:	57                   	push   %edi
  1003e4:	56                   	push   %esi
  1003e5:	53                   	push   %ebx
  1003e6:	83 ec 10             	sub    $0x10,%esp
  1003e9:	8b 45 10             	mov    0x10(%ebp),%eax
  1003ec:	85 c0                	test   %eax,%eax
  1003ee:	7e 6d                	jle    10045d <fs_write+0x7d>
  1003f0:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  1003f3:	8b 75 10             	mov    0x10(%ebp),%esi
  1003f6:	01 ce                	add    %ecx,%esi
  1003f8:	bf 50 00 00 00       	mov    $0x50,%edi
  1003fd:	eb 16                	jmp    100415 <fs_write+0x35>
  1003ff:	90                   	nop
  100400:	99                   	cltd   
  100401:	f7 ff                	idiv   %edi
  100403:	89 15 28 11 10 00    	mov    %edx,0x101128
  100409:	43                   	inc    %ebx
  10040a:	89 1d 00 10 10 00    	mov    %ebx,0x101000
  100410:	41                   	inc    %ecx
  100411:	39 f1                	cmp    %esi,%ecx
  100413:	74 48                	je     10045d <fs_write+0x7d>
  100415:	0f be 01             	movsbl (%ecx),%eax
  100418:	3c 0a                	cmp    $0xa,%al
  10041a:	74 4c                	je     100468 <fs_write+0x88>
  10041c:	89 45 e8             	mov    %eax,-0x18(%ebp)
  10041f:	8b 1d 00 10 10 00    	mov    0x101000,%ebx
  100425:	a1 28 11 10 00       	mov    0x101128,%eax
  10042a:	8d 14 9b             	lea    (%ebx,%ebx,4),%edx
  10042d:	c1 e2 04             	shl    $0x4,%edx
  100430:	01 c2                	add    %eax,%edx
  100432:	01 d2                	add    %edx,%edx
  100434:	89 55 ec             	mov    %edx,-0x14(%ebp)
  100437:	c7 45 f0 0c 00 00 00 	movl   $0xc,-0x10(%ebp)
  10043e:	60                   	pusha  
  10043f:	8b 7d ec             	mov    -0x14(%ebp),%edi
  100442:	8a 65 f0             	mov    -0x10(%ebp),%ah
  100445:	8a 45 e8             	mov    -0x18(%ebp),%al
  100448:	65 66 89 07          	mov    %ax,%gs:(%edi)
  10044c:	61                   	popa   
  10044d:	83 f8 4f             	cmp    $0x4f,%eax
  100450:	7f ae                	jg     100400 <fs_write+0x20>
  100452:	40                   	inc    %eax
  100453:	a3 28 11 10 00       	mov    %eax,0x101128
  100458:	41                   	inc    %ecx
  100459:	39 f1                	cmp    %esi,%ecx
  10045b:	75 b8                	jne    100415 <fs_write+0x35>
  10045d:	8b 45 10             	mov    0x10(%ebp),%eax
  100460:	83 c4 10             	add    $0x10,%esp
  100463:	5b                   	pop    %ebx
  100464:	5e                   	pop    %esi
  100465:	5f                   	pop    %edi
  100466:	5d                   	pop    %ebp
  100467:	c3                   	ret    
  100468:	ff 05 00 10 10 00    	incl   0x101000
  10046e:	c7 05 28 11 10 00 00 	movl   $0x0,0x101128
  100475:	00 00 00 
  100478:	eb 96                	jmp    100410 <fs_write+0x30>
  10047a:	66 90                	xchg   %ax,%ax

0010047c <sys_write>:
  10047c:	55                   	push   %ebp
  10047d:	89 e5                	mov    %esp,%ebp
  10047f:	53                   	push   %ebx
  100480:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100483:	ff 73 14             	pushl  0x14(%ebx)
  100486:	ff 73 18             	pushl  0x18(%ebx)
  100489:	ff 73 10             	pushl  0x10(%ebx)
  10048c:	e8 4f ff ff ff       	call   1003e0 <fs_write>
  100491:	89 43 1c             	mov    %eax,0x1c(%ebx)
  100494:	83 c4 0c             	add    $0xc,%esp
  100497:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10049a:	c9                   	leave  
  10049b:	c3                   	ret    

0010049c <irqHandle>:
  10049c:	55                   	push   %ebp
  10049d:	89 e5                	mov    %esp,%ebp
  10049f:	53                   	push   %ebx
  1004a0:	52                   	push   %edx
  1004a1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1004a4:	8b 43 20             	mov    0x20(%ebx),%eax
  1004a7:	83 f8 0d             	cmp    $0xd,%eax
  1004aa:	74 44                	je     1004f0 <irqHandle+0x54>
  1004ac:	3d 80 00 00 00       	cmp    $0x80,%eax
  1004b1:	74 1d                	je     1004d0 <irqHandle+0x34>
  1004b3:	40                   	inc    %eax
  1004b4:	74 12                	je     1004c8 <irqHandle+0x2c>
  1004b6:	83 ec 08             	sub    $0x8,%esp
  1004b9:	6a 44                	push   $0x44
  1004bb:	68 c0 06 10 00       	push   $0x1006c0
  1004c0:	e8 37 01 00 00       	call   1005fc <abort>
  1004c5:	83 c4 10             	add    $0x10,%esp
  1004c8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1004cb:	c9                   	leave  
  1004cc:	c3                   	ret    
  1004cd:	8d 76 00             	lea    0x0(%esi),%esi
  1004d0:	83 7b 1c 04          	cmpl   $0x4,0x1c(%ebx)
  1004d4:	75 f2                	jne    1004c8 <irqHandle+0x2c>
  1004d6:	50                   	push   %eax
  1004d7:	ff 73 14             	pushl  0x14(%ebx)
  1004da:	ff 73 18             	pushl  0x18(%ebx)
  1004dd:	ff 73 10             	pushl  0x10(%ebx)
  1004e0:	e8 fb fe ff ff       	call   1003e0 <fs_write>
  1004e5:	89 43 1c             	mov    %eax,0x1c(%ebx)
  1004e8:	83 c4 10             	add    $0x10,%esp
  1004eb:	eb db                	jmp    1004c8 <irqHandle+0x2c>
  1004ed:	8d 76 00             	lea    0x0(%esi),%esi
  1004f0:	83 ec 08             	sub    $0x8,%esp
  1004f3:	6a 50                	push   $0x50
  1004f5:	68 c0 06 10 00       	push   $0x1006c0
  1004fa:	e8 fd 00 00 00       	call   1005fc <abort>
  1004ff:	83 c4 10             	add    $0x10,%esp
  100502:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100505:	c9                   	leave  
  100506:	c3                   	ret    
  100507:	90                   	nop

00100508 <syscallHandle>:
  100508:	55                   	push   %ebp
  100509:	89 e5                	mov    %esp,%ebp
  10050b:	53                   	push   %ebx
  10050c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10050f:	83 7b 1c 04          	cmpl   $0x4,0x1c(%ebx)
  100513:	75 14                	jne    100529 <syscallHandle+0x21>
  100515:	ff 73 14             	pushl  0x14(%ebx)
  100518:	ff 73 18             	pushl  0x18(%ebx)
  10051b:	ff 73 10             	pushl  0x10(%ebx)
  10051e:	e8 bd fe ff ff       	call   1003e0 <fs_write>
  100523:	89 43 1c             	mov    %eax,0x1c(%ebx)
  100526:	83 c4 0c             	add    $0xc,%esp
  100529:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10052c:	c9                   	leave  
  10052d:	c3                   	ret    
  10052e:	66 90                	xchg   %ax,%ax

00100530 <GProtectFaultHandle>:
  100530:	55                   	push   %ebp
  100531:	89 e5                	mov    %esp,%ebp
  100533:	83 ec 10             	sub    $0x10,%esp
  100536:	6a 50                	push   $0x50
  100538:	68 c0 06 10 00       	push   $0x1006c0
  10053d:	e8 ba 00 00 00       	call   1005fc <abort>
  100542:	83 c4 10             	add    $0x10,%esp
  100545:	c9                   	leave  
  100546:	c3                   	ret    
  100547:	90                   	nop

00100548 <initIdt>:
  100548:	55                   	push   %ebp
  100549:	89 e5                	mov    %esp,%ebp
  10054b:	53                   	push   %ebx
  10054c:	ba 93 06 10 00       	mov    $0x100693,%edx
  100551:	89 d3                	mov    %edx,%ebx
  100553:	c1 ea 10             	shr    $0x10,%edx
  100556:	b9 20 1a 10 00       	mov    $0x101a20,%ecx
  10055b:	b8 20 12 10 00       	mov    $0x101220,%eax
  100560:	66 89 18             	mov    %bx,(%eax)
  100563:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  100569:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  10056d:	c6 40 05 8f          	movb   $0x8f,0x5(%eax)
  100571:	66 89 50 06          	mov    %dx,0x6(%eax)
  100575:	83 c0 08             	add    $0x8,%eax
  100578:	39 c1                	cmp    %eax,%ecx
  10057a:	75 e4                	jne    100560 <initIdt+0x18>
  10057c:	b8 99 06 10 00       	mov    $0x100699,%eax
  100581:	66 a3 88 12 10 00    	mov    %ax,0x101288
  100587:	66 c7 05 8a 12 10 00 	movw   $0x8,0x10128a
  10058e:	08 00 
  100590:	c6 05 8c 12 10 00 00 	movb   $0x0,0x10128c
  100597:	c6 05 8d 12 10 00 8f 	movb   $0x8f,0x10128d
  10059e:	c1 e8 10             	shr    $0x10,%eax
  1005a1:	66 a3 8e 12 10 00    	mov    %ax,0x10128e
  1005a7:	b8 9d 06 10 00       	mov    $0x10069d,%eax
  1005ac:	66 a3 20 16 10 00    	mov    %ax,0x101620
  1005b2:	66 c7 05 22 16 10 00 	movw   $0x8,0x101622
  1005b9:	08 00 
  1005bb:	c6 05 24 16 10 00 00 	movb   $0x0,0x101624
  1005c2:	c6 05 25 16 10 00 ee 	movb   $0xee,0x101625
  1005c9:	c1 e8 10             	shr    $0x10,%eax
  1005cc:	66 a3 26 16 10 00    	mov    %ax,0x101626
  1005d2:	66 c7 05 2c 11 10 00 	movw   $0x7ff,0x10112c
  1005d9:	ff 07 
  1005db:	b8 20 12 10 00       	mov    $0x101220,%eax
  1005e0:	66 a3 2e 11 10 00    	mov    %ax,0x10112e
  1005e6:	c1 e8 10             	shr    $0x10,%eax
  1005e9:	66 a3 30 11 10 00    	mov    %ax,0x101130
  1005ef:	b8 2c 11 10 00       	mov    $0x10112c,%eax
  1005f4:	0f 01 18             	lidtl  (%eax)
  1005f7:	5b                   	pop    %ebx
  1005f8:	5d                   	pop    %ebp
  1005f9:	c3                   	ret    
  1005fa:	66 90                	xchg   %ax,%ax

001005fc <abort>:
  1005fc:	55                   	push   %ebp
  1005fd:	89 e5                	mov    %esp,%ebp
  1005ff:	57                   	push   %edi
  100600:	56                   	push   %esi
  100601:	53                   	push   %ebx
  100602:	83 ec 1c             	sub    $0x1c,%esp
  100605:	8b 55 08             	mov    0x8(%ebp),%edx
  100608:	fa                   	cli    
  100609:	8a 02                	mov    (%edx),%al
  10060b:	b9 32 10 10 00       	mov    $0x101032,%ecx
  100610:	84 c0                	test   %al,%al
  100612:	74 0b                	je     10061f <abort+0x23>
  100614:	41                   	inc    %ecx
  100615:	42                   	inc    %edx
  100616:	88 41 ff             	mov    %al,-0x1(%ecx)
  100619:	8a 02                	mov    (%edx),%al
  10061b:	84 c0                	test   %al,%al
  10061d:	75 f5                	jne    100614 <abort+0x18>
  10061f:	c6 01 3a             	movb   $0x3a,(%ecx)
  100622:	bb 51 11 10 00       	mov    $0x101151,%ebx
  100627:	be 0a 00 00 00       	mov    $0xa,%esi
  10062c:	bf 67 66 66 66       	mov    $0x66666667,%edi
  100631:	4b                   	dec    %ebx
  100632:	8b 45 0c             	mov    0xc(%ebp),%eax
  100635:	99                   	cltd   
  100636:	f7 fe                	idiv   %esi
  100638:	8d 42 30             	lea    0x30(%edx),%eax
  10063b:	88 45 e7             	mov    %al,-0x19(%ebp)
  10063e:	88 03                	mov    %al,(%ebx)
  100640:	89 f8                	mov    %edi,%eax
  100642:	f7 6d 0c             	imull  0xc(%ebp)
  100645:	c1 fa 02             	sar    $0x2,%edx
  100648:	8b 45 0c             	mov    0xc(%ebp),%eax
  10064b:	c1 f8 1f             	sar    $0x1f,%eax
  10064e:	29 c2                	sub    %eax,%edx
  100650:	89 55 0c             	mov    %edx,0xc(%ebp)
  100653:	75 dc                	jne    100631 <abort+0x35>
  100655:	41                   	inc    %ecx
  100656:	41                   	inc    %ecx
  100657:	43                   	inc    %ebx
  100658:	8a 45 e7             	mov    -0x19(%ebp),%al
  10065b:	88 41 ff             	mov    %al,-0x1(%ecx)
  10065e:	8a 03                	mov    (%ebx),%al
  100660:	88 45 e7             	mov    %al,-0x19(%ebp)
  100663:	84 c0                	test   %al,%al
  100665:	75 ef                	jne    100656 <abort+0x5a>
  100667:	c6 01 0a             	movb   $0xa,(%ecx)
  10066a:	0f be 05 20 10 10 00 	movsbl 0x101020,%eax
  100671:	84 c0                	test   %al,%al
  100673:	74 1b                	je     100690 <abort+0x94>
  100675:	bb 20 10 10 00       	mov    $0x101020,%ebx
  10067a:	83 ec 0c             	sub    $0xc,%esp
  10067d:	50                   	push   %eax
  10067e:	e8 e1 f9 ff ff       	call   100064 <putChar>
  100683:	43                   	inc    %ebx
  100684:	0f be 03             	movsbl (%ebx),%eax
  100687:	83 c4 10             	add    $0x10,%esp
  10068a:	84 c0                	test   %al,%al
  10068c:	75 ec                	jne    10067a <abort+0x7e>
  10068e:	66 90                	xchg   %ax,%ax
  100690:	f4                   	hlt    
  100691:	eb fd                	jmp    100690 <abort+0x94>

00100693 <irqEmpty>:
  100693:	6a 00                	push   $0x0
  100695:	6a ff                	push   $0xffffffff
  100697:	eb 0d                	jmp    1006a6 <asmDoIrq>

00100699 <irqGProtectFault>:
  100699:	6a 0d                	push   $0xd
  10069b:	eb 09                	jmp    1006a6 <asmDoIrq>

0010069d <irqSyscall>:
  10069d:	6a 00                	push   $0x0
  10069f:	68 80 00 00 00       	push   $0x80
  1006a4:	eb 00                	jmp    1006a6 <asmDoIrq>

001006a6 <asmDoIrq>:
  1006a6:	60                   	pusha  
  1006a7:	54                   	push   %esp
  1006a8:	e8 ef fd ff ff       	call   10049c <irqHandle>
  1006ad:	83 c4 04             	add    $0x4,%esp
  1006b0:	61                   	popa   
  1006b1:	83 c4 04             	add    $0x4,%esp
  1006b4:	83 c4 04             	add    $0x4,%esp
  1006b7:	cf                   	iret   
