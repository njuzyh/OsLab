
uMain.elf:     file format elf32-i386


Disassembly of section .text:

00200000 <uEntry>:
  200000:	55                   	push   %ebp
  200001:	89 e5                	mov    %esp,%ebp
  200003:	53                   	push   %ebx
  200004:	53                   	push   %ebx
  200005:	e8 96 06 00 00       	call   2006a0 <fork>
  20000a:	85 c0                	test   %eax,%eax
  20000c:	75 4a                	jne    200058 <uEntry+0x58>
  20000e:	c7 05 b4 19 20 00 02 	movl   $0x2,0x2019b4
  200015:	00 00 00 
  200018:	b8 02 00 00 00       	mov    $0x2,%eax
  20001d:	bb 08 00 00 00       	mov    $0x8,%ebx
  200022:	eb 05                	jmp    200029 <uEntry+0x29>
  200024:	a1 b4 19 20 00       	mov    0x2019b4,%eax
  200029:	4b                   	dec    %ebx
  20002a:	51                   	push   %ecx
  20002b:	53                   	push   %ebx
  20002c:	50                   	push   %eax
  20002d:	68 93 07 20 00       	push   $0x200793
  200032:	e8 f5 01 00 00       	call   20022c <printf>
  200037:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
  20003e:	e8 b1 06 00 00       	call   2006f4 <sleep>
  200043:	83 c4 10             	add    $0x10,%esp
  200046:	85 db                	test   %ebx,%ebx
  200048:	75 da                	jne    200024 <uEntry+0x24>
  20004a:	e8 f5 06 00 00       	call   200744 <exit>
  20004f:	31 c0                	xor    %eax,%eax
  200051:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  200054:	c9                   	leave  
  200055:	c3                   	ret    
  200056:	66 90                	xchg   %ax,%ax
  200058:	40                   	inc    %eax
  200059:	74 f4                	je     20004f <uEntry+0x4f>
  20005b:	c7 05 b4 19 20 00 01 	movl   $0x1,0x2019b4
  200062:	00 00 00 
  200065:	b8 01 00 00 00       	mov    $0x1,%eax
  20006a:	bb 08 00 00 00       	mov    $0x8,%ebx
  20006f:	eb 08                	jmp    200079 <uEntry+0x79>
  200071:	8d 76 00             	lea    0x0(%esi),%esi
  200074:	a1 b4 19 20 00       	mov    0x2019b4,%eax
  200079:	4b                   	dec    %ebx
  20007a:	52                   	push   %edx
  20007b:	53                   	push   %ebx
  20007c:	50                   	push   %eax
  20007d:	68 b0 07 20 00       	push   $0x2007b0
  200082:	e8 a5 01 00 00       	call   20022c <printf>
  200087:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
  20008e:	e8 61 06 00 00       	call   2006f4 <sleep>
  200093:	83 c4 10             	add    $0x10,%esp
  200096:	85 db                	test   %ebx,%ebx
  200098:	75 da                	jne    200074 <uEntry+0x74>
  20009a:	eb ae                	jmp    20004a <uEntry+0x4a>

0020009c <syscall>:
  20009c:	55                   	push   %ebp
  20009d:	89 e5                	mov    %esp,%ebp
  20009f:	60                   	pusha  
  2000a0:	8b 45 08             	mov    0x8(%ebp),%eax
  2000a3:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  2000a6:	8b 4d 10             	mov    0x10(%ebp),%ecx
  2000a9:	8b 55 14             	mov    0x14(%ebp),%edx
  2000ac:	8b 7d 18             	mov    0x18(%ebp),%edi
  2000af:	8b 75 1c             	mov    0x1c(%ebp),%esi
  2000b2:	cd 80                	int    $0x80
  2000b4:	a3 bc 19 20 00       	mov    %eax,0x2019bc
  2000b9:	61                   	popa   
  2000ba:	a1 bc 19 20 00       	mov    0x2019bc,%eax
  2000bf:	5d                   	pop    %ebp
  2000c0:	c3                   	ret    
  2000c1:	8d 76 00             	lea    0x0(%esi),%esi

