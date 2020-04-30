
kMain.elf:     file format elf32-i386


Disassembly of section .text:

00100000 <kEntry>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 08             	sub    $0x8,%esp
  100006:	e8 21 00 00 00       	call   10002c <initSerial>
  10000b:	e8 e8 0a 00 00       	call   100af8 <initIdt>
  100010:	e8 8b 00 00 00       	call   1000a0 <initIntr>
  100015:	e8 22 04 00 00       	call   10043c <initSeg>
  10001a:	e8 69 00 00 00       	call   100088 <initTimer>
  10001f:	e8 a8 0d 00 00       	call   100dcc <initProcess>
  100024:	e8 cf 05 00 00       	call   1005f8 <loadUMain>
  100029:	eb fe                	jmp    100029 <kEntry+0x29>
  10002b:	90                   	nop

0010002c <initSerial>:
  10002c:	55                   	push   %ebp
  10002d:	89 e5                	mov    %esp,%ebp
  10002f:	ba f9 03 00 00       	mov    $0x3f9,%edx
  100034:	31 c0                	xor    %eax,%eax
  100036:	ee                   	out    %al,(%dx)
  100037:	ba fb 03 00 00       	mov    $0x3fb,%edx
  10003c:	b0 80                	mov    $0x80,%al
  10003e:	ee                   	out    %al,(%dx)
  10003f:	ba f8 03 00 00       	mov    $0x3f8,%edx
  100044:	b0 01                	mov    $0x1,%al
  100046:	ee                   	out    %al,(%dx)
  100047:	ba f9 03 00 00       	mov    $0x3f9,%edx
  10004c:	31 c0                	xor    %eax,%eax
  10004e:	ee                   	out    %al,(%dx)
  10004f:	ba fb 03 00 00       	mov    $0x3fb,%edx
  100054:	b0 03                	mov    $0x3,%al
  100056:	ee                   	out    %al,(%dx)
  100057:	ba fa 03 00 00       	mov    $0x3fa,%edx
  10005c:	b0 c7                	mov    $0xc7,%al
  10005e:	ee                   	out    %al,(%dx)
  10005f:	ba fc 03 00 00       	mov    $0x3fc,%edx
  100064:	b0 0b                	mov    $0xb,%al
  100066:	ee                   	out    %al,(%dx)
  100067:	5d                   	pop    %ebp
  100068:	c3                   	ret    
  100069:	8d 76 00             	lea    0x0(%esi),%esi

0010006c <putChar>:
  10006c:	55                   	push   %ebp
  10006d:	89 e5                	mov    %esp,%ebp
  10006f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100072:	ba fd 03 00 00       	mov    $0x3fd,%edx
  100077:	90                   	nop
  100078:	ec                   	in     (%dx),%al
  100079:	a8 20                	test   $0x20,%al
  10007b:	74 fb                	je     100078 <putChar+0xc>
  10007d:	ba f8 03 00 00       	mov    $0x3f8,%edx
  100082:	88 c8                	mov    %cl,%al
  100084:	ee                   	out    %al,(%dx)
  100085:	5d                   	pop    %ebp
  100086:	c3                   	ret    
  100087:	90                   	nop

00100088 <initTimer>:
  100088:	55                   	push   %ebp
  100089:	89 e5                	mov    %esp,%ebp
  10008b:	ba 43 00 00 00       	mov    $0x43,%edx
  100090:	b0 34                	mov    $0x34,%al
  100092:	ee                   	out    %al,(%dx)
  100093:	ba 40 00 00 00       	mov    $0x40,%edx
  100098:	b0 9b                	mov    $0x9b,%al
  10009a:	ee                   	out    %al,(%dx)
  10009b:	b0 2e                	mov    $0x2e,%al
  10009d:	ee                   	out    %al,(%dx)
  10009e:	5d                   	pop    %ebp
  10009f:	c3                   	ret    

001000a0 <initIntr>:
  1000a0:	55                   	push   %ebp
  1000a1:	89 e5                	mov    %esp,%ebp
  1000a3:	ba 21 00 00 00       	mov    $0x21,%edx
  1000a8:	b0 ff                	mov    $0xff,%al
  1000aa:	ee                   	out    %al,(%dx)
  1000ab:	ba a1 00 00 00       	mov    $0xa1,%edx
  1000b0:	ee                   	out    %al,(%dx)
  1000b1:	ba 20 00 00 00       	mov    $0x20,%edx
  1000b6:	b0 11                	mov    $0x11,%al
  1000b8:	ee                   	out    %al,(%dx)
  1000b9:	ba 21 00 00 00       	mov    $0x21,%edx
  1000be:	b0 20                	mov    $0x20,%al
  1000c0:	ee                   	out    %al,(%dx)
  1000c1:	b0 04                	mov    $0x4,%al
  1000c3:	ee                   	out    %al,(%dx)
  1000c4:	b0 03                	mov    $0x3,%al
  1000c6:	ee                   	out    %al,(%dx)
  1000c7:	ba a0 00 00 00       	mov    $0xa0,%edx
  1000cc:	b0 11                	mov    $0x11,%al
  1000ce:	ee                   	out    %al,(%dx)
  1000cf:	ba a1 00 00 00       	mov    $0xa1,%edx
  1000d4:	b0 28                	mov    $0x28,%al
  1000d6:	ee                   	out    %al,(%dx)
  1000d7:	b0 02                	mov    $0x2,%al
  1000d9:	ee                   	out    %al,(%dx)
  1000da:	b0 03                	mov    $0x3,%al
  1000dc:	ee                   	out    %al,(%dx)
  1000dd:	ba 20 00 00 00       	mov    $0x20,%edx
  1000e2:	b0 68                	mov    $0x68,%al
  1000e4:	ee                   	out    %al,(%dx)
  1000e5:	b0 0a                	mov    $0xa,%al
  1000e7:	ee                   	out    %al,(%dx)
  1000e8:	ba a0 00 00 00       	mov    $0xa0,%edx
  1000ed:	b0 68                	mov    $0x68,%al
  1000ef:	ee                   	out    %al,(%dx)
  1000f0:	b0 0a                	mov    $0xa,%al
  1000f2:	ee                   	out    %al,(%dx)
  1000f3:	5d                   	pop    %ebp
  1000f4:	c3                   	ret    
  1000f5:	66 90                	xchg   %ax,%ax
  1000f7:	90                   	nop

001000f8 <addString2Buff>:
  1000f8:	55                   	push   %ebp
  1000f9:	89 e5                	mov    %esp,%ebp
  1000fb:	8b 4d 08             	mov    0x8(%ebp),%ecx
  1000fe:	8a 11                	mov    (%ecx),%dl
  100100:	84 d2                	test   %dl,%dl
  100102:	74 1b                	je     10011f <addString2Buff+0x27>
  100104:	a1 e8 21 10 00       	mov    0x1021e8,%eax
  100109:	29 c1                	sub    %eax,%ecx
  10010b:	90                   	nop
  10010c:	40                   	inc    %eax
  10010d:	88 90 1f 21 10 00    	mov    %dl,0x10211f(%eax)
  100113:	8a 14 01             	mov    (%ecx,%eax,1),%dl
  100116:	84 d2                	test   %dl,%dl
  100118:	75 f2                	jne    10010c <addString2Buff+0x14>
  10011a:	a3 e8 21 10 00       	mov    %eax,0x1021e8
  10011f:	5d                   	pop    %ebp
  100120:	c3                   	ret    
  100121:	8d 76 00             	lea    0x0(%esi),%esi

00100124 <addCh2Buff>:
  100124:	55                   	push   %ebp
  100125:	89 e5                	mov    %esp,%ebp
  100127:	a1 e8 21 10 00       	mov    0x1021e8,%eax
  10012c:	8d 50 01             	lea    0x1(%eax),%edx
  10012f:	89 15 e8 21 10 00    	mov    %edx,0x1021e8
  100135:	8b 55 08             	mov    0x8(%ebp),%edx
  100138:	88 90 20 21 10 00    	mov    %dl,0x102120(%eax)
  10013e:	5d                   	pop    %ebp
  10013f:	c3                   	ret    

00100140 <addDec2Buff>:
  100140:	55                   	push   %ebp
  100141:	89 e5                	mov    %esp,%ebp
  100143:	56                   	push   %esi
  100144:	53                   	push   %ebx
  100145:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100148:	85 db                	test   %ebx,%ebx
  10014a:	0f 89 92 00 00 00    	jns    1001e2 <addDec2Buff+0xa2>
  100150:	81 fb 00 00 00 80    	cmp    $0x80000000,%ebx
  100156:	74 58                	je     1001b0 <addDec2Buff+0x70>
  100158:	a1 e8 21 10 00       	mov    0x1021e8,%eax
  10015d:	c6 80 20 21 10 00 2d 	movb   $0x2d,0x102120(%eax)
  100164:	40                   	inc    %eax
  100165:	f7 db                	neg    %ebx
  100167:	a3 e8 21 10 00       	mov    %eax,0x1021e8
  10016c:	83 ec 0c             	sub    $0xc,%esp
  10016f:	b8 67 66 66 66       	mov    $0x66666667,%eax
  100174:	f7 eb                	imul   %ebx
  100176:	89 d6                	mov    %edx,%esi
  100178:	c1 fe 02             	sar    $0x2,%esi
  10017b:	89 d8                	mov    %ebx,%eax
  10017d:	c1 f8 1f             	sar    $0x1f,%eax
  100180:	29 c6                	sub    %eax,%esi
  100182:	56                   	push   %esi
  100183:	e8 b8 ff ff ff       	call   100140 <addDec2Buff>
  100188:	8b 15 e8 21 10 00    	mov    0x1021e8,%edx
  10018e:	8d 42 01             	lea    0x1(%edx),%eax
  100191:	a3 e8 21 10 00       	mov    %eax,0x1021e8
  100196:	8d 04 b6             	lea    (%esi,%esi,4),%eax
  100199:	01 c0                	add    %eax,%eax
  10019b:	29 c3                	sub    %eax,%ebx
  10019d:	83 c3 30             	add    $0x30,%ebx
  1001a0:	88 9a 20 21 10 00    	mov    %bl,0x102120(%edx)
  1001a6:	83 c4 10             	add    $0x10,%esp
  1001a9:	8d 65 f8             	lea    -0x8(%ebp),%esp
  1001ac:	5b                   	pop    %ebx
  1001ad:	5e                   	pop    %esi
  1001ae:	5d                   	pop    %ebp
  1001af:	c3                   	ret    
  1001b0:	8b 1d e8 21 10 00    	mov    0x1021e8,%ebx
  1001b6:	8d 43 01             	lea    0x1(%ebx),%eax
  1001b9:	b2 2d                	mov    $0x2d,%dl
  1001bb:	b9 7c 0f 10 00       	mov    $0x100f7c,%ecx
  1001c0:	29 d9                	sub    %ebx,%ecx
  1001c2:	66 90                	xchg   %ax,%ax
  1001c4:	89 c3                	mov    %eax,%ebx
  1001c6:	88 90 1f 21 10 00    	mov    %dl,0x10211f(%eax)
  1001cc:	40                   	inc    %eax
  1001cd:	8a 54 01 ff          	mov    -0x1(%ecx,%eax,1),%dl
  1001d1:	84 d2                	test   %dl,%dl
  1001d3:	75 ef                	jne    1001c4 <addDec2Buff+0x84>
  1001d5:	89 1d e8 21 10 00    	mov    %ebx,0x1021e8
  1001db:	8d 65 f8             	lea    -0x8(%ebp),%esp
  1001de:	5b                   	pop    %ebx
  1001df:	5e                   	pop    %esi
  1001e0:	5d                   	pop    %ebp
  1001e1:	c3                   	ret    
  1001e2:	74 c5                	je     1001a9 <addDec2Buff+0x69>
  1001e4:	eb 86                	jmp    10016c <addDec2Buff+0x2c>
  1001e6:	66 90                	xchg   %ax,%ax

