
kMain.elf:     file format elf32-i386


Disassembly of section .text:

00100000 <kEntry>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 08             	sub    $0x8,%esp
  100006:	e8 21 00 00 00       	call   10002c <initSerial>
  10000b:	e8 b4 0e 00 00       	call   100ec4 <initIdt>
  100010:	e8 8b 00 00 00       	call   1000a0 <initIntr>
  100015:	e8 22 04 00 00       	call   10043c <initSeg>
  10001a:	e8 69 00 00 00       	call   100088 <initTimer>
  10001f:	e8 c4 09 00 00       	call   1009e8 <initProcess>
  100024:	e8 e3 05 00 00       	call   10060c <loadUMain>
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
  1001bb:	b9 74 10 10 00       	mov    $0x101074,%ecx
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
  1004fc:	a1 80 10 10 00       	mov    0x101080,%eax
  100501:	8b 15 84 10 10 00    	mov    0x101084,%edx
  100507:	a3 78 24 11 00       	mov    %eax,0x112478
  10050c:	89 15 7c 24 11 00    	mov    %edx,0x11247c
  100512:	a1 88 10 10 00       	mov    0x101088,%eax
  100517:	8b 15 8c 10 10 00    	mov    0x10108c,%edx
  10051d:	a3 80 24 11 00       	mov    %eax,0x112480
  100522:	89 15 84 24 11 00    	mov    %edx,0x112484
  100528:	a1 90 10 10 00       	mov    0x101090,%eax
  10052d:	8b 15 94 10 10 00    	mov    0x101094,%edx
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
  100595:	c7 05 44 22 10 00 6c 	movl   $0x10a36c,0x102244
  10059c:	a3 10 00 
  10059f:	c7 05 48 22 10 00 10 	movl   $0x10,0x102248
  1005a6:	00 00 00 
  1005a9:	b8 28 00 00 00       	mov    $0x28,%eax
  1005ae:	0f 00 d8             	ltr    %ax
  1005b1:	b8 30 00 00 00       	mov    $0x30,%eax
  1005b6:	8e e8                	mov    %eax,%gs
  1005b8:	b8 10 00 00 00       	mov    $0x10,%eax
  1005bd:	8e e0                	mov    %eax,%fs
  1005bf:	8e c0                	mov    %eax,%es
  1005c1:	8e d8                	mov    %eax,%ds
  1005c3:	8e d0                	mov    %eax,%ss
  1005c5:	31 c0                	xor    %eax,%eax
  1005c7:	0f 00 d0             	lldt   %ax
  1005ca:	5d                   	pop    %ebp
  1005cb:	c3                   	ret    

001005cc <enterUserSpace>:
  1005cc:	55                   	push   %ebp
  1005cd:	89 e5                	mov    %esp,%ebp
  1005cf:	8b 45 08             	mov    0x8(%ebp),%eax
  1005d2:	ba 23 00 00 00       	mov    $0x23,%edx
  1005d7:	52                   	push   %edx
  1005d8:	ba 00 00 02 00       	mov    $0x20000,%edx
  1005dd:	52                   	push   %edx
  1005de:	9c                   	pushf  
  1005df:	ba 1b 00 00 00       	mov    $0x1b,%edx
  1005e4:	52                   	push   %edx
  1005e5:	50                   	push   %eax
  1005e6:	a3 58 a3 10 00       	mov    %eax,0x10a358
  1005eb:	c7 05 6c a3 10 00 01 	movl   $0x1,0x10a36c
  1005f2:	00 00 00 
  1005f5:	05 00 00 10 00       	add    $0x100000,%eax
  1005fa:	a3 64 a3 10 00       	mov    %eax,0x10a364
  1005ff:	b8 23 00 00 00       	mov    $0x23,%eax
  100604:	8e d8                	mov    %eax,%ds
  100606:	cf                   	iret   
  100607:	5d                   	pop    %ebp
  100608:	c3                   	ret    
  100609:	8d 76 00             	lea    0x0(%esi),%esi

0010060c <loadUMain>:
  10060c:	55                   	push   %ebp
  10060d:	89 e5                	mov    %esp,%ebp
  10060f:	57                   	push   %edi
  100610:	56                   	push   %esi
  100611:	53                   	push   %ebx
  100612:	83 ec 0c             	sub    $0xc,%esp
  100615:	be c9 00 00 00       	mov    $0xc9,%esi
  10061a:	bb 00 00 21 00       	mov    $0x210000,%ebx
  10061f:	90                   	nop
  100620:	56                   	push   %esi
  100621:	53                   	push   %ebx
  100622:	e8 9d fd ff ff       	call   1003c4 <readSect>
  100627:	81 c3 00 02 00 00    	add    $0x200,%ebx
  10062d:	46                   	inc    %esi
  10062e:	58                   	pop    %eax
  10062f:	5a                   	pop    %edx
  100630:	81 fb 00 90 22 00    	cmp    $0x229000,%ebx
  100636:	75 e8                	jne    100620 <loadUMain+0x14>
  100638:	a1 1c 00 21 00       	mov    0x21001c,%eax
  10063d:	8d 88 00 00 21 00    	lea    0x210000(%eax),%ecx
  100643:	0f b7 35 2c 00 21 00 	movzwl 0x21002c,%esi
  10064a:	c1 e6 05             	shl    $0x5,%esi
  10064d:	01 ce                	add    %ecx,%esi
  10064f:	39 f1                	cmp    %esi,%ecx
  100651:	73 42                	jae    100695 <loadUMain+0x89>
  100653:	90                   	nop
  100654:	8b 51 08             	mov    0x8(%ecx),%edx
  100657:	8b 41 04             	mov    0x4(%ecx),%eax
  10065a:	8d b8 00 00 21 00    	lea    0x210000(%eax),%edi
  100660:	8b 59 10             	mov    0x10(%ecx),%ebx
  100663:	31 c0                	xor    %eax,%eax
  100665:	85 db                	test   %ebx,%ebx
  100667:	74 14                	je     10067d <loadUMain+0x71>
  100669:	8d 76 00             	lea    0x0(%esi),%esi
  10066c:	42                   	inc    %edx
  10066d:	8a 1c 07             	mov    (%edi,%eax,1),%bl
  100670:	88 5a ff             	mov    %bl,-0x1(%edx)
  100673:	40                   	inc    %eax
  100674:	8b 59 10             	mov    0x10(%ecx),%ebx
  100677:	39 c3                	cmp    %eax,%ebx
  100679:	77 f1                	ja     10066c <loadUMain+0x60>
  10067b:	89 d8                	mov    %ebx,%eax
  10067d:	29 c2                	sub    %eax,%edx
  10067f:	39 59 14             	cmp    %ebx,0x14(%ecx)
  100682:	76 0a                	jbe    10068e <loadUMain+0x82>
  100684:	c6 04 02 00          	movb   $0x0,(%edx,%eax,1)
  100688:	40                   	inc    %eax
  100689:	39 41 14             	cmp    %eax,0x14(%ecx)
  10068c:	77 f6                	ja     100684 <loadUMain+0x78>
  10068e:	83 c1 20             	add    $0x20,%ecx
  100691:	39 ce                	cmp    %ecx,%esi
  100693:	77 bf                	ja     100654 <loadUMain+0x48>
  100695:	a1 18 00 21 00       	mov    0x210018,%eax
  10069a:	ba 23 00 00 00       	mov    $0x23,%edx
  10069f:	52                   	push   %edx
  1006a0:	b9 00 00 02 00       	mov    $0x20000,%ecx
  1006a5:	51                   	push   %ecx
  1006a6:	9c                   	pushf  
  1006a7:	b9 1b 00 00 00       	mov    $0x1b,%ecx
  1006ac:	51                   	push   %ecx
  1006ad:	50                   	push   %eax
  1006ae:	a3 58 a3 10 00       	mov    %eax,0x10a358
  1006b3:	c7 05 6c a3 10 00 01 	movl   $0x1,0x10a36c
  1006ba:	00 00 00 
  1006bd:	8d 88 00 00 10 00    	lea    0x100000(%eax),%ecx
  1006c3:	89 0d 64 a3 10 00    	mov    %ecx,0x10a364
  1006c9:	8e da                	mov    %edx,%ds
  1006cb:	cf                   	iret   
  1006cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1006cf:	5b                   	pop    %ebx
  1006d0:	5e                   	pop    %esi
  1006d1:	5f                   	pop    %edi
  1006d2:	5d                   	pop    %ebp
  1006d3:	ff e0                	jmp    *%eax
  1006d5:	66 90                	xchg   %ax,%ax
  1006d7:	90                   	nop