002000c4 <printch>:
  2000c4:	55                   	push   %ebp
  2000c5:	89 e5                	mov    %esp,%ebp
  2000c7:	83 ec 24             	sub    $0x24,%esp
  2000ca:	c7 45 e8 04 00 00 00 	movl   $0x4,-0x18(%ebp)
  2000d1:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  2000d8:	8d 45 dc             	lea    -0x24(%ebp),%eax
  2000db:	89 45 f0             	mov    %eax,-0x10(%ebp)
  2000de:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  2000e5:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  2000ec:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  2000f3:	60                   	pusha  
  2000f4:	8b 45 e8             	mov    -0x18(%ebp),%eax
  2000f7:	8b 5d ec             	mov    -0x14(%ebp),%ebx
  2000fa:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  2000fd:	8b 55 f4             	mov    -0xc(%ebp),%edx
  200100:	8b 7d f8             	mov    -0x8(%ebp),%edi
  200103:	8b 75 fc             	mov    -0x4(%ebp),%esi
  200106:	cd 80                	int    $0x80
  200108:	a3 bc 19 20 00       	mov    %eax,0x2019bc
  20010d:	61                   	popa   
  20010e:	c9                   	leave  
  20010f:	c3                   	ret    

00200110 <printint>:
  200110:	55                   	push   %ebp
  200111:	89 e5                	mov    %esp,%ebp
  200113:	8b 45 08             	mov    0x8(%ebp),%eax
  200116:	8b 55 0c             	mov    0xc(%ebp),%edx
  200119:	85 c0                	test   %eax,%eax
  20011b:	75 03                	jne    200120 <printint+0x10>
  20011d:	5d                   	pop    %ebp
  20011e:	c3                   	ret    
  20011f:	90                   	nop
  200120:	5d                   	pop    %ebp
  200121:	eb 01                	jmp    200124 <printint.part.0>
  200123:	90                   	nop

00200124 <printint.part.0>:
  200124:	55                   	push   %ebp
  200125:	89 e5                	mov    %esp,%ebp
  200127:	57                   	push   %edi
  200128:	56                   	push   %esi
  200129:	53                   	push   %ebx
  20012a:	83 ec 14             	sub    $0x14,%esp
  20012d:	89 c3                	mov    %eax,%ebx
  20012f:	89 d6                	mov    %edx,%esi
  200131:	52                   	push   %edx
  200132:	b9 cd cc cc cc       	mov    $0xcccccccd,%ecx
  200137:	89 c8                	mov    %ecx,%eax
  200139:	f7 e3                	mul    %ebx
  20013b:	89 d7                	mov    %edx,%edi
  20013d:	c1 ef 03             	shr    $0x3,%edi
  200140:	57                   	push   %edi
  200141:	e8 ca ff ff ff       	call   200110 <printint>
  200146:	a1 b8 19 20 00       	mov    0x2019b8,%eax
  20014b:	8d 14 bf             	lea    (%edi,%edi,4),%edx
  20014e:	01 d2                	add    %edx,%edx
  200150:	29 d3                	sub    %edx,%ebx
  200152:	83 c3 30             	add    $0x30,%ebx
  200155:	88 1c 06             	mov    %bl,(%esi,%eax,1)
  200158:	40                   	inc    %eax
  200159:	a3 b8 19 20 00       	mov    %eax,0x2019b8
  20015e:	83 c4 10             	add    $0x10,%esp
  200161:	8d 65 f4             	lea    -0xc(%ebp),%esp
  200164:	5b                   	pop    %ebx
  200165:	5e                   	pop    %esi
  200166:	5f                   	pop    %edi
  200167:	5d                   	pop    %ebp
  200168:	c3                   	ret    
  200169:	8d 76 00             	lea    0x0(%esi),%esi

0020016c <printstr>:
  20016c:	55                   	push   %ebp
  20016d:	89 e5                	mov    %esp,%ebp
  20016f:	83 ec 20             	sub    $0x20,%esp
  200172:	8b 55 08             	mov    0x8(%ebp),%edx
  200175:	80 3a 00             	cmpb   $0x0,(%edx)
  200178:	74 4a                	je     2001c4 <printstr+0x58>
  20017a:	31 c0                	xor    %eax,%eax
  20017c:	40                   	inc    %eax
  20017d:	89 c1                	mov    %eax,%ecx
  20017f:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  200183:	75 f7                	jne    20017c <printstr+0x10>
  200185:	c7 45 e8 04 00 00 00 	movl   $0x4,-0x18(%ebp)
  20018c:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  200193:	89 55 f0             	mov    %edx,-0x10(%ebp)
  200196:	89 4d f4             	mov    %ecx,-0xc(%ebp)
  200199:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  2001a0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  2001a7:	60                   	pusha  
  2001a8:	8b 45 e8             	mov    -0x18(%ebp),%eax
  2001ab:	8b 5d ec             	mov    -0x14(%ebp),%ebx
  2001ae:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  2001b1:	8b 55 f4             	mov    -0xc(%ebp),%edx
  2001b4:	8b 7d f8             	mov    -0x8(%ebp),%edi
  2001b7:	8b 75 fc             	mov    -0x4(%ebp),%esi
  2001ba:	cd 80                	int    $0x80
  2001bc:	a3 bc 19 20 00       	mov    %eax,0x2019bc
  2001c1:	61                   	popa   
  2001c2:	c9                   	leave  
  2001c3:	c3                   	ret    
  2001c4:	31 c9                	xor    %ecx,%ecx
  2001c6:	eb bd                	jmp    200185 <printstr+0x19>

