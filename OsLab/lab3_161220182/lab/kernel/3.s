
kMain.elf:     file format elf32-i386


Disassembly of section .text:

00100000 <kEntry>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 08             	sub    $0x8,%esp
  100006:	e8 21 00 00 00       	call   10002c <initSerial>
  10000b:	e8 24 0b 00 00       	call   100b34 <initIdt>
  100010:	e8 8b 00 00 00       	call   1000a0 <initIntr>
  100015:	e8 22 04 00 00       	call   10043c <initSeg>
  10001a:	e8 69 00 00 00       	call   100088 <initTimer>
  10001f:	e8 30 0e 00 00       	call   100e54 <initProcess>
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
  1001bb:	b9 38 0f 10 00       	mov    $0x100f38,%ecx
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
  10043f:	b9 40 24 11 00       	mov    $0x112440,%ecx
  100444:	66 c7 05 48 24 11 00 	movw   $0xffff,0x112448
  10044b:	ff ff 
  10044d:	66 c7 05 4a 24 11 00 	movw   $0x0,0x11244a
  100454:	00 00 
  100456:	c6 05 4c 24 11 00 00 	movb   $0x0,0x11244c
  10045d:	c6 05 4d 24 11 00 9a 	movb   $0x9a,0x11244d
  100464:	c6 05 4e 24 11 00 cf 	movb   $0xcf,0x11244e
  10046b:	c6 05 4f 24 11 00 00 	movb   $0x0,0x11244f
  100472:	66 c7 05 50 24 11 00 	movw   $0xffff,0x112450
  100479:	ff ff 
  10047b:	66 c7 05 52 24 11 00 	movw   $0x0,0x112452
  100482:	00 00 
  100484:	c6 05 54 24 11 00 00 	movb   $0x0,0x112454
  10048b:	c6 05 55 24 11 00 92 	movb   $0x92,0x112455
  100492:	c6 05 56 24 11 00 cf 	movb   $0xcf,0x112456
  100499:	c6 05 57 24 11 00 00 	movb   $0x0,0x112457
  1004a0:	66 c7 05 58 24 11 00 	movw   $0xffff,0x112458
  1004a7:	ff ff 
  1004a9:	66 c7 05 5a 24 11 00 	movw   $0x0,0x11245a
  1004b0:	00 00 
  1004b2:	c6 05 5c 24 11 00 00 	movb   $0x0,0x11245c
  1004b9:	c6 05 5d 24 11 00 fa 	movb   $0xfa,0x11245d
  1004c0:	c6 05 5e 24 11 00 cf 	movb   $0xcf,0x11245e
  1004c7:	c6 05 5f 24 11 00 00 	movb   $0x0,0x11245f
  1004ce:	66 c7 05 60 24 11 00 	movw   $0xffff,0x112460
  1004d5:	ff ff 
  1004d7:	66 c7 05 62 24 11 00 	movw   $0x0,0x112462
  1004de:	00 00 
  1004e0:	c6 05 64 24 11 00 00 	movb   $0x0,0x112464
  1004e7:	c6 05 65 24 11 00 f2 	movb   $0xf2,0x112465
  1004ee:	c6 05 66 24 11 00 cf 	movb   $0xcf,0x112466
  1004f5:	c6 05 67 24 11 00 00 	movb   $0x0,0x112467
  1004fc:	a1 44 0f 10 00       	mov    0x100f44,%eax
  100501:	8b 15 48 0f 10 00    	mov    0x100f48,%edx
  100507:	a3 78 24 11 00       	mov    %eax,0x112478
  10050c:	89 15 7c 24 11 00    	mov    %edx,0x11247c
  100512:	a1 4c 0f 10 00       	mov    0x100f4c,%eax
  100517:	8b 15 50 0f 10 00    	mov    0x100f50,%edx
  10051d:	a3 80 24 11 00       	mov    %eax,0x112480
  100522:	89 15 84 24 11 00    	mov    %edx,0x112484
  100528:	a1 54 0f 10 00       	mov    0x100f54,%eax
  10052d:	8b 15 58 0f 10 00    	mov    0x100f58,%edx
  100533:	a3 70 24 11 00       	mov    %eax,0x112470
  100538:	89 15 74 24 11 00    	mov    %edx,0x112474
  10053e:	66 c7 05 68 24 11 00 	movw   $0x63,0x112468
  100545:	63 00 
  100547:	b8 40 22 10 00       	mov    $0x102240,%eax
  10054c:	66 a3 6a 24 11 00    	mov    %ax,0x11246a
  100552:	89 c2                	mov    %eax,%edx
  100554:	c1 ea 10             	shr    $0x10,%edx
  100557:	88 15 6c 24 11 00    	mov    %dl,0x11246c
  10055d:	c6 05 6d 24 11 00 89 	movb   $0x89,0x11246d
  100564:	c6 05 6e 24 11 00 40 	movb   $0x40,0x11246e
  10056b:	c1 e8 18             	shr    $0x18,%eax
  10056e:	a2 6f 24 11 00       	mov    %al,0x11246f
  100573:	66 c7 05 ec 21 10 00 	movw   $0x77,0x1021ec
  10057a:	77 00 
  10057c:	66 89 0d ee 21 10 00 	mov    %cx,0x1021ee
  100583:	c1 e9 10             	shr    $0x10,%ecx
  100586:	66 89 0d f0 21 10 00 	mov    %cx,0x1021f0
  10058d:	b8 ec 21 10 00       	mov    $0x1021ec,%eax
  100592:	0f 01 10             	lgdtl  (%eax)
  100595:	c7 05 44 22 10 00 00 	movl   $0x200000,0x102244
  10059c:	00 20 00 
  10059f:	c7 05 48 22 10 00 10 	movl   $0x10,0x102248
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
  10078f:	68 5c 0f 10 00       	push   $0x100f5c
  100794:	e8 af fa ff ff       	call   100248 <Log>
  100799:	8b 0d 04 20 10 00    	mov    0x102004,%ecx
  10079f:	83 c4 10             	add    $0x10,%esp
  1007a2:	83 f9 00             	cmp    $0x0,%ecx
  1007a5:	0f 8e 31 01 00 00    	jle    1008dc <sys_fork+0x15c>
  1007ab:	83 3d 0c 63 10 00 03 	cmpl   $0x3,0x10630c
  1007b2:	0f 84 1b 01 00 00    	je     1008d3 <sys_fork+0x153>
  1007b8:	b8 c0 22 10 00       	mov    $0x1022c0,%eax
  1007bd:	31 d2                	xor    %edx,%edx
  1007bf:	eb 11                	jmp    1007d2 <sys_fork+0x52>
  1007c1:	8d 76 00             	lea    0x0(%esi),%esi
  1007c4:	05 5c 40 00 00       	add    $0x405c,%eax
  1007c9:	83 b8 4c 40 00 00 03 	cmpl   $0x3,0x404c(%eax)
  1007d0:	74 05                	je     1007d7 <sys_fork+0x57>
  1007d2:	42                   	inc    %edx
  1007d3:	39 ca                	cmp    %ecx,%edx
  1007d5:	75 ed                	jne    1007c4 <sys_fork+0x44>
  1007d7:	89 d0                	mov    %edx,%eax
  1007d9:	41                   	inc    %ecx
  1007da:	89 0d 04 20 10 00    	mov    %ecx,0x102004
  1007e0:	8d 0c 92             	lea    (%edx,%edx,4),%ecx
  1007e3:	8d 0c ca             	lea    (%edx,%ecx,8),%ecx
  1007e6:	8d 0c ca             	lea    (%edx,%ecx,8),%ecx
  1007e9:	01 c9                	add    %ecx,%ecx
  1007eb:	01 d1                	add    %edx,%ecx
  1007ed:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
  1007f0:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
  1007f3:	01 ca                	add    %ecx,%edx
  1007f5:	8d 9a c0 22 10 00    	lea    0x1022c0(%edx),%ebx
  1007fb:	8b 35 04 22 10 00    	mov    0x102204,%esi
  100801:	b9 17 10 00 00       	mov    $0x1017,%ecx
  100806:	89 df                	mov    %ebx,%edi
  100808:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10080a:	89 82 18 63 10 00    	mov    %eax,0x106318(%edx)
  100810:	89 45 e0             	mov    %eax,-0x20(%ebp)
  100813:	c7 82 0c 63 10 00 00 	movl   $0x0,0x10630c(%edx)
  10081a:	00 00 00 
  10081d:	c7 82 10 63 10 00 0a 	movl   $0xa,0x106310(%edx)
  100824:	00 00 00 
  100827:	81 c2 0c 63 10 00    	add    $0x10630c,%edx
  10082d:	89 93 44 40 00 00    	mov    %edx,0x4044(%ebx)
  100833:	c7 83 2c 40 00 00 00 	movl   $0x0,0x402c(%ebx)
  10083a:	00 00 00 
  10083d:	c7 83 3c 40 00 00 3b 	movl   $0x3b,0x403c(%ebx)
  100844:	00 00 00 
  100847:	c7 83 0c 40 00 00 43 	movl   $0x43,0x400c(%ebx)
  10084e:	00 00 00 
  100851:	c7 83 48 40 00 00 43 	movl   $0x43,0x4048(%ebx)
  100858:	00 00 00 
  10085b:	6a 43                	push   $0x43
  10085d:	6a 43                	push   $0x43
  10085f:	6a 3b                	push   $0x3b
  100861:	68 63 0f 10 00       	push   $0x100f63
  100866:	e8 dd f9 ff ff       	call   100248 <Log>
  10086b:	c7 83 3c 40 00 00 3b 	movl   $0x3b,0x403c(%ebx)
  100872:	00 00 00 
  100875:	c7 83 0c 40 00 00 43 	movl   $0x43,0x400c(%ebx)
  10087c:	00 00 00 
  10087f:	c7 83 48 40 00 00 43 	movl   $0x43,0x4048(%ebx)
  100886:	00 00 00 
  100889:	83 c4 10             	add    $0x10,%esp
  10088c:	31 d2                	xor    %edx,%edx
  10088e:	8b 45 e0             	mov    -0x20(%ebp),%eax
  100891:	8d 76 00             	lea    0x0(%esi),%esi
  100894:	8a 9a 00 00 20 00    	mov    0x200000(%edx),%bl
  10089a:	88 9a 00 00 40 00    	mov    %bl,0x400000(%edx)
  1008a0:	42                   	inc    %edx
  1008a1:	81 fa 00 00 20 00    	cmp    $0x200000,%edx
  1008a7:	75 eb                	jne    100894 <sys_fork+0x114>
  1008a9:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  1008ac:	89 47 2c             	mov    %eax,0x2c(%edi)
  1008af:	83 ec 08             	sub    $0x8,%esp
  1008b2:	50                   	push   %eax
  1008b3:	68 6b 0f 10 00       	push   $0x100f6b
  1008b8:	e8 8b f9 ff ff       	call   100248 <Log>
  1008bd:	83 c4 10             	add    $0x10,%esp
  1008c0:	c7 45 08 6f 0f 10 00 	movl   $0x100f6f,0x8(%ebp)
  1008c7:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1008ca:	5b                   	pop    %ebx
  1008cb:	5e                   	pop    %esi
  1008cc:	5f                   	pop    %edi
  1008cd:	5d                   	pop    %ebp
  1008ce:	e9 75 f9 ff ff       	jmp    100248 <Log>
  1008d3:	31 c0                	xor    %eax,%eax
  1008d5:	31 d2                	xor    %edx,%edx
  1008d7:	e9 fd fe ff ff       	jmp    1007d9 <sys_fork+0x59>
  1008dc:	75 f5                	jne    1008d3 <sys_fork+0x153>
  1008de:	31 d2                	xor    %edx,%edx
  1008e0:	e9 f2 fe ff ff       	jmp    1007d7 <sys_fork+0x57>
  1008e5:	8d 76 00             	lea    0x0(%esi),%esi

