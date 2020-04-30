
kMain.elf:     file format elf32-i386


Disassembly of section .text:

00100000 <kEntry>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 08             	sub    $0x8,%esp
  100006:	e8 21 00 00 00       	call   10002c <initSerial>
  10000b:	e8 88 0e 00 00       	call   100e98 <initIdt>
  100010:	e8 8b 00 00 00       	call   1000a0 <initIntr>
  100015:	e8 22 04 00 00       	call   10043c <initSeg>
  10001a:	e8 69 00 00 00       	call   100088 <initTimer>
  10001f:	e8 ac 09 00 00       	call   1009d0 <initProcess>
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
  1001bb:	b9 48 10 10 00       	mov    $0x101048,%ecx
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
  1004fc:	a1 54 10 10 00       	mov    0x101054,%eax
  100501:	8b 15 58 10 10 00    	mov    0x101058,%edx
  100507:	a3 78 24 11 00       	mov    %eax,0x112478
  10050c:	89 15 7c 24 11 00    	mov    %edx,0x11247c
  100512:	a1 5c 10 10 00       	mov    0x10105c,%eax
  100517:	8b 15 60 10 10 00    	mov    0x101060,%edx
  10051d:	a3 80 24 11 00       	mov    %eax,0x112480
  100522:	89 15 84 24 11 00    	mov    %edx,0x112484
  100528:	a1 64 10 10 00       	mov    0x101064,%eax
  10052d:	8b 15 68 10 10 00    	mov    0x101068,%edx
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
  1005d8:	ba 00 00 2f 00       	mov    $0x2f0000,%edx
  1005dd:	52                   	push   %edx
  1005de:	9c                   	pushf  
  1005df:	ba 1b 00 00 00       	mov    $0x1b,%edx
  1005e4:	52                   	push   %edx
  1005e5:	50                   	push   %eax
  1005e6:	a3 58 a3 10 00       	mov    %eax,0x10a358
  1005eb:	c7 05 6c a3 10 00 01 	movl   $0x1,0x10a36c
  1005f2:	00 00 00 
  1005f5:	c7 05 64 a3 10 00 00 	movl   $0x2f0000,0x10a364
  1005fc:	00 2f 00 
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
  1006a0:	b9 00 00 2f 00       	mov    $0x2f0000,%ecx
  1006a5:	51                   	push   %ecx
  1006a6:	9c                   	pushf  
  1006a7:	b9 1b 00 00 00       	mov    $0x1b,%ecx
  1006ac:	51                   	push   %ecx
  1006ad:	50                   	push   %eax
  1006ae:	a3 58 a3 10 00       	mov    %eax,0x10a358
  1006b3:	c7 05 6c a3 10 00 01 	movl   $0x1,0x10a36c
  1006ba:	00 00 00 
  1006bd:	c7 05 64 a3 10 00 00 	movl   $0x2f0000,0x10a364
  1006c4:	00 2f 00 
  1006c7:	8e da                	mov    %edx,%ds
  1006c9:	cf                   	iret   
  1006ca:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1006cd:	5b                   	pop    %ebx
  1006ce:	5e                   	pop    %esi
  1006cf:	5f                   	pop    %edi
  1006d0:	5d                   	pop    %ebp
  1006d1:	ff e0                	jmp    *%eax
  1006d3:	90                   	nop

001006d4 <cpu_idle>:
  1006d4:	55                   	push   %ebp
  1006d5:	89 e5                	mov    %esp,%ebp
  1006d7:	fb                   	sti    
  1006d8:	f4                   	hlt    
  1006d9:	eb fd                	jmp    1006d8 <cpu_idle+0x4>
  1006db:	90                   	nop

001006dc <kernel_thread>:
  1006dc:	55                   	push   %ebp
  1006dd:	89 e5                	mov    %esp,%ebp
  1006df:	83 ec 08             	sub    $0x8,%esp
  1006e2:	c7 05 fc 62 10 00 08 	movl   $0x8,0x1062fc
  1006e9:	00 00 00 
  1006ec:	c7 05 08 63 10 00 10 	movl   $0x10,0x106308
  1006f3:	00 00 00 
  1006f6:	c7 05 c4 62 10 00 10 	movl   $0x10,0x1062c4
  1006fd:	00 00 00 
  100700:	c7 05 c8 62 10 00 10 	movl   $0x10,0x1062c8
  100707:	00 00 00 
  10070a:	c7 05 cc 62 10 00 10 	movl   $0x10,0x1062cc
  100711:	00 00 00 
  100714:	c7 05 c0 62 10 00 33 	movl   $0x33,0x1062c0
  10071b:	00 00 00 
  10071e:	6a 10                	push   $0x10
  100720:	6a 10                	push   $0x10
  100722:	6a 08                	push   $0x8
  100724:	68 6c 10 10 00       	push   $0x10106c
  100729:	e8 1a fb ff ff       	call   100248 <Log>
  10072e:	c7 05 f8 62 10 00 d4 	movl   $0x1006d4,0x1062f8
  100735:	06 10 00 
  100738:	c7 05 1c 63 10 00 0c 	movl   $0x10630c,0x10631c
  10073f:	63 10 00 
  100742:	c7 05 0c 63 10 00 00 	movl   $0x0,0x10630c
  100749:	00 00 00 
  10074c:	c7 05 10 63 10 00 0a 	movl   $0xa,0x106310
  100753:	00 00 00 
  100756:	c7 05 14 63 10 00 00 	movl   $0x0,0x106314
  10075d:	00 00 00 
  100760:	c7 05 18 63 10 00 00 	movl   $0x0,0x106318
  100767:	00 00 00 
  10076a:	c7 05 f8 21 10 00 c0 	movl   $0x1022c0,0x1021f8
  100771:	22 10 00 
  100774:	83 c4 10             	add    $0x10,%esp
  100777:	c9                   	leave  
  100778:	c3                   	ret    
  100779:	8d 76 00             	lea    0x0(%esi),%esi

