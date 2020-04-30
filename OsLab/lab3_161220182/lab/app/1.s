
uMain.elf:     file format elf32-i386


Disassembly of section .text:

00200000 <uEntry>:
  200000:	55                   	push   %ebp
  200001:	89 e5                	mov    %esp,%ebp
  200003:	53                   	push   %ebx
  200004:	51                   	push   %ecx
  200005:	c7 05 ac 19 20 00 02 	movl   $0x2,0x2019ac
  20000c:	00 00 00 
  20000f:	b8 02 00 00 00       	mov    $0x2,%eax
  200014:	bb 08 00 00 00       	mov    $0x8,%ebx
  200019:	eb 06                	jmp    200021 <uEntry+0x21>
  20001b:	90                   	nop
  20001c:	a1 ac 19 20 00       	mov    0x2019ac,%eax
  200021:	4b                   	dec    %ebx
  200022:	52                   	push   %edx
  200023:	53                   	push   %ebx
  200024:	50                   	push   %eax
  200025:	68 ac 07 20 00       	push   $0x2007ac
  20002a:	e8 c1 01 00 00       	call   2001f0 <printf>
  20002f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  200036:	e8 c9 06 00 00       	call   200704 <sleep>
  20003b:	83 c4 10             	add    $0x10,%esp
  20003e:	85 db                	test   %ebx,%ebx
  200040:	75 da                	jne    20001c <uEntry+0x1c>
  200042:	31 c0                	xor    %eax,%eax
  200044:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  200047:	c9                   	leave  
  200048:	c3                   	ret    
  200049:	66 90                	xchg   %ax,%ax
  20004b:	90                   	nop

0020004c <syscall>:
  20004c:	55                   	push   %ebp
  20004d:	89 e5                	mov    %esp,%ebp
  20004f:	83 ec 10             	sub    $0x10,%esp
  200052:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  200059:	60                   	pusha  
  20005a:	8b 45 08             	mov    0x8(%ebp),%eax
  20005d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  200060:	8b 4d 10             	mov    0x10(%ebp),%ecx
  200063:	8b 55 14             	mov    0x14(%ebp),%edx
  200066:	8b 7d 18             	mov    0x18(%ebp),%edi
  200069:	8b 75 1c             	mov    0x1c(%ebp),%esi
  20006c:	cd 80                	int    $0x80
  20006e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  200071:	61                   	popa   
  200072:	31 c0                	xor    %eax,%eax
  200074:	c9                   	leave  
  200075:	c3                   	ret    
  200076:	66 90                	xchg   %ax,%ax

00200078 <printch>:
  200078:	55                   	push   %ebp
  200079:	89 e5                	mov    %esp,%ebp
  20007b:	83 ec 24             	sub    $0x24,%esp
  20007e:	c7 45 e4 04 00 00 00 	movl   $0x4,-0x1c(%ebp)
  200085:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
  20008c:	8d 45 dc             	lea    -0x24(%ebp),%eax
  20008f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  200092:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  200099:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  2000a0:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  2000a7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  2000ae:	60                   	pusha  
  2000af:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  2000b2:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  2000b5:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  2000b8:	8b 55 f0             	mov    -0x10(%ebp),%edx
  2000bb:	8b 7d f4             	mov    -0xc(%ebp),%edi
  2000be:	8b 75 f8             	mov    -0x8(%ebp),%esi
  2000c1:	cd 80                	int    $0x80
  2000c3:	89 45 fc             	mov    %eax,-0x4(%ebp)
  2000c6:	61                   	popa   
  2000c7:	c9                   	leave  
  2000c8:	c3                   	ret    
  2000c9:	8d 76 00             	lea    0x0(%esi),%esi

002000cc <printint>:
  2000cc:	55                   	push   %ebp
  2000cd:	89 e5                	mov    %esp,%ebp
  2000cf:	8b 45 08             	mov    0x8(%ebp),%eax
  2000d2:	8b 55 0c             	mov    0xc(%ebp),%edx
  2000d5:	85 c0                	test   %eax,%eax
  2000d7:	75 03                	jne    2000dc <printint+0x10>
  2000d9:	5d                   	pop    %ebp
  2000da:	c3                   	ret    
  2000db:	90                   	nop
  2000dc:	5d                   	pop    %ebp
  2000dd:	eb 01                	jmp    2000e0 <printint.part.0>
  2000df:	90                   	nop