001008e8 <sys_sleep>:
  1008e8:	55                   	push   %ebp
  1008e9:	89 e5                	mov    %esp,%ebp
  1008eb:	53                   	push   %ebx
  1008ec:	83 ec 10             	sub    $0x10,%esp
  1008ef:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1008f2:	68 77 0f 10 00       	push   $0x100f77
  1008f7:	e8 4c f9 ff ff       	call   100248 <Log>
  1008fc:	a1 04 22 10 00       	mov    0x102204,%eax
  100901:	8b 53 2c             	mov    0x2c(%ebx),%edx
  100904:	89 90 54 40 00 00    	mov    %edx,0x4054(%eax)
  10090a:	c7 80 4c 40 00 00 02 	movl   $0x2,0x404c(%eax)
  100911:	00 00 00 
  100914:	c7 80 50 40 00 00 0a 	movl   $0xa,0x4050(%eax)
  10091b:	00 00 00 
  10091e:	e8 91 04 00 00       	call   100db4 <schedule>
  100923:	83 c4 10             	add    $0x10,%esp
  100926:	c7 45 08 80 0f 10 00 	movl   $0x100f80,0x8(%ebp)
  10092d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100930:	c9                   	leave  
  100931:	e9 12 f9 ff ff       	jmp    100248 <Log>
  100936:	66 90                	xchg   %ax,%ax