0010077c <user_process>:
  10077c:	55                   	push   %ebp
  10077d:	89 e5                	mov    %esp,%ebp
  10077f:	83 ec 08             	sub    $0x8,%esp
  100782:	c7 05 5c a3 10 00 1b 	movl   $0x1b,0x10a35c
  100789:	00 00 00 
  10078c:	c7 05 68 a3 10 00 23 	movl   $0x23,0x10a368
  100793:	00 00 00 
  100796:	c7 05 24 a3 10 00 23 	movl   $0x23,0x10a324
  10079d:	00 00 00 
  1007a0:	c7 05 28 a3 10 00 23 	movl   $0x23,0x10a328
  1007a7:	00 00 00 
  1007aa:	c7 05 2c a3 10 00 23 	movl   $0x23,0x10a32c
  1007b1:	00 00 00 
  1007b4:	c7 05 20 a3 10 00 33 	movl   $0x33,0x10a320
  1007bb:	00 00 00 
  1007be:	6a 23                	push   $0x23
  1007c0:	6a 23                	push   $0x23
  1007c2:	6a 1b                	push   $0x1b
  1007c4:	68 6c 10 10 00       	push   $0x10106c
  1007c9:	e8 7a fa ff ff       	call   100248 <Log>
  1007ce:	c7 05 6c a3 10 00 00 	movl   $0x0,0x10a36c
  1007d5:	00 00 00 
  1007d8:	c7 05 7c a3 10 00 6c 	movl   $0x10a36c,0x10a37c
  1007df:	a3 10 00 
  1007e2:	c7 05 70 a3 10 00 0a 	movl   $0xa,0x10a370
  1007e9:	00 00 00 
  1007ec:	c7 05 74 a3 10 00 00 	movl   $0x0,0x10a374
  1007f3:	00 00 00 
  1007f6:	c7 05 78 a3 10 00 01 	movl   $0x1,0x10a378
  1007fd:	00 00 00 
  100800:	ff 05 00 20 10 00    	incl   0x102000
  100806:	83 c4 10             	add    $0x10,%esp
  100809:	c9                   	leave  
  10080a:	c3                   	ret    
  10080b:	90                   	nop

0010080c <proc_run>:
  10080c:	55                   	push   %ebp
  10080d:	89 e5                	mov    %esp,%ebp
  10080f:	83 ec 0c             	sub    $0xc,%esp
  100812:	8b 45 08             	mov    0x8(%ebp),%eax
  100815:	c7 05 fc 62 10 00 08 	movl   $0x8,0x1062fc
  10081c:	00 00 00 
  10081f:	c7 05 08 63 10 00 10 	movl   $0x10,0x106308
  100826:	00 00 00 
  100829:	c7 05 c4 62 10 00 10 	movl   $0x10,0x1062c4
  100830:	00 00 00 
  100833:	c7 05 c8 62 10 00 10 	movl   $0x10,0x1062c8
  10083a:	00 00 00 
  10083d:	c7 05 cc 62 10 00 10 	movl   $0x10,0x1062cc
  100844:	00 00 00 
  100847:	c7 05 c0 62 10 00 33 	movl   $0x33,0x1062c0
  10084e:	00 00 00 
  100851:	c7 05 f8 62 10 00 d4 	movl   $0x1006d4,0x1062f8
  100858:	06 10 00 
  10085b:	c7 05 1c 63 10 00 0c 	movl   $0x10630c,0x10631c
  100862:	63 10 00 
  100865:	c7 05 0c 63 10 00 00 	movl   $0x0,0x10630c
  10086c:	00 00 00 
  10086f:	c7 05 10 63 10 00 0a 	movl   $0xa,0x106310
  100876:	00 00 00 
  100879:	c7 05 14 63 10 00 00 	movl   $0x0,0x106314
  100880:	00 00 00 
  100883:	c7 05 18 63 10 00 00 	movl   $0x0,0x106318
  10088a:	00 00 00 
  10088d:	a3 f4 21 10 00       	mov    %eax,0x1021f4
  100892:	ff b0 38 40 00 00    	pushl  0x4038(%eax)
  100898:	2d c0 22 10 00       	sub    $0x1022c0,%eax
  10089d:	c1 f8 05             	sar    $0x5,%eax
  1008a0:	8d 14 00             	lea    (%eax,%eax,1),%edx
  1008a3:	01 c2                	add    %eax,%edx
  1008a5:	8d 14 92             	lea    (%edx,%edx,4),%edx
  1008a8:	8d 14 d0             	lea    (%eax,%edx,8),%edx
  1008ab:	8d 0c 90             	lea    (%eax,%edx,4),%ecx
  1008ae:	8d 14 cd 00 00 00 00 	lea    0x0(,%ecx,8),%edx
  1008b5:	29 ca                	sub    %ecx,%edx
  1008b7:	8d 14 d0             	lea    (%eax,%edx,8),%edx
  1008ba:	01 d2                	add    %edx,%edx
  1008bc:	01 c2                	add    %eax,%edx
  1008be:	8d 14 90             	lea    (%eax,%edx,4),%edx
  1008c1:	8d 14 d2             	lea    (%edx,%edx,8),%edx
  1008c4:	8d 14 90             	lea    (%eax,%edx,4),%edx
  1008c7:	89 d0                	mov    %edx,%eax
  1008c9:	c1 e0 07             	shl    $0x7,%eax
  1008cc:	01 d0                	add    %edx,%eax
  1008ce:	f7 d8                	neg    %eax
  1008d0:	50                   	push   %eax
  1008d1:	68 78 10 10 00       	push   $0x101078
  1008d6:	e8 6d f9 ff ff       	call   100248 <Log>
  1008db:	a1 f4 21 10 00       	mov    0x1021f4,%eax
  1008e0:	c7 80 54 40 00 00 00 	movl   $0x0,0x4054(%eax)
  1008e7:	00 00 00 
  1008ea:	c7 80 50 40 00 00 0a 	movl   $0xa,0x4050(%eax)
  1008f1:	00 00 00 
  1008f4:	c7 80 4c 40 00 00 01 	movl   $0x1,0x404c(%eax)
  1008fb:	00 00 00 
  1008fe:	c7 05 48 22 10 00 10 	movl   $0x10,0x102248
  100905:	00 00 00 
  100908:	8d 90 4c 40 00 00    	lea    0x404c(%eax),%edx
  10090e:	89 15 44 22 10 00    	mov    %edx,0x102244
  100914:	05 00 40 00 00       	add    $0x4000,%eax
  100919:	89 c4                	mov    %eax,%esp
  10091b:	0f a9                	pop    %gs
  10091d:	0f a1                	pop    %fs
  10091f:	07                   	pop    %es
  100920:	1f                   	pop    %ds
  100921:	61                   	popa   
  100922:	83 c4 08             	add    $0x8,%esp
  100925:	cf                   	iret   
  100926:	83 c4 10             	add    $0x10,%esp
  100929:	c9                   	leave  
  10092a:	c3                   	ret    
  10092b:	90                   	nop