001001e8 <addHex2Buff>:
  1001e8:	55                   	push   %ebp
  1001e9:	89 e5                	mov    %esp,%ebp
  1001eb:	8b 45 08             	mov    0x8(%ebp),%eax
  1001ee:	85 c0                	test   %eax,%eax
  1001f0:	75 02                	jne    1001f4 <addHex2Buff+0xc>
  1001f2:	5d                   	pop    %ebp
  1001f3:	c3                   	ret    
  1001f4:	5d                   	pop    %ebp
  1001f5:	eb 01                	jmp    1001f8 <addHex2Buff.part.1>
  1001f7:	90                   	nop

001001f8 <addHex2Buff.part.1>:
  1001f8:	55                   	push   %ebp
  1001f9:	89 e5                	mov    %esp,%ebp
  1001fb:	53                   	push   %ebx
  1001fc:	83 ec 10             	sub    $0x10,%esp
  1001ff:	89 c3                	mov    %eax,%ebx
  100201:	89 c2                	mov    %eax,%edx
  100203:	c1 ea 04             	shr    $0x4,%edx
  100206:	52                   	push   %edx
  100207:	e8 dc ff ff ff       	call   1001e8 <addHex2Buff>
  10020c:	89 d8                	mov    %ebx,%eax
  10020e:	83 e0 0f             	and    $0xf,%eax
  100211:	83 c4 10             	add    $0x10,%esp
  100214:	8b 15 e8 21 10 00    	mov    0x1021e8,%edx
  10021a:	8d 4a 01             	lea    0x1(%edx),%ecx
  10021d:	89 0d e8 21 10 00    	mov    %ecx,0x1021e8
  100223:	83 f8 09             	cmp    $0x9,%eax
  100226:	76 10                	jbe    100238 <addHex2Buff.part.1+0x40>
  100228:	83 c0 57             	add    $0x57,%eax
  10022b:	88 82 20 21 10 00    	mov    %al,0x102120(%edx)
  100231:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100234:	c9                   	leave  
  100235:	c3                   	ret    
  100236:	66 90                	xchg   %ax,%ax
  100238:	83 c0 30             	add    $0x30,%eax
  10023b:	88 82 20 21 10 00    	mov    %al,0x102120(%edx)
  100241:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100244:	c9                   	leave  
  100245:	c3                   	ret    
  100246:	66 90                	xchg   %ax,%ax

00100248 <Log>:
  100248:	55                   	push   %ebp
  100249:	89 e5                	mov    %esp,%ebp
  10024b:	57                   	push   %edi
  10024c:	56                   	push   %esi
  10024d:	53                   	push   %ebx
  10024e:	83 ec 0c             	sub    $0xc,%esp
  100251:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100254:	8d 75 0c             	lea    0xc(%ebp),%esi
  100257:	8a 03                	mov    (%ebx),%al
  100259:	84 c0                	test   %al,%al
  10025b:	74 21                	je     10027e <Log+0x36>
  10025d:	3c 25                	cmp    $0x25,%al
  10025f:	74 5f                	je     1002c0 <Log+0x78>
  100261:	8b 15 e8 21 10 00    	mov    0x1021e8,%edx
  100267:	8d 4a 01             	lea    0x1(%edx),%ecx
  10026a:	89 0d e8 21 10 00    	mov    %ecx,0x1021e8
  100270:	88 82 20 21 10 00    	mov    %al,0x102120(%edx)
  100276:	8a 43 01             	mov    0x1(%ebx),%al
  100279:	43                   	inc    %ebx
  10027a:	84 c0                	test   %al,%al
  10027c:	75 df                	jne    10025d <Log+0x15>
  10027e:	a1 e8 21 10 00       	mov    0x1021e8,%eax
  100283:	c6 80 20 21 10 00 00 	movb   $0x0,0x102120(%eax)
  10028a:	85 c0                	test   %eax,%eax
  10028c:	7e 1e                	jle    1002ac <Log+0x64>
  10028e:	31 db                	xor    %ebx,%ebx
  100290:	83 ec 0c             	sub    $0xc,%esp
  100293:	0f be 83 20 21 10 00 	movsbl 0x102120(%ebx),%eax
  10029a:	50                   	push   %eax
  10029b:	e8 cc fd ff ff       	call   10006c <putChar>
  1002a0:	43                   	inc    %ebx
  1002a1:	83 c4 10             	add    $0x10,%esp
  1002a4:	39 1d e8 21 10 00    	cmp    %ebx,0x1021e8
  1002aa:	7f e4                	jg     100290 <Log+0x48>
  1002ac:	c7 05 e8 21 10 00 00 	movl   $0x0,0x1021e8
  1002b3:	00 00 00 
  1002b6:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1002b9:	5b                   	pop    %ebx
  1002ba:	5e                   	pop    %esi
  1002bb:	5f                   	pop    %edi
  1002bc:	5d                   	pop    %ebp
  1002bd:	c3                   	ret    
  1002be:	66 90                	xchg   %ax,%ax
  1002c0:	8a 43 01             	mov    0x1(%ebx),%al
  1002c3:	3c 64                	cmp    $0x64,%al
  1002c5:	74 5e                	je     100325 <Log+0xdd>
  1002c7:	7f 33                	jg     1002fc <Log+0xb4>
  1002c9:	3c 25                	cmp    $0x25,%al
  1002cb:	0f 84 b3 00 00 00    	je     100384 <Log+0x13c>
  1002d1:	3c 63                	cmp    $0x63,%al
  1002d3:	75 4a                	jne    10031f <Log+0xd7>
  1002d5:	8b 16                	mov    (%esi),%edx
  1002d7:	a1 e8 21 10 00       	mov    0x1021e8,%eax
  1002dc:	8d 48 01             	lea    0x1(%eax),%ecx
  1002df:	89 0d e8 21 10 00    	mov    %ecx,0x1021e8
  1002e5:	88 90 20 21 10 00    	mov    %dl,0x102120(%eax)
  1002eb:	8a 43 02             	mov    0x2(%ebx),%al
  1002ee:	83 c6 04             	add    $0x4,%esi
  1002f1:	83 c3 02             	add    $0x2,%ebx
  1002f4:	e9 60 ff ff ff       	jmp    100259 <Log+0x11>
  1002f9:	8d 76 00             	lea    0x0(%esi),%esi
  1002fc:	3c 73                	cmp    $0x73,%al
  1002fe:	74 47                	je     100347 <Log+0xff>
  100300:	3c 78                	cmp    $0x78,%al
  100302:	75 1b                	jne    10031f <Log+0xd7>
  100304:	89 f0                	mov    %esi,%eax
  100306:	83 c6 04             	add    $0x4,%esi
  100309:	8b 00                	mov    (%eax),%eax
  10030b:	85 c0                	test   %eax,%eax
  10030d:	74 21                	je     100330 <Log+0xe8>
  10030f:	e8 e4 fe ff ff       	call   1001f8 <addHex2Buff.part.1>
  100314:	8a 43 02             	mov    0x2(%ebx),%al
  100317:	83 c3 02             	add    $0x2,%ebx
  10031a:	e9 3a ff ff ff       	jmp    100259 <Log+0x11>
  10031f:	43                   	inc    %ebx
  100320:	e9 34 ff ff ff       	jmp    100259 <Log+0x11>
  100325:	89 f0                	mov    %esi,%eax
  100327:	83 c6 04             	add    $0x4,%esi
  10032a:	8b 00                	mov    (%eax),%eax
  10032c:	85 c0                	test   %eax,%eax
  10032e:	75 6e                	jne    10039e <Log+0x156>
  100330:	a1 e8 21 10 00       	mov    0x1021e8,%eax
  100335:	8d 50 01             	lea    0x1(%eax),%edx
  100338:	89 15 e8 21 10 00    	mov    %edx,0x1021e8
  10033e:	c6 80 20 21 10 00 30 	movb   $0x30,0x102120(%eax)
  100345:	eb cd                	jmp    100314 <Log+0xcc>
  100347:	8d 4e 04             	lea    0x4(%esi),%ecx
  10034a:	8b 36                	mov    (%esi),%esi
  10034c:	8a 16                	mov    (%esi),%dl
  10034e:	84 d2                	test   %dl,%dl
  100350:	74 25                	je     100377 <Log+0x12f>
  100352:	8b 3d e8 21 10 00    	mov    0x1021e8,%edi
  100358:	8d 47 01             	lea    0x1(%edi),%eax
  10035b:	29 fe                	sub    %edi,%esi
  10035d:	8d 76 00             	lea    0x0(%esi),%esi
  100360:	89 c7                	mov    %eax,%edi
  100362:	88 90 1f 21 10 00    	mov    %dl,0x10211f(%eax)
  100368:	40                   	inc    %eax
  100369:	8a 54 06 ff          	mov    -0x1(%esi,%eax,1),%dl
  10036d:	84 d2                	test   %dl,%dl
  10036f:	75 ef                	jne    100360 <Log+0x118>
  100371:	89 3d e8 21 10 00    	mov    %edi,0x1021e8
  100377:	8a 43 02             	mov    0x2(%ebx),%al
  10037a:	89 ce                	mov    %ecx,%esi
  10037c:	83 c3 02             	add    $0x2,%ebx
  10037f:	e9 d5 fe ff ff       	jmp    100259 <Log+0x11>
  100384:	a1 e8 21 10 00       	mov    0x1021e8,%eax
  100389:	8d 50 01             	lea    0x1(%eax),%edx
  10038c:	89 15 e8 21 10 00    	mov    %edx,0x1021e8
  100392:	c6 80 20 21 10 00 25 	movb   $0x25,0x102120(%eax)
  100399:	e9 76 ff ff ff       	jmp    100314 <Log+0xcc>
  10039e:	83 ec 0c             	sub    $0xc,%esp
  1003a1:	50                   	push   %eax
  1003a2:	e8 99 fd ff ff       	call   100140 <addDec2Buff>
  1003a7:	83 c4 10             	add    $0x10,%esp
  1003aa:	e9 65 ff ff ff       	jmp    100314 <Log+0xcc>
  1003af:	90                   	nop