00100938 <sys_exit>:
  100938:	55                   	push   %ebp
  100939:	89 e5                	mov    %esp,%ebp
  10093b:	83 ec 14             	sub    $0x14,%esp
  10093e:	68 8a 0f 10 00       	push   $0x100f8a
  100943:	e8 00 f9 ff ff       	call   100248 <Log>
  100948:	a1 04 22 10 00       	mov    0x102204,%eax
  10094d:	c7 80 4c 40 00 00 03 	movl   $0x3,0x404c(%eax)
  100954:	00 00 00 
  100957:	c7 80 50 40 00 00 0a 	movl   $0xa,0x4050(%eax)
  10095e:	00 00 00 
  100961:	c7 80 54 40 00 00 00 	movl   $0x0,0x4054(%eax)
  100968:	00 00 00 
  10096b:	e8 44 04 00 00       	call   100db4 <schedule>
  100970:	83 c4 10             	add    $0x10,%esp
  100973:	c7 45 08 93 0f 10 00 	movl   $0x100f93,0x8(%ebp)
  10097a:	c9                   	leave  
  10097b:	e9 c8 f8 ff ff       	jmp    100248 <Log>

00100980 <sys_write>:
  100980:	55                   	push   %ebp
  100981:	89 e5                	mov    %esp,%ebp
  100983:	53                   	push   %ebx
  100984:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100987:	ff 73 24             	pushl  0x24(%ebx)
  10098a:	ff 73 28             	pushl  0x28(%ebx)
  10098d:	ff 73 20             	pushl  0x20(%ebx)
  100990:	e8 4f fd ff ff       	call   1006e4 <fs_write>
  100995:	89 43 2c             	mov    %eax,0x2c(%ebx)
  100998:	83 c4 0c             	add    $0xc,%esp
  10099b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10099e:	c9                   	leave  
  10099f:	c3                   	ret    

001009a0 <syscallHandle>:
  1009a0:	55                   	push   %ebp
  1009a1:	89 e5                	mov    %esp,%ebp
  1009a3:	53                   	push   %ebx
  1009a4:	52                   	push   %edx
  1009a5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1009a8:	8b 43 2c             	mov    0x2c(%ebx),%eax
  1009ab:	83 f8 01             	cmp    $0x1,%eax
  1009ae:	74 40                	je     1009f0 <syscallHandle+0x50>
  1009b0:	72 32                	jb     1009e4 <syscallHandle+0x44>
  1009b2:	83 f8 02             	cmp    $0x2,%eax
  1009b5:	74 21                	je     1009d8 <syscallHandle+0x38>
  1009b7:	83 f8 04             	cmp    $0x4,%eax
  1009ba:	75 15                	jne    1009d1 <syscallHandle+0x31>
  1009bc:	50                   	push   %eax
  1009bd:	ff 73 24             	pushl  0x24(%ebx)
  1009c0:	ff 73 28             	pushl  0x28(%ebx)
  1009c3:	ff 73 20             	pushl  0x20(%ebx)
  1009c6:	e8 19 fd ff ff       	call   1006e4 <fs_write>
  1009cb:	89 43 2c             	mov    %eax,0x2c(%ebx)
  1009ce:	83 c4 10             	add    $0x10,%esp
  1009d1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1009d4:	c9                   	leave  
  1009d5:	c3                   	ret    
  1009d6:	66 90                	xchg   %ax,%ax
  1009d8:	89 5d 08             	mov    %ebx,0x8(%ebp)
  1009db:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1009de:	c9                   	leave  
  1009df:	e9 54 ff ff ff       	jmp    100938 <sys_exit>
  1009e4:	89 5d 08             	mov    %ebx,0x8(%ebp)
  1009e7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1009ea:	c9                   	leave  
  1009eb:	e9 90 fd ff ff       	jmp    100780 <sys_fork>
  1009f0:	89 5d 08             	mov    %ebx,0x8(%ebp)
  1009f3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1009f6:	c9                   	leave  
  1009f7:	e9 ec fe ff ff       	jmp    1008e8 <sys_sleep>