0010092c <schedule>:
  10092c:	55                   	push   %ebp
  10092d:	89 e5                	mov    %esp,%ebp
  10092f:	56                   	push   %esi
  100930:	53                   	push   %ebx
  100931:	8b 15 00 20 10 00    	mov    0x102000,%edx
  100937:	83 fa 01             	cmp    $0x1,%edx
  10093a:	0f 8e 88 00 00 00    	jle    1009c8 <schedule+0x9c>
  100940:	8b 35 f4 21 10 00    	mov    0x1021f4,%esi
  100946:	b8 c0 22 10 00       	mov    $0x1022c0,%eax
  10094b:	bb 01 00 00 00       	mov    $0x1,%ebx
  100950:	8b 88 ac 80 00 00    	mov    0x80ac(%eax),%ecx
  100956:	85 c9                	test   %ecx,%ecx
  100958:	75 0e                	jne    100968 <schedule+0x3c>
  10095a:	8b 8e 58 40 00 00    	mov    0x4058(%esi),%ecx
  100960:	39 88 b8 80 00 00    	cmp    %ecx,0x80b8(%eax)
  100966:	75 24                	jne    10098c <schedule+0x60>
  100968:	43                   	inc    %ebx
  100969:	05 60 40 00 00       	add    $0x4060,%eax
  10096e:	39 d3                	cmp    %edx,%ebx
  100970:	75 de                	jne    100950 <schedule+0x24>
  100972:	83 ec 0c             	sub    $0xc,%esp
  100975:	ff 35 f8 21 10 00    	pushl  0x1021f8
  10097b:	e8 8c fe ff ff       	call   10080c <proc_run>
  100980:	83 c4 10             	add    $0x10,%esp
  100983:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100986:	5b                   	pop    %ebx
  100987:	5e                   	pop    %esi
  100988:	5d                   	pop    %ebp
  100989:	c3                   	ret    
  10098a:	66 90                	xchg   %ax,%ax
  10098c:	50                   	push   %eax
  10098d:	51                   	push   %ecx
  10098e:	53                   	push   %ebx
  10098f:	68 84 10 10 00       	push   $0x101084
  100994:	e8 af f8 ff ff       	call   100248 <Log>
  100999:	89 d8                	mov    %ebx,%eax
  10099b:	c1 e0 08             	shl    $0x8,%eax
  10099e:	01 d8                	add    %ebx,%eax
  1009a0:	01 c0                	add    %eax,%eax
  1009a2:	01 d8                	add    %ebx,%eax
  1009a4:	c1 e0 05             	shl    $0x5,%eax
  1009a7:	05 c0 22 10 00       	add    $0x1022c0,%eax
  1009ac:	89 04 24             	mov    %eax,(%esp)
  1009af:	e8 58 fe ff ff       	call   10080c <proc_run>
  1009b4:	8b 15 00 20 10 00    	mov    0x102000,%edx
  1009ba:	83 c4 10             	add    $0x10,%esp
  1009bd:	39 da                	cmp    %ebx,%edx
  1009bf:	74 b1                	je     100972 <schedule+0x46>
  1009c1:	8d 65 f8             	lea    -0x8(%ebp),%esp
  1009c4:	5b                   	pop    %ebx
  1009c5:	5e                   	pop    %esi
  1009c6:	5d                   	pop    %ebp
  1009c7:	c3                   	ret    
  1009c8:	bb 01 00 00 00       	mov    $0x1,%ebx
  1009cd:	eb ee                	jmp    1009bd <schedule+0x91>
  1009cf:	90                   	nop

001009d0 <initProcess>:
  1009d0:	55                   	push   %ebp
  1009d1:	89 e5                	mov    %esp,%ebp
  1009d3:	83 ec 08             	sub    $0x8,%esp
  1009d6:	c7 05 00 20 10 00 01 	movl   $0x1,0x102000
  1009dd:	00 00 00 
  1009e0:	c7 05 f4 21 10 00 00 	movl   $0x0,0x1021f4
  1009e7:	00 00 00 
  1009ea:	c7 05 f8 21 10 00 00 	movl   $0x0,0x1021f8
  1009f1:	00 00 00 
  1009f4:	fb                   	sti    
  1009f5:	e8 e2 fc ff ff       	call   1006dc <kernel_thread>
  1009fa:	e8 7d fd ff ff       	call   10077c <user_process>
  1009ff:	c7 05 f4 21 10 00 20 	movl   $0x106320,0x1021f4
  100a06:	63 10 00 
  100a09:	c9                   	leave  
  100a0a:	c3                   	ret    
  100a0b:	90                   	nop

00100a0c <printch>:
  100a0c:	55                   	push   %ebp
  100a0d:	89 e5                	mov    %esp,%ebp
  100a0f:	83 ec 10             	sub    $0x10,%esp
  100a12:	0f be 45 08          	movsbl 0x8(%ebp),%eax
  100a16:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100a19:	a1 04 20 10 00       	mov    0x102004,%eax
  100a1e:	8d 04 80             	lea    (%eax,%eax,4),%eax
  100a21:	c1 e0 04             	shl    $0x4,%eax
  100a24:	03 05 00 22 10 00    	add    0x102200,%eax
  100a2a:	01 c0                	add    %eax,%eax
  100a2c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  100a2f:	c7 45 fc 0c 00 00 00 	movl   $0xc,-0x4(%ebp)
  100a36:	60                   	pusha  
  100a37:	8b 7d f8             	mov    -0x8(%ebp),%edi
  100a3a:	8a 65 fc             	mov    -0x4(%ebp),%ah
  100a3d:	8a 45 f4             	mov    -0xc(%ebp),%al
  100a40:	65 66 89 07          	mov    %ax,%gs:(%edi)
  100a44:	61                   	popa   
  100a45:	c9                   	leave  
  100a46:	c3                   	ret    
  100a47:	90                   	nop