001003b0 <waitDisk>:
  1003b0:	55                   	push   %ebp
  1003b1:	89 e5                	mov    %esp,%ebp
  1003b3:	ba f7 01 00 00       	mov    $0x1f7,%edx
  1003b8:	ec                   	in     (%dx),%al
  1003b9:	83 e0 c0             	and    $0xffffffc0,%eax
  1003bc:	3c 40                	cmp    $0x40,%al
  1003be:	75 f8                	jne    1003b8 <waitDisk+0x8>
  1003c0:	5d                   	pop    %ebp
  1003c1:	c3                   	ret    
  1003c2:	66 90                	xchg   %ax,%ax

001003c4 <readSect>:
  1003c4:	55                   	push   %ebp
  1003c5:	89 e5                	mov    %esp,%ebp
  1003c7:	53                   	push   %ebx
  1003c8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  1003cb:	ba f7 01 00 00       	mov    $0x1f7,%edx
  1003d0:	ec                   	in     (%dx),%al
  1003d1:	83 e0 c0             	and    $0xffffffc0,%eax
  1003d4:	3c 40                	cmp    $0x40,%al
  1003d6:	75 f8                	jne    1003d0 <readSect+0xc>
  1003d8:	ba f2 01 00 00       	mov    $0x1f2,%edx
  1003dd:	b0 01                	mov    $0x1,%al
  1003df:	ee                   	out    %al,(%dx)
  1003e0:	ba f3 01 00 00       	mov    $0x1f3,%edx
  1003e5:	88 c8                	mov    %cl,%al
  1003e7:	ee                   	out    %al,(%dx)
  1003e8:	89 c8                	mov    %ecx,%eax
  1003ea:	c1 f8 08             	sar    $0x8,%eax
  1003ed:	ba f4 01 00 00       	mov    $0x1f4,%edx
  1003f2:	ee                   	out    %al,(%dx)
  1003f3:	89 c8                	mov    %ecx,%eax
  1003f5:	c1 f8 10             	sar    $0x10,%eax
  1003f8:	ba f5 01 00 00       	mov    $0x1f5,%edx
  1003fd:	ee                   	out    %al,(%dx)
  1003fe:	89 c8                	mov    %ecx,%eax
  100400:	c1 f8 18             	sar    $0x18,%eax
  100403:	83 c8 e0             	or     $0xffffffe0,%eax
  100406:	ba f6 01 00 00       	mov    $0x1f6,%edx
  10040b:	ee                   	out    %al,(%dx)
  10040c:	ba f7 01 00 00       	mov    $0x1f7,%edx
  100411:	b0 20                	mov    $0x20,%al
  100413:	ee                   	out    %al,(%dx)
  100414:	ec                   	in     (%dx),%al
  100415:	83 e0 c0             	and    $0xffffffc0,%eax
  100418:	3c 40                	cmp    $0x40,%al
  10041a:	75 f8                	jne    100414 <readSect+0x50>
  10041c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10041f:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
  100425:	ba f0 01 00 00       	mov    $0x1f0,%edx
  10042a:	66 90                	xchg   %ax,%ax
  10042c:	ed                   	in     (%dx),%eax
  10042d:	89 01                	mov    %eax,(%ecx)
  10042f:	83 c1 04             	add    $0x4,%ecx
  100432:	39 d9                	cmp    %ebx,%ecx
  100434:	75 f6                	jne    10042c <readSect+0x68>
  100436:	5b                   	pop    %ebx
  100437:	5d                   	pop    %ebp
  100438:	c3                   	ret    
  100439:	8d 76 00             	lea    0x0(%esi),%esi

0010043c <initSeg>:
  10043c:	55                   	push   %ebp
  10043d:	89 e5                	mov    %esp,%ebp
  10043f:	b9 c0 23 11 00       	mov    $0x1123c0,%ecx
  100444:	66 c7 05 c8 23 11 00 	movw   $0xffff,0x1123c8
  10044b:	ff ff 
  10044d:	66 c7 05 ca 23 11 00 	movw   $0x0,0x1123ca
  100454:	00 00 
  100456:	c6 05 cc 23 11 00 00 	movb   $0x0,0x1123cc
  10045d:	c6 05 cd 23 11 00 9a 	movb   $0x9a,0x1123cd
  100464:	c6 05 ce 23 11 00 cf 	movb   $0xcf,0x1123ce
  10046b:	c6 05 cf 23 11 00 00 	movb   $0x0,0x1123cf
  100472:	66 c7 05 d0 23 11 00 	movw   $0xffff,0x1123d0
  100479:	ff ff 
  10047b:	66 c7 05 d2 23 11 00 	movw   $0x0,0x1123d2
  100482:	00 00 
  100484:	c6 05 d4 23 11 00 00 	movb   $0x0,0x1123d4
  10048b:	c6 05 d5 23 11 00 92 	movb   $0x92,0x1123d5
  100492:	c6 05 d6 23 11 00 cf 	movb   $0xcf,0x1123d6
  100499:	c6 05 d7 23 11 00 00 	movb   $0x0,0x1123d7
  1004a0:	66 c7 05 d8 23 11 00 	movw   $0xffff,0x1123d8
  1004a7:	ff ff 
  1004a9:	66 c7 05 da 23 11 00 	movw   $0x0,0x1123da
  1004b0:	00 00 
  1004b2:	c6 05 dc 23 11 00 00 	movb   $0x0,0x1123dc
  1004b9:	c6 05 dd 23 11 00 fa 	movb   $0xfa,0x1123dd
  1004c0:	c6 05 de 23 11 00 cf 	movb   $0xcf,0x1123de
  1004c7:	c6 05 df 23 11 00 00 	movb   $0x0,0x1123df
  1004ce:	66 c7 05 e0 23 11 00 	movw   $0xffff,0x1123e0
  1004d5:	ff ff 
  1004d7:	66 c7 05 e2 23 11 00 	movw   $0x0,0x1123e2
  1004de:	00 00 
  1004e0:	c6 05 e4 23 11 00 00 	movb   $0x0,0x1123e4
  1004e7:	c6 05 e5 23 11 00 f2 	movb   $0xf2,0x1123e5
  1004ee:	c6 05 e6 23 11 00 cf 	movb   $0xcf,0x1123e6
  1004f5:	c6 05 e7 23 11 00 00 	movb   $0x0,0x1123e7
  1004fc:	a1 88 0f 10 00       	mov    0x100f88,%eax
  100501:	8b 15 8c 0f 10 00    	mov    0x100f8c,%edx
  100507:	a3 f8 23 11 00       	mov    %eax,0x1123f8
  10050c:	89 15 fc 23 11 00    	mov    %edx,0x1123fc
  100512:	a1 90 0f 10 00       	mov    0x100f90,%eax
  100517:	8b 15 94 0f 10 00    	mov    0x100f94,%edx
  10051d:	a3 00 24 11 00       	mov    %eax,0x112400
  100522:	89 15 04 24 11 00    	mov    %edx,0x112404
  100528:	a1 98 0f 10 00       	mov    0x100f98,%eax
  10052d:	8b 15 9c 0f 10 00    	mov    0x100f9c,%edx
  100533:	a3 f0 23 11 00       	mov    %eax,0x1123f0
  100538:	89 15 f4 23 11 00    	mov    %edx,0x1123f4
  10053e:	66 c7 05 e8 23 11 00 	movw   $0x63,0x1123e8
  100545:	63 00 
  100547:	b8 40 24 11 00       	mov    $0x112440,%eax
  10054c:	66 a3 ea 23 11 00    	mov    %ax,0x1123ea
  100552:	89 c2                	mov    %eax,%edx
  100554:	c1 ea 10             	shr    $0x10,%edx
  100557:	88 15 ec 23 11 00    	mov    %dl,0x1123ec
  10055d:	c6 05 ed 23 11 00 89 	movb   $0x89,0x1123ed
  100564:	c6 05 ee 23 11 00 40 	movb   $0x40,0x1123ee
  10056b:	c1 e8 18             	shr    $0x18,%eax
  10056e:	a2 ef 23 11 00       	mov    %al,0x1123ef
  100573:	66 c7 05 ec 21 10 00 	movw   $0x77,0x1021ec
  10057a:	77 00 
  10057c:	66 89 0d ee 21 10 00 	mov    %cx,0x1021ee
  100583:	c1 e9 10             	shr    $0x10,%ecx
  100586:	66 89 0d f0 21 10 00 	mov    %cx,0x1021f0
  10058d:	b8 ec 21 10 00       	mov    $0x1021ec,%eax
  100592:	0f 01 10             	lgdtl  (%eax)
  100595:	c7 05 44 24 11 00 00 	movl   $0x200000,0x112444
  10059c:	00 20 00 
  10059f:	c7 05 48 24 11 00 10 	movl   $0x10,0x112448
  1005a6:	00 00 00 
  1005a9:	b8 28 00 00 00       	mov    $0x28,%eax
  1005ae:	0f 00 d8             	ltr    %ax
  1005b1:	b8 30 00 00 00       	mov    $0x30,%eax
  1005b6:	8e e8                	mov    %eax,%gs
  1005b8:	b8 23 00 00 00       	mov    $0x23,%eax
  1005bd:	8e e0                	mov    %eax,%fs
  1005bf:	b8 10 00 00 00       	mov    $0x10,%eax
  1005c4:	8e c0                	mov    %eax,%es
  1005c6:	8e d8                	mov    %eax,%ds
  1005c8:	8e d0                	mov    %eax,%ss
  1005ca:	31 c0                	xor    %eax,%eax
  1005cc:	0f 00 d0             	lldt   %ax
  1005cf:	5d                   	pop    %ebp
  1005d0:	c3                   	ret    
  1005d1:	8d 76 00             	lea    0x0(%esi),%esi