001009fc <GProtectFaultHandle>:
  1009fc:	55                   	push   %ebp
  1009fd:	89 e5                	mov    %esp,%ebp
  1009ff:	83 ec 10             	sub    $0x10,%esp
  100a02:	68 a2 00 00 00       	push   $0xa2
  100a07:	68 9e 0f 10 00       	push   $0x100f9e
  100a0c:	e8 57 04 00 00       	call   100e68 <abort>
  100a11:	83 c4 10             	add    $0x10,%esp
  100a14:	c9                   	leave  
  100a15:	c3                   	ret    
  100a16:	66 90                	xchg   %ax,%ax

00100a18 <timeHandle>:
  100a18:	55                   	push   %ebp
  100a19:	89 e5                	mov    %esp,%ebp
  100a1b:	56                   	push   %esi
  100a1c:	53                   	push   %ebx
  100a1d:	ff 05 f4 21 10 00    	incl   0x1021f4
  100a23:	8b 35 04 22 10 00    	mov    0x102204,%esi
  100a29:	8b 86 50 40 00 00    	mov    0x4050(%esi),%eax
  100a2f:	8d 58 ff             	lea    -0x1(%eax),%ebx
  100a32:	89 9e 50 40 00 00    	mov    %ebx,0x4050(%esi)
  100a38:	8b 15 04 20 10 00    	mov    0x102004,%edx
  100a3e:	85 d2                	test   %edx,%edx
  100a40:	7e 31                	jle    100a73 <timeHandle+0x5b>
  100a42:	b8 c0 22 10 00       	mov    $0x1022c0,%eax
  100a47:	8d 0c 92             	lea    (%edx,%edx,4),%ecx
  100a4a:	8d 0c ca             	lea    (%edx,%ecx,8),%ecx
  100a4d:	8d 0c ca             	lea    (%edx,%ecx,8),%ecx
  100a50:	01 c9                	add    %ecx,%ecx
  100a52:	01 d1                	add    %edx,%ecx
  100a54:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
  100a57:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
  100a5a:	8d 8c 0a c0 22 10 00 	lea    0x1022c0(%edx,%ecx,1),%ecx
  100a61:	83 b8 4c 40 00 00 02 	cmpl   $0x2,0x404c(%eax)
  100a68:	74 12                	je     100a7c <timeHandle+0x64>
  100a6a:	05 5c 40 00 00       	add    $0x405c,%eax
  100a6f:	39 c8                	cmp    %ecx,%eax
  100a71:	75 ee                	jne    100a61 <timeHandle+0x49>
  100a73:	85 db                	test   %ebx,%ebx
  100a75:	74 19                	je     100a90 <timeHandle+0x78>
  100a77:	5b                   	pop    %ebx
  100a78:	5e                   	pop    %esi
  100a79:	5d                   	pop    %ebp
  100a7a:	c3                   	ret    
  100a7b:	90                   	nop
  100a7c:	ff 88 54 40 00 00    	decl   0x4054(%eax)
  100a82:	75 e6                	jne    100a6a <timeHandle+0x52>
  100a84:	c7 80 4c 40 00 00 00 	movl   $0x0,0x404c(%eax)
  100a8b:	00 00 00 
  100a8e:	eb da                	jmp    100a6a <timeHandle+0x52>
  100a90:	c7 86 4c 40 00 00 00 	movl   $0x0,0x404c(%esi)
  100a97:	00 00 00 
  100a9a:	c7 86 50 40 00 00 0a 	movl   $0xa,0x4050(%esi)
  100aa1:	00 00 00 
  100aa4:	5b                   	pop    %ebx
  100aa5:	5e                   	pop    %esi
  100aa6:	5d                   	pop    %ebp
  100aa7:	e9 08 03 00 00       	jmp    100db4 <schedule>