002001c8 <printhex>:
  2001c8:	55                   	push   %ebp
  2001c9:	89 e5                	mov    %esp,%ebp
  2001cb:	8b 45 08             	mov    0x8(%ebp),%eax
  2001ce:	8b 55 0c             	mov    0xc(%ebp),%edx
  2001d1:	85 c0                	test   %eax,%eax
  2001d3:	75 03                	jne    2001d8 <printhex+0x10>
  2001d5:	5d                   	pop    %ebp
  2001d6:	c3                   	ret    
  2001d7:	90                   	nop
  2001d8:	5d                   	pop    %ebp
  2001d9:	eb 01                	jmp    2001dc <printhex.part.1>
  2001db:	90                   	nop

002001dc <printhex.part.1>:
  2001dc:	55                   	push   %ebp
  2001dd:	89 e5                	mov    %esp,%ebp
  2001df:	56                   	push   %esi
  2001e0:	53                   	push   %ebx
  2001e1:	89 c3                	mov    %eax,%ebx
  2001e3:	89 d6                	mov    %edx,%esi
  2001e5:	83 ec 08             	sub    $0x8,%esp
  2001e8:	52                   	push   %edx
  2001e9:	c1 e8 04             	shr    $0x4,%eax
  2001ec:	50                   	push   %eax
  2001ed:	e8 d6 ff ff ff       	call   2001c8 <printhex>
  2001f2:	83 e3 0f             	and    $0xf,%ebx
  2001f5:	83 c4 10             	add    $0x10,%esp
  2001f8:	a1 b8 19 20 00       	mov    0x2019b8,%eax
  2001fd:	83 fb 09             	cmp    $0x9,%ebx
  200200:	77 16                	ja     200218 <printhex.part.1+0x3c>
  200202:	83 c3 30             	add    $0x30,%ebx
  200205:	88 1c 06             	mov    %bl,(%esi,%eax,1)
  200208:	40                   	inc    %eax
  200209:	a3 b8 19 20 00       	mov    %eax,0x2019b8
  20020e:	8d 65 f8             	lea    -0x8(%ebp),%esp
  200211:	5b                   	pop    %ebx
  200212:	5e                   	pop    %esi
  200213:	5d                   	pop    %ebp
  200214:	c3                   	ret    
  200215:	8d 76 00             	lea    0x0(%esi),%esi
  200218:	83 c3 57             	add    $0x57,%ebx
  20021b:	88 1c 06             	mov    %bl,(%esi,%eax,1)
  20021e:	40                   	inc    %eax
  20021f:	a3 b8 19 20 00       	mov    %eax,0x2019b8
  200224:	8d 65 f8             	lea    -0x8(%ebp),%esp
  200227:	5b                   	pop    %ebx
  200228:	5e                   	pop    %esi
  200229:	5d                   	pop    %ebp
  20022a:	c3                   	ret    
  20022b:	90                   	nop