001006d8 <cpu_idle>:
  1006d8:	55                   	push   %ebp
  1006d9:	89 e5                	mov    %esp,%ebp
  1006db:	83 ec 08             	sub    $0x8,%esp
  1006de:	fb                   	sti    
  1006df:	90                   	nop
  1006e0:	83 ec 0c             	sub    $0xc,%esp
  1006e3:	68 98 10 10 00       	push   $0x101098
  1006e8:	e8 5b fb ff ff       	call   100248 <Log>
  1006ed:	f4                   	hlt    
  1006ee:	83 c4 10             	add    $0x10,%esp
  1006f1:	eb ed                	jmp    1006e0 <cpu_idle+0x8>
  1006f3:	90                   	nop

001006f4 <kernel_thread>:
  1006f4:	55                   	push   %ebp
  1006f5:	89 e5                	mov    %esp,%ebp
  1006f7:	83 ec 08             	sub    $0x8,%esp
  1006fa:	c7 05 fc 62 10 00 08 	movl   $0x8,0x1062fc
  100701:	00 00 00 
  100704:	c7 05 08 63 10 00 10 	movl   $0x10,0x106308
  10070b:	00 00 00 
  10070e:	c7 05 c0 62 10 00 10 	movl   $0x10,0x1062c0
  100715:	00 00 00 
  100718:	c7 05 c4 62 10 00 10 	movl   $0x10,0x1062c4
  10071f:	00 00 00 
  100722:	c7 05 c8 62 10 00 10 	movl   $0x10,0x1062c8
  100729:	00 00 00 
  10072c:	c7 05 cc 62 10 00 10 	movl   $0x10,0x1062cc
  100733:	00 00 00 
  100736:	6a 10                	push   $0x10
  100738:	6a 10                	push   $0x10
  10073a:	6a 08                	push   $0x8
  10073c:	68 9e 10 10 00       	push   $0x10109e
  100741:	e8 02 fb ff ff       	call   100248 <Log>
  100746:	c7 05 f8 62 10 00 d8 	movl   $0x1006d8,0x1062f8
  10074d:	06 10 00 
  100750:	c7 05 1c 63 10 00 0c 	movl   $0x10630c,0x10631c
  100757:	63 10 00 
  10075a:	c7 05 0c 63 10 00 00 	movl   $0x0,0x10630c
  100761:	00 00 00 
  100764:	c7 05 10 63 10 00 00 	movl   $0x0,0x106310
  10076b:	00 00 00 
  10076e:	c7 05 14 63 10 00 00 	movl   $0x0,0x106314
  100775:	00 00 00 
  100778:	c7 05 18 63 10 00 00 	movl   $0x0,0x106318
  10077f:	00 00 00 
  100782:	c7 05 f8 21 10 00 c0 	movl   $0x1022c0,0x1021f8
  100789:	22 10 00 
  10078c:	83 c4 10             	add    $0x10,%esp
  10078f:	c9                   	leave  
  100790:	c3                   	ret    
  100791:	8d 76 00             	lea    0x0(%esi),%esi

00100794 <user_process>:
  100794:	55                   	push   %ebp
  100795:	89 e5                	mov    %esp,%ebp
  100797:	83 ec 08             	sub    $0x8,%esp
  10079a:	c7 05 5c a3 10 00 1b 	movl   $0x1b,0x10a35c
  1007a1:	00 00 00 
  1007a4:	c7 05 68 a3 10 00 23 	movl   $0x23,0x10a368
  1007ab:	00 00 00 
  1007ae:	c7 05 20 a3 10 00 23 	movl   $0x23,0x10a320
  1007b5:	00 00 00 
  1007b8:	c7 05 24 a3 10 00 23 	movl   $0x23,0x10a324
  1007bf:	00 00 00 
  1007c2:	c7 05 28 a3 10 00 23 	movl   $0x23,0x10a328
  1007c9:	00 00 00 
  1007cc:	c7 05 2c a3 10 00 23 	movl   $0x23,0x10a32c
  1007d3:	00 00 00 
  1007d6:	6a 23                	push   $0x23
  1007d8:	6a 23                	push   $0x23
  1007da:	6a 1b                	push   $0x1b
  1007dc:	68 9e 10 10 00       	push   $0x10109e
  1007e1:	e8 62 fa ff ff       	call   100248 <Log>
  1007e6:	c7 05 6c a3 10 00 00 	movl   $0x0,0x10a36c
  1007ed:	00 00 00 
  1007f0:	c7 05 7c a3 10 00 6c 	movl   $0x10a36c,0x10a37c
  1007f7:	a3 10 00 
  1007fa:	c7 05 70 a3 10 00 0a 	movl   $0xa,0x10a370
  100801:	00 00 00 
  100804:	c7 05 74 a3 10 00 00 	movl   $0x0,0x10a374
  10080b:	00 00 00 
  10080e:	c7 05 78 a3 10 00 01 	movl   $0x1,0x10a378
  100815:	00 00 00 
  100818:	ff 05 00 20 10 00    	incl   0x102000
  10081e:	83 c4 10             	add    $0x10,%esp
  100821:	c9                   	leave  
  100822:	c3                   	ret    
  100823:	90                   	nop