00100a48 <fs_write>:
  100a48:	55                   	push   %ebp
  100a49:	89 e5                	mov    %esp,%ebp
  100a4b:	57                   	push   %edi
  100a4c:	56                   	push   %esi
  100a4d:	53                   	push   %ebx
  100a4e:	83 ec 10             	sub    $0x10,%esp
  100a51:	8b 45 10             	mov    0x10(%ebp),%eax
  100a54:	85 c0                	test   %eax,%eax
  100a56:	7e 6d                	jle    100ac5 <fs_write+0x7d>
  100a58:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  100a5b:	8b 75 10             	mov    0x10(%ebp),%esi
  100a5e:	01 ce                	add    %ecx,%esi
  100a60:	bf 50 00 00 00       	mov    $0x50,%edi
  100a65:	eb 16                	jmp    100a7d <fs_write+0x35>
  100a67:	90                   	nop
  100a68:	99                   	cltd   
  100a69:	f7 ff                	idiv   %edi
  100a6b:	89 15 00 22 10 00    	mov    %edx,0x102200
  100a71:	43                   	inc    %ebx
  100a72:	89 1d 04 20 10 00    	mov    %ebx,0x102004
  100a78:	41                   	inc    %ecx
  100a79:	39 f1                	cmp    %esi,%ecx
  100a7b:	74 48                	je     100ac5 <fs_write+0x7d>
  100a7d:	0f be 01             	movsbl (%ecx),%eax
  100a80:	3c 0a                	cmp    $0xa,%al
  100a82:	74 4c                	je     100ad0 <fs_write+0x88>
  100a84:	89 45 e8             	mov    %eax,-0x18(%ebp)
  100a87:	8b 1d 04 20 10 00    	mov    0x102004,%ebx
  100a8d:	a1 00 22 10 00       	mov    0x102200,%eax
  100a92:	8d 14 9b             	lea    (%ebx,%ebx,4),%edx
  100a95:	c1 e2 04             	shl    $0x4,%edx
  100a98:	01 c2                	add    %eax,%edx
  100a9a:	01 d2                	add    %edx,%edx
  100a9c:	89 55 ec             	mov    %edx,-0x14(%ebp)
  100a9f:	c7 45 f0 0c 00 00 00 	movl   $0xc,-0x10(%ebp)
  100aa6:	60                   	pusha  
  100aa7:	8b 7d ec             	mov    -0x14(%ebp),%edi
  100aaa:	8a 65 f0             	mov    -0x10(%ebp),%ah
  100aad:	8a 45 e8             	mov    -0x18(%ebp),%al
  100ab0:	65 66 89 07          	mov    %ax,%gs:(%edi)
  100ab4:	61                   	popa   
  100ab5:	83 f8 4f             	cmp    $0x4f,%eax
  100ab8:	7f ae                	jg     100a68 <fs_write+0x20>
  100aba:	40                   	inc    %eax
  100abb:	a3 00 22 10 00       	mov    %eax,0x102200
  100ac0:	41                   	inc    %ecx
  100ac1:	39 f1                	cmp    %esi,%ecx
  100ac3:	75 b8                	jne    100a7d <fs_write+0x35>
  100ac5:	8b 45 10             	mov    0x10(%ebp),%eax
  100ac8:	83 c4 10             	add    $0x10,%esp
  100acb:	5b                   	pop    %ebx
  100acc:	5e                   	pop    %esi
  100acd:	5f                   	pop    %edi
  100ace:	5d                   	pop    %ebp
  100acf:	c3                   	ret    
  100ad0:	ff 05 04 20 10 00    	incl   0x102004
  100ad6:	c7 05 00 22 10 00 00 	movl   $0x0,0x102200
  100add:	00 00 00 
  100ae0:	eb 96                	jmp    100a78 <fs_write+0x30>
  100ae2:	66 90                	xchg   %ax,%ax