0020022c <printf>:
  20022c:	55                   	push   %ebp
  20022d:	89 e5                	mov    %esp,%ebp
  20022f:	57                   	push   %edi
  200230:	56                   	push   %esi
  200231:	53                   	push   %ebx
  200232:	81 ec 4c 01 00 00    	sub    $0x14c,%esp
  200238:	8b 5d 08             	mov    0x8(%ebp),%ebx
  20023b:	8d 75 0c             	lea    0xc(%ebp),%esi
  20023e:	8d 7d 84             	lea    -0x7c(%ebp),%edi
  200241:	8a 03                	mov    (%ebx),%al
  200243:	84 c0                	test   %al,%al
  200245:	74 70                	je     2002b7 <printf+0x8b>
  200247:	3c 25                	cmp    $0x25,%al
  200249:	74 75                	je     2002c0 <printf+0x94>
  20024b:	c7 85 c4 fe ff ff 04 	movl   $0x4,-0x13c(%ebp)
  200252:	00 00 00 
  200255:	c7 85 c8 fe ff ff 01 	movl   $0x1,-0x138(%ebp)
  20025c:	00 00 00 
  20025f:	89 9d cc fe ff ff    	mov    %ebx,-0x134(%ebp)
  200265:	c7 85 d0 fe ff ff 01 	movl   $0x1,-0x130(%ebp)
  20026c:	00 00 00 
  20026f:	c7 85 d4 fe ff ff 00 	movl   $0x0,-0x12c(%ebp)
  200276:	00 00 00 
  200279:	c7 85 d8 fe ff ff 00 	movl   $0x0,-0x128(%ebp)
  200280:	00 00 00 
  200283:	60                   	pusha  
  200284:	8b 85 c4 fe ff ff    	mov    -0x13c(%ebp),%eax
  20028a:	8b 9d c8 fe ff ff    	mov    -0x138(%ebp),%ebx
  200290:	8b 8d cc fe ff ff    	mov    -0x134(%ebp),%ecx
  200296:	8b 95 d0 fe ff ff    	mov    -0x130(%ebp),%edx
  20029c:	8b bd d4 fe ff ff    	mov    -0x12c(%ebp),%edi
  2002a2:	8b b5 d8 fe ff ff    	mov    -0x128(%ebp),%esi
  2002a8:	cd 80                	int    $0x80
  2002aa:	a3 bc 19 20 00       	mov    %eax,0x2019bc
  2002af:	61                   	popa   
  2002b0:	43                   	inc    %ebx
  2002b1:	8a 03                	mov    (%ebx),%al
  2002b3:	84 c0                	test   %al,%al
  2002b5:	75 90                	jne    200247 <printf+0x1b>
  2002b7:	8d 65 f4             	lea    -0xc(%ebp),%esp
  2002ba:	5b                   	pop    %ebx
  2002bb:	5e                   	pop    %esi
  2002bc:	5f                   	pop    %edi
  2002bd:	5d                   	pop    %ebp
  2002be:	c3                   	ret    
  2002bf:	90                   	nop
  2002c0:	8a 43 01             	mov    0x1(%ebx),%al
  2002c3:	3c 64                	cmp    $0x64,%al
  2002c5:	0f 84 19 01 00 00    	je     2003e4 <printf+0x1b8>
  2002cb:	0f 8e 93 00 00 00    	jle    200364 <printf+0x138>
  2002d1:	3c 73                	cmp    $0x73,%al
  2002d3:	0f 84 1f 02 00 00    	je     2004f8 <printf+0x2cc>
  2002d9:	3c 78                	cmp    $0x78,%al
  2002db:	0f 85 ab 01 00 00    	jne    20048c <printf+0x260>
  2002e1:	89 f0                	mov    %esi,%eax
  2002e3:	83 c6 04             	add    $0x4,%esi
  2002e6:	8b 00                	mov    (%eax),%eax
  2002e8:	85 c0                	test   %eax,%eax
  2002ea:	0f 85 a0 02 00 00    	jne    200590 <printf+0x364>
  2002f0:	c6 45 84 30          	movb   $0x30,-0x7c(%ebp)
  2002f4:	c6 45 85 00          	movb   $0x0,-0x7b(%ebp)
  2002f8:	c7 85 3c ff ff ff 04 	movl   $0x4,-0xc4(%ebp)
  2002ff:	00 00 00 
  200302:	c7 85 40 ff ff ff 01 	movl   $0x1,-0xc0(%ebp)
  200309:	00 00 00 
  20030c:	89 bd 44 ff ff ff    	mov    %edi,-0xbc(%ebp)
  200312:	c7 85 48 ff ff ff 01 	movl   $0x1,-0xb8(%ebp)
  200319:	00 00 00 
  20031c:	c7 85 4c ff ff ff 00 	movl   $0x0,-0xb4(%ebp)
  200323:	00 00 00 
  200326:	c7 85 50 ff ff ff 00 	movl   $0x0,-0xb0(%ebp)
  20032d:	00 00 00 
  200330:	60                   	pusha  
  200331:	8b 85 3c ff ff ff    	mov    -0xc4(%ebp),%eax
  200337:	8b 9d 40 ff ff ff    	mov    -0xc0(%ebp),%ebx
  20033d:	8b 8d 44 ff ff ff    	mov    -0xbc(%ebp),%ecx
  200343:	8b 95 48 ff ff ff    	mov    -0xb8(%ebp),%edx
  200349:	8b bd 4c ff ff ff    	mov    -0xb4(%ebp),%edi
  20034f:	8b b5 50 ff ff ff    	mov    -0xb0(%ebp),%esi
  200355:	cd 80                	int    $0x80
  200357:	a3 bc 19 20 00       	mov    %eax,0x2019bc
  20035c:	61                   	popa   
  20035d:	e9 8c 01 00 00       	jmp    2004ee <printf+0x2c2>
  200362:	66 90                	xchg   %ax,%ax
  200364:	3c 63                	cmp    $0x63,%al
  200366:	0f 85 20 01 00 00    	jne    20048c <printf+0x260>
  20036c:	8d 46 04             	lea    0x4(%esi),%eax
  20036f:	8b 16                	mov    (%esi),%edx
  200371:	88 55 84             	mov    %dl,-0x7c(%ebp)
  200374:	c7 85 dc fe ff ff 04 	movl   $0x4,-0x124(%ebp)
  20037b:	00 00 00 
  20037e:	c7 85 e0 fe ff ff 01 	movl   $0x1,-0x120(%ebp)
  200385:	00 00 00 
  200388:	89 bd e4 fe ff ff    	mov    %edi,-0x11c(%ebp)
  20038e:	c7 85 e8 fe ff ff 01 	movl   $0x1,-0x118(%ebp)
  200395:	00 00 00 
  200398:	c7 85 ec fe ff ff 00 	movl   $0x0,-0x114(%ebp)
  20039f:	00 00 00 
  2003a2:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
  2003a9:	00 00 00 
  2003ac:	60                   	pusha  
  2003ad:	8b 85 dc fe ff ff    	mov    -0x124(%ebp),%eax
  2003b3:	8b 9d e0 fe ff ff    	mov    -0x120(%ebp),%ebx
  2003b9:	8b 8d e4 fe ff ff    	mov    -0x11c(%ebp),%ecx
  2003bf:	8b 95 e8 fe ff ff    	mov    -0x118(%ebp),%edx
  2003c5:	8b bd ec fe ff ff    	mov    -0x114(%ebp),%edi
  2003cb:	8b b5 f0 fe ff ff    	mov    -0x110(%ebp),%esi
  2003d1:	cd 80                	int    $0x80
  2003d3:	a3 bc 19 20 00       	mov    %eax,0x2019bc
  2003d8:	61                   	popa   
  2003d9:	83 c3 02             	add    $0x2,%ebx
  2003dc:	89 c6                	mov    %eax,%esi
  2003de:	e9 5e fe ff ff       	jmp    200241 <printf+0x15>
  2003e3:	90                   	nop
  2003e4:	8d 4e 04             	lea    0x4(%esi),%ecx
  2003e7:	8b 06                	mov    (%esi),%eax
  2003e9:	85 c0                	test   %eax,%eax
  2003eb:	0f 84 23 01 00 00    	je     200514 <printf+0x2e8>
  2003f1:	89 8d b4 fe ff ff    	mov    %ecx,-0x14c(%ebp)
  2003f7:	0f 88 14 02 00 00    	js     200611 <printf+0x3e5>
  2003fd:	c7 05 b8 19 20 00 00 	movl   $0x0,0x2019b8
  200404:	00 00 00 
  200407:	89 fa                	mov    %edi,%edx
  200409:	e8 16 fd ff ff       	call   200124 <printint.part.0>
  20040e:	a1 b8 19 20 00       	mov    0x2019b8,%eax
  200413:	c6 44 05 84 00       	movb   $0x0,-0x7c(%ebp,%eax,1)
  200418:	c7 85 24 ff ff ff 04 	movl   $0x4,-0xdc(%ebp)
  20041f:	00 00 00 
  200422:	c7 85 28 ff ff ff 01 	movl   $0x1,-0xd8(%ebp)
  200429:	00 00 00 
  20042c:	89 bd 2c ff ff ff    	mov    %edi,-0xd4(%ebp)
  200432:	89 85 30 ff ff ff    	mov    %eax,-0xd0(%ebp)
  200438:	c7 85 34 ff ff ff 00 	movl   $0x0,-0xcc(%ebp)
  20043f:	00 00 00 
  200442:	c7 85 38 ff ff ff 00 	movl   $0x0,-0xc8(%ebp)
  200449:	00 00 00 
  20044c:	60                   	pusha  
  20044d:	8b 85 24 ff ff ff    	mov    -0xdc(%ebp),%eax
  200453:	8b 9d 28 ff ff ff    	mov    -0xd8(%ebp),%ebx
  200459:	8b 8d 2c ff ff ff    	mov    -0xd4(%ebp),%ecx
  20045f:	8b 95 30 ff ff ff    	mov    -0xd0(%ebp),%edx
  200465:	8b bd 34 ff ff ff    	mov    -0xcc(%ebp),%edi
  20046b:	8b b5 38 ff ff ff    	mov    -0xc8(%ebp),%esi
  200471:	cd 80                	int    $0x80
  200473:	a3 bc 19 20 00       	mov    %eax,0x2019bc
  200478:	61                   	popa   
  200479:	8b 8d b4 fe ff ff    	mov    -0x14c(%ebp),%ecx
  20047f:	83 c3 02             	add    $0x2,%ebx
  200482:	89 ce                	mov    %ecx,%esi
  200484:	e9 b8 fd ff ff       	jmp    200241 <printf+0x15>
  200489:	8d 76 00             	lea    0x0(%esi),%esi
  20048c:	c7 85 6c ff ff ff 04 	movl   $0x4,-0x94(%ebp)
  200493:	00 00 00 
  200496:	c7 85 70 ff ff ff 01 	movl   $0x1,-0x90(%ebp)
  20049d:	00 00 00 
  2004a0:	8d 43 01             	lea    0x1(%ebx),%eax
  2004a3:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
  2004a9:	c7 85 78 ff ff ff 01 	movl   $0x1,-0x88(%ebp)
  2004b0:	00 00 00 
  2004b3:	c7 85 7c ff ff ff 00 	movl   $0x0,-0x84(%ebp)
  2004ba:	00 00 00 
  2004bd:	c7 45 80 00 00 00 00 	movl   $0x0,-0x80(%ebp)
  2004c4:	60                   	pusha  
  2004c5:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
  2004cb:	8b 9d 70 ff ff ff    	mov    -0x90(%ebp),%ebx
  2004d1:	8b 8d 74 ff ff ff    	mov    -0x8c(%ebp),%ecx
  2004d7:	8b 95 78 ff ff ff    	mov    -0x88(%ebp),%edx
  2004dd:	8b bd 7c ff ff ff    	mov    -0x84(%ebp),%edi
  2004e3:	8b 75 80             	mov    -0x80(%ebp),%esi
  2004e6:	cd 80                	int    $0x80
  2004e8:	a3 bc 19 20 00       	mov    %eax,0x2019bc
  2004ed:	61                   	popa   
  2004ee:	83 c3 02             	add    $0x2,%ebx
  2004f1:	e9 4b fd ff ff       	jmp    200241 <printf+0x15>
  2004f6:	66 90                	xchg   %ax,%ax
  2004f8:	89 f0                	mov    %esi,%eax
  2004fa:	83 c6 04             	add    $0x4,%esi
  2004fd:	83 ec 0c             	sub    $0xc,%esp
  200500:	ff 30                	pushl  (%eax)
  200502:	e8 65 fc ff ff       	call   20016c <printstr>
  200507:	83 c3 02             	add    $0x2,%ebx
  20050a:	83 c4 10             	add    $0x10,%esp
  20050d:	e9 2f fd ff ff       	jmp    200241 <printf+0x15>
  200512:	66 90                	xchg   %ax,%ax
  200514:	c7 05 b8 19 20 00 00 	movl   $0x0,0x2019b8
  20051b:	00 00 00 
  20051e:	c6 45 84 30          	movb   $0x30,-0x7c(%ebp)
  200522:	c6 45 85 00          	movb   $0x0,-0x7b(%ebp)
  200526:	c7 85 f4 fe ff ff 04 	movl   $0x4,-0x10c(%ebp)
  20052d:	00 00 00 
  200530:	c7 85 f8 fe ff ff 01 	movl   $0x1,-0x108(%ebp)
  200537:	00 00 00 
  20053a:	89 bd fc fe ff ff    	mov    %edi,-0x104(%ebp)
  200540:	c7 85 00 ff ff ff 01 	movl   $0x1,-0x100(%ebp)
  200547:	00 00 00 
  20054a:	c7 85 04 ff ff ff 00 	movl   $0x0,-0xfc(%ebp)
  200551:	00 00 00 
  200554:	c7 85 08 ff ff ff 00 	movl   $0x0,-0xf8(%ebp)
  20055b:	00 00 00 
  20055e:	60                   	pusha  
  20055f:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
  200565:	8b 9d f8 fe ff ff    	mov    -0x108(%ebp),%ebx
  20056b:	8b 8d fc fe ff ff    	mov    -0x104(%ebp),%ecx
  200571:	8b 95 00 ff ff ff    	mov    -0x100(%ebp),%edx
  200577:	8b bd 04 ff ff ff    	mov    -0xfc(%ebp),%edi
  20057d:	8b b5 08 ff ff ff    	mov    -0xf8(%ebp),%esi
  200583:	cd 80                	int    $0x80
  200585:	a3 bc 19 20 00       	mov    %eax,0x2019bc
  20058a:	61                   	popa   
  20058b:	e9 ef fe ff ff       	jmp    20047f <printf+0x253>
  200590:	c7 05 b8 19 20 00 00 	movl   $0x0,0x2019b8
  200597:	00 00 00 
  20059a:	89 fa                	mov    %edi,%edx
  20059c:	e8 3b fc ff ff       	call   2001dc <printhex.part.1>
  2005a1:	a1 b8 19 20 00       	mov    0x2019b8,%eax
  2005a6:	c6 44 05 84 00       	movb   $0x0,-0x7c(%ebp,%eax,1)
  2005ab:	c7 85 54 ff ff ff 04 	movl   $0x4,-0xac(%ebp)
  2005b2:	00 00 00 
  2005b5:	c7 85 58 ff ff ff 01 	movl   $0x1,-0xa8(%ebp)
  2005bc:	00 00 00 
  2005bf:	89 bd 5c ff ff ff    	mov    %edi,-0xa4(%ebp)
  2005c5:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
  2005cb:	c7 85 64 ff ff ff 00 	movl   $0x0,-0x9c(%ebp)
  2005d2:	00 00 00 
  2005d5:	c7 85 68 ff ff ff 00 	movl   $0x0,-0x98(%ebp)
  2005dc:	00 00 00 
  2005df:	60                   	pusha  
  2005e0:	8b 85 54 ff ff ff    	mov    -0xac(%ebp),%eax
  2005e6:	8b 9d 58 ff ff ff    	mov    -0xa8(%ebp),%ebx
  2005ec:	8b 8d 5c ff ff ff    	mov    -0xa4(%ebp),%ecx
  2005f2:	8b 95 60 ff ff ff    	mov    -0xa0(%ebp),%edx
  2005f8:	8b bd 64 ff ff ff    	mov    -0x9c(%ebp),%edi
  2005fe:	8b b5 68 ff ff ff    	mov    -0x98(%ebp),%esi
  200604:	cd 80                	int    $0x80
  200606:	a3 bc 19 20 00       	mov    %eax,0x2019bc
  20060b:	61                   	popa   
  20060c:	e9 dd fe ff ff       	jmp    2004ee <printf+0x2c2>
  200611:	c6 45 84 2d          	movb   $0x2d,-0x7c(%ebp)
  200615:	c7 05 b8 19 20 00 01 	movl   $0x1,0x2019b8
  20061c:	00 00 00 
  20061f:	f7 d8                	neg    %eax
  200621:	89 fa                	mov    %edi,%edx
  200623:	e8 fc fa ff ff       	call   200124 <printint.part.0>
  200628:	a1 b8 19 20 00       	mov    0x2019b8,%eax
  20062d:	c6 44 05 84 00       	movb   $0x0,-0x7c(%ebp,%eax,1)
  200632:	c7 85 0c ff ff ff 04 	movl   $0x4,-0xf4(%ebp)
  200639:	00 00 00 
  20063c:	c7 85 10 ff ff ff 01 	movl   $0x1,-0xf0(%ebp)
  200643:	00 00 00 
  200646:	89 bd 14 ff ff ff    	mov    %edi,-0xec(%ebp)
  20064c:	89 85 18 ff ff ff    	mov    %eax,-0xe8(%ebp)
  200652:	c7 85 1c ff ff ff 00 	movl   $0x0,-0xe4(%ebp)
  200659:	00 00 00 
  20065c:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
  200663:	00 00 00 
  200666:	60                   	pusha  
  200667:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
  20066d:	8b 9d 10 ff ff ff    	mov    -0xf0(%ebp),%ebx
  200673:	8b 8d 14 ff ff ff    	mov    -0xec(%ebp),%ecx
  200679:	8b 95 18 ff ff ff    	mov    -0xe8(%ebp),%edx
  20067f:	8b bd 1c ff ff ff    	mov    -0xe4(%ebp),%edi
  200685:	8b b5 20 ff ff ff    	mov    -0xe0(%ebp),%esi
  20068b:	cd 80                	int    $0x80
  20068d:	a3 bc 19 20 00       	mov    %eax,0x2019bc
  200692:	61                   	popa   
  200693:	8b 8d b4 fe ff ff    	mov    -0x14c(%ebp),%ecx
  200699:	e9 e1 fd ff ff       	jmp    20047f <printf+0x253>
  20069e:	66 90                	xchg   %ax,%ax