001005d4 <enterUserSpace>:
  1005d4:	55                   	push   %ebp
  1005d5:	89 e5                	mov    %esp,%ebp
  1005d7:	b8 23 00 00 00       	mov    $0x23,%eax
  1005dc:	50                   	push   %eax
  1005dd:	b8 00 00 02 00       	mov    $0x20000,%eax
  1005e2:	50                   	push   %eax
  1005e3:	9c                   	pushf  
  1005e4:	b8 1b 00 00 00       	mov    $0x1b,%eax
  1005e9:	50                   	push   %eax
  1005ea:	8b 45 08             	mov    0x8(%ebp),%eax
  1005ed:	50                   	push   %eax
  1005ee:	b8 23 00 00 00       	mov    $0x23,%eax
  1005f3:	8e d8                	mov    %eax,%ds
  1005f5:	cf                   	iret   
  1005f6:	5d                   	pop    %ebp
  1005f7:	c3                   	ret    

001005f8 <loadUMain>:
  1005f8:	55                   	push   %ebp
  1005f9:	89 e5                	mov    %esp,%ebp
  1005fb:	57                   	push   %edi
  1005fc:	56                   	push   %esi
  1005fd:	53                   	push   %ebx
  1005fe:	83 ec 0c             	sub    $0xc,%esp
  100601:	be c9 00 00 00       	mov    $0xc9,%esi
  100606:	bb 00 00 21 00       	mov    $0x210000,%ebx
  10060b:	90                   	nop
  10060c:	56                   	push   %esi
  10060d:	53                   	push   %ebx
  10060e:	e8 b1 fd ff ff       	call   1003c4 <readSect>
  100613:	81 c3 00 02 00 00    	add    $0x200,%ebx
  100619:	46                   	inc    %esi
  10061a:	58                   	pop    %eax
  10061b:	5a                   	pop    %edx
  10061c:	81 fb 00 90 22 00    	cmp    $0x229000,%ebx
  100622:	75 e8                	jne    10060c <loadUMain+0x14>
  100624:	a1 1c 00 21 00       	mov    0x21001c,%eax
  100629:	8d 88 00 00 21 00    	lea    0x210000(%eax),%ecx
  10062f:	0f b7 35 2c 00 21 00 	movzwl 0x21002c,%esi
  100636:	c1 e6 05             	shl    $0x5,%esi
  100639:	01 ce                	add    %ecx,%esi
  10063b:	39 f1                	cmp    %esi,%ecx
  10063d:	73 42                	jae    100681 <loadUMain+0x89>
  10063f:	90                   	nop
  100640:	8b 51 08             	mov    0x8(%ecx),%edx
  100643:	8b 41 04             	mov    0x4(%ecx),%eax
  100646:	8d b8 00 00 21 00    	lea    0x210000(%eax),%edi
  10064c:	8b 59 10             	mov    0x10(%ecx),%ebx
  10064f:	31 c0                	xor    %eax,%eax
  100651:	85 db                	test   %ebx,%ebx
  100653:	74 14                	je     100669 <loadUMain+0x71>
  100655:	8d 76 00             	lea    0x0(%esi),%esi
  100658:	42                   	inc    %edx
  100659:	8a 1c 07             	mov    (%edi,%eax,1),%bl
  10065c:	88 5a ff             	mov    %bl,-0x1(%edx)
  10065f:	40                   	inc    %eax
  100660:	8b 59 10             	mov    0x10(%ecx),%ebx
  100663:	39 c3                	cmp    %eax,%ebx
  100665:	77 f1                	ja     100658 <loadUMain+0x60>
  100667:	89 d8                	mov    %ebx,%eax
  100669:	29 c2                	sub    %eax,%edx
  10066b:	39 59 14             	cmp    %ebx,0x14(%ecx)
  10066e:	76 0a                	jbe    10067a <loadUMain+0x82>
  100670:	c6 04 02 00          	movb   $0x0,(%edx,%eax,1)
  100674:	40                   	inc    %eax
  100675:	39 41 14             	cmp    %eax,0x14(%ecx)
  100678:	77 f6                	ja     100670 <loadUMain+0x78>
  10067a:	83 c1 20             	add    $0x20,%ecx
  10067d:	39 ce                	cmp    %ecx,%esi
  10067f:	77 bf                	ja     100640 <loadUMain+0x48>
  100681:	a1 18 00 21 00       	mov    0x210018,%eax
  100686:	ba 23 00 00 00       	mov    $0x23,%edx
  10068b:	52                   	push   %edx
  10068c:	b9 00 00 02 00       	mov    $0x20000,%ecx
  100691:	51                   	push   %ecx
  100692:	9c                   	pushf  
  100693:	b9 1b 00 00 00       	mov    $0x1b,%ecx
  100698:	51                   	push   %ecx
  100699:	50                   	push   %eax
  10069a:	8e da                	mov    %edx,%ds
  10069c:	cf                   	iret   
  10069d:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1006a0:	5b                   	pop    %ebx
  1006a1:	5e                   	pop    %esi
  1006a2:	5f                   	pop    %edi
  1006a3:	5d                   	pop    %ebp
  1006a4:	ff e0                	jmp    *%eax
  1006a6:	66 90                	xchg   %ax,%ax

001006a8 <printch>:
  1006a8:	55                   	push   %ebp
  1006a9:	89 e5                	mov    %esp,%ebp
  1006ab:	83 ec 10             	sub    $0x10,%esp
  1006ae:	0f be 45 08          	movsbl 0x8(%ebp),%eax
  1006b2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1006b5:	a1 00 20 10 00       	mov    0x102000,%eax
  1006ba:	8d 04 80             	lea    (%eax,%eax,4),%eax
  1006bd:	c1 e0 04             	shl    $0x4,%eax
  1006c0:	03 05 f8 21 10 00    	add    0x1021f8,%eax
  1006c6:	01 c0                	add    %eax,%eax
  1006c8:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1006cb:	c7 45 fc 0c 00 00 00 	movl   $0xc,-0x4(%ebp)
  1006d2:	60                   	pusha  
  1006d3:	8b 7d f8             	mov    -0x8(%ebp),%edi
  1006d6:	8a 65 fc             	mov    -0x4(%ebp),%ah
  1006d9:	8a 45 f4             	mov    -0xc(%ebp),%al
  1006dc:	65 66 89 07          	mov    %ax,%gs:(%edi)
  1006e0:	61                   	popa   
  1006e1:	c9                   	leave  
  1006e2:	c3                   	ret    
  1006e3:	90                   	nop

001006e4 <fs_write>:
  1006e4:	55                   	push   %ebp
  1006e5:	89 e5                	mov    %esp,%ebp
  1006e7:	57                   	push   %edi
  1006e8:	56                   	push   %esi
  1006e9:	53                   	push   %ebx
  1006ea:	83 ec 10             	sub    $0x10,%esp
  1006ed:	8b 45 10             	mov    0x10(%ebp),%eax
  1006f0:	85 c0                	test   %eax,%eax
  1006f2:	7e 6d                	jle    100761 <fs_write+0x7d>
  1006f4:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  1006f7:	8b 75 10             	mov    0x10(%ebp),%esi
  1006fa:	01 ce                	add    %ecx,%esi
  1006fc:	bf 50 00 00 00       	mov    $0x50,%edi
  100701:	eb 16                	jmp    100719 <fs_write+0x35>
  100703:	90                   	nop
  100704:	99                   	cltd   
  100705:	f7 ff                	idiv   %edi
  100707:	89 15 f8 21 10 00    	mov    %edx,0x1021f8
  10070d:	43                   	inc    %ebx
  10070e:	89 1d 00 20 10 00    	mov    %ebx,0x102000
  100714:	41                   	inc    %ecx
  100715:	39 f1                	cmp    %esi,%ecx
  100717:	74 48                	je     100761 <fs_write+0x7d>
  100719:	0f be 01             	movsbl (%ecx),%eax
  10071c:	3c 0a                	cmp    $0xa,%al
  10071e:	74 4c                	je     10076c <fs_write+0x88>
  100720:	89 45 e8             	mov    %eax,-0x18(%ebp)
  100723:	8b 1d 00 20 10 00    	mov    0x102000,%ebx
  100729:	a1 f8 21 10 00       	mov    0x1021f8,%eax
  10072e:	8d 14 9b             	lea    (%ebx,%ebx,4),%edx
  100731:	c1 e2 04             	shl    $0x4,%edx
  100734:	01 c2                	add    %eax,%edx
  100736:	01 d2                	add    %edx,%edx
  100738:	89 55 ec             	mov    %edx,-0x14(%ebp)
  10073b:	c7 45 f0 0c 00 00 00 	movl   $0xc,-0x10(%ebp)
  100742:	60                   	pusha  
  100743:	8b 7d ec             	mov    -0x14(%ebp),%edi
  100746:	8a 65 f0             	mov    -0x10(%ebp),%ah
  100749:	8a 45 e8             	mov    -0x18(%ebp),%al
  10074c:	65 66 89 07          	mov    %ax,%gs:(%edi)
  100750:	61                   	popa   
  100751:	83 f8 4f             	cmp    $0x4f,%eax
  100754:	7f ae                	jg     100704 <fs_write+0x20>
  100756:	40                   	inc    %eax
  100757:	a3 f8 21 10 00       	mov    %eax,0x1021f8
  10075c:	41                   	inc    %ecx
  10075d:	39 f1                	cmp    %esi,%ecx
  10075f:	75 b8                	jne    100719 <fs_write+0x35>
  100761:	8b 45 10             	mov    0x10(%ebp),%eax
  100764:	83 c4 10             	add    $0x10,%esp
  100767:	5b                   	pop    %ebx
  100768:	5e                   	pop    %esi
  100769:	5f                   	pop    %edi
  10076a:	5d                   	pop    %ebp
  10076b:	c3                   	ret    
  10076c:	ff 05 00 20 10 00    	incl   0x102000
  100772:	c7 05 f8 21 10 00 00 	movl   $0x0,0x1021f8
  100779:	00 00 00 
  10077c:	eb 96                	jmp    100714 <fs_write+0x30>
  10077e:	66 90                	xchg   %ax,%ax