00100824 <proc_run>:
  100824:	55                   	push   %ebp
  100825:	89 e5                	mov    %esp,%ebp
  100827:	83 ec 10             	sub    $0x10,%esp
  10082a:	8b 45 08             	mov    0x8(%ebp),%eax
  10082d:	a3 f4 21 10 00       	mov    %eax,0x1021f4
  100832:	2d c0 22 10 00       	sub    $0x1022c0,%eax
  100837:	c1 f8 05             	sar    $0x5,%eax
  10083a:	8d 14 00             	lea    (%eax,%eax,1),%edx
  10083d:	01 c2                	add    %eax,%edx
  10083f:	8d 14 92             	lea    (%edx,%edx,4),%edx
  100842:	8d 14 d0             	lea    (%eax,%edx,8),%edx
  100845:	8d 0c 90             	lea    (%eax,%edx,4),%ecx
  100848:	8d 14 cd 00 00 00 00 	lea    0x0(,%ecx,8),%edx
  10084f:	29 ca                	sub    %ecx,%edx
  100851:	8d 14 d0             	lea    (%eax,%edx,8),%edx
  100854:	01 d2                	add    %edx,%edx
  100856:	01 c2                	add    %eax,%edx
  100858:	8d 14 90             	lea    (%eax,%edx,4),%edx
  10085b:	8d 14 d2             	lea    (%edx,%edx,8),%edx
  10085e:	8d 14 90             	lea    (%eax,%edx,4),%edx
  100861:	89 d0                	mov    %edx,%eax
  100863:	c1 e0 07             	shl    $0x7,%eax
  100866:	01 d0                	add    %edx,%eax
  100868:	f7 d8                	neg    %eax
  10086a:	50                   	push   %eax
  10086b:	68 aa 10 10 00       	push   $0x1010aa
  100870:	e8 d3 f9 ff ff       	call   100248 <Log>
  100875:	58                   	pop    %eax
  100876:	5a                   	pop    %edx
  100877:	a1 f4 21 10 00       	mov    0x1021f4,%eax
  10087c:	ff b0 38 40 00 00    	pushl  0x4038(%eax)
  100882:	68 aa 10 10 00       	push   $0x1010aa
  100887:	e8 bc f9 ff ff       	call   100248 <Log>
  10088c:	a1 f4 21 10 00       	mov    0x1021f4,%eax
  100891:	c7 80 54 40 00 00 00 	movl   $0x0,0x4054(%eax)
  100898:	00 00 00 
  10089b:	c7 80 50 40 00 00 0a 	movl   $0xa,0x4050(%eax)
  1008a2:	00 00 00 
  1008a5:	c7 80 4c 40 00 00 01 	movl   $0x1,0x404c(%eax)
  1008ac:	00 00 00 
  1008af:	c7 05 48 22 10 00 10 	movl   $0x10,0x102248
  1008b6:	00 00 00 
  1008b9:	8d 90 4c 40 00 00    	lea    0x404c(%eax),%edx
  1008bf:	89 15 44 22 10 00    	mov    %edx,0x102244
  1008c5:	05 00 40 00 00       	add    $0x4000,%eax
  1008ca:	89 c4                	mov    %eax,%esp
  1008cc:	0f a9                	pop    %gs
  1008ce:	0f a1                	pop    %fs
  1008d0:	07                   	pop    %es
  1008d1:	1f                   	pop    %ds
  1008d2:	61                   	popa   
  1008d3:	83 c4 08             	add    $0x8,%esp
  1008d6:	cf                   	iret   
  1008d7:	83 c4 10             	add    $0x10,%esp
  1008da:	c7 45 08 ae 10 10 00 	movl   $0x1010ae,0x8(%ebp)
  1008e1:	c9                   	leave  
  1008e2:	e9 61 f9 ff ff       	jmp    100248 <Log>
  1008e7:	90                   	nop

001008e8 <schedule>:
  1008e8:	55                   	push   %ebp
  1008e9:	89 e5                	mov    %esp,%ebp
  1008eb:	56                   	push   %esi
  1008ec:	53                   	push   %ebx
  1008ed:	83 ec 0c             	sub    $0xc,%esp
  1008f0:	68 b7 10 10 00       	push   $0x1010b7
  1008f5:	e8 4e f9 ff ff       	call   100248 <Log>
  1008fa:	8b 15 00 20 10 00    	mov    0x102000,%edx
  100900:	83 c4 10             	add    $0x10,%esp
  100903:	83 fa 01             	cmp    $0x1,%edx
  100906:	0f 8e 88 00 00 00    	jle    100994 <schedule+0xac>
  10090c:	8b 35 f4 21 10 00    	mov    0x1021f4,%esi
  100912:	b8 c0 22 10 00       	mov    $0x1022c0,%eax
  100917:	bb 01 00 00 00       	mov    $0x1,%ebx
  10091c:	8b 88 ac 80 00 00    	mov    0x80ac(%eax),%ecx
  100922:	85 c9                	test   %ecx,%ecx
  100924:	75 0e                	jne    100934 <schedule+0x4c>
  100926:	8b 8e 58 40 00 00    	mov    0x4058(%esi),%ecx
  10092c:	39 88 b8 80 00 00    	cmp    %ecx,0x80b8(%eax)
  100932:	75 24                	jne    100958 <schedule+0x70>
  100934:	43                   	inc    %ebx
  100935:	05 60 40 00 00       	add    $0x4060,%eax
  10093a:	39 d3                	cmp    %edx,%ebx
  10093c:	75 de                	jne    10091c <schedule+0x34>
  10093e:	83 ec 0c             	sub    $0xc,%esp
  100941:	ff 35 f8 21 10 00    	pushl  0x1021f8
  100947:	e8 d8 fe ff ff       	call   100824 <proc_run>
  10094c:	83 c4 10             	add    $0x10,%esp
  10094f:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100952:	5b                   	pop    %ebx
  100953:	5e                   	pop    %esi
  100954:	5d                   	pop    %ebp
  100955:	c3                   	ret    
  100956:	66 90                	xchg   %ax,%ax
  100958:	50                   	push   %eax
  100959:	51                   	push   %ecx
  10095a:	53                   	push   %ebx
  10095b:	68 c1 10 10 00       	push   $0x1010c1
  100960:	e8 e3 f8 ff ff       	call   100248 <Log>
  100965:	89 d8                	mov    %ebx,%eax
  100967:	c1 e0 08             	shl    $0x8,%eax
  10096a:	01 d8                	add    %ebx,%eax
  10096c:	01 c0                	add    %eax,%eax
  10096e:	01 d8                	add    %ebx,%eax
  100970:	c1 e0 05             	shl    $0x5,%eax
  100973:	05 c0 22 10 00       	add    $0x1022c0,%eax
  100978:	89 04 24             	mov    %eax,(%esp)
  10097b:	e8 a4 fe ff ff       	call   100824 <proc_run>
  100980:	8b 15 00 20 10 00    	mov    0x102000,%edx
  100986:	83 c4 10             	add    $0x10,%esp
  100989:	39 da                	cmp    %ebx,%edx
  10098b:	74 b1                	je     10093e <schedule+0x56>
  10098d:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100990:	5b                   	pop    %ebx
  100991:	5e                   	pop    %esi
  100992:	5d                   	pop    %ebp
  100993:	c3                   	ret    
  100994:	bb 01 00 00 00       	mov    $0x1,%ebx
  100999:	eb ee                	jmp    100989 <schedule+0xa1>
  10099b:	90                   	nop