00100aac <irqHandle>:
  100aac:	55                   	push   %ebp
  100aad:	89 e5                	mov    %esp,%ebp
  100aaf:	53                   	push   %ebx
  100ab0:	50                   	push   %eax
  100ab1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100ab4:	8b 43 30             	mov    0x30(%ebx),%eax
  100ab7:	83 f8 20             	cmp    $0x20,%eax
  100aba:	74 5c                	je     100b18 <irqHandle+0x6c>
  100abc:	76 1e                	jbe    100adc <irqHandle+0x30>
  100abe:	3d 80 00 00 00       	cmp    $0x80,%eax
  100ac3:	74 0b                	je     100ad0 <irqHandle+0x24>
  100ac5:	40                   	inc    %eax
  100ac6:	75 34                	jne    100afc <irqHandle+0x50>
  100ac8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100acb:	c9                   	leave  
  100acc:	c3                   	ret    
  100acd:	8d 76 00             	lea    0x0(%esi),%esi
  100ad0:	89 5d 08             	mov    %ebx,0x8(%ebp)
  100ad3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100ad6:	c9                   	leave  
  100ad7:	e9 c4 fe ff ff       	jmp    1009a0 <syscallHandle>
  100adc:	83 f8 0d             	cmp    $0xd,%eax
  100adf:	75 1b                	jne    100afc <irqHandle+0x50>
  100ae1:	83 ec 08             	sub    $0x8,%esp
  100ae4:	68 a2 00 00 00       	push   $0xa2
  100ae9:	68 9e 0f 10 00       	push   $0x100f9e
  100aee:	e8 75 03 00 00       	call   100e68 <abort>
  100af3:	83 c4 10             	add    $0x10,%esp
  100af6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100af9:	c9                   	leave  
  100afa:	c3                   	ret    
  100afb:	90                   	nop
  100afc:	83 ec 08             	sub    $0x8,%esp
  100aff:	68 93 00 00 00       	push   $0x93
  100b04:	68 9e 0f 10 00       	push   $0x100f9e
  100b09:	e8 5a 03 00 00       	call   100e68 <abort>
  100b0e:	83 c4 10             	add    $0x10,%esp
  100b11:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100b14:	c9                   	leave  
  100b15:	c3                   	ret    
  100b16:	66 90                	xchg   %ax,%ax
  100b18:	83 ec 0c             	sub    $0xc,%esp
  100b1b:	68 b1 0f 10 00       	push   $0x100fb1
  100b20:	e8 23 f7 ff ff       	call   100248 <Log>
  100b25:	83 c4 10             	add    $0x10,%esp
  100b28:	89 5d 08             	mov    %ebx,0x8(%ebp)
  100b2b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100b2e:	c9                   	leave  
  100b2f:	e9 e4 fe ff ff       	jmp    100a18 <timeHandle>

00100b34 <initIdt>:
  100b34:	55                   	push   %ebp
  100b35:	89 e5                	mov    %esp,%ebp
  100b37:	53                   	push   %ebx
  100b38:	ba ff 0e 10 00       	mov    $0x100eff,%edx
  100b3d:	89 d3                	mov    %edx,%ebx
  100b3f:	c1 ea 10             	shr    $0x10,%edx
  100b42:	b9 c0 2c 11 00       	mov    $0x112cc0,%ecx
  100b47:	b8 c0 24 11 00       	mov    $0x1124c0,%eax
  100b4c:	66 89 18             	mov    %bx,(%eax)
  100b4f:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  100b55:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  100b59:	c6 40 05 8f          	movb   $0x8f,0x5(%eax)
  100b5d:	66 89 50 06          	mov    %dx,0x6(%eax)
  100b61:	83 c0 08             	add    $0x8,%eax
  100b64:	39 c1                	cmp    %eax,%ecx
  100b66:	75 e4                	jne    100b4c <initIdt+0x18>
  100b68:	b8 05 0f 10 00       	mov    $0x100f05,%eax
  100b6d:	66 a3 28 25 11 00    	mov    %ax,0x112528
  100b73:	66 c7 05 2a 25 11 00 	movw   $0x8,0x11252a
  100b7a:	08 00 
  100b7c:	c6 05 2c 25 11 00 00 	movb   $0x0,0x11252c
  100b83:	c6 05 2d 25 11 00 8f 	movb   $0x8f,0x11252d
  100b8a:	c1 e8 10             	shr    $0x10,%eax
  100b8d:	66 a3 2e 25 11 00    	mov    %ax,0x11252e
  100b93:	b8 09 0f 10 00       	mov    $0x100f09,%eax
  100b98:	66 a3 c0 25 11 00    	mov    %ax,0x1125c0
  100b9e:	66 c7 05 c2 25 11 00 	movw   $0x8,0x1125c2
  100ba5:	08 00 
  100ba7:	c6 05 c4 25 11 00 00 	movb   $0x0,0x1125c4
  100bae:	c6 05 c5 25 11 00 ee 	movb   $0xee,0x1125c5
  100bb5:	c1 e8 10             	shr    $0x10,%eax
  100bb8:	66 a3 c6 25 11 00    	mov    %ax,0x1125c6
  100bbe:	b8 0f 0f 10 00       	mov    $0x100f0f,%eax
  100bc3:	66 a3 c0 28 11 00    	mov    %ax,0x1128c0
  100bc9:	66 c7 05 c2 28 11 00 	movw   $0x8,0x1128c2
  100bd0:	08 00 
  100bd2:	c6 05 c4 28 11 00 00 	movb   $0x0,0x1128c4
  100bd9:	c6 05 c5 28 11 00 ee 	movb   $0xee,0x1128c5
  100be0:	c1 e8 10             	shr    $0x10,%eax
  100be3:	66 a3 c6 28 11 00    	mov    %ax,0x1128c6
  100be9:	66 c7 05 fc 21 10 00 	movw   $0x7ff,0x1021fc
  100bf0:	ff 07 
  100bf2:	b8 c0 24 11 00       	mov    $0x1124c0,%eax
  100bf7:	66 a3 fe 21 10 00    	mov    %ax,0x1021fe
  100bfd:	c1 e8 10             	shr    $0x10,%eax
  100c00:	66 a3 00 22 10 00    	mov    %ax,0x102200
  100c06:	b8 fc 21 10 00       	mov    $0x1021fc,%eax
  100c0b:	0f 01 18             	lidtl  (%eax)
  100c0e:	5b                   	pop    %ebx
  100c0f:	5d                   	pop    %ebp
  100c10:	c3                   	ret    
  100c11:	66 90                	xchg   %ax,%ax
  100c13:	90                   	nop