00100780 <sys_fork>:
  100780:	55                   	push   %ebp
  100781:	89 e5                	mov    %esp,%ebp
  100783:	57                   	push   %edi
  100784:	56                   	push   %esi
  100785:	53                   	push   %ebx
  100786:	83 ec 28             	sub    $0x28,%esp
  100789:	8b 45 08             	mov    0x8(%ebp),%eax
  10078c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  10078f:	68 a0 0f 10 00       	push   $0x100fa0
  100794:	e8 af fa ff ff       	call   100248 <Log>
  100799:	8b 0d 04 20 10 00    	mov    0x102004,%ecx
  10079f:	83 c4 10             	add    $0x10,%esp
  1007a2:	83 f9 00             	cmp    $0x0,%ecx
  1007a5:	0f 8e f8 00 00 00    	jle    1008a3 <sys_fork+0x123>
  1007ab:	83 3d 8c 62 10 00 03 	cmpl   $0x3,0x10628c
  1007b2:	0f 84 e2 00 00 00    	je     10089a <sys_fork+0x11a>
  1007b8:	ba 40 22 10 00       	mov    $0x102240,%edx
  1007bd:	31 c0                	xor    %eax,%eax
  1007bf:	eb 12                	jmp    1007d3 <sys_fork+0x53>
  1007c1:	8d 76 00             	lea    0x0(%esi),%esi
  1007c4:	81 c2 5c 40 00 00    	add    $0x405c,%edx
  1007ca:	83 ba 4c 40 00 00 03 	cmpl   $0x3,0x404c(%edx)
  1007d1:	74 05                	je     1007d8 <sys_fork+0x58>
  1007d3:	40                   	inc    %eax
  1007d4:	39 c8                	cmp    %ecx,%eax
  1007d6:	75 ec                	jne    1007c4 <sys_fork+0x44>
  1007d8:	89 c2                	mov    %eax,%edx
  1007da:	41                   	inc    %ecx
  1007db:	89 0d 04 20 10 00    	mov    %ecx,0x102004
  1007e1:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
  1007e4:	8d 0c c8             	lea    (%eax,%ecx,8),%ecx
  1007e7:	8d 0c c8             	lea    (%eax,%ecx,8),%ecx
  1007ea:	01 c9                	add    %ecx,%ecx
  1007ec:	01 c1                	add    %eax,%ecx
  1007ee:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
  1007f1:	8d 1c 89             	lea    (%ecx,%ecx,4),%ebx
  1007f4:	01 c3                	add    %eax,%ebx
  1007f6:	8d 83 40 22 10 00    	lea    0x102240(%ebx),%eax
  1007fc:	8b 35 04 22 10 00    	mov    0x102204,%esi
  100802:	b9 17 10 00 00       	mov    $0x1017,%ecx
  100807:	89 c7                	mov    %eax,%edi
  100809:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10080b:	89 93 98 62 10 00    	mov    %edx,0x106298(%ebx)
  100811:	c7 83 8c 62 10 00 00 	movl   $0x0,0x10628c(%ebx)
  100818:	00 00 00 
  10081b:	c7 83 90 62 10 00 0a 	movl   $0xa,0x106290(%ebx)
  100822:	00 00 00 
  100825:	81 c3 8c 62 10 00    	add    $0x10628c,%ebx
  10082b:	89 98 44 40 00 00    	mov    %ebx,0x4044(%eax)
  100831:	c7 80 2c 40 00 00 00 	movl   $0x0,0x402c(%eax)
  100838:	00 00 00 
  10083b:	c7 80 3c 40 00 00 3b 	movl   $0x3b,0x403c(%eax)
  100842:	00 00 00 
  100845:	c7 80 0c 40 00 00 43 	movl   $0x43,0x400c(%eax)
  10084c:	00 00 00 
  10084f:	c7 80 48 40 00 00 43 	movl   $0x43,0x4048(%eax)
  100856:	00 00 00 
  100859:	31 c0                	xor    %eax,%eax
  10085b:	90                   	nop
  10085c:	8a 98 00 00 20 00    	mov    0x200000(%eax),%bl
  100862:	88 98 00 00 40 00    	mov    %bl,0x400000(%eax)
  100868:	40                   	inc    %eax
  100869:	3d 00 00 20 00       	cmp    $0x200000,%eax
  10086e:	75 ec                	jne    10085c <sys_fork+0xdc>
  100870:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100873:	89 50 2c             	mov    %edx,0x2c(%eax)
  100876:	83 ec 08             	sub    $0x8,%esp
  100879:	52                   	push   %edx
  10087a:	68 a7 0f 10 00       	push   $0x100fa7
  10087f:	e8 c4 f9 ff ff       	call   100248 <Log>
  100884:	83 c4 10             	add    $0x10,%esp
  100887:	c7 45 08 ab 0f 10 00 	movl   $0x100fab,0x8(%ebp)
  10088e:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100891:	5b                   	pop    %ebx
  100892:	5e                   	pop    %esi
  100893:	5f                   	pop    %edi
  100894:	5d                   	pop    %ebp
  100895:	e9 ae f9 ff ff       	jmp    100248 <Log>
  10089a:	31 d2                	xor    %edx,%edx
  10089c:	31 c0                	xor    %eax,%eax
  10089e:	e9 37 ff ff ff       	jmp    1007da <sys_fork+0x5a>
  1008a3:	75 f5                	jne    10089a <sys_fork+0x11a>
  1008a5:	31 c0                	xor    %eax,%eax
  1008a7:	e9 2c ff ff ff       	jmp    1007d8 <sys_fork+0x58>

001008ac <sys_sleep>:
  1008ac:	55                   	push   %ebp
  1008ad:	89 e5                	mov    %esp,%ebp
  1008af:	53                   	push   %ebx
  1008b0:	83 ec 10             	sub    $0x10,%esp
  1008b3:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1008b6:	68 b3 0f 10 00       	push   $0x100fb3
  1008bb:	e8 88 f9 ff ff       	call   100248 <Log>
  1008c0:	a1 04 22 10 00       	mov    0x102204,%eax
  1008c5:	8b 53 2c             	mov    0x2c(%ebx),%edx
  1008c8:	89 90 54 40 00 00    	mov    %edx,0x4054(%eax)
  1008ce:	c7 80 4c 40 00 00 02 	movl   $0x2,0x404c(%eax)
  1008d5:	00 00 00 
  1008d8:	c7 80 50 40 00 00 0a 	movl   $0xa,0x4050(%eax)
  1008df:	00 00 00 
  1008e2:	e8 45 04 00 00       	call   100d2c <schedule>
  1008e7:	83 c4 10             	add    $0x10,%esp
  1008ea:	c7 45 08 bc 0f 10 00 	movl   $0x100fbc,0x8(%ebp)
  1008f1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1008f4:	c9                   	leave  
  1008f5:	e9 4e f9 ff ff       	jmp    100248 <Log>
  1008fa:	66 90                	xchg   %ax,%ax

001008fc <sys_exit>:
  1008fc:	55                   	push   %ebp
  1008fd:	89 e5                	mov    %esp,%ebp
  1008ff:	83 ec 14             	sub    $0x14,%esp
  100902:	68 c6 0f 10 00       	push   $0x100fc6
  100907:	e8 3c f9 ff ff       	call   100248 <Log>
  10090c:	a1 04 22 10 00       	mov    0x102204,%eax
  100911:	c7 80 4c 40 00 00 03 	movl   $0x3,0x404c(%eax)
  100918:	00 00 00 
  10091b:	c7 80 50 40 00 00 0a 	movl   $0xa,0x4050(%eax)
  100922:	00 00 00 
  100925:	c7 80 54 40 00 00 00 	movl   $0x0,0x4054(%eax)
  10092c:	00 00 00 
  10092f:	e8 f8 03 00 00       	call   100d2c <schedule>
  100934:	83 c4 10             	add    $0x10,%esp
  100937:	c7 45 08 cf 0f 10 00 	movl   $0x100fcf,0x8(%ebp)
  10093e:	c9                   	leave  
  10093f:	e9 04 f9 ff ff       	jmp    100248 <Log>

00100944 <sys_write>:
  100944:	55                   	push   %ebp
  100945:	89 e5                	mov    %esp,%ebp
  100947:	53                   	push   %ebx
  100948:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10094b:	ff 73 24             	pushl  0x24(%ebx)
  10094e:	ff 73 28             	pushl  0x28(%ebx)
  100951:	ff 73 20             	pushl  0x20(%ebx)
  100954:	e8 8b fd ff ff       	call   1006e4 <fs_write>
  100959:	89 43 2c             	mov    %eax,0x2c(%ebx)
  10095c:	83 c4 0c             	add    $0xc,%esp
  10095f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100962:	c9                   	leave  
  100963:	c3                   	ret    