002000e0 <printint.part.0>:
  2000e0:	55                   	push   %ebp
  2000e1:	89 e5                	mov    %esp,%ebp
  2000e3:	57                   	push   %edi
  2000e4:	56                   	push   %esi
  2000e5:	53                   	push   %ebx
  2000e6:	83 ec 14             	sub    $0x14,%esp
  2000e9:	89 c3                	mov    %eax,%ebx
  2000eb:	89 d6                	mov    %edx,%esi
  2000ed:	52                   	push   %edx
  2000ee:	b9 cd cc cc cc       	mov    $0xcccccccd,%ecx
  2000f3:	89 c8                	mov    %ecx,%eax
  2000f5:	f7 e3                	mul    %ebx
  2000f7:	89 d7                	mov    %edx,%edi
  2000f9:	c1 ef 03             	shr    $0x3,%edi
  2000fc:	57                   	push   %edi
  2000fd:	e8 ca ff ff ff       	call   2000cc <printint>
  200102:	a1 b0 19 20 00       	mov    0x2019b0,%eax
  200107:	8d 14 bf             	lea    (%edi,%edi,4),%edx
  20010a:	01 d2                	add    %edx,%edx
  20010c:	29 d3                	sub    %edx,%ebx
  20010e:	83 c3 30             	add    $0x30,%ebx
  200111:	88 1c 06             	mov    %bl,(%esi,%eax,1)
  200114:	40                   	inc    %eax
  200115:	a3 b0 19 20 00       	mov    %eax,0x2019b0
  20011a:	83 c4 10             	add    $0x10,%esp
  20011d:	8d 65 f4             	lea    -0xc(%ebp),%esp
  200120:	5b                   	pop    %ebx
  200121:	5e                   	pop    %esi
  200122:	5f                   	pop    %edi
  200123:	5d                   	pop    %ebp
  200124:	c3                   	ret    
  200125:	8d 76 00             	lea    0x0(%esi),%esi

00200128 <printstr>:
  200128:	55                   	push   %ebp
  200129:	89 e5                	mov    %esp,%ebp
  20012b:	83 ec 20             	sub    $0x20,%esp
  20012e:	8b 55 08             	mov    0x8(%ebp),%edx
  200131:	80 3a 00             	cmpb   $0x0,(%edx)
  200134:	74 4f                	je     200185 <printstr+0x5d>
  200136:	31 c0                	xor    %eax,%eax
  200138:	40                   	inc    %eax
  200139:	89 c1                	mov    %eax,%ecx
  20013b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  20013f:	75 f7                	jne    200138 <printstr+0x10>
  200141:	c7 45 e4 04 00 00 00 	movl   $0x4,-0x1c(%ebp)
  200148:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
  20014f:	89 55 ec             	mov    %edx,-0x14(%ebp)
  200152:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  200155:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  20015c:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  200163:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  20016a:	60                   	pusha  
  20016b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  20016e:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  200171:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  200174:	8b 55 f0             	mov    -0x10(%ebp),%edx
  200177:	8b 7d f4             	mov    -0xc(%ebp),%edi
  20017a:	8b 75 f8             	mov    -0x8(%ebp),%esi
  20017d:	cd 80                	int    $0x80
  20017f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  200182:	61                   	popa   
  200183:	c9                   	leave  
  200184:	c3                   	ret    
  200185:	31 c9                	xor    %ecx,%ecx
  200187:	eb b8                	jmp    200141 <printstr+0x19>
  200189:	8d 76 00             	lea    0x0(%esi),%esi

0020018c <printhex>:
  20018c:	55                   	push   %ebp
  20018d:	89 e5                	mov    %esp,%ebp
  20018f:	8b 45 08             	mov    0x8(%ebp),%eax
  200192:	8b 55 0c             	mov    0xc(%ebp),%edx
  200195:	85 c0                	test   %eax,%eax
  200197:	75 03                	jne    20019c <printhex+0x10>
  200199:	5d                   	pop    %ebp
  20019a:	c3                   	ret    
  20019b:	90                   	nop
  20019c:	5d                   	pop    %ebp
  20019d:	eb 01                	jmp    2001a0 <printhex.part.1>
  20019f:	90                   	nop