00100ae4 <sys_fork>:
  100ae4:	55                   	push   %ebp
  100ae5:	89 e5                	mov    %esp,%ebp
  100ae7:	56                   	push   %esi
  100ae8:	53                   	push   %ebx
  100ae9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100aec:	8b 0d 00 20 10 00    	mov    0x102000,%ecx
  100af2:	83 f9 00             	cmp    $0x0,%ecx
  100af5:	0f 8e 5c 01 00 00    	jle    100c57 <sys_fork+0x173>
  100afb:	83 3d 0c 63 10 00 03 	cmpl   $0x3,0x10630c
  100b02:	0f 84 46 01 00 00    	je     100c4e <sys_fork+0x16a>
  100b08:	ba c0 22 10 00       	mov    $0x1022c0,%edx
  100b0d:	31 c0                	xor    %eax,%eax
  100b0f:	eb 12                	jmp    100b23 <sys_fork+0x3f>
  100b11:	8d 76 00             	lea    0x0(%esi),%esi
  100b14:	81 c2 60 40 00 00    	add    $0x4060,%edx
  100b1a:	83 ba 4c 40 00 00 03 	cmpl   $0x3,0x404c(%edx)
  100b21:	74 05                	je     100b28 <sys_fork+0x44>
  100b23:	40                   	inc    %eax
  100b24:	39 c8                	cmp    %ecx,%eax
  100b26:	75 ec                	jne    100b14 <sys_fork+0x30>
  100b28:	89 c6                	mov    %eax,%esi
  100b2a:	41                   	inc    %ecx
  100b2b:	89 0d 00 20 10 00    	mov    %ecx,0x102000
  100b31:	89 c2                	mov    %eax,%edx
  100b33:	c1 e2 08             	shl    $0x8,%edx
  100b36:	01 c2                	add    %eax,%edx
  100b38:	01 d2                	add    %edx,%edx
  100b3a:	01 d0                	add    %edx,%eax
  100b3c:	c1 e0 05             	shl    $0x5,%eax
  100b3f:	05 c0 22 10 00       	add    $0x1022c0,%eax
  100b44:	89 b0 58 40 00 00    	mov    %esi,0x4058(%eax)
  100b4a:	c7 80 4c 40 00 00 00 	movl   $0x0,0x404c(%eax)
  100b51:	00 00 00 
  100b54:	c7 80 50 40 00 00 0a 	movl   $0xa,0x4050(%eax)
  100b5b:	00 00 00 
  100b5e:	c7 80 54 40 00 00 00 	movl   $0x0,0x4054(%eax)
  100b65:	00 00 00 
  100b68:	8b 53 44             	mov    0x44(%ebx),%edx
  100b6b:	89 90 44 40 00 00    	mov    %edx,0x4044(%eax)
  100b71:	c7 80 2c 40 00 00 00 	movl   $0x0,0x402c(%eax)
  100b78:	00 00 00 
  100b7b:	8b 53 20             	mov    0x20(%ebx),%edx
  100b7e:	89 90 20 40 00 00    	mov    %edx,0x4020(%eax)
  100b84:	8b 53 38             	mov    0x38(%ebx),%edx
  100b87:	89 90 38 40 00 00    	mov    %edx,0x4038(%eax)
  100b8d:	8b 53 40             	mov    0x40(%ebx),%edx
  100b90:	89 90 40 40 00 00    	mov    %edx,0x4040(%eax)
  100b96:	8b 53 34             	mov    0x34(%ebx),%edx
  100b99:	89 90 34 40 00 00    	mov    %edx,0x4034(%eax)
  100b9f:	8b 53 30             	mov    0x30(%ebx),%edx
  100ba2:	89 90 30 40 00 00    	mov    %edx,0x4030(%eax)
  100ba8:	8b 53 28             	mov    0x28(%ebx),%edx
  100bab:	89 90 28 40 00 00    	mov    %edx,0x4028(%eax)
  100bb1:	8b 53 24             	mov    0x24(%ebx),%edx
  100bb4:	89 90 24 40 00 00    	mov    %edx,0x4024(%eax)
  100bba:	8b 53 18             	mov    0x18(%ebx),%edx
  100bbd:	89 90 18 40 00 00    	mov    %edx,0x4018(%eax)
  100bc3:	8b 53 14             	mov    0x14(%ebx),%edx
  100bc6:	89 90 14 40 00 00    	mov    %edx,0x4014(%eax)
  100bcc:	8b 53 10             	mov    0x10(%ebx),%edx
  100bcf:	89 90 10 40 00 00    	mov    %edx,0x4010(%eax)
  100bd5:	8b 53 1c             	mov    0x1c(%ebx),%edx
  100bd8:	89 90 1c 40 00 00    	mov    %edx,0x401c(%eax)
  100bde:	c7 80 3c 40 00 00 3b 	movl   $0x3b,0x403c(%eax)
  100be5:	00 00 00 
  100be8:	c7 80 04 40 00 00 43 	movl   $0x43,0x4004(%eax)
  100bef:	00 00 00 
  100bf2:	c7 80 48 40 00 00 43 	movl   $0x43,0x4048(%eax)
  100bf9:	00 00 00 
  100bfc:	c7 80 08 40 00 00 43 	movl   $0x43,0x4008(%eax)
  100c03:	00 00 00 
  100c06:	c7 80 0c 40 00 00 43 	movl   $0x43,0x400c(%eax)
  100c0d:	00 00 00 
  100c10:	c7 80 00 40 00 00 33 	movl   $0x33,0x4000(%eax)
  100c17:	00 00 00 
  100c1a:	6a 43                	push   $0x43
  100c1c:	6a 43                	push   $0x43
  100c1e:	6a 3b                	push   $0x3b
  100c20:	68 6c 10 10 00       	push   $0x10106c
  100c25:	e8 1e f6 ff ff       	call   100248 <Log>
  100c2a:	83 c4 10             	add    $0x10,%esp
  100c2d:	31 c0                	xor    %eax,%eax
  100c2f:	90                   	nop
  100c30:	8a 88 00 00 20 00    	mov    0x200000(%eax),%cl
  100c36:	88 88 00 00 30 00    	mov    %cl,0x300000(%eax)
  100c3c:	40                   	inc    %eax
  100c3d:	3d 00 00 10 00       	cmp    $0x100000,%eax
  100c42:	75 ec                	jne    100c30 <sys_fork+0x14c>
  100c44:	89 73 2c             	mov    %esi,0x2c(%ebx)
  100c47:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100c4a:	5b                   	pop    %ebx
  100c4b:	5e                   	pop    %esi
  100c4c:	5d                   	pop    %ebp
  100c4d:	c3                   	ret    
  100c4e:	31 f6                	xor    %esi,%esi
  100c50:	31 c0                	xor    %eax,%eax
  100c52:	e9 d3 fe ff ff       	jmp    100b2a <sys_fork+0x46>
  100c57:	75 f5                	jne    100c4e <sys_fork+0x16a>
  100c59:	31 c0                	xor    %eax,%eax
  100c5b:	e9 c8 fe ff ff       	jmp    100b28 <sys_fork+0x44>

00100c60 <sys_sleep>:
  100c60:	55                   	push   %ebp
  100c61:	89 e5                	mov    %esp,%ebp
  100c63:	53                   	push   %ebx
  100c64:	83 ec 08             	sub    $0x8,%esp
  100c67:	8b 45 08             	mov    0x8(%ebp),%eax
  100c6a:	8b 58 20             	mov    0x20(%eax),%ebx
  100c6d:	53                   	push   %ebx
  100c6e:	a1 f4 21 10 00       	mov    0x1021f4,%eax
  100c73:	ff b0 58 40 00 00    	pushl  0x4058(%eax)
  100c79:	68 94 10 10 00       	push   $0x101094
  100c7e:	e8 c5 f5 ff ff       	call   100248 <Log>
  100c83:	a1 f4 21 10 00       	mov    0x1021f4,%eax
  100c88:	83 c4 10             	add    $0x10,%esp
  100c8b:	8b 90 58 40 00 00    	mov    0x4058(%eax),%edx
  100c91:	85 d2                	test   %edx,%edx
  100c93:	75 07                	jne    100c9c <sys_sleep+0x3c>
  100c95:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100c98:	c9                   	leave  
  100c99:	c3                   	ret    
  100c9a:	66 90                	xchg   %ax,%ax
  100c9c:	89 98 54 40 00 00    	mov    %ebx,0x4054(%eax)
  100ca2:	c7 80 4c 40 00 00 02 	movl   $0x2,0x404c(%eax)
  100ca9:	00 00 00 
  100cac:	c7 80 50 40 00 00 0a 	movl   $0xa,0x4050(%eax)
  100cb3:	00 00 00 
  100cb6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100cb9:	c9                   	leave  
  100cba:	e9 6d fc ff ff       	jmp    10092c <schedule>
  100cbf:	90                   	nop