00100c14 <cpu_idle>:
  100c14:	55                   	push   %ebp
  100c15:	89 e5                	mov    %esp,%ebp
  100c17:	83 ec 08             	sub    $0x8,%esp
  100c1a:	fb                   	sti    
  100c1b:	90                   	nop
  100c1c:	83 ec 0c             	sub    $0xc,%esp
  100c1f:	68 b7 0f 10 00       	push   $0x100fb7
  100c24:	e8 1f f6 ff ff       	call   100248 <Log>
  100c29:	f4                   	hlt    
  100c2a:	83 c4 10             	add    $0x10,%esp
  100c2d:	eb ed                	jmp    100c1c <cpu_idle+0x8>
  100c2f:	90                   	nop

00100c30 <kernel_thread>:
  100c30:	55                   	push   %ebp
  100c31:	89 e5                	mov    %esp,%ebp
  100c33:	83 ec 08             	sub    $0x8,%esp
  100c36:	c7 05 fc 62 10 00 08 	movl   $0x8,0x1062fc
  100c3d:	00 00 00 
  100c40:	c7 05 08 63 10 00 10 	movl   $0x10,0x106308
  100c47:	00 00 00 
  100c4a:	c7 05 c0 62 10 00 10 	movl   $0x10,0x1062c0
  100c51:	00 00 00 
  100c54:	c7 05 c4 62 10 00 10 	movl   $0x10,0x1062c4
  100c5b:	00 00 00 
  100c5e:	c7 05 c8 62 10 00 10 	movl   $0x10,0x1062c8
  100c65:	00 00 00 
  100c68:	c7 05 cc 62 10 00 10 	movl   $0x10,0x1062cc
  100c6f:	00 00 00 
  100c72:	6a 10                	push   $0x10
  100c74:	6a 10                	push   $0x10
  100c76:	6a 08                	push   $0x8
  100c78:	68 63 0f 10 00       	push   $0x100f63
  100c7d:	e8 c6 f5 ff ff       	call   100248 <Log>
  100c82:	c7 05 f8 62 10 00 14 	movl   $0x100c14,0x1062f8
  100c89:	0c 10 00 
  100c8c:	c7 05 0c 63 10 00 00 	movl   $0x0,0x10630c
  100c93:	00 00 00 
  100c96:	c7 05 10 63 10 00 0a 	movl   $0xa,0x106310
  100c9d:	00 00 00 
  100ca0:	c7 05 14 63 10 00 00 	movl   $0x0,0x106314
  100ca7:	00 00 00 
  100caa:	c7 05 18 63 10 00 00 	movl   $0x0,0x106318
  100cb1:	00 00 00 
  100cb4:	c7 05 08 22 10 00 c0 	movl   $0x1022c0,0x102208
  100cbb:	22 10 00 
  100cbe:	83 c4 10             	add    $0x10,%esp
  100cc1:	c9                   	leave  
  100cc2:	c3                   	ret    
  100cc3:	90                   	nop

00100cc4 <user_process>:
  100cc4:	55                   	push   %ebp
  100cc5:	89 e5                	mov    %esp,%ebp
  100cc7:	83 ec 08             	sub    $0x8,%esp
  100cca:	c7 05 58 a3 10 00 1b 	movl   $0x1b,0x10a358
  100cd1:	00 00 00 
  100cd4:	c7 05 64 a3 10 00 23 	movl   $0x23,0x10a364
  100cdb:	00 00 00 
  100cde:	c7 05 1c a3 10 00 23 	movl   $0x23,0x10a31c
  100ce5:	00 00 00 
  100ce8:	c7 05 20 a3 10 00 23 	movl   $0x23,0x10a320
  100cef:	00 00 00 
  100cf2:	c7 05 24 a3 10 00 23 	movl   $0x23,0x10a324
  100cf9:	00 00 00 
  100cfc:	c7 05 28 a3 10 00 23 	movl   $0x23,0x10a328
  100d03:	00 00 00 
  100d06:	6a 23                	push   $0x23
  100d08:	6a 23                	push   $0x23
  100d0a:	6a 1b                	push   $0x1b
  100d0c:	68 63 0f 10 00       	push   $0x100f63
  100d11:	e8 32 f5 ff ff       	call   100248 <Log>
  100d16:	c7 05 54 a3 10 00 00 	movl   $0x200000,0x10a354
  100d1d:	00 20 00 
  100d20:	c7 05 68 a3 10 00 00 	movl   $0x0,0x10a368
  100d27:	00 00 00 
  100d2a:	c7 05 6c a3 10 00 0a 	movl   $0xa,0x10a36c
  100d31:	00 00 00 
  100d34:	c7 05 70 a3 10 00 00 	movl   $0x0,0x10a370
  100d3b:	00 00 00 
  100d3e:	c7 05 74 a3 10 00 01 	movl   $0x1,0x10a374
  100d45:	00 00 00 
  100d48:	ff 05 04 20 10 00    	incl   0x102004
  100d4e:	83 c4 10             	add    $0x10,%esp
  100d51:	c9                   	leave  
  100d52:	c3                   	ret    
  100d53:	90                   	nop