0010099c <sys_exit.part.1>:
  10099c:	55                   	push   %ebp
  10099d:	89 e5                	mov    %esp,%ebp
  10099f:	83 ec 14             	sub    $0x14,%esp
  1009a2:	68 d1 10 10 00       	push   $0x1010d1
  1009a7:	e8 9c f8 ff ff       	call   100248 <Log>
  1009ac:	a1 f4 21 10 00       	mov    0x1021f4,%eax
  1009b1:	c7 80 4c 40 00 00 03 	movl   $0x3,0x404c(%eax)
  1009b8:	00 00 00 
  1009bb:	c7 80 50 40 00 00 0a 	movl   $0xa,0x4050(%eax)
  1009c2:	00 00 00 
  1009c5:	c7 80 54 40 00 00 00 	movl   $0x0,0x4054(%eax)
  1009cc:	00 00 00 
  1009cf:	e8 14 ff ff ff       	call   1008e8 <schedule>
  1009d4:	c7 04 24 da 10 10 00 	movl   $0x1010da,(%esp)
  1009db:	e8 68 f8 ff ff       	call   100248 <Log>
  1009e0:	83 c4 10             	add    $0x10,%esp
  1009e3:	c9                   	leave  
  1009e4:	c3                   	ret    
  1009e5:	8d 76 00             	lea    0x0(%esi),%esi

001009e8 <initProcess>:
  1009e8:	55                   	push   %ebp
  1009e9:	89 e5                	mov    %esp,%ebp
  1009eb:	83 ec 08             	sub    $0x8,%esp
  1009ee:	c7 05 00 20 10 00 01 	movl   $0x1,0x102000
  1009f5:	00 00 00 
  1009f8:	c7 05 f4 21 10 00 00 	movl   $0x0,0x1021f4
  1009ff:	00 00 00 
  100a02:	c7 05 f8 21 10 00 00 	movl   $0x0,0x1021f8
  100a09:	00 00 00 
  100a0c:	fb                   	sti    
  100a0d:	e8 e2 fc ff ff       	call   1006f4 <kernel_thread>
  100a12:	e8 7d fd ff ff       	call   100794 <user_process>
  100a17:	c7 05 f4 21 10 00 20 	movl   $0x106320,0x1021f4
  100a1e:	63 10 00 
  100a21:	c9                   	leave  
  100a22:	c3                   	ret    
  100a23:	90                   	nop

00100a24 <printch>:
  100a24:	55                   	push   %ebp
  100a25:	89 e5                	mov    %esp,%ebp
  100a27:	83 ec 10             	sub    $0x10,%esp
  100a2a:	0f be 45 08          	movsbl 0x8(%ebp),%eax
  100a2e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100a31:	a1 04 20 10 00       	mov    0x102004,%eax
  100a36:	8d 04 80             	lea    (%eax,%eax,4),%eax
  100a39:	c1 e0 04             	shl    $0x4,%eax
  100a3c:	03 05 00 22 10 00    	add    0x102200,%eax
  100a42:	01 c0                	add    %eax,%eax
  100a44:	89 45 f8             	mov    %eax,-0x8(%ebp)
  100a47:	c7 45 fc 0c 00 00 00 	movl   $0xc,-0x4(%ebp)
  100a4e:	60                   	pusha  
  100a4f:	8b 7d f8             	mov    -0x8(%ebp),%edi
  100a52:	8a 65 fc             	mov    -0x4(%ebp),%ah
  100a55:	8a 45 f4             	mov    -0xc(%ebp),%al
  100a58:	65 66 89 07          	mov    %ax,%gs:(%edi)
  100a5c:	61                   	popa   
  100a5d:	c9                   	leave  
  100a5e:	c3                   	ret    
  100a5f:	90                   	nop

00100a60 <fs_write>:
  100a60:	55                   	push   %ebp
  100a61:	89 e5                	mov    %esp,%ebp
  100a63:	57                   	push   %edi
  100a64:	56                   	push   %esi
  100a65:	53                   	push   %ebx
  100a66:	83 ec 10             	sub    $0x10,%esp
  100a69:	8b 45 10             	mov    0x10(%ebp),%eax
  100a6c:	85 c0                	test   %eax,%eax
  100a6e:	7e 6d                	jle    100add <fs_write+0x7d>
  100a70:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  100a73:	8b 75 10             	mov    0x10(%ebp),%esi
  100a76:	01 ce                	add    %ecx,%esi
  100a78:	bf 50 00 00 00       	mov    $0x50,%edi
  100a7d:	eb 16                	jmp    100a95 <fs_write+0x35>
  100a7f:	90                   	nop
  100a80:	99                   	cltd   
  100a81:	f7 ff                	idiv   %edi
  100a83:	89 15 00 22 10 00    	mov    %edx,0x102200
  100a89:	43                   	inc    %ebx
  100a8a:	89 1d 04 20 10 00    	mov    %ebx,0x102004
  100a90:	41                   	inc    %ecx
  100a91:	39 f1                	cmp    %esi,%ecx
  100a93:	74 48                	je     100add <fs_write+0x7d>
  100a95:	0f be 01             	movsbl (%ecx),%eax
  100a98:	3c 0a                	cmp    $0xa,%al
  100a9a:	74 4c                	je     100ae8 <fs_write+0x88>
  100a9c:	89 45 e8             	mov    %eax,-0x18(%ebp)
  100a9f:	8b 1d 04 20 10 00    	mov    0x102004,%ebx
  100aa5:	a1 00 22 10 00       	mov    0x102200,%eax
  100aaa:	8d 14 9b             	lea    (%ebx,%ebx,4),%edx
  100aad:	c1 e2 04             	shl    $0x4,%edx
  100ab0:	01 c2                	add    %eax,%edx
  100ab2:	01 d2                	add    %edx,%edx
  100ab4:	89 55 ec             	mov    %edx,-0x14(%ebp)
  100ab7:	c7 45 f0 0c 00 00 00 	movl   $0xc,-0x10(%ebp)
  100abe:	60                   	pusha  
  100abf:	8b 7d ec             	mov    -0x14(%ebp),%edi
  100ac2:	8a 65 f0             	mov    -0x10(%ebp),%ah
  100ac5:	8a 45 e8             	mov    -0x18(%ebp),%al
  100ac8:	65 66 89 07          	mov    %ax,%gs:(%edi)
  100acc:	61                   	popa   
  100acd:	83 f8 4f             	cmp    $0x4f,%eax
  100ad0:	7f ae                	jg     100a80 <fs_write+0x20>
  100ad2:	40                   	inc    %eax
  100ad3:	a3 00 22 10 00       	mov    %eax,0x102200
  100ad8:	41                   	inc    %ecx
  100ad9:	39 f1                	cmp    %esi,%ecx
  100adb:	75 b8                	jne    100a95 <fs_write+0x35>
  100add:	8b 45 10             	mov    0x10(%ebp),%eax
  100ae0:	83 c4 10             	add    $0x10,%esp
  100ae3:	5b                   	pop    %ebx
  100ae4:	5e                   	pop    %esi
  100ae5:	5f                   	pop    %edi
  100ae6:	5d                   	pop    %ebp
  100ae7:	c3                   	ret    
  100ae8:	ff 05 04 20 10 00    	incl   0x102004
  100aee:	c7 05 00 22 10 00 00 	movl   $0x0,0x102200
  100af5:	00 00 00 
  100af8:	eb 96                	jmp    100a90 <fs_write+0x30>
  100afa:	66 90                	xchg   %ax,%ax