00100cc0 <sys_exit>:
  100cc0:	a1 f4 21 10 00       	mov    0x1021f4,%eax
  100cc5:	8b 80 58 40 00 00    	mov    0x4058(%eax),%eax
  100ccb:	85 c0                	test   %eax,%eax
  100ccd:	75 01                	jne    100cd0 <sys_exit+0x10>
  100ccf:	c3                   	ret    
  100cd0:	55                   	push   %ebp
  100cd1:	89 e5                	mov    %esp,%ebp
  100cd3:	83 ec 10             	sub    $0x10,%esp
  100cd6:	50                   	push   %eax
  100cd7:	68 a3 10 10 00       	push   $0x1010a3
  100cdc:	e8 67 f5 ff ff       	call   100248 <Log>
  100ce1:	a1 f4 21 10 00       	mov    0x1021f4,%eax
  100ce6:	c7 80 4c 40 00 00 03 	movl   $0x3,0x404c(%eax)
  100ced:	00 00 00 
  100cf0:	c7 80 50 40 00 00 0a 	movl   $0xa,0x4050(%eax)
  100cf7:	00 00 00 
  100cfa:	c7 80 54 40 00 00 00 	movl   $0x0,0x4054(%eax)
  100d01:	00 00 00 
  100d04:	83 c4 10             	add    $0x10,%esp
  100d07:	c9                   	leave  
  100d08:	e9 1f fc ff ff       	jmp    10092c <schedule>
  100d0d:	8d 76 00             	lea    0x0(%esi),%esi

00100d10 <sys_write>:
  100d10:	55                   	push   %ebp
  100d11:	89 e5                	mov    %esp,%ebp
  100d13:	53                   	push   %ebx
  100d14:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100d17:	a1 f4 21 10 00       	mov    0x1021f4,%eax
  100d1c:	83 b8 58 40 00 00 02 	cmpl   $0x2,0x4058(%eax)
  100d23:	8b 43 28             	mov    0x28(%ebx),%eax
  100d26:	75 08                	jne    100d30 <sys_write+0x20>
  100d28:	05 00 00 10 00       	add    $0x100000,%eax
  100d2d:	89 43 28             	mov    %eax,0x28(%ebx)
  100d30:	ff 73 24             	pushl  0x24(%ebx)
  100d33:	50                   	push   %eax
  100d34:	ff 73 20             	pushl  0x20(%ebx)
  100d37:	e8 0c fd ff ff       	call   100a48 <fs_write>
  100d3c:	89 43 2c             	mov    %eax,0x2c(%ebx)
  100d3f:	83 c4 0c             	add    $0xc,%esp
  100d42:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100d45:	c9                   	leave  
  100d46:	c3                   	ret    
  100d47:	90                   	nop

00100d48 <syscallHandle>:
  100d48:	55                   	push   %ebp
  100d49:	89 e5                	mov    %esp,%ebp
  100d4b:	8b 55 08             	mov    0x8(%ebp),%edx
  100d4e:	8b 42 2c             	mov    0x2c(%edx),%eax
  100d51:	83 f8 01             	cmp    $0x1,%eax
  100d54:	74 2e                	je     100d84 <syscallHandle+0x3c>
  100d56:	72 20                	jb     100d78 <syscallHandle+0x30>
  100d58:	83 f8 02             	cmp    $0x2,%eax
  100d5b:	74 0b                	je     100d68 <syscallHandle+0x20>
  100d5d:	83 f8 04             	cmp    $0x4,%eax
  100d60:	75 12                	jne    100d74 <syscallHandle+0x2c>
  100d62:	89 55 08             	mov    %edx,0x8(%ebp)
  100d65:	5d                   	pop    %ebp
  100d66:	eb a8                	jmp    100d10 <sys_write>
  100d68:	89 55 08             	mov    %edx,0x8(%ebp)
  100d6b:	5d                   	pop    %ebp
  100d6c:	e9 4f ff ff ff       	jmp    100cc0 <sys_exit>
  100d71:	8d 76 00             	lea    0x0(%esi),%esi
  100d74:	5d                   	pop    %ebp
  100d75:	c3                   	ret    
  100d76:	66 90                	xchg   %ax,%ax
  100d78:	89 55 08             	mov    %edx,0x8(%ebp)
  100d7b:	5d                   	pop    %ebp
  100d7c:	e9 63 fd ff ff       	jmp    100ae4 <sys_fork>
  100d81:	8d 76 00             	lea    0x0(%esi),%esi
  100d84:	89 55 08             	mov    %edx,0x8(%ebp)
  100d87:	5d                   	pop    %ebp
  100d88:	e9 d3 fe ff ff       	jmp    100c60 <sys_sleep>
  100d8d:	8d 76 00             	lea    0x0(%esi),%esi

00100d90 <GProtectFaultHandle>:
  100d90:	55                   	push   %ebp
  100d91:	89 e5                	mov    %esp,%ebp
  100d93:	83 ec 10             	sub    $0x10,%esp
  100d96:	68 09 01 00 00       	push   $0x109
  100d9b:	68 ad 10 10 00       	push   $0x1010ad
  100da0:	e8 d3 01 00 00       	call   100f78 <abort>
  100da5:	83 c4 10             	add    $0x10,%esp
  100da8:	c9                   	leave  
  100da9:	c3                   	ret    
  100daa:	66 90                	xchg   %ax,%ax

00100dac <timeHandle>:
  100dac:	55                   	push   %ebp
  100dad:	89 e5                	mov    %esp,%ebp
  100daf:	ff 05 fc 21 10 00    	incl   0x1021fc
  100db5:	8b 15 00 20 10 00    	mov    0x102000,%edx
  100dbb:	83 fa 01             	cmp    $0x1,%edx
  100dbe:	7e 2b                	jle    100deb <timeHandle+0x3f>
  100dc0:	b8 c0 22 10 00       	mov    $0x1022c0,%eax
  100dc5:	89 d1                	mov    %edx,%ecx
  100dc7:	c1 e1 08             	shl    $0x8,%ecx
  100dca:	01 d1                	add    %edx,%ecx
  100dcc:	01 c9                	add    %ecx,%ecx
  100dce:	01 ca                	add    %ecx,%edx
  100dd0:	c1 e2 05             	shl    $0x5,%edx
  100dd3:	81 c2 60 e2 0f 00    	add    $0xfe260,%edx
  100dd9:	83 b8 ac 80 00 00 02 	cmpl   $0x2,0x80ac(%eax)
  100de0:	74 26                	je     100e08 <timeHandle+0x5c>
  100de2:	05 60 40 00 00       	add    $0x4060,%eax
  100de7:	39 d0                	cmp    %edx,%eax
  100de9:	75 ee                	jne    100dd9 <timeHandle+0x2d>
  100deb:	8b 15 f4 21 10 00    	mov    0x1021f4,%edx
  100df1:	8b 82 58 40 00 00    	mov    0x4058(%edx),%eax
  100df7:	85 c0                	test   %eax,%eax
  100df9:	74 21                	je     100e1c <timeHandle+0x70>
  100dfb:	ff 8a 50 40 00 00    	decl   0x4050(%edx)
  100e01:	74 19                	je     100e1c <timeHandle+0x70>
  100e03:	5d                   	pop    %ebp
  100e04:	c3                   	ret    
  100e05:	8d 76 00             	lea    0x0(%esi),%esi
  100e08:	ff 88 b4 80 00 00    	decl   0x80b4(%eax)
  100e0e:	75 d2                	jne    100de2 <timeHandle+0x36>
  100e10:	c7 80 ac 80 00 00 00 	movl   $0x0,0x80ac(%eax)
  100e17:	00 00 00 
  100e1a:	eb c6                	jmp    100de2 <timeHandle+0x36>
  100e1c:	5d                   	pop    %ebp
  100e1d:	e9 0a fb ff ff       	jmp    10092c <schedule>
  100e22:	66 90                	xchg   %ax,%ax