002001a0 <printhex.part.1>:
  2001a0:	55                   	push   %ebp
  2001a1:	89 e5                	mov    %esp,%ebp
  2001a3:	56                   	push   %esi
  2001a4:	53                   	push   %ebx
  2001a5:	89 c3                	mov    %eax,%ebx
  2001a7:	89 d6                	mov    %edx,%esi
  2001a9:	83 ec 08             	sub    $0x8,%esp
  2001ac:	52                   	push   %edx
  2001ad:	c1 e8 04             	shr    $0x4,%eax
  2001b0:	50                   	push   %eax
  2001b1:	e8 d6 ff ff ff       	call   20018c <printhex>
  2001b6:	83 e3 0f             	and    $0xf,%ebx
  2001b9:	83 c4 10             	add    $0x10,%esp
  2001bc:	a1 b0 19 20 00       	mov    0x2019b0,%eax
  2001c1:	83 fb 09             	cmp    $0x9,%ebx
  2001c4:	77 16                	ja     2001dc <printhex.part.1+0x3c>
  2001c6:	83 c3 30             	add    $0x30,%ebx
  2001c9:	88 1c 06             	mov    %bl,(%esi,%eax,1)
  2001cc:	40                   	inc    %eax
  2001cd:	a3 b0 19 20 00       	mov    %eax,0x2019b0
  2001d2:	8d 65 f8             	lea    -0x8(%ebp),%esp
  2001d5:	5b                   	pop    %ebx
  2001d6:	5e                   	pop    %esi
  2001d7:	5d                   	pop    %ebp
  2001d8:	c3                   	ret    
  2001d9:	8d 76 00             	lea    0x0(%esi),%esi
  2001dc:	83 c3 57             	add    $0x57,%ebx
  2001df:	88 1c 06             	mov    %bl,(%esi,%eax,1)
  2001e2:	40                   	inc    %eax
  2001e3:	a3 b0 19 20 00       	mov    %eax,0x2019b0
  2001e8:	8d 65 f8             	lea    -0x8(%ebp),%esp
  2001eb:	5b                   	pop    %ebx
  2001ec:	5e                   	pop    %esi
  2001ed:	5d                   	pop    %ebp
  2001ee:	c3                   	ret    
  2001ef:	90                   	nop