00100afc <sys_fork>:
  100afc:	55                   	push   %ebp
  100afd:	89 e5                	mov    %esp,%ebp
  100aff:	57                   	push   %edi
  100b00:	56                   	push   %esi
  100b01:	53                   	push   %ebx
  100b02:	83 ec 18             	sub    $0x18,%esp
  100b05:	68 e5 10 10 00       	push   $0x1010e5
  100b0a:	e8 39 f7 ff ff       	call   100248 <Log>
  100b0f:	8b 0d 00 20 10 00    	mov    0x102000,%ecx
  100b15:	83 c4 10             	add    $0x10,%esp
  100b18:	83 f9 00             	cmp    $0x0,%ecx
  100b1b:	0f 8e f7 00 00 00    	jle    100c18 <sys_fork+0x11c>
  100b21:	83 3d 0c 63 10 00 03 	cmpl   $0x3,0x10630c
  100b28:	0f 84 e1 00 00 00    	je     100c0f <sys_fork+0x113>
  100b2e:	ba c0 22 10 00       	mov    $0x1022c0,%edx
  100b33:	31 c0                	xor    %eax,%eax
  100b35:	eb 10                	jmp    100b47 <sys_fork+0x4b>
  100b37:	90                   	nop
  100b38:	81 c2 60 40 00 00    	add    $0x4060,%edx
  100b3e:	83 ba 4c 40 00 00 03 	cmpl   $0x3,0x404c(%edx)
  100b45:	74 05                	je     100b4c <sys_fork+0x50>
  100b47:	40                   	inc    %eax
  100b48:	39 c8                	cmp    %ecx,%eax
  100b4a:	75 ec                	jne    100b38 <sys_fork+0x3c>
  100b4c:	89 c3                	mov    %eax,%ebx
  100b4e:	41                   	inc    %ecx
  100b4f:	89 0d 00 20 10 00    	mov    %ecx,0x102000
  100b55:	89 c2                	mov    %eax,%edx
  100b57:	c1 e2 08             	shl    $0x8,%edx
  100b5a:	01 c2                	add    %eax,%edx
  100b5c:	01 d2                	add    %edx,%edx
  100b5e:	01 c2                	add    %eax,%edx
  100b60:	c1 e2 05             	shl    $0x5,%edx
  100b63:	8d 82 c0 22 10 00    	lea    0x1022c0(%edx),%eax
  100b69:	8b 35 f4 21 10 00    	mov    0x1021f4,%esi
  100b6f:	b9 18 10 00 00       	mov    $0x1018,%ecx
  100b74:	89 c7                	mov    %eax,%edi
  100b76:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  100b78:	89 9a 18 63 10 00    	mov    %ebx,0x106318(%edx)
  100b7e:	c7 82 0c 63 10 00 00 	movl   $0x0,0x10630c(%edx)
  100b85:	00 00 00 
  100b88:	c7 82 10 63 10 00 0a 	movl   $0xa,0x106310(%edx)
  100b8f:	00 00 00 
  100b92:	81 c2 0c 63 10 00    	add    $0x10630c,%edx
  100b98:	89 90 44 40 00 00    	mov    %edx,0x4044(%eax)
  100b9e:	c7 80 2c 40 00 00 00 	movl   $0x0,0x402c(%eax)
  100ba5:	00 00 00 
  100ba8:	c7 80 3c 40 00 00 3b 	movl   $0x3b,0x403c(%eax)
  100baf:	00 00 00 
  100bb2:	c7 80 0c 40 00 00 43 	movl   $0x43,0x400c(%eax)
  100bb9:	00 00 00 
  100bbc:	c7 80 48 40 00 00 43 	movl   $0x43,0x4048(%eax)
  100bc3:	00 00 00 
  100bc6:	6a 43                	push   $0x43
  100bc8:	6a 43                	push   $0x43
  100bca:	6a 3b                	push   $0x3b
  100bcc:	68 9e 10 10 00       	push   $0x10109e
  100bd1:	e8 72 f6 ff ff       	call   100248 <Log>
  100bd6:	83 c4 10             	add    $0x10,%esp
  100bd9:	31 c0                	xor    %eax,%eax
  100bdb:	90                   	nop
  100bdc:	8a 88 00 00 20 00    	mov    0x200000(%eax),%cl
  100be2:	88 88 00 00 30 00    	mov    %cl,0x300000(%eax)
  100be8:	40                   	inc    %eax
  100be9:	3d 00 00 10 00       	cmp    $0x100000,%eax
  100bee:	75 ec                	jne    100bdc <sys_fork+0xe0>
  100bf0:	8b 45 08             	mov    0x8(%ebp),%eax
  100bf3:	89 58 2c             	mov    %ebx,0x2c(%eax)
  100bf6:	83 ec 08             	sub    $0x8,%esp
  100bf9:	53                   	push   %ebx
  100bfa:	68 a6 10 10 00       	push   $0x1010a6
  100bff:	e8 44 f6 ff ff       	call   100248 <Log>
  100c04:	83 c4 10             	add    $0x10,%esp
  100c07:	8d 65 f4             	lea    -0xc(%ebp),%esp
  100c0a:	5b                   	pop    %ebx
  100c0b:	5e                   	pop    %esi
  100c0c:	5f                   	pop    %edi
  100c0d:	5d                   	pop    %ebp
  100c0e:	c3                   	ret    
  100c0f:	31 db                	xor    %ebx,%ebx
  100c11:	31 c0                	xor    %eax,%eax
  100c13:	e9 36 ff ff ff       	jmp    100b4e <sys_fork+0x52>
  100c18:	75 f5                	jne    100c0f <sys_fork+0x113>
  100c1a:	31 c0                	xor    %eax,%eax
  100c1c:	e9 2b ff ff ff       	jmp    100b4c <sys_fork+0x50>
  100c21:	8d 76 00             	lea    0x0(%esi),%esi

00100c24 <sys_sleep>:
  100c24:	55                   	push   %ebp
  100c25:	89 e5                	mov    %esp,%ebp
  100c27:	53                   	push   %ebx
  100c28:	83 ec 0c             	sub    $0xc,%esp
  100c2b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100c2e:	a1 f4 21 10 00       	mov    0x1021f4,%eax
  100c33:	ff b0 58 40 00 00    	pushl  0x4058(%eax)
  100c39:	68 a6 10 10 00       	push   $0x1010a6
  100c3e:	e8 05 f6 ff ff       	call   100248 <Log>
  100c43:	8b 5b 2c             	mov    0x2c(%ebx),%ebx
  100c46:	58                   	pop    %eax
  100c47:	5a                   	pop    %edx
  100c48:	53                   	push   %ebx
  100c49:	68 a6 10 10 00       	push   $0x1010a6
  100c4e:	e8 f5 f5 ff ff       	call   100248 <Log>
  100c53:	a1 f4 21 10 00       	mov    0x1021f4,%eax
  100c58:	83 c4 10             	add    $0x10,%esp
  100c5b:	8b 88 58 40 00 00    	mov    0x4058(%eax),%ecx
  100c61:	85 c9                	test   %ecx,%ecx
  100c63:	75 07                	jne    100c6c <sys_sleep+0x48>
  100c65:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100c68:	c9                   	leave  
  100c69:	c3                   	ret    
  100c6a:	66 90                	xchg   %ax,%ax
  100c6c:	89 98 54 40 00 00    	mov    %ebx,0x4054(%eax)
  100c72:	c7 80 4c 40 00 00 02 	movl   $0x2,0x404c(%eax)
  100c79:	00 00 00 
  100c7c:	c7 80 50 40 00 00 0a 	movl   $0xa,0x4050(%eax)
  100c83:	00 00 00 
  100c86:	e8 5d fc ff ff       	call   1008e8 <schedule>
  100c8b:	c7 45 08 ec 10 10 00 	movl   $0x1010ec,0x8(%ebp)
  100c92:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100c95:	c9                   	leave  
  100c96:	e9 ad f5 ff ff       	jmp    100248 <Log>
  100c9b:	90                   	nop