00100e24 <irqHandle>:
  100e24:	55                   	push   %ebp
  100e25:	89 e5                	mov    %esp,%ebp
  100e27:	83 ec 08             	sub    $0x8,%esp
  100e2a:	8b 55 08             	mov    0x8(%ebp),%edx
  100e2d:	b8 10 00 00 00       	mov    $0x10,%eax
  100e32:	8e d8                	mov    %eax,%ds
  100e34:	8b 42 30             	mov    0x30(%edx),%eax
  100e37:	83 f8 20             	cmp    $0x20,%eax
  100e3a:	74 50                	je     100e8c <irqHandle+0x68>
  100e3c:	76 32                	jbe    100e70 <irqHandle+0x4c>
  100e3e:	3d 80 00 00 00       	cmp    $0x80,%eax
  100e43:	74 07                	je     100e4c <irqHandle+0x28>
  100e45:	40                   	inc    %eax
  100e46:	75 10                	jne    100e58 <irqHandle+0x34>
  100e48:	c9                   	leave  
  100e49:	c3                   	ret    
  100e4a:	66 90                	xchg   %ax,%ax
  100e4c:	89 55 08             	mov    %edx,0x8(%ebp)
  100e4f:	c9                   	leave  
  100e50:	e9 f3 fe ff ff       	jmp    100d48 <syscallHandle>
  100e55:	8d 76 00             	lea    0x0(%esi),%esi
  100e58:	83 ec 08             	sub    $0x8,%esp
  100e5b:	68 fa 00 00 00       	push   $0xfa
  100e60:	68 ad 10 10 00       	push   $0x1010ad
  100e65:	e8 0e 01 00 00       	call   100f78 <abort>
  100e6a:	83 c4 10             	add    $0x10,%esp
  100e6d:	c9                   	leave  
  100e6e:	c3                   	ret    
  100e6f:	90                   	nop
  100e70:	83 f8 0d             	cmp    $0xd,%eax
  100e73:	75 e3                	jne    100e58 <irqHandle+0x34>
  100e75:	83 ec 08             	sub    $0x8,%esp
  100e78:	68 09 01 00 00       	push   $0x109
  100e7d:	68 ad 10 10 00       	push   $0x1010ad
  100e82:	e8 f1 00 00 00       	call   100f78 <abort>
  100e87:	83 c4 10             	add    $0x10,%esp
  100e8a:	c9                   	leave  
  100e8b:	c3                   	ret    
  100e8c:	89 55 08             	mov    %edx,0x8(%ebp)
  100e8f:	c9                   	leave  
  100e90:	e9 17 ff ff ff       	jmp    100dac <timeHandle>
  100e95:	66 90                	xchg   %ax,%ax
  100e97:	90                   	nop

00100e98 <initIdt>:
  100e98:	55                   	push   %ebp
  100e99:	89 e5                	mov    %esp,%ebp
  100e9b:	53                   	push   %ebx
  100e9c:	ba 0f 10 10 00       	mov    $0x10100f,%edx
  100ea1:	89 d3                	mov    %edx,%ebx
  100ea3:	c1 ea 10             	shr    $0x10,%edx
  100ea6:	b9 c0 2c 11 00       	mov    $0x112cc0,%ecx
  100eab:	b8 c0 24 11 00       	mov    $0x1124c0,%eax
  100eb0:	66 89 18             	mov    %bx,(%eax)
  100eb3:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  100eb9:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  100ebd:	c6 40 05 8f          	movb   $0x8f,0x5(%eax)
  100ec1:	66 89 50 06          	mov    %dx,0x6(%eax)
  100ec5:	83 c0 08             	add    $0x8,%eax
  100ec8:	39 c1                	cmp    %eax,%ecx
  100eca:	75 e4                	jne    100eb0 <initIdt+0x18>
  100ecc:	b8 15 10 10 00       	mov    $0x101015,%eax
  100ed1:	66 a3 28 25 11 00    	mov    %ax,0x112528
  100ed7:	66 c7 05 2a 25 11 00 	movw   $0x8,0x11252a
  100ede:	08 00 
  100ee0:	c6 05 2c 25 11 00 00 	movb   $0x0,0x11252c
  100ee7:	c6 05 2d 25 11 00 8f 	movb   $0x8f,0x11252d
  100eee:	c1 e8 10             	shr    $0x10,%eax
  100ef1:	66 a3 2e 25 11 00    	mov    %ax,0x11252e
  100ef7:	b8 19 10 10 00       	mov    $0x101019,%eax
  100efc:	66 a3 c0 25 11 00    	mov    %ax,0x1125c0
  100f02:	66 c7 05 c2 25 11 00 	movw   $0x8,0x1125c2
  100f09:	08 00 
  100f0b:	c6 05 c4 25 11 00 00 	movb   $0x0,0x1125c4
  100f12:	c6 05 c5 25 11 00 ee 	movb   $0xee,0x1125c5
  100f19:	c1 e8 10             	shr    $0x10,%eax
  100f1c:	66 a3 c6 25 11 00    	mov    %ax,0x1125c6
  100f22:	b8 1f 10 10 00       	mov    $0x10101f,%eax
  100f27:	66 a3 c0 28 11 00    	mov    %ax,0x1128c0
  100f2d:	66 c7 05 c2 28 11 00 	movw   $0x8,0x1128c2
  100f34:	08 00 
  100f36:	c6 05 c4 28 11 00 00 	movb   $0x0,0x1128c4
  100f3d:	c6 05 c5 28 11 00 ee 	movb   $0xee,0x1128c5
  100f44:	c1 e8 10             	shr    $0x10,%eax
  100f47:	66 a3 c6 28 11 00    	mov    %ax,0x1128c6
  100f4d:	66 c7 05 04 22 10 00 	movw   $0x7ff,0x102204
  100f54:	ff 07 
  100f56:	b8 c0 24 11 00       	mov    $0x1124c0,%eax
  100f5b:	66 a3 06 22 10 00    	mov    %ax,0x102206
  100f61:	c1 e8 10             	shr    $0x10,%eax
  100f64:	66 a3 08 22 10 00    	mov    %ax,0x102208
  100f6a:	b8 04 22 10 00       	mov    $0x102204,%eax
  100f6f:	0f 01 18             	lidtl  (%eax)
  100f72:	5b                   	pop    %ebx
  100f73:	5d                   	pop    %ebp
  100f74:	c3                   	ret    
  100f75:	66 90                	xchg   %ax,%ax
  100f77:	90                   	nop