002001f0 <printf>:
  2001f0:	55                   	push   %ebp
  2001f1:	89 e5                	mov    %esp,%ebp
  2001f3:	57                   	push   %edi
  2001f4:	56                   	push   %esi
  2001f5:	53                   	push   %ebx
  2001f6:	81 ec 4c 01 00 00    	sub    $0x14c,%esp
  2001fc:	8b 5d 08             	mov    0x8(%ebp),%ebx
  2001ff:	8d 75 0c             	lea    0xc(%ebp),%esi
  200202:	8d 7d 84             	lea    -0x7c(%ebp),%edi
  200205:	8a 03                	mov    (%ebx),%al
  200207:	84 c0                	test   %al,%al
  200209:	74 75                	je     200280 <printf+0x90>
  20020b:	3c 25                	cmp    $0x25,%al
  20020d:	74 79                	je     200288 <printf+0x98>
  20020f:	c7 85 c0 fe ff ff 04 	movl   $0x4,-0x140(%ebp)
  200216:	00 00 00 
  200219:	c7 85 c4 fe ff ff 01 	movl   $0x1,-0x13c(%ebp)
  200220:	00 00 00 
  200223:	89 9d c8 fe ff ff    	mov    %ebx,-0x138(%ebp)
  200229:	c7 85 cc fe ff ff 01 	movl   $0x1,-0x134(%ebp)
  200230:	00 00 00 
  200233:	c7 85 d0 fe ff ff 00 	movl   $0x0,-0x130(%ebp)
  20023a:	00 00 00 
  20023d:	c7 85 d4 fe ff ff 00 	movl   $0x0,-0x12c(%ebp)
  200244:	00 00 00 
  200247:	c7 45 84 00 00 00 00 	movl   $0x0,-0x7c(%ebp)
  20024e:	60                   	pusha  
  20024f:	8b 85 c0 fe ff ff    	mov    -0x140(%ebp),%eax
  200255:	8b 9d c4 fe ff ff    	mov    -0x13c(%ebp),%ebx
  20025b:	8b 8d c8 fe ff ff    	mov    -0x138(%ebp),%ecx
  200261:	8b 95 cc fe ff ff    	mov    -0x134(%ebp),%edx
  200267:	8b bd d0 fe ff ff    	mov    -0x130(%ebp),%edi
  20026d:	8b b5 d4 fe ff ff    	mov    -0x12c(%ebp),%esi
  200273:	cd 80                	int    $0x80
  200275:	89 45 84             	mov    %eax,-0x7c(%ebp)
  200278:	61                   	popa   
  200279:	43                   	inc    %ebx
  20027a:	8a 03                	mov    (%ebx),%al
  20027c:	84 c0                	test   %al,%al
  20027e:	75 8b                	jne    20020b <printf+0x1b>
  200280:	8d 65 f4             	lea    -0xc(%ebp),%esp
  200283:	5b                   	pop    %ebx
  200284:	5e                   	pop    %esi
  200285:	5f                   	pop    %edi
  200286:	5d                   	pop    %ebp
  200287:	c3                   	ret    
  200288:	8a 43 01             	mov    0x1(%ebx),%al
  20028b:	3c 64                	cmp    $0x64,%al
  20028d:	0f 84 35 01 00 00    	je     2003c8 <printf+0x1d8>
  200293:	0f 8e 9f 00 00 00    	jle    200338 <printf+0x148>
  200299:	3c 73                	cmp    $0x73,%al
  20029b:	0f 84 47 02 00 00    	je     2004e8 <printf+0x2f8>
  2002a1:	3c 78                	cmp    $0x78,%al
  2002a3:	0f 85 cf 01 00 00    	jne    200478 <printf+0x288>
  2002a9:	89 f0                	mov    %esi,%eax
  2002ab:	83 c6 04             	add    $0x4,%esi
  2002ae:	8b 00                	mov    (%eax),%eax
  2002b0:	85 c0                	test   %eax,%eax
  2002b2:	0f 85 d4 02 00 00    	jne    20058c <printf+0x39c>
  2002b8:	c6 45 84 30          	movb   $0x30,-0x7c(%ebp)
  2002bc:	c6 45 85 00          	movb   $0x0,-0x7b(%ebp)
  2002c0:	c7 85 38 ff ff ff 04 	movl   $0x4,-0xc8(%ebp)
  2002c7:	00 00 00 
  2002ca:	c7 85 3c ff ff ff 01 	movl   $0x1,-0xc4(%ebp)
  2002d1:	00 00 00 
  2002d4:	89 bd 40 ff ff ff    	mov    %edi,-0xc0(%ebp)
  2002da:	c7 85 44 ff ff ff 01 	movl   $0x1,-0xbc(%ebp)
  2002e1:	00 00 00 
  2002e4:	c7 85 48 ff ff ff 00 	movl   $0x0,-0xb8(%ebp)
  2002eb:	00 00 00 
  2002ee:	c7 85 4c ff ff ff 00 	movl   $0x0,-0xb4(%ebp)
  2002f5:	00 00 00 
  2002f8:	c7 85 68 ff ff ff 00 	movl   $0x0,-0x98(%ebp)
  2002ff:	00 00 00 
  200302:	60                   	pusha  
  200303:	8b 85 38 ff ff ff    	mov    -0xc8(%ebp),%eax
  200309:	8b 9d 3c ff ff ff    	mov    -0xc4(%ebp),%ebx
  20030f:	8b 8d 40 ff ff ff    	mov    -0xc0(%ebp),%ecx
  200315:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
  20031b:	8b bd 48 ff ff ff    	mov    -0xb8(%ebp),%edi
  200321:	8b b5 4c ff ff ff    	mov    -0xb4(%ebp),%esi
  200327:	cd 80                	int    $0x80
  200329:	89 85 68 ff ff ff    	mov    %eax,-0x98(%ebp)
  20032f:	61                   	popa   
  200330:	e9 aa 01 00 00       	jmp    2004df <printf+0x2ef>
  200335:	8d 76 00             	lea    0x0(%esi),%esi
  200338:	3c 63                	cmp    $0x63,%al
  20033a:	0f 85 38 01 00 00    	jne    200478 <printf+0x288>
  200340:	8d 46 04             	lea    0x4(%esi),%eax
  200343:	8b 16                	mov    (%esi),%edx
  200345:	88 95 68 ff ff ff    	mov    %dl,-0x98(%ebp)
  20034b:	c7 85 d8 fe ff ff 04 	movl   $0x4,-0x128(%ebp)
  200352:	00 00 00 
  200355:	c7 85 dc fe ff ff 01 	movl   $0x1,-0x124(%ebp)
  20035c:	00 00 00 
  20035f:	8d 8d 68 ff ff ff    	lea    -0x98(%ebp),%ecx
  200365:	89 8d e0 fe ff ff    	mov    %ecx,-0x120(%ebp)
  20036b:	c7 85 e4 fe ff ff 01 	movl   $0x1,-0x11c(%ebp)
  200372:	00 00 00 
  200375:	c7 85 e8 fe ff ff 00 	movl   $0x0,-0x118(%ebp)
  20037c:	00 00 00 
  20037f:	c7 85 ec fe ff ff 00 	movl   $0x0,-0x114(%ebp)
  200386:	00 00 00 
  200389:	c7 45 84 00 00 00 00 	movl   $0x0,-0x7c(%ebp)
  200390:	60                   	pusha  
  200391:	8b 85 d8 fe ff ff    	mov    -0x128(%ebp),%eax
  200397:	8b 9d dc fe ff ff    	mov    -0x124(%ebp),%ebx
  20039d:	8b 8d e0 fe ff ff    	mov    -0x120(%ebp),%ecx
  2003a3:	8b 95 e4 fe ff ff    	mov    -0x11c(%ebp),%edx
  2003a9:	8b bd e8 fe ff ff    	mov    -0x118(%ebp),%edi
  2003af:	8b b5 ec fe ff ff    	mov    -0x114(%ebp),%esi
  2003b5:	cd 80                	int    $0x80
  2003b7:	89 45 84             	mov    %eax,-0x7c(%ebp)
  2003ba:	61                   	popa   
  2003bb:	83 c3 02             	add    $0x2,%ebx
  2003be:	89 c6                	mov    %eax,%esi
  2003c0:	e9 40 fe ff ff       	jmp    200205 <printf+0x15>
  2003c5:	8d 76 00             	lea    0x0(%esi),%esi
  2003c8:	8d 4e 04             	lea    0x4(%esi),%ecx
  2003cb:	8b 06                	mov    (%esi),%eax
  2003cd:	85 c0                	test   %eax,%eax
  2003cf:	0f 84 2f 01 00 00    	je     200504 <printf+0x314>
  2003d5:	89 8d b4 fe ff ff    	mov    %ecx,-0x14c(%ebp)
  2003db:	0f 88 37 02 00 00    	js     200618 <printf+0x428>
  2003e1:	c7 05 b0 19 20 00 00 	movl   $0x0,0x2019b0
  2003e8:	00 00 00 
  2003eb:	89 fa                	mov    %edi,%edx
  2003ed:	e8 ee fc ff ff       	call   2000e0 <printint.part.0>
  2003f2:	a1 b0 19 20 00       	mov    0x2019b0,%eax
  2003f7:	c6 44 05 84 00       	movb   $0x0,-0x7c(%ebp,%eax,1)
  2003fc:	c7 85 20 ff ff ff 04 	movl   $0x4,-0xe0(%ebp)
  200403:	00 00 00 
  200406:	c7 85 24 ff ff ff 01 	movl   $0x1,-0xdc(%ebp)
  20040d:	00 00 00 
  200410:	89 bd 28 ff ff ff    	mov    %edi,-0xd8(%ebp)
  200416:	89 85 2c ff ff ff    	mov    %eax,-0xd4(%ebp)
  20041c:	c7 85 30 ff ff ff 00 	movl   $0x0,-0xd0(%ebp)
  200423:	00 00 00 
  200426:	c7 85 34 ff ff ff 00 	movl   $0x0,-0xcc(%ebp)
  20042d:	00 00 00 
  200430:	c7 85 68 ff ff ff 00 	movl   $0x0,-0x98(%ebp)
  200437:	00 00 00 
  20043a:	60                   	pusha  
  20043b:	8b 85 20 ff ff ff    	mov    -0xe0(%ebp),%eax
  200441:	8b 9d 24 ff ff ff    	mov    -0xdc(%ebp),%ebx
  200447:	8b 8d 28 ff ff ff    	mov    -0xd8(%ebp),%ecx
  20044d:	8b 95 2c ff ff ff    	mov    -0xd4(%ebp),%edx
  200453:	8b bd 30 ff ff ff    	mov    -0xd0(%ebp),%edi
  200459:	8b b5 34 ff ff ff    	mov    -0xcc(%ebp),%esi
  20045f:	cd 80                	int    $0x80
  200461:	89 85 68 ff ff ff    	mov    %eax,-0x98(%ebp)
  200467:	61                   	popa   
  200468:	8b 8d b4 fe ff ff    	mov    -0x14c(%ebp),%ecx
  20046e:	83 c3 02             	add    $0x2,%ebx
  200471:	89 ce                	mov    %ecx,%esi
  200473:	e9 8d fd ff ff       	jmp    200205 <printf+0x15>
  200478:	c7 85 6c ff ff ff 04 	movl   $0x4,-0x94(%ebp)
  20047f:	00 00 00 
  200482:	c7 85 70 ff ff ff 01 	movl   $0x1,-0x90(%ebp)
  200489:	00 00 00 
  20048c:	8d 43 01             	lea    0x1(%ebx),%eax
  20048f:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
  200495:	c7 85 78 ff ff ff 01 	movl   $0x1,-0x88(%ebp)
  20049c:	00 00 00 
  20049f:	c7 85 7c ff ff ff 00 	movl   $0x0,-0x84(%ebp)
  2004a6:	00 00 00 
  2004a9:	c7 45 80 00 00 00 00 	movl   $0x0,-0x80(%ebp)
  2004b0:	c7 45 84 00 00 00 00 	movl   $0x0,-0x7c(%ebp)
  2004b7:	60                   	pusha  
  2004b8:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
  2004be:	8b 9d 70 ff ff ff    	mov    -0x90(%ebp),%ebx
  2004c4:	8b 8d 74 ff ff ff    	mov    -0x8c(%ebp),%ecx
  2004ca:	8b 95 78 ff ff ff    	mov    -0x88(%ebp),%edx
  2004d0:	8b bd 7c ff ff ff    	mov    -0x84(%ebp),%edi
  2004d6:	8b 75 80             	mov    -0x80(%ebp),%esi
  2004d9:	cd 80                	int    $0x80
  2004db:	89 45 84             	mov    %eax,-0x7c(%ebp)
  2004de:	61                   	popa   
  2004df:	83 c3 02             	add    $0x2,%ebx
  2004e2:	e9 1e fd ff ff       	jmp    200205 <printf+0x15>
  2004e7:	90                   	nop
  2004e8:	89 f0                	mov    %esi,%eax
  2004ea:	83 c6 04             	add    $0x4,%esi
  2004ed:	83 ec 0c             	sub    $0xc,%esp
  2004f0:	ff 30                	pushl  (%eax)
  2004f2:	e8 31 fc ff ff       	call   200128 <printstr>
  2004f7:	83 c3 02             	add    $0x2,%ebx
  2004fa:	83 c4 10             	add    $0x10,%esp
  2004fd:	e9 03 fd ff ff       	jmp    200205 <printf+0x15>
  200502:	66 90                	xchg   %ax,%ax
  200504:	c7 05 b0 19 20 00 00 	movl   $0x0,0x2019b0
  20050b:	00 00 00 
  20050e:	c6 45 84 30          	movb   $0x30,-0x7c(%ebp)
  200512:	c6 45 85 00          	movb   $0x0,-0x7b(%ebp)
  200516:	c7 85 f0 fe ff ff 04 	movl   $0x4,-0x110(%ebp)
  20051d:	00 00 00 
  200520:	c7 85 f4 fe ff ff 01 	movl   $0x1,-0x10c(%ebp)
  200527:	00 00 00 
  20052a:	89 bd f8 fe ff ff    	mov    %edi,-0x108(%ebp)
  200530:	c7 85 fc fe ff ff 01 	movl   $0x1,-0x104(%ebp)
  200537:	00 00 00 
  20053a:	c7 85 00 ff ff ff 00 	movl   $0x0,-0x100(%ebp)
  200541:	00 00 00 
  200544:	c7 85 04 ff ff ff 00 	movl   $0x0,-0xfc(%ebp)
  20054b:	00 00 00 
  20054e:	c7 85 68 ff ff ff 00 	movl   $0x0,-0x98(%ebp)
  200555:	00 00 00 
  200558:	60                   	pusha  
  200559:	8b 85 f0 fe ff ff    	mov    -0x110(%ebp),%eax
  20055f:	8b 9d f4 fe ff ff    	mov    -0x10c(%ebp),%ebx
  200565:	8b 8d f8 fe ff ff    	mov    -0x108(%ebp),%ecx
  20056b:	8b 95 fc fe ff ff    	mov    -0x104(%ebp),%edx
  200571:	8b bd 00 ff ff ff    	mov    -0x100(%ebp),%edi
  200577:	8b b5 04 ff ff ff    	mov    -0xfc(%ebp),%esi
  20057d:	cd 80                	int    $0x80
  20057f:	89 85 68 ff ff ff    	mov    %eax,-0x98(%ebp)
  200585:	61                   	popa   
  200586:	e9 e3 fe ff ff       	jmp    20046e <printf+0x27e>
  20058b:	90                   	nop
  20058c:	c7 05 b0 19 20 00 00 	movl   $0x0,0x2019b0
  200593:	00 00 00 
  200596:	89 fa                	mov    %edi,%edx
  200598:	e8 03 fc ff ff       	call   2001a0 <printhex.part.1>
  20059d:	a1 b0 19 20 00       	mov    0x2019b0,%eax
  2005a2:	c6 44 05 84 00       	movb   $0x0,-0x7c(%ebp,%eax,1)
  2005a7:	c7 85 50 ff ff ff 04 	movl   $0x4,-0xb0(%ebp)
  2005ae:	00 00 00 
  2005b1:	c7 85 54 ff ff ff 01 	movl   $0x1,-0xac(%ebp)
  2005b8:	00 00 00 
  2005bb:	89 bd 58 ff ff ff    	mov    %edi,-0xa8(%ebp)
  2005c1:	89 85 5c ff ff ff    	mov    %eax,-0xa4(%ebp)
  2005c7:	c7 85 60 ff ff ff 00 	movl   $0x0,-0xa0(%ebp)
  2005ce:	00 00 00 
  2005d1:	c7 85 64 ff ff ff 00 	movl   $0x0,-0x9c(%ebp)
  2005d8:	00 00 00 
  2005db:	c7 85 68 ff ff ff 00 	movl   $0x0,-0x98(%ebp)
  2005e2:	00 00 00 
  2005e5:	60                   	pusha  
  2005e6:	8b 85 50 ff ff ff    	mov    -0xb0(%ebp),%eax
  2005ec:	8b 9d 54 ff ff ff    	mov    -0xac(%ebp),%ebx
  2005f2:	8b 8d 58 ff ff ff    	mov    -0xa8(%ebp),%ecx
  2005f8:	8b 95 5c ff ff ff    	mov    -0xa4(%ebp),%edx
  2005fe:	8b bd 60 ff ff ff    	mov    -0xa0(%ebp),%edi
  200604:	8b b5 64 ff ff ff    	mov    -0x9c(%ebp),%esi
  20060a:	cd 80                	int    $0x80
  20060c:	89 85 68 ff ff ff    	mov    %eax,-0x98(%ebp)
  200612:	61                   	popa   
  200613:	e9 c7 fe ff ff       	jmp    2004df <printf+0x2ef>
  200618:	c6 45 84 2d          	movb   $0x2d,-0x7c(%ebp)
  20061c:	c7 05 b0 19 20 00 01 	movl   $0x1,0x2019b0
  200623:	00 00 00 
  200626:	f7 d8                	neg    %eax
  200628:	89 fa                	mov    %edi,%edx
  20062a:	e8 b1 fa ff ff       	call   2000e0 <printint.part.0>
  20062f:	a1 b0 19 20 00       	mov    0x2019b0,%eax
  200634:	c6 44 05 84 00       	movb   $0x0,-0x7c(%ebp,%eax,1)
  200639:	c7 85 08 ff ff ff 04 	movl   $0x4,-0xf8(%ebp)
  200640:	00 00 00 
  200643:	c7 85 0c ff ff ff 01 	movl   $0x1,-0xf4(%ebp)
  20064a:	00 00 00 
  20064d:	89 bd 10 ff ff ff    	mov    %edi,-0xf0(%ebp)
  200653:	89 85 14 ff ff ff    	mov    %eax,-0xec(%ebp)
  200659:	c7 85 18 ff ff ff 00 	movl   $0x0,-0xe8(%ebp)
  200660:	00 00 00 
  200663:	c7 85 1c ff ff ff 00 	movl   $0x0,-0xe4(%ebp)
  20066a:	00 00 00 
  20066d:	c7 85 68 ff ff ff 00 	movl   $0x0,-0x98(%ebp)
  200674:	00 00 00 
  200677:	60                   	pusha  
  200678:	8b 85 08 ff ff ff    	mov    -0xf8(%ebp),%eax
  20067e:	8b 9d 0c ff ff ff    	mov    -0xf4(%ebp),%ebx
  200684:	8b 8d 10 ff ff ff    	mov    -0xf0(%ebp),%ecx
  20068a:	8b 95 14 ff ff ff    	mov    -0xec(%ebp),%edx
  200690:	8b bd 18 ff ff ff    	mov    -0xe8(%ebp),%edi
  200696:	8b b5 1c ff ff ff    	mov    -0xe4(%ebp),%esi
  20069c:	cd 80                	int    $0x80
  20069e:	89 85 68 ff ff ff    	mov    %eax,-0x98(%ebp)
  2006a4:	61                   	popa   
  2006a5:	8b 8d b4 fe ff ff    	mov    -0x14c(%ebp),%ecx
  2006ab:	e9 be fd ff ff       	jmp    20046e <printf+0x27e>