00100d54 <proc_run>:
  100d54:	55                   	push   %ebp
  100d55:	89 e5                	mov    %esp,%ebp
  100d57:	8b 45 08             	mov    0x8(%ebp),%eax
  100d5a:	a3 04 22 10 00       	mov    %eax,0x102204
  100d5f:	c7 80 54 40 00 00 00 	movl   $0x0,0x4054(%eax)
  100d66:	00 00 00 
  100d69:	c7 80 50 40 00 00 0a 	movl   $0xa,0x4050(%eax)
  100d70:	00 00 00 
  100d73:	c7 80 4c 40 00 00 01 	movl   $0x1,0x404c(%eax)
  100d7a:	00 00 00 
  100d7d:	c7 05 48 22 10 00 10 	movl   $0x10,0x102248
  100d84:	00 00 00 
  100d87:	8d 90 4c 40 00 00    	lea    0x404c(%eax),%edx
  100d8d:	89 15 44 22 10 00    	mov    %edx,0x102244
  100d93:	05 00 40 00 00       	add    $0x4000,%eax
  100d98:	89 c4                	mov    %eax,%esp
  100d9a:	0f a9                	pop    %gs
  100d9c:	0f a1                	pop    %fs
  100d9e:	07                   	pop    %es
  100d9f:	1f                   	pop    %ds
  100da0:	61                   	popa   
  100da1:	83 c4 08             	add    $0x8,%esp
  100da4:	cf                   	iret   
  100da5:	c7 45 08 bd 0f 10 00 	movl   $0x100fbd,0x8(%ebp)
  100dac:	5d                   	pop    %ebp
  100dad:	e9 96 f4 ff ff       	jmp    100248 <Log>
  100db2:	66 90                	xchg   %ax,%ax

00100db4 <schedule>:
  100db4:	8b 15 04 20 10 00    	mov    0x102004,%edx
  100dba:	83 fa 01             	cmp    $0x1,%edx
  100dbd:	7e 3d                	jle    100dfc <schedule+0x48>
  100dbf:	55                   	push   %ebp
  100dc0:	89 e5                	mov    %esp,%ebp
  100dc2:	56                   	push   %esi
  100dc3:	53                   	push   %ebx
  100dc4:	8b 0d 04 22 10 00    	mov    0x102204,%ecx
  100dca:	b8 c0 22 10 00       	mov    $0x1022c0,%eax
  100dcf:	bb 01 00 00 00       	mov    $0x1,%ebx
  100dd4:	8b b0 a8 80 00 00    	mov    0x80a8(%eax),%esi
  100dda:	85 f6                	test   %esi,%esi
  100ddc:	75 0e                	jne    100dec <schedule+0x38>
  100dde:	8b b1 58 40 00 00    	mov    0x4058(%ecx),%esi
  100de4:	39 b0 b4 80 00 00    	cmp    %esi,0x80b4(%eax)
  100dea:	75 14                	jne    100e00 <schedule+0x4c>
  100dec:	43                   	inc    %ebx
  100ded:	05 5c 40 00 00       	add    $0x405c,%eax
  100df2:	39 d3                	cmp    %edx,%ebx
  100df4:	75 de                	jne    100dd4 <schedule+0x20>
  100df6:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100df9:	5b                   	pop    %ebx
  100dfa:	5e                   	pop    %esi
  100dfb:	5d                   	pop    %ebp
  100dfc:	c3                   	ret    
  100dfd:	8d 76 00             	lea    0x0(%esi),%esi
  100e00:	83 ec 0c             	sub    $0xc,%esp
  100e03:	68 c6 0f 10 00       	push   $0x100fc6
  100e08:	e8 3b f4 ff ff       	call   100248 <Log>
  100e0d:	8d 04 9b             	lea    (%ebx,%ebx,4),%eax
  100e10:	8d 04 c3             	lea    (%ebx,%eax,8),%eax
  100e13:	8d 04 c3             	lea    (%ebx,%eax,8),%eax
  100e16:	01 c0                	add    %eax,%eax
  100e18:	01 d8                	add    %ebx,%eax
  100e1a:	8d 04 80             	lea    (%eax,%eax,4),%eax
  100e1d:	8d 04 80             	lea    (%eax,%eax,4),%eax
  100e20:	8d 84 03 c0 22 10 00 	lea    0x1022c0(%ebx,%eax,1),%eax
  100e27:	89 04 24             	mov    %eax,(%esp)
  100e2a:	e8 25 ff ff ff       	call   100d54 <proc_run>
  100e2f:	83 c4 10             	add    $0x10,%esp
  100e32:	39 1d 04 20 10 00    	cmp    %ebx,0x102004
  100e38:	7e bc                	jle    100df6 <schedule+0x42>
  100e3a:	83 ec 0c             	sub    $0xc,%esp
  100e3d:	ff 35 08 22 10 00    	pushl  0x102208
  100e43:	e8 0c ff ff ff       	call   100d54 <proc_run>
  100e48:	83 c4 10             	add    $0x10,%esp
  100e4b:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100e4e:	5b                   	pop    %ebx
  100e4f:	5e                   	pop    %esi
  100e50:	5d                   	pop    %ebp
  100e51:	eb a9                	jmp    100dfc <schedule+0x48>
  100e53:	90                   	nop

00100e54 <initProcess>:
  100e54:	55                   	push   %ebp
  100e55:	89 e5                	mov    %esp,%ebp
  100e57:	83 ec 08             	sub    $0x8,%esp
  100e5a:	e8 d1 fd ff ff       	call   100c30 <kernel_thread>
  100e5f:	c9                   	leave  
  100e60:	e9 5f fe ff ff       	jmp    100cc4 <user_process>
  100e65:	66 90                	xchg   %ax,%ax
  100e67:	90                   	nop