00100964 <syscallHandle>:
  100964:	55                   	push   %ebp
  100965:	89 e5                	mov    %esp,%ebp
  100967:	53                   	push   %ebx
  100968:	52                   	push   %edx
  100969:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10096c:	8b 43 2c             	mov    0x2c(%ebx),%eax
  10096f:	83 f8 01             	cmp    $0x1,%eax
  100972:	74 40                	je     1009b4 <syscallHandle+0x50>
  100974:	72 32                	jb     1009a8 <syscallHandle+0x44>
  100976:	83 f8 02             	cmp    $0x2,%eax
  100979:	74 21                	je     10099c <syscallHandle+0x38>
  10097b:	83 f8 04             	cmp    $0x4,%eax
  10097e:	75 15                	jne    100995 <syscallHandle+0x31>
  100980:	50                   	push   %eax
  100981:	ff 73 24             	pushl  0x24(%ebx)
  100984:	ff 73 28             	pushl  0x28(%ebx)
  100987:	ff 73 20             	pushl  0x20(%ebx)
  10098a:	e8 55 fd ff ff       	call   1006e4 <fs_write>
  10098f:	89 43 2c             	mov    %eax,0x2c(%ebx)
  100992:	83 c4 10             	add    $0x10,%esp
  100995:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100998:	c9                   	leave  
  100999:	c3                   	ret    
  10099a:	66 90                	xchg   %ax,%ax
  10099c:	89 5d 08             	mov    %ebx,0x8(%ebp)
  10099f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1009a2:	c9                   	leave  
  1009a3:	e9 54 ff ff ff       	jmp    1008fc <sys_exit>
  1009a8:	89 5d 08             	mov    %ebx,0x8(%ebp)
  1009ab:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1009ae:	c9                   	leave  
  1009af:	e9 cc fd ff ff       	jmp    100780 <sys_fork>
  1009b4:	89 5d 08             	mov    %ebx,0x8(%ebp)
  1009b7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1009ba:	c9                   	leave  
  1009bb:	e9 ec fe ff ff       	jmp    1008ac <sys_sleep>

001009c0 <GProtectFaultHandle>:
  1009c0:	55                   	push   %ebp
  1009c1:	89 e5                	mov    %esp,%ebp
  1009c3:	83 ec 10             	sub    $0x10,%esp
  1009c6:	68 a1 00 00 00       	push   $0xa1
  1009cb:	68 da 0f 10 00       	push   $0x100fda
  1009d0:	e8 d7 04 00 00       	call   100eac <abort>
  1009d5:	83 c4 10             	add    $0x10,%esp
  1009d8:	c9                   	leave  
  1009d9:	c3                   	ret    
  1009da:	66 90                	xchg   %ax,%ax

001009dc <timeHandle>:
  1009dc:	55                   	push   %ebp
  1009dd:	89 e5                	mov    %esp,%ebp
  1009df:	56                   	push   %esi
  1009e0:	53                   	push   %ebx
  1009e1:	ff 05 f4 21 10 00    	incl   0x1021f4
  1009e7:	8b 35 04 22 10 00    	mov    0x102204,%esi
  1009ed:	8b 86 50 40 00 00    	mov    0x4050(%esi),%eax
  1009f3:	8d 58 ff             	lea    -0x1(%eax),%ebx
  1009f6:	89 9e 50 40 00 00    	mov    %ebx,0x4050(%esi)
  1009fc:	8b 15 04 20 10 00    	mov    0x102004,%edx
  100a02:	85 d2                	test   %edx,%edx
  100a04:	7e 31                	jle    100a37 <timeHandle+0x5b>
  100a06:	b8 40 22 10 00       	mov    $0x102240,%eax
  100a0b:	8d 0c 92             	lea    (%edx,%edx,4),%ecx
  100a0e:	8d 0c ca             	lea    (%edx,%ecx,8),%ecx
  100a11:	8d 0c ca             	lea    (%edx,%ecx,8),%ecx
  100a14:	01 c9                	add    %ecx,%ecx
  100a16:	01 d1                	add    %edx,%ecx
  100a18:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
  100a1b:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
  100a1e:	8d 8c 0a 40 22 10 00 	lea    0x102240(%edx,%ecx,1),%ecx
  100a25:	83 b8 4c 40 00 00 02 	cmpl   $0x2,0x404c(%eax)
  100a2c:	74 12                	je     100a40 <timeHandle+0x64>
  100a2e:	05 5c 40 00 00       	add    $0x405c,%eax
  100a33:	39 c8                	cmp    %ecx,%eax
  100a35:	75 ee                	jne    100a25 <timeHandle+0x49>
  100a37:	85 db                	test   %ebx,%ebx
  100a39:	74 19                	je     100a54 <timeHandle+0x78>
  100a3b:	5b                   	pop    %ebx
  100a3c:	5e                   	pop    %esi
  100a3d:	5d                   	pop    %ebp
  100a3e:	c3                   	ret    
  100a3f:	90                   	nop
  100a40:	ff 88 54 40 00 00    	decl   0x4054(%eax)
  100a46:	75 e6                	jne    100a2e <timeHandle+0x52>
  100a48:	c7 80 4c 40 00 00 00 	movl   $0x0,0x404c(%eax)
  100a4f:	00 00 00 
  100a52:	eb da                	jmp    100a2e <timeHandle+0x52>
  100a54:	c7 86 4c 40 00 00 00 	movl   $0x0,0x404c(%esi)
  100a5b:	00 00 00 
  100a5e:	c7 86 50 40 00 00 0a 	movl   $0xa,0x4050(%esi)
  100a65:	00 00 00 
  100a68:	5b                   	pop    %ebx
  100a69:	5e                   	pop    %esi
  100a6a:	5d                   	pop    %ebp
  100a6b:	e9 bc 02 00 00       	jmp    100d2c <schedule>

00100a70 <irqHandle>:
  100a70:	55                   	push   %ebp
  100a71:	89 e5                	mov    %esp,%ebp
  100a73:	53                   	push   %ebx
  100a74:	50                   	push   %eax
  100a75:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100a78:	8b 43 30             	mov    0x30(%ebx),%eax
  100a7b:	83 f8 20             	cmp    $0x20,%eax
  100a7e:	74 5c                	je     100adc <irqHandle+0x6c>
  100a80:	76 1e                	jbe    100aa0 <irqHandle+0x30>
  100a82:	3d 80 00 00 00       	cmp    $0x80,%eax
  100a87:	74 0b                	je     100a94 <irqHandle+0x24>
  100a89:	40                   	inc    %eax
  100a8a:	75 34                	jne    100ac0 <irqHandle+0x50>
  100a8c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100a8f:	c9                   	leave  
  100a90:	c3                   	ret    
  100a91:	8d 76 00             	lea    0x0(%esi),%esi
  100a94:	89 5d 08             	mov    %ebx,0x8(%ebp)
  100a97:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100a9a:	c9                   	leave  
  100a9b:	e9 c4 fe ff ff       	jmp    100964 <syscallHandle>
  100aa0:	83 f8 0d             	cmp    $0xd,%eax
  100aa3:	75 1b                	jne    100ac0 <irqHandle+0x50>
  100aa5:	83 ec 08             	sub    $0x8,%esp
  100aa8:	68 a1 00 00 00       	push   $0xa1
  100aad:	68 da 0f 10 00       	push   $0x100fda
  100ab2:	e8 f5 03 00 00       	call   100eac <abort>
  100ab7:	83 c4 10             	add    $0x10,%esp
  100aba:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100abd:	c9                   	leave  
  100abe:	c3                   	ret    
  100abf:	90                   	nop
  100ac0:	83 ec 08             	sub    $0x8,%esp
  100ac3:	68 92 00 00 00       	push   $0x92
  100ac8:	68 da 0f 10 00       	push   $0x100fda
  100acd:	e8 da 03 00 00       	call   100eac <abort>
  100ad2:	83 c4 10             	add    $0x10,%esp
  100ad5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100ad8:	c9                   	leave  
  100ad9:	c3                   	ret    
  100ada:	66 90                	xchg   %ax,%ax
  100adc:	83 ec 0c             	sub    $0xc,%esp
  100adf:	68 ed 0f 10 00       	push   $0x100fed
  100ae4:	e8 5f f7 ff ff       	call   100248 <Log>
  100ae9:	83 c4 10             	add    $0x10,%esp
  100aec:	89 5d 08             	mov    %ebx,0x8(%ebp)
  100aef:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100af2:	c9                   	leave  
  100af3:	e9 e4 fe ff ff       	jmp    1009dc <timeHandle>