00100f78 <abort>:
  100f78:	55                   	push   %ebp
  100f79:	89 e5                	mov    %esp,%ebp
  100f7b:	57                   	push   %edi
  100f7c:	56                   	push   %esi
  100f7d:	53                   	push   %ebx
  100f7e:	83 ec 1c             	sub    $0x1c,%esp
  100f81:	8b 55 08             	mov    0x8(%ebp),%edx
  100f84:	fa                   	cli    
  100f85:	8a 02                	mov    (%edx),%al
  100f87:	b9 32 20 10 00       	mov    $0x102032,%ecx
  100f8c:	84 c0                	test   %al,%al
  100f8e:	74 0b                	je     100f9b <abort+0x23>
  100f90:	41                   	inc    %ecx
  100f91:	42                   	inc    %edx
  100f92:	88 41 ff             	mov    %al,-0x1(%ecx)
  100f95:	8a 02                	mov    (%edx),%al
  100f97:	84 c0                	test   %al,%al
  100f99:	75 f5                	jne    100f90 <abort+0x18>
  100f9b:	c6 01 3a             	movb   $0x3a,(%ecx)
  100f9e:	bb 29 22 10 00       	mov    $0x102229,%ebx
  100fa3:	be 0a 00 00 00       	mov    $0xa,%esi
  100fa8:	bf 67 66 66 66       	mov    $0x66666667,%edi
  100fad:	4b                   	dec    %ebx
  100fae:	8b 45 0c             	mov    0xc(%ebp),%eax
  100fb1:	99                   	cltd   
  100fb2:	f7 fe                	idiv   %esi
  100fb4:	8d 42 30             	lea    0x30(%edx),%eax
  100fb7:	88 45 e7             	mov    %al,-0x19(%ebp)
  100fba:	88 03                	mov    %al,(%ebx)
  100fbc:	89 f8                	mov    %edi,%eax
  100fbe:	f7 6d 0c             	imull  0xc(%ebp)
  100fc1:	c1 fa 02             	sar    $0x2,%edx
  100fc4:	8b 45 0c             	mov    0xc(%ebp),%eax
  100fc7:	c1 f8 1f             	sar    $0x1f,%eax
  100fca:	29 c2                	sub    %eax,%edx
  100fcc:	89 55 0c             	mov    %edx,0xc(%ebp)
  100fcf:	75 dc                	jne    100fad <abort+0x35>
  100fd1:	41                   	inc    %ecx
  100fd2:	41                   	inc    %ecx
  100fd3:	43                   	inc    %ebx
  100fd4:	8a 45 e7             	mov    -0x19(%ebp),%al
  100fd7:	88 41 ff             	mov    %al,-0x1(%ecx)
  100fda:	8a 03                	mov    (%ebx),%al
  100fdc:	88 45 e7             	mov    %al,-0x19(%ebp)
  100fdf:	84 c0                	test   %al,%al
  100fe1:	75 ef                	jne    100fd2 <abort+0x5a>
  100fe3:	c6 01 0a             	movb   $0xa,(%ecx)
  100fe6:	0f be 05 20 20 10 00 	movsbl 0x102020,%eax
  100fed:	84 c0                	test   %al,%al
  100fef:	74 1b                	je     10100c <abort+0x94>
  100ff1:	bb 20 20 10 00       	mov    $0x102020,%ebx
  100ff6:	83 ec 0c             	sub    $0xc,%esp
  100ff9:	50                   	push   %eax
  100ffa:	e8 6d f0 ff ff       	call   10006c <putChar>
  100fff:	43                   	inc    %ebx
  101000:	0f be 03             	movsbl (%ebx),%eax
  101003:	83 c4 10             	add    $0x10,%esp
  101006:	84 c0                	test   %al,%al
  101008:	75 ec                	jne    100ff6 <abort+0x7e>
  10100a:	66 90                	xchg   %ax,%ax
  10100c:	f4                   	hlt    
  10100d:	eb fd                	jmp    10100c <abort+0x94>

0010100f <irqEmpty>:
  10100f:	6a 00                	push   $0x0
  101011:	6a ff                	push   $0xffffffff
  101013:	eb 13                	jmp    101028 <asmDoIrq>

00101015 <irqGProtectFault>:
  101015:	6a 0d                	push   $0xd
  101017:	eb 0f                	jmp    101028 <asmDoIrq>

00101019 <irqTimeSyscall>:
  101019:	6a 00                	push   $0x0
  10101b:	6a 20                	push   $0x20
  10101d:	eb 09                	jmp    101028 <asmDoIrq>

0010101f <irqSyscall>:
  10101f:	6a 00                	push   $0x0
  101021:	68 80 00 00 00       	push   $0x80
  101026:	eb 00                	jmp    101028 <asmDoIrq>

00101028 <asmDoIrq>:
  101028:	60                   	pusha  
  101029:	1e                   	push   %ds
  10102a:	06                   	push   %es
  10102b:	0f a0                	push   %fs
  10102d:	0f a8                	push   %gs
  10102f:	54                   	push   %esp
  101030:	e8 ef fd ff ff       	call   100e24 <irqHandle>
  101035:	83 c4 04             	add    $0x4,%esp
  101038:	0f a9                	pop    %gs
  10103a:	0f a1                	pop    %fs
  10103c:	07                   	pop    %es
  10103d:	1f                   	pop    %ds
  10103e:	61                   	popa   
  10103f:	83 c4 04             	add    $0x4,%esp
  101042:	83 c4 04             	add    $0x4,%esp
  101045:	cf                   	iret   