00100e68 <abort>:
  100e68:	55                   	push   %ebp
  100e69:	89 e5                	mov    %esp,%ebp
  100e6b:	57                   	push   %edi
  100e6c:	56                   	push   %esi
  100e6d:	53                   	push   %ebx
  100e6e:	83 ec 1c             	sub    $0x1c,%esp
  100e71:	8b 55 08             	mov    0x8(%ebp),%edx
  100e74:	fa                   	cli    
  100e75:	8a 02                	mov    (%edx),%al
  100e77:	b9 32 20 10 00       	mov    $0x102032,%ecx
  100e7c:	84 c0                	test   %al,%al
  100e7e:	74 0b                	je     100e8b <abort+0x23>
  100e80:	41                   	inc    %ecx
  100e81:	42                   	inc    %edx
  100e82:	88 41 ff             	mov    %al,-0x1(%ecx)
  100e85:	8a 02                	mov    (%edx),%al
  100e87:	84 c0                	test   %al,%al
  100e89:	75 f5                	jne    100e80 <abort+0x18>
  100e8b:	c6 01 3a             	movb   $0x3a,(%ecx)
  100e8e:	bb 29 22 10 00       	mov    $0x102229,%ebx
  100e93:	be 0a 00 00 00       	mov    $0xa,%esi
  100e98:	bf 67 66 66 66       	mov    $0x66666667,%edi
  100e9d:	4b                   	dec    %ebx
  100e9e:	8b 45 0c             	mov    0xc(%ebp),%eax
  100ea1:	99                   	cltd   
  100ea2:	f7 fe                	idiv   %esi
  100ea4:	8d 42 30             	lea    0x30(%edx),%eax
  100ea7:	88 45 e7             	mov    %al,-0x19(%ebp)
  100eaa:	88 03                	mov    %al,(%ebx)
  100eac:	89 f8                	mov    %edi,%eax
  100eae:	f7 6d 0c             	imull  0xc(%ebp)
  100eb1:	c1 fa 02             	sar    $0x2,%edx
  100eb4:	8b 45 0c             	mov    0xc(%ebp),%eax
  100eb7:	c1 f8 1f             	sar    $0x1f,%eax
  100eba:	29 c2                	sub    %eax,%edx
  100ebc:	89 55 0c             	mov    %edx,0xc(%ebp)
  100ebf:	75 dc                	jne    100e9d <abort+0x35>
  100ec1:	41                   	inc    %ecx
  100ec2:	41                   	inc    %ecx
  100ec3:	43                   	inc    %ebx
  100ec4:	8a 45 e7             	mov    -0x19(%ebp),%al
  100ec7:	88 41 ff             	mov    %al,-0x1(%ecx)
  100eca:	8a 03                	mov    (%ebx),%al
  100ecc:	88 45 e7             	mov    %al,-0x19(%ebp)
  100ecf:	84 c0                	test   %al,%al
  100ed1:	75 ef                	jne    100ec2 <abort+0x5a>
  100ed3:	c6 01 0a             	movb   $0xa,(%ecx)
  100ed6:	0f be 05 20 20 10 00 	movsbl 0x102020,%eax
  100edd:	84 c0                	test   %al,%al
  100edf:	74 1b                	je     100efc <abort+0x94>
  100ee1:	bb 20 20 10 00       	mov    $0x102020,%ebx
  100ee6:	83 ec 0c             	sub    $0xc,%esp
  100ee9:	50                   	push   %eax
  100eea:	e8 7d f1 ff ff       	call   10006c <putChar>
  100eef:	43                   	inc    %ebx
  100ef0:	0f be 03             	movsbl (%ebx),%eax
  100ef3:	83 c4 10             	add    $0x10,%esp
  100ef6:	84 c0                	test   %al,%al
  100ef8:	75 ec                	jne    100ee6 <abort+0x7e>
  100efa:	66 90                	xchg   %ax,%ax
  100efc:	f4                   	hlt    
  100efd:	eb fd                	jmp    100efc <abort+0x94>

00100eff <irqEmpty>:
  100eff:	6a 00                	push   $0x0
  100f01:	6a ff                	push   $0xffffffff
  100f03:	eb 13                	jmp    100f18 <asmDoIrq>

00100f05 <irqGProtectFault>:
  100f05:	6a 0d                	push   $0xd
  100f07:	eb 0f                	jmp    100f18 <asmDoIrq>

00100f09 <irqTimeSyscall>:
  100f09:	6a 00                	push   $0x0
  100f0b:	6a 20                	push   $0x20
  100f0d:	eb 09                	jmp    100f18 <asmDoIrq>

00100f0f <irqSyscall>:
  100f0f:	6a 00                	push   $0x0
  100f11:	68 80 00 00 00       	push   $0x80
  100f16:	eb 00                	jmp    100f18 <asmDoIrq>

00100f18 <asmDoIrq>:
  100f18:	60                   	pusha  
  100f19:	1e                   	push   %ds
  100f1a:	06                   	push   %es
  100f1b:	0f a0                	push   %fs
  100f1d:	0f a8                	push   %gs
  100f1f:	54                   	push   %esp
  100f20:	e8 87 fb ff ff       	call   100aac <irqHandle>
  100f25:	83 c4 04             	add    $0x4,%esp
  100f28:	0f a9                	pop    %gs
  100f2a:	0f a1                	pop    %fs
  100f2c:	07                   	pop    %es
  100f2d:	1f                   	pop    %ds
  100f2e:	61                   	popa   
  100f2f:	83 c4 04             	add    $0x4,%esp
  100f32:	83 c4 04             	add    $0x4,%esp
  100f35:	cf                   	iret   