00100af8 <initIdt>:
  100af8:	55                   	push   %ebp
  100af9:	89 e5                	mov    %esp,%ebp
  100afb:	53                   	push   %ebx
  100afc:	ba 43 0f 10 00       	mov    $0x100f43,%edx
  100b01:	89 d3                	mov    %edx,%ebx
  100b03:	c1 ea 10             	shr    $0x10,%edx
  100b06:	b9 c0 2c 11 00       	mov    $0x112cc0,%ecx
  100b0b:	b8 c0 24 11 00       	mov    $0x1124c0,%eax
  100b10:	66 89 18             	mov    %bx,(%eax)
  100b13:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  100b19:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  100b1d:	c6 40 05 8f          	movb   $0x8f,0x5(%eax)
  100b21:	66 89 50 06          	mov    %dx,0x6(%eax)
  100b25:	83 c0 08             	add    $0x8,%eax
  100b28:	39 c1                	cmp    %eax,%ecx
  100b2a:	75 e4                	jne    100b10 <initIdt+0x18>
  100b2c:	b8 49 0f 10 00       	mov    $0x100f49,%eax
  100b31:	66 a3 28 25 11 00    	mov    %ax,0x112528
  100b37:	66 c7 05 2a 25 11 00 	movw   $0x8,0x11252a
  100b3e:	08 00 
  100b40:	c6 05 2c 25 11 00 00 	movb   $0x0,0x11252c
  100b47:	c6 05 2d 25 11 00 8f 	movb   $0x8f,0x11252d
  100b4e:	c1 e8 10             	shr    $0x10,%eax
  100b51:	66 a3 2e 25 11 00    	mov    %ax,0x11252e
  100b57:	b8 4d 0f 10 00       	mov    $0x100f4d,%eax
  100b5c:	66 a3 c0 25 11 00    	mov    %ax,0x1125c0
  100b62:	66 c7 05 c2 25 11 00 	movw   $0x8,0x1125c2
  100b69:	08 00 
  100b6b:	c6 05 c4 25 11 00 00 	movb   $0x0,0x1125c4
  100b72:	c6 05 c5 25 11 00 ee 	movb   $0xee,0x1125c5
  100b79:	c1 e8 10             	shr    $0x10,%eax
  100b7c:	66 a3 c6 25 11 00    	mov    %ax,0x1125c6
  100b82:	b8 53 0f 10 00       	mov    $0x100f53,%eax
  100b87:	66 a3 c0 28 11 00    	mov    %ax,0x1128c0
  100b8d:	66 c7 05 c2 28 11 00 	movw   $0x8,0x1128c2
  100b94:	08 00 
  100b96:	c6 05 c4 28 11 00 00 	movb   $0x0,0x1128c4
  100b9d:	c6 05 c5 28 11 00 ee 	movb   $0xee,0x1128c5
  100ba4:	c1 e8 10             	shr    $0x10,%eax
  100ba7:	66 a3 c6 28 11 00    	mov    %ax,0x1128c6
  100bad:	66 c7 05 fc 21 10 00 	movw   $0x7ff,0x1021fc
  100bb4:	ff 07 
  100bb6:	b8 c0 24 11 00       	mov    $0x1124c0,%eax
  100bbb:	66 a3 fe 21 10 00    	mov    %ax,0x1021fe
  100bc1:	c1 e8 10             	shr    $0x10,%eax
  100bc4:	66 a3 00 22 10 00    	mov    %ax,0x102200
  100bca:	b8 fc 21 10 00       	mov    $0x1021fc,%eax
  100bcf:	0f 01 18             	lidtl  (%eax)
  100bd2:	5b                   	pop    %ebx
  100bd3:	5d                   	pop    %ebp
  100bd4:	c3                   	ret    
  100bd5:	66 90                	xchg   %ax,%ax
  100bd7:	90                   	nop

00100bd8 <cpu_idle>:
  100bd8:	55                   	push   %ebp
  100bd9:	89 e5                	mov    %esp,%ebp
  100bdb:	fb                   	sti    
  100bdc:	f4                   	hlt    
  100bdd:	eb fd                	jmp    100bdc <cpu_idle+0x4>
  100bdf:	90                   	nop

00100be0 <kernel_thread>:
  100be0:	55                   	push   %ebp
  100be1:	89 e5                	mov    %esp,%ebp
  100be3:	c7 05 7c 62 10 00 08 	movl   $0x8,0x10627c
  100bea:	00 00 00 
  100bed:	c7 05 40 62 10 00 10 	movl   $0x10,0x106240
  100bf4:	00 00 00 
  100bf7:	c7 05 44 62 10 00 10 	movl   $0x10,0x106244
  100bfe:	00 00 00 
  100c01:	c7 05 48 62 10 00 10 	movl   $0x10,0x106248
  100c08:	00 00 00 
  100c0b:	c7 05 4c 62 10 00 10 	movl   $0x10,0x10624c
  100c12:	00 00 00 
  100c15:	c7 05 78 62 10 00 d8 	movl   $0x100bd8,0x106278
  100c1c:	0b 10 00 
  100c1f:	c7 05 8c 62 10 00 00 	movl   $0x0,0x10628c
  100c26:	00 00 00 
  100c29:	c7 05 90 62 10 00 0a 	movl   $0xa,0x106290
  100c30:	00 00 00 
  100c33:	c7 05 94 62 10 00 00 	movl   $0x0,0x106294
  100c3a:	00 00 00 
  100c3d:	c7 05 98 62 10 00 00 	movl   $0x0,0x106298
  100c44:	00 00 00 
  100c47:	c7 05 08 22 10 00 40 	movl   $0x102240,0x102208
  100c4e:	22 10 00 
  100c51:	5d                   	pop    %ebp
  100c52:	c3                   	ret    
  100c53:	90                   	nop

00100c54 <user_process>:
  100c54:	55                   	push   %ebp
  100c55:	89 e5                	mov    %esp,%ebp
  100c57:	c7 05 d8 a2 10 00 1b 	movl   $0x1b,0x10a2d8
  100c5e:	00 00 00 
  100c61:	c7 05 9c a2 10 00 23 	movl   $0x23,0x10a29c
  100c68:	00 00 00 
  100c6b:	c7 05 a0 a2 10 00 23 	movl   $0x23,0x10a2a0
  100c72:	00 00 00 
  100c75:	c7 05 a4 a2 10 00 23 	movl   $0x23,0x10a2a4
  100c7c:	00 00 00 
  100c7f:	c7 05 a8 a2 10 00 23 	movl   $0x23,0x10a2a8
  100c86:	00 00 00 
  100c89:	c7 05 d4 a2 10 00 00 	movl   $0x200000,0x10a2d4
  100c90:	00 20 00 
  100c93:	c7 05 e8 a2 10 00 00 	movl   $0x0,0x10a2e8
  100c9a:	00 00 00 
  100c9d:	c7 05 ec a2 10 00 0a 	movl   $0xa,0x10a2ec
  100ca4:	00 00 00 
  100ca7:	c7 05 f0 a2 10 00 00 	movl   $0x0,0x10a2f0
  100cae:	00 00 00 
  100cb1:	c7 05 f4 a2 10 00 01 	movl   $0x1,0x10a2f4
  100cb8:	00 00 00 
  100cbb:	ff 05 04 20 10 00    	incl   0x102004
  100cc1:	5d                   	pop    %ebp
  100cc2:	c3                   	ret    
  100cc3:	90                   	nop

00100cc4 <proc_run>:
  100cc4:	55                   	push   %ebp
  100cc5:	89 e5                	mov    %esp,%ebp
  100cc7:	83 ec 10             	sub    $0x10,%esp
  100cca:	8b 45 08             	mov    0x8(%ebp),%eax
  100ccd:	a3 04 22 10 00       	mov    %eax,0x102204
  100cd2:	c7 80 54 40 00 00 00 	movl   $0x0,0x4054(%eax)
  100cd9:	00 00 00 
  100cdc:	c7 80 50 40 00 00 0a 	movl   $0xa,0x4050(%eax)
  100ce3:	00 00 00 
  100ce6:	c7 80 4c 40 00 00 01 	movl   $0x1,0x404c(%eax)
  100ced:	00 00 00 
  100cf0:	b8 01 00 00 00       	mov    $0x1,%eax
  100cf5:	89 e0                	mov    %esp,%eax
  100cf7:	6a 01                	push   $0x1
  100cf9:	68 a7 0f 10 00       	push   $0x100fa7
  100cfe:	e8 45 f5 ff ff       	call   100248 <Log>
  100d03:	a1 04 22 10 00       	mov    0x102204,%eax
  100d08:	05 4c 40 00 00       	add    $0x404c,%eax
  100d0d:	89 c4                	mov    %eax,%esp
  100d0f:	0f a9                	pop    %gs
  100d11:	0f a1                	pop    %fs
  100d13:	07                   	pop    %es
  100d14:	1f                   	pop    %ds
  100d15:	61                   	popa   
  100d16:	83 c4 08             	add    $0x8,%esp
  100d19:	cf                   	iret   
  100d1a:	83 c4 10             	add    $0x10,%esp
  100d1d:	c7 45 08 f3 0f 10 00 	movl   $0x100ff3,0x8(%ebp)
  100d24:	c9                   	leave  
  100d25:	e9 1e f5 ff ff       	jmp    100248 <Log>
  100d2a:	66 90                	xchg   %ax,%ax

00100d2c <schedule>:
  100d2c:	8b 15 04 20 10 00    	mov    0x102004,%edx
  100d32:	83 fa 01             	cmp    $0x1,%edx
  100d35:	7e 3d                	jle    100d74 <schedule+0x48>
  100d37:	55                   	push   %ebp
  100d38:	89 e5                	mov    %esp,%ebp
  100d3a:	56                   	push   %esi
  100d3b:	53                   	push   %ebx
  100d3c:	8b 0d 04 22 10 00    	mov    0x102204,%ecx
  100d42:	b8 40 22 10 00       	mov    $0x102240,%eax
  100d47:	bb 01 00 00 00       	mov    $0x1,%ebx
  100d4c:	8b b0 a8 80 00 00    	mov    0x80a8(%eax),%esi
  100d52:	85 f6                	test   %esi,%esi
  100d54:	75 0e                	jne    100d64 <schedule+0x38>
  100d56:	8b b1 58 40 00 00    	mov    0x4058(%ecx),%esi
  100d5c:	39 b0 b4 80 00 00    	cmp    %esi,0x80b4(%eax)
  100d62:	75 14                	jne    100d78 <schedule+0x4c>
  100d64:	43                   	inc    %ebx
  100d65:	05 5c 40 00 00       	add    $0x405c,%eax
  100d6a:	39 d3                	cmp    %edx,%ebx
  100d6c:	75 de                	jne    100d4c <schedule+0x20>
  100d6e:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100d71:	5b                   	pop    %ebx
  100d72:	5e                   	pop    %esi
  100d73:	5d                   	pop    %ebp
  100d74:	c3                   	ret    
  100d75:	8d 76 00             	lea    0x0(%esi),%esi
  100d78:	83 ec 0c             	sub    $0xc,%esp
  100d7b:	68 fc 0f 10 00       	push   $0x100ffc
  100d80:	e8 c3 f4 ff ff       	call   100248 <Log>
  100d85:	8d 04 9b             	lea    (%ebx,%ebx,4),%eax
  100d88:	8d 04 c3             	lea    (%ebx,%eax,8),%eax
  100d8b:	8d 04 c3             	lea    (%ebx,%eax,8),%eax
  100d8e:	01 c0                	add    %eax,%eax
  100d90:	01 d8                	add    %ebx,%eax
  100d92:	8d 04 80             	lea    (%eax,%eax,4),%eax
  100d95:	8d 04 80             	lea    (%eax,%eax,4),%eax
  100d98:	8d 84 03 40 22 10 00 	lea    0x102240(%ebx,%eax,1),%eax
  100d9f:	89 04 24             	mov    %eax,(%esp)
  100da2:	e8 1d ff ff ff       	call   100cc4 <proc_run>
  100da7:	83 c4 10             	add    $0x10,%esp
  100daa:	39 1d 04 20 10 00    	cmp    %ebx,0x102004
  100db0:	7e bc                	jle    100d6e <schedule+0x42>
  100db2:	83 ec 0c             	sub    $0xc,%esp
  100db5:	ff 35 08 22 10 00    	pushl  0x102208
  100dbb:	e8 04 ff ff ff       	call   100cc4 <proc_run>
  100dc0:	83 c4 10             	add    $0x10,%esp
  100dc3:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100dc6:	5b                   	pop    %ebx
  100dc7:	5e                   	pop    %esi
  100dc8:	5d                   	pop    %ebp
  100dc9:	eb a9                	jmp    100d74 <schedule+0x48>
  100dcb:	90                   	nop