00100c9c <sys_exit>:
  100c9c:	55                   	push   %ebp
  100c9d:	89 e5                	mov    %esp,%ebp
  100c9f:	a1 f4 21 10 00       	mov    0x1021f4,%eax
  100ca4:	8b 80 58 40 00 00    	mov    0x4058(%eax),%eax
  100caa:	85 c0                	test   %eax,%eax
  100cac:	75 02                	jne    100cb0 <sys_exit+0x14>
  100cae:	5d                   	pop    %ebp
  100caf:	c3                   	ret    
  100cb0:	5d                   	pop    %ebp
  100cb1:	e9 e6 fc ff ff       	jmp    10099c <sys_exit.part.1>
  100cb6:	66 90                	xchg   %ax,%ax

00100cb8 <sys_write>:
  100cb8:	55                   	push   %ebp
  100cb9:	89 e5                	mov    %esp,%ebp
  100cbb:	53                   	push   %ebx
  100cbc:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100cbf:	ff 73 24             	pushl  0x24(%ebx)
  100cc2:	ff 73 28             	pushl  0x28(%ebx)
  100cc5:	ff 73 20             	pushl  0x20(%ebx)
  100cc8:	e8 93 fd ff ff       	call   100a60 <fs_write>
  100ccd:	89 43 2c             	mov    %eax,0x2c(%ebx)
  100cd0:	83 c4 0c             	add    $0xc,%esp
  100cd3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100cd6:	c9                   	leave  
  100cd7:	c3                   	ret    

00100cd8 <syscallHandle>:
  100cd8:	55                   	push   %ebp
  100cd9:	89 e5                	mov    %esp,%ebp
  100cdb:	53                   	push   %ebx
  100cdc:	51                   	push   %ecx
  100cdd:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100ce0:	8b 43 2c             	mov    0x2c(%ebx),%eax
  100ce3:	83 f8 01             	cmp    $0x1,%eax
  100ce6:	74 4c                	je     100d34 <syscallHandle+0x5c>
  100ce8:	72 3e                	jb     100d28 <syscallHandle+0x50>
  100cea:	83 f8 02             	cmp    $0x2,%eax
  100ced:	74 21                	je     100d10 <syscallHandle+0x38>
  100cef:	83 f8 04             	cmp    $0x4,%eax
  100cf2:	75 15                	jne    100d09 <syscallHandle+0x31>
  100cf4:	50                   	push   %eax
  100cf5:	ff 73 24             	pushl  0x24(%ebx)
  100cf8:	ff 73 28             	pushl  0x28(%ebx)
  100cfb:	ff 73 20             	pushl  0x20(%ebx)
  100cfe:	e8 5d fd ff ff       	call   100a60 <fs_write>
  100d03:	89 43 2c             	mov    %eax,0x2c(%ebx)
  100d06:	83 c4 10             	add    $0x10,%esp
  100d09:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100d0c:	c9                   	leave  
  100d0d:	c3                   	ret    
  100d0e:	66 90                	xchg   %ax,%ax
  100d10:	a1 f4 21 10 00       	mov    0x1021f4,%eax
  100d15:	8b 90 58 40 00 00    	mov    0x4058(%eax),%edx
  100d1b:	85 d2                	test   %edx,%edx
  100d1d:	74 ea                	je     100d09 <syscallHandle+0x31>
  100d1f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100d22:	c9                   	leave  
  100d23:	e9 74 fc ff ff       	jmp    10099c <sys_exit.part.1>
  100d28:	89 5d 08             	mov    %ebx,0x8(%ebp)
  100d2b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100d2e:	c9                   	leave  
  100d2f:	e9 c8 fd ff ff       	jmp    100afc <sys_fork>
  100d34:	89 5d 08             	mov    %ebx,0x8(%ebp)
  100d37:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100d3a:	c9                   	leave  
  100d3b:	e9 e4 fe ff ff       	jmp    100c24 <sys_sleep>

00100d40 <GProtectFaultHandle>:
  100d40:	55                   	push   %ebp
  100d41:	89 e5                	mov    %esp,%ebp
  100d43:	83 ec 10             	sub    $0x10,%esp
  100d46:	68 fc 00 00 00       	push   $0xfc
  100d4b:	68 f6 10 10 00       	push   $0x1010f6
  100d50:	e8 4f 02 00 00       	call   100fa4 <abort>
  100d55:	83 c4 10             	add    $0x10,%esp
  100d58:	c9                   	leave  
  100d59:	c3                   	ret    
  100d5a:	66 90                	xchg   %ax,%ax