002006b0 <fork>:
  2006b0:	55                   	push   %ebp
  2006b1:	89 e5                	mov    %esp,%ebp
  2006b3:	83 ec 20             	sub    $0x20,%esp
  2006b6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  2006bd:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  2006c4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  2006cb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  2006d2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  2006d9:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  2006e0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  2006e7:	60                   	pusha  
  2006e8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  2006eb:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  2006ee:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  2006f1:	8b 55 f0             	mov    -0x10(%ebp),%edx
  2006f4:	8b 7d f4             	mov    -0xc(%ebp),%edi
  2006f7:	8b 75 f8             	mov    -0x8(%ebp),%esi
  2006fa:	cd 80                	int    $0x80
  2006fc:	89 45 fc             	mov    %eax,-0x4(%ebp)
  2006ff:	61                   	popa   
  200700:	31 c0                	xor    %eax,%eax
  200702:	c9                   	leave  
  200703:	c3                   	ret    

00200704 <sleep>:
  200704:	55                   	push   %ebp
  200705:	89 e5                	mov    %esp,%ebp
  200707:	83 ec 20             	sub    $0x20,%esp
  20070a:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
  200711:	8b 45 08             	mov    0x8(%ebp),%eax
  200714:	89 45 e8             	mov    %eax,-0x18(%ebp)
  200717:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  20071e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  200725:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  20072c:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  200733:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  20073a:	60                   	pusha  
  20073b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  20073e:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  200741:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  200744:	8b 55 f0             	mov    -0x10(%ebp),%edx
  200747:	8b 7d f4             	mov    -0xc(%ebp),%edi
  20074a:	8b 75 f8             	mov    -0x8(%ebp),%esi
  20074d:	cd 80                	int    $0x80
  20074f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  200752:	61                   	popa   
  200753:	31 c0                	xor    %eax,%eax
  200755:	c9                   	leave  
  200756:	c3                   	ret    
  200757:	90                   	nop

00200758 <exit>:
  200758:	55                   	push   %ebp
  200759:	89 e5                	mov    %esp,%ebp
  20075b:	83 ec 20             	sub    $0x20,%esp
  20075e:	c7 45 e4 02 00 00 00 	movl   $0x2,-0x1c(%ebp)
  200765:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  20076c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  200773:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  20077a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  200781:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  200788:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  20078f:	60                   	pusha  
  200790:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  200793:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  200796:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  200799:	8b 55 f0             	mov    -0x10(%ebp),%edx
  20079c:	8b 7d f4             	mov    -0xc(%ebp),%edi
  20079f:	8b 75 f8             	mov    -0x8(%ebp),%esi
  2007a2:	cd 80                	int    $0x80
  2007a4:	89 45 fc             	mov    %eax,-0x4(%ebp)
  2007a7:	61                   	popa   
  2007a8:	31 c0                	xor    %eax,%eax
  2007aa:	c9                   	leave  
  2007ab:	c3                   	ret    