00100dcc <initProcess>:
  100dcc:	55                   	push   %ebp
  100dcd:	89 e5                	mov    %esp,%ebp
  100dcf:	c7 05 7c 62 10 00 08 	movl   $0x8,0x10627c
  100dd6:	00 00 00 
  100dd9:	c7 05 40 62 10 00 10 	movl   $0x10,0x106240
  100de0:	00 00 00 
  100de3:	c7 05 44 62 10 00 10 	movl   $0x10,0x106244
  100dea:	00 00 00 
  100ded:	c7 05 48 62 10 00 10 	movl   $0x10,0x106248
  100df4:	00 00 00 
  100df7:	c7 05 4c 62 10 00 10 	movl   $0x10,0x10624c
  100dfe:	00 00 00 
  100e01:	c7 05 78 62 10 00 d8 	movl   $0x100bd8,0x106278
  100e08:	0b 10 00 
  100e0b:	c7 05 8c 62 10 00 00 	movl   $0x0,0x10628c
  100e12:	00 00 00 
  100e15:	c7 05 90 62 10 00 0a 	movl   $0xa,0x106290
  100e1c:	00 00 00 
  100e1f:	c7 05 94 62 10 00 00 	movl   $0x0,0x106294
  100e26:	00 00 00 
  100e29:	c7 05 98 62 10 00 00 	movl   $0x0,0x106298
  100e30:	00 00 00 
  100e33:	c7 05 08 22 10 00 40 	movl   $0x102240,0x102208
  100e3a:	22 10 00 
  100e3d:	c7 05 d8 a2 10 00 1b 	movl   $0x1b,0x10a2d8
  100e44:	00 00 00 
  100e47:	c7 05 9c a2 10 00 23 	movl   $0x23,0x10a29c
  100e4e:	00 00 00 
  100e51:	c7 05 a0 a2 10 00 23 	movl   $0x23,0x10a2a0
  100e58:	00 00 00 
  100e5b:	c7 05 a4 a2 10 00 23 	movl   $0x23,0x10a2a4
  100e62:	00 00 00 
  100e65:	c7 05 a8 a2 10 00 23 	movl   $0x23,0x10a2a8
  100e6c:	00 00 00 
  100e6f:	c7 05 d4 a2 10 00 00 	movl   $0x200000,0x10a2d4
  100e76:	00 20 00 
  100e79:	c7 05 e8 a2 10 00 00 	movl   $0x0,0x10a2e8
  100e80:	00 00 00 
  100e83:	c7 05 ec a2 10 00 0a 	movl   $0xa,0x10a2ec
  100e8a:	00 00 00 
  100e8d:	c7 05 f0 a2 10 00 00 	movl   $0x0,0x10a2f0
  100e94:	00 00 00 
  100e97:	c7 05 f4 a2 10 00 01 	movl   $0x1,0x10a2f4
  100e9e:	00 00 00 
  100ea1:	ff 05 04 20 10 00    	incl   0x102004
  100ea7:	5d                   	pop    %ebp
  100ea8:	c3                   	ret    
  100ea9:	66 90                	xchg   %ax,%ax
  100eab:	90                   	nop

00100eac <abort>:
  100eac:	55                   	push   %ebp
  100ead:	89 e5                	mov    %esp,%ebp
  100eaf:	57                   	push   %edi
  100eb0:	56                   	push   %esi
  100eb1:	53                   	push   %ebx
  100eb2:	83 ec 1c             	sub    $0x1c,%esp
  100eb5:	8b 55 08             	mov    0x8(%ebp),%edx
  100eb8:	fa                   	cli    
  100eb9:	8a 02                	mov    (%edx),%al
  100ebb:	b9 32 20 10 00       	mov    $0x102032,%ecx
  100ec0:	84 c0                	test   %al,%al
  100ec2:	74 0b                	je     100ecf <abort+0x23>
  100ec4:	41                   	inc    %ecx
  100ec5:	42                   	inc    %edx
  100ec6:	88 41 ff             	mov    %al,-0x1(%ecx)
  100ec9:	8a 02                	mov    (%edx),%al
  100ecb:	84 c0                	test   %al,%al
  100ecd:	75 f5                	jne    100ec4 <abort+0x18>
  100ecf:	c6 01 3a             	movb   $0x3a,(%ecx)
  100ed2:	bb 29 22 10 00       	mov    $0x102229,%ebx
  100ed7:	be 0a 00 00 00       	mov    $0xa,%esi
  100edc:	bf 67 66 66 66       	mov    $0x66666667,%edi
  100ee1:	4b                   	dec    %ebx
  100ee2:	8b 45 0c             	mov    0xc(%ebp),%eax
  100ee5:	99                   	cltd   
  100ee6:	f7 fe                	idiv   %esi
  100ee8:	8d 42 30             	lea    0x30(%edx),%eax
  100eeb:	88 45 e7             	mov    %al,-0x19(%ebp)
  100eee:	88 03                	mov    %al,(%ebx)
  100ef0:	89 f8                	mov    %edi,%eax
  100ef2:	f7 6d 0c             	imull  0xc(%ebp)
  100ef5:	c1 fa 02             	sar    $0x2,%edx
  100ef8:	8b 45 0c             	mov    0xc(%ebp),%eax
  100efb:	c1 f8 1f             	sar    $0x1f,%eax
  100efe:	29 c2                	sub    %eax,%edx
  100f00:	89 55 0c             	mov    %edx,0xc(%ebp)
  100f03:	75 dc                	jne    100ee1 <abort+0x35>
  100f05:	41                   	inc    %ecx
  100f06:	41                   	inc    %ecx
  100f07:	43                   	inc    %ebx
  100f08:	8a 45 e7             	mov    -0x19(%ebp),%al
  100f0b:	88 41 ff             	mov    %al,-0x1(%ecx)
  100f0e:	8a 03                	mov    (%ebx),%al
  100f10:	88 45 e7             	mov    %al,-0x19(%ebp)
  100f13:	84 c0                	test   %al,%al
  100f15:	75 ef                	jne    100f06 <abort+0x5a>
  100f17:	c6 01 0a             	movb   $0xa,(%ecx)
  100f1a:	0f be 05 20 20 10 00 	movsbl 0x102020,%eax
  100f21:	84 c0                	test   %al,%al
  100f23:	74 1b                	je     100f40 <abort+0x94>
  100f25:	bb 20 20 10 00       	mov    $0x102020,%ebx
  100f2a:	83 ec 0c             	sub    $0xc,%esp
  100f2d:	50                   	push   %eax
  100f2e:	e8 39 f1 ff ff       	call   10006c <putChar>
  100f33:	43                   	inc    %ebx
  100f34:	0f be 03             	movsbl (%ebx),%eax
  100f37:	83 c4 10             	add    $0x10,%esp
  100f3a:	84 c0                	test   %al,%al
  100f3c:	75 ec                	jne    100f2a <abort+0x7e>
  100f3e:	66 90                	xchg   %ax,%ax
  100f40:	f4                   	hlt    
  100f41:	eb fd                	jmp    100f40 <abort+0x94>

00100f43 <irqEmpty>:
  100f43:	6a 00                	push   $0x0
  100f45:	6a ff                	push   $0xffffffff
  100f47:	eb 13                	jmp    100f5c <asmDoIrq>

00100f49 <irqGProtectFault>:
  100f49:	6a 0d                	push   $0xd
  100f4b:	eb 0f                	jmp    100f5c <asmDoIrq>

00100f4d <irqTimeSyscall>:
  100f4d:	6a 00                	push   $0x0
  100f4f:	6a 20                	push   $0x20
  100f51:	eb 09                	jmp    100f5c <asmDoIrq>

00100f53 <irqSyscall>:
  100f53:	6a 00                	push   $0x0
  100f55:	68 80 00 00 00       	push   $0x80
  100f5a:	eb 00                	jmp    100f5c <asmDoIrq>

00100f5c <asmDoIrq>:
  100f5c:	60                   	pusha  
  100f5d:	1e                   	push   %ds
  100f5e:	06                   	push   %es
  100f5f:	0f a0                	push   %fs
  100f61:	0f a8                	push   %gs
  100f63:	54                   	push   %esp
  100f64:	e8 07 fb ff ff       	call   100a70 <irqHandle>
  100f69:	83 c4 04             	add    $0x4,%esp
  100f6c:	0f a9                	pop    %gs
  100f6e:	0f a1                	pop    %fs
  100f70:	07                   	pop    %es
  100f71:	1f                   	pop    %ds
  100f72:	61                   	popa   
  100f73:	83 c4 04             	add    $0x4,%esp
  100f76:	83 c4 04             	add    $0x4,%esp
  100f79:	cf                   	iret   