00100d5c <timeHandle>:
  100d5c:	55                   	push   %ebp
  100d5d:	89 e5                	mov    %esp,%ebp
  100d5f:	56                   	push   %esi
  100d60:	53                   	push   %ebx
  100d61:	83 ec 0c             	sub    $0xc,%esp
  100d64:	68 09 11 10 00       	push   $0x101109
  100d69:	e8 da f4 ff ff       	call   100248 <Log>
  100d6e:	ff 05 fc 21 10 00    	incl   0x1021fc
  100d74:	a1 f4 21 10 00       	mov    0x1021f4,%eax
  100d79:	83 c4 10             	add    $0x10,%esp
  100d7c:	8b 98 58 40 00 00    	mov    0x4058(%eax),%ebx
  100d82:	85 db                	test   %ebx,%ebx
  100d84:	0f 84 82 00 00 00    	je     100e0c <timeHandle+0xb0>
  100d8a:	ff 88 50 40 00 00    	decl   0x4050(%eax)
  100d90:	83 3d 00 20 10 00 01 	cmpl   $0x1,0x102000
  100d97:	7e 2c                	jle    100dc5 <timeHandle+0x69>
  100d99:	bb c0 22 10 00       	mov    $0x1022c0,%ebx
  100d9e:	be 01 00 00 00       	mov    $0x1,%esi
  100da3:	83 bb ac 80 00 00 02 	cmpl   $0x2,0x80ac(%ebx)
  100daa:	74 2c                	je     100dd8 <timeHandle+0x7c>
  100dac:	46                   	inc    %esi
  100dad:	81 c3 60 40 00 00    	add    $0x4060,%ebx
  100db3:	39 35 00 20 10 00    	cmp    %esi,0x102000
  100db9:	7f e8                	jg     100da3 <timeHandle+0x47>
  100dbb:	8b 90 58 40 00 00    	mov    0x4058(%eax),%edx
  100dc1:	85 d2                	test   %edx,%edx
  100dc3:	74 0a                	je     100dcf <timeHandle+0x73>
  100dc5:	8b 80 50 40 00 00    	mov    0x4050(%eax),%eax
  100dcb:	85 c0                	test   %eax,%eax
  100dcd:	74 4d                	je     100e1c <timeHandle+0xc0>
  100dcf:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100dd2:	5b                   	pop    %ebx
  100dd3:	5e                   	pop    %esi
  100dd4:	5d                   	pop    %ebp
  100dd5:	c3                   	ret    
  100dd6:	66 90                	xchg   %ax,%ax
  100dd8:	8b 8b b4 80 00 00    	mov    0x80b4(%ebx),%ecx
  100dde:	8d 51 ff             	lea    -0x1(%ecx),%edx
  100de1:	89 93 b4 80 00 00    	mov    %edx,0x80b4(%ebx)
  100de7:	85 d2                	test   %edx,%edx
  100de9:	75 c1                	jne    100dac <timeHandle+0x50>
  100deb:	c7 83 ac 80 00 00 00 	movl   $0x0,0x80ac(%ebx)
  100df2:	00 00 00 
  100df5:	8b 88 58 40 00 00    	mov    0x4058(%eax),%ecx
  100dfb:	85 c9                	test   %ecx,%ecx
  100dfd:	75 ad                	jne    100dac <timeHandle+0x50>
  100dff:	e8 e4 fa ff ff       	call   1008e8 <schedule>
  100e04:	a1 f4 21 10 00       	mov    0x1021f4,%eax
  100e09:	eb a1                	jmp    100dac <timeHandle+0x50>
  100e0b:	90                   	nop
  100e0c:	83 3d 00 20 10 00 01 	cmpl   $0x1,0x102000
  100e13:	7f 84                	jg     100d99 <timeHandle+0x3d>
  100e15:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100e18:	5b                   	pop    %ebx
  100e19:	5e                   	pop    %esi
  100e1a:	5d                   	pop    %ebp
  100e1b:	c3                   	ret    
  100e1c:	83 ec 0c             	sub    $0xc,%esp
  100e1f:	68 14 11 10 00       	push   $0x101114
  100e24:	e8 1f f4 ff ff       	call   100248 <Log>
  100e29:	a1 f4 21 10 00       	mov    0x1021f4,%eax
  100e2e:	c7 80 4c 40 00 00 00 	movl   $0x0,0x404c(%eax)
  100e35:	00 00 00 
  100e38:	c7 80 50 40 00 00 0a 	movl   $0xa,0x4050(%eax)
  100e3f:	00 00 00 
  100e42:	83 c4 10             	add    $0x10,%esp
  100e45:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100e48:	5b                   	pop    %ebx
  100e49:	5e                   	pop    %esi
  100e4a:	5d                   	pop    %ebp
  100e4b:	e9 98 fa ff ff       	jmp    1008e8 <schedule>

00100e50 <irqHandle>:
  100e50:	55                   	push   %ebp
  100e51:	89 e5                	mov    %esp,%ebp
  100e53:	83 ec 08             	sub    $0x8,%esp
  100e56:	8b 55 08             	mov    0x8(%ebp),%edx
  100e59:	b8 10 00 00 00       	mov    $0x10,%eax
  100e5e:	8e d8                	mov    %eax,%ds
  100e60:	8b 42 30             	mov    0x30(%edx),%eax
  100e63:	83 f8 20             	cmp    $0x20,%eax
  100e66:	74 50                	je     100eb8 <irqHandle+0x68>
  100e68:	76 32                	jbe    100e9c <irqHandle+0x4c>
  100e6a:	3d 80 00 00 00       	cmp    $0x80,%eax
  100e6f:	74 07                	je     100e78 <irqHandle+0x28>
  100e71:	40                   	inc    %eax
  100e72:	75 10                	jne    100e84 <irqHandle+0x34>
  100e74:	c9                   	leave  
  100e75:	c3                   	ret    
  100e76:	66 90                	xchg   %ax,%ax
  100e78:	89 55 08             	mov    %edx,0x8(%ebp)
  100e7b:	c9                   	leave  
  100e7c:	e9 57 fe ff ff       	jmp    100cd8 <syscallHandle>
  100e81:	8d 76 00             	lea    0x0(%esi),%esi
  100e84:	83 ec 08             	sub    $0x8,%esp
  100e87:	68 ed 00 00 00       	push   $0xed
  100e8c:	68 f6 10 10 00       	push   $0x1010f6
  100e91:	e8 0e 01 00 00       	call   100fa4 <abort>
  100e96:	83 c4 10             	add    $0x10,%esp
  100e99:	c9                   	leave  
  100e9a:	c3                   	ret    
  100e9b:	90                   	nop
  100e9c:	83 f8 0d             	cmp    $0xd,%eax
  100e9f:	75 e3                	jne    100e84 <irqHandle+0x34>
  100ea1:	83 ec 08             	sub    $0x8,%esp
  100ea4:	68 fc 00 00 00       	push   $0xfc
  100ea9:	68 f6 10 10 00       	push   $0x1010f6
  100eae:	e8 f1 00 00 00       	call   100fa4 <abort>
  100eb3:	83 c4 10             	add    $0x10,%esp
  100eb6:	c9                   	leave  
  100eb7:	c3                   	ret    
  100eb8:	89 55 08             	mov    %edx,0x8(%ebp)
  100ebb:	c9                   	leave  
  100ebc:	e9 9b fe ff ff       	jmp    100d5c <timeHandle>
  100ec1:	66 90                	xchg   %ax,%ax
  100ec3:	90                   	nop

00100ec4 <initIdt>:
  100ec4:	55                   	push   %ebp
  100ec5:	89 e5                	mov    %esp,%ebp
  100ec7:	53                   	push   %ebx
  100ec8:	ba 3b 10 10 00       	mov    $0x10103b,%edx
  100ecd:	89 d3                	mov    %edx,%ebx
  100ecf:	c1 ea 10             	shr    $0x10,%edx
  100ed2:	b9 c0 2c 11 00       	mov    $0x112cc0,%ecx
  100ed7:	b8 c0 24 11 00       	mov    $0x1124c0,%eax
  100edc:	66 89 18             	mov    %bx,(%eax)
  100edf:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  100ee5:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  100ee9:	c6 40 05 8f          	movb   $0x8f,0x5(%eax)
  100eed:	66 89 50 06          	mov    %dx,0x6(%eax)
  100ef1:	83 c0 08             	add    $0x8,%eax
  100ef4:	39 c1                	cmp    %eax,%ecx
  100ef6:	75 e4                	jne    100edc <initIdt+0x18>
  100ef8:	b8 41 10 10 00       	mov    $0x101041,%eax
  100efd:	66 a3 28 25 11 00    	mov    %ax,0x112528
  100f03:	66 c7 05 2a 25 11 00 	movw   $0x8,0x11252a
  100f0a:	08 00 
  100f0c:	c6 05 2c 25 11 00 00 	movb   $0x0,0x11252c
  100f13:	c6 05 2d 25 11 00 8f 	movb   $0x8f,0x11252d
  100f1a:	c1 e8 10             	shr    $0x10,%eax
  100f1d:	66 a3 2e 25 11 00    	mov    %ax,0x11252e
  100f23:	b8 45 10 10 00       	mov    $0x101045,%eax
  100f28:	66 a3 c0 25 11 00    	mov    %ax,0x1125c0
  100f2e:	66 c7 05 c2 25 11 00 	movw   $0x8,0x1125c2
  100f35:	08 00 
  100f37:	c6 05 c4 25 11 00 00 	movb   $0x0,0x1125c4
  100f3e:	c6 05 c5 25 11 00 ee 	movb   $0xee,0x1125c5
  100f45:	c1 e8 10             	shr    $0x10,%eax
  100f48:	66 a3 c6 25 11 00    	mov    %ax,0x1125c6
  100f4e:	b8 4b 10 10 00       	mov    $0x10104b,%eax
  100f53:	66 a3 c0 28 11 00    	mov    %ax,0x1128c0
  100f59:	66 c7 05 c2 28 11 00 	movw   $0x8,0x1128c2
  100f60:	08 00 
  100f62:	c6 05 c4 28 11 00 00 	movb   $0x0,0x1128c4
  100f69:	c6 05 c5 28 11 00 ee 	movb   $0xee,0x1128c5
  100f70:	c1 e8 10             	shr    $0x10,%eax
  100f73:	66 a3 c6 28 11 00    	mov    %ax,0x1128c6
  100f79:	66 c7 05 04 22 10 00 	movw   $0x7ff,0x102204
  100f80:	ff 07 
  100f82:	b8 c0 24 11 00       	mov    $0x1124c0,%eax
  100f87:	66 a3 06 22 10 00    	mov    %ax,0x102206
  100f8d:	c1 e8 10             	shr    $0x10,%eax
  100f90:	66 a3 08 22 10 00    	mov    %ax,0x102208
  100f96:	b8 04 22 10 00       	mov    $0x102204,%eax
  100f9b:	0f 01 18             	lidtl  (%eax)
  100f9e:	5b                   	pop    %ebx
  100f9f:	5d                   	pop    %ebp
  100fa0:	c3                   	ret    
  100fa1:	66 90                	xchg   %ax,%ax
  100fa3:	90                   	nop