002006a0 <fork>:
  2006a0:	55                   	push   %ebp
  2006a1:	89 e5                	mov    %esp,%ebp
  2006a3:	83 ec 20             	sub    $0x20,%esp
  2006a6:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  2006ad:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  2006b4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  2006bb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  2006c2:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  2006c9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  2006d0:	60                   	pusha  
  2006d1:	8b 45 e8             	mov    -0x18(%ebp),%eax
  2006d4:	8b 5d ec             	mov    -0x14(%ebp),%ebx
  2006d7:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  2006da:	8b 55 f4             	mov    -0xc(%ebp),%edx
  2006dd:	8b 7d f8             	mov    -0x8(%ebp),%edi
  2006e0:	8b 75 fc             	mov    -0x4(%ebp),%esi
  2006e3:	cd 80                	int    $0x80
  2006e5:	a3 bc 19 20 00       	mov    %eax,0x2019bc
  2006ea:	61                   	popa   
  2006eb:	a1 bc 19 20 00       	mov    0x2019bc,%eax
  2006f0:	c9                   	leave  
  2006f1:	c3                   	ret    
  2006f2:	66 90                	xchg   %ax,%ax

002006f4 <sleep>:
  2006f4:	55                   	push   %ebp
  2006f5:	89 e5                	mov    %esp,%ebp
  2006f7:	83 ec 20             	sub    $0x20,%esp
  2006fa:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
  200701:	8b 45 08             	mov    0x8(%ebp),%eax
  200704:	89 45 ec             	mov    %eax,-0x14(%ebp)
  200707:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  20070e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200715:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  20071c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  200723:	60                   	pusha  
  200724:	8b 45 e8             	mov    -0x18(%ebp),%eax
  200727:	8b 5d ec             	mov    -0x14(%ebp),%ebx
  20072a:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  20072d:	8b 55 f4             	mov    -0xc(%ebp),%edx
  200730:	8b 7d f8             	mov    -0x8(%ebp),%edi
  200733:	8b 75 fc             	mov    -0x4(%ebp),%esi
  200736:	cd 80                	int    $0x80
  200738:	a3 bc 19 20 00       	mov    %eax,0x2019bc
  20073d:	61                   	popa   
  20073e:	31 c0                	xor    %eax,%eax
  200740:	c9                   	leave  
  200741:	c3                   	ret    
  200742:	66 90                	xchg   %ax,%ax

00200744 <exit>:
  200744:	55                   	push   %ebp
  200745:	89 e5                	mov    %esp,%ebp
  200747:	83 ec 20             	sub    $0x20,%esp
  20074a:	c7 45 e8 02 00 00 00 	movl   $0x2,-0x18(%ebp)
  200751:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  200758:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  20075f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200766:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  20076d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  200774:	60                   	pusha  
  200775:	8b 45 e8             	mov    -0x18(%ebp),%eax
  200778:	8b 5d ec             	mov    -0x14(%ebp),%ebx
  20077b:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  20077e:	8b 55 f4             	mov    -0xc(%ebp),%edx
  200781:	8b 7d f8             	mov    -0x8(%ebp),%edi
  200784:	8b 75 fc             	mov    -0x4(%ebp),%esi
  200787:	cd 80                	int    $0x80
  200789:	a3 bc 19 20 00       	mov    %eax,0x2019bc
  20078e:	61                   	popa   
  20078f:	31 c0                	xor    %eax,%eax
  200791:	c9                   	leave  
  200792:	c3                   	ret    