00100fa4 <abort>:
  100fa4:	55                   	push   %ebp
  100fa5:	89 e5                	mov    %esp,%ebp
  100fa7:	57                   	push   %edi
  100fa8:	56                   	push   %esi
  100fa9:	53                   	push   %ebx
  100faa:	83 ec 1c             	sub    $0x1c,%esp
  100fad:	8b 55 08             	mov    0x8(%ebp),%edx
  100fb0:	fa                   	cli    
  100fb1:	8a 02                	mov    (%edx),%al
  100fb3:	b9 32 20 10 00       	mov    $0x102032,%ecx
  100fb8:	84 c0                	test   %al,%al
  100fba:	74 0b                	je     100fc7 <abort+0x23>
  100fbc:	41                   	inc    %ecx
  100fbd:	42                   	inc    %edx
  100fbe:	88 41 ff             	mov    %al,-0x1(%ecx)
  100fc1:	8a 02                	mov    (%edx),%al
  100fc3:	84 c0                	test   %al,%al
  100fc5:	75 f5                	jne    100fbc <abort+0x18>
  100fc7:	c6 01 3a             	movb   $0x3a,(%ecx)
  100fca:	bb 29 22 10 00       	mov    $0x102229,%ebx
  100fcf:	be 0a 00 00 00       	mov    $0xa,%esi
  100fd4:	bf 67 66 66 66       	mov    $0x66666667,%edi
  100fd9:	4b                   	dec    %ebx
  100fda:	8b 45 0c             	mov    0xc(%ebp),%eax
  100fdd:	99                   	cltd   
  100fde:	f7 fe                	idiv   %esi
  100fe0:	8d 42 30             	lea    0x30(%edx),%eax
  100fe3:	88 45 e7             	mov    %al,-0x19(%ebp)
  100fe6:	88 03                	mov    %al,(%ebx)
  100fe8:	89 f8                	mov    %edi,%eax
  100fea:	f7 6d 0c             	imull  0xc(%ebp)
  100fed:	c1 fa 02             	sar    $0x2,%edx
  100ff0:	8b 45 0c             	mov    0xc(%ebp),%eax
  100ff3:	c1 f8 1f             	sar    $0x1f,%eax
  100ff6:	29 c2                	sub    %eax,%edx
  100ff8:	89 55 0c             	mov    %edx,0xc(%ebp)
  100ffb:	75 dc                	jne    100fd9 <abort+0x35>
  100ffd:	41                   	inc    %ecx
  100ffe:	41                   	inc    %ecx
  100fff:	43                   	inc    %ebx
  101000:	8a 45 e7             	mov    -0x19(%ebp),%al
  101003:	88 41 ff             	mov    %al,-0x1(%ecx)
  101006:	8a 03                	mov    (%ebx),%al
  101008:	88 45 e7             	mov    %al,-0x19(%ebp)
  10100b:	84 c0                	test   %al,%al
  10100d:	75 ef                	jne    100ffe <abort+0x5a>
  10100f:	c6 01 0a             	movb   $0xa,(%ecx)
  101012:	0f be 05 20 20 10 00 	movsbl 0x102020,%eax
  101019:	84 c0                	test   %al,%al
  10101b:	74 1b                	je     101038 <abort+0x94>
  10101d:	bb 20 20 10 00       	mov    $0x102020,%ebx
  101022:	83 ec 0c             	sub    $0xc,%esp
  101025:	50                   	push   %eax
  101026:	e8 41 f0 ff ff       	call   10006c <putChar>
  10102b:	43                   	inc    %ebx
  10102c:	0f be 03             	movsbl (%ebx),%eax
  10102f:	83 c4 10             	add    $0x10,%esp
  101032:	84 c0                	test   %al,%al
  101034:	75 ec                	jne    101022 <abort+0x7e>
  101036:	66 90                	xchg   %ax,%ax
  101038:	f4                   	hlt    
  101039:	eb fd                	jmp    101038 <abort+0x94>

0010103b <irqEmpty>:
  10103b:	6a 00                	push   $0x0
  10103d:	6a ff                	push   $0xffffffff
  10103f:	eb 13                	jmp    101054 <asmDoIrq>

00101041 <irqGProtectFault>:
  101041:	6a 0d                	push   $0xd
  101043:	eb 0f                	jmp    101054 <asmDoIrq>

00101045 <irqTimeSyscall>:
  101045:	6a 00                	push   $0x0
  101047:	6a 20                	push   $0x20
  101049:	eb 09                	jmp    101054 <asmDoIrq>

0010104b <irqSyscall>:
  10104b:	6a 00                	push   $0x0
  10104d:	68 80 00 00 00       	push   $0x80
  101052:	eb 00                	jmp    101054 <asmDoIrq>

00101054 <asmDoIrq>:
  101054:	60                   	pusha  
  101055:	1e                   	push   %ds
  101056:	06                   	push   %es
  101057:	0f a0                	push   %fs
  101059:	0f a8                	push   %gs
  10105b:	54                   	push   %esp
  10105c:	e8 ef fd ff ff       	call   100e50 <irqHandle>
  101061:	83 c4 04             	add    $0x4,%esp
  101064:	0f a9                	pop    %gs
  101066:	0f a1                	pop    %fs
  101068:	07                   	pop    %es
  101069:	1f                   	pop    %ds
  10106a:	61                   	popa   
  10106b:	83 c4 04             	add    $0x4,%esp
  10106e:	83 c4 04             	add    $0x4,%esp
  101071:	cf                   	iret   
