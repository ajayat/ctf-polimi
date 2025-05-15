
square-earther:     format de fichier elf64-x86-64


Déassemblage de la section .init :

0000000000001000 <.init>:
    1000:	endbr64
    1004:	sub    $0x8,%rsp
    1008:	mov    0x2fd9(%rip),%rax        # 3fe8 <exit@plt+0x2e98>
    100f:	test   %rax,%rax
    1012:	je     1016 <__cxa_finalize@plt-0xaa>
    1014:	call   *%rax
    1016:	add    $0x8,%rsp
    101a:	ret

Déassemblage de la section .plt :

0000000000001020 <.plt>:
    1020:	push   0x2f5a(%rip)        # 3f80 <exit@plt+0x2e30>
    1026:	jmp    *0x2f5c(%rip)        # 3f88 <exit@plt+0x2e38>
    102c:	nopl   0x0(%rax)
    1030:	endbr64
    1034:	push   $0x0
    1039:	jmp    1020 <__cxa_finalize@plt-0xa0>
    103e:	xchg   %ax,%ax
    1040:	endbr64
    1044:	push   $0x1
    1049:	jmp    1020 <__cxa_finalize@plt-0xa0>
    104e:	xchg   %ax,%ax
    1050:	endbr64
    1054:	push   $0x2
    1059:	jmp    1020 <__cxa_finalize@plt-0xa0>
    105e:	xchg   %ax,%ax
    1060:	endbr64
    1064:	push   $0x3
    1069:	jmp    1020 <__cxa_finalize@plt-0xa0>
    106e:	xchg   %ax,%ax
    1070:	endbr64
    1074:	push   $0x4
    1079:	jmp    1020 <__cxa_finalize@plt-0xa0>
    107e:	xchg   %ax,%ax
    1080:	endbr64
    1084:	push   $0x5
    1089:	jmp    1020 <__cxa_finalize@plt-0xa0>
    108e:	xchg   %ax,%ax
    1090:	endbr64
    1094:	push   $0x6
    1099:	jmp    1020 <__cxa_finalize@plt-0xa0>
    109e:	xchg   %ax,%ax
    10a0:	endbr64
    10a4:	push   $0x7
    10a9:	jmp    1020 <__cxa_finalize@plt-0xa0>
    10ae:	xchg   %ax,%ax
    10b0:	endbr64
    10b4:	push   $0x8
    10b9:	jmp    1020 <__cxa_finalize@plt-0xa0>
    10be:	xchg   %ax,%ax

Déassemblage de la section .plt.got :

00000000000010c0 <__cxa_finalize@plt>:
    10c0:	endbr64
    10c4:	jmp    *0x2f2e(%rip)        # 3ff8 <exit@plt+0x2ea8>
    10ca:	nopw   0x0(%rax,%rax,1)

Déassemblage de la section .plt.sec :

00000000000010d0 <putchar@plt>:
    10d0:	endbr64
    10d4:	jmp    *0x2eb6(%rip)        # 3f90 <exit@plt+0x2e40>
    10da:	nopw   0x0(%rax,%rax,1)

00000000000010e0 <puts@plt>:
    10e0:	endbr64
    10e4:	jmp    *0x2eae(%rip)        # 3f98 <exit@plt+0x2e48>
    10ea:	nopw   0x0(%rax,%rax,1)

00000000000010f0 <__stack_chk_fail@plt>:
    10f0:	endbr64
    10f4:	jmp    *0x2ea6(%rip)        # 3fa0 <exit@plt+0x2e50>
    10fa:	nopw   0x0(%rax,%rax,1)

0000000000001100 <system@plt>:
    1100:	endbr64
    1104:	jmp    *0x2e9e(%rip)        # 3fa8 <exit@plt+0x2e58>
    110a:	nopw   0x0(%rax,%rax,1)

0000000000001110 <printf@plt>:
    1110:	endbr64
    1114:	jmp    *0x2e96(%rip)        # 3fb0 <exit@plt+0x2e60>
    111a:	nopw   0x0(%rax,%rax,1)

0000000000001120 <alarm@plt>:
    1120:	endbr64
    1124:	jmp    *0x2e8e(%rip)        # 3fb8 <exit@plt+0x2e68>
    112a:	nopw   0x0(%rax,%rax,1)

0000000000001130 <setvbuf@plt>:
    1130:	endbr64
    1134:	jmp    *0x2e86(%rip)        # 3fc0 <exit@plt+0x2e70>
    113a:	nopw   0x0(%rax,%rax,1)

0000000000001140 <__isoc99_scanf@plt>:
    1140:	endbr64
    1144:	jmp    *0x2e7e(%rip)        # 3fc8 <exit@plt+0x2e78>
    114a:	nopw   0x0(%rax,%rax,1)

0000000000001150 <exit@plt>:
    1150:	endbr64
    1154:	jmp    *0x2e76(%rip)        # 3fd0 <exit@plt+0x2e80>
    115a:	nopw   0x0(%rax,%rax,1)

Déassemblage de la section .text :

0000000000001160 <.text>:
    1160:	endbr64
    1164:	xor    %ebp,%ebp
    1166:	mov    %rdx,%r9
    1169:	pop    %rsi
    116a:	mov    %rsp,%rdx
    116d:	and    $0xfffffffffffffff0,%rsp
    1171:	push   %rax
    1172:	push   %rsp
    1173:	xor    %r8d,%r8d
    1176:	xor    %ecx,%ecx
    1178:	lea    0x63b(%rip),%rdi        # 17ba <exit@plt+0x66a>
    117f:	call   *0x2e53(%rip)        # 3fd8 <exit@plt+0x2e88>
    1185:	hlt
    1186:	cs nopw 0x0(%rax,%rax,1)
    1190:	lea    0x2e79(%rip),%rdi        # 4010 <exit@plt+0x2ec0>
    1197:	lea    0x2e72(%rip),%rax        # 4010 <exit@plt+0x2ec0>
    119e:	cmp    %rdi,%rax
    11a1:	je     11b8 <exit@plt+0x68>
    11a3:	mov    0x2e36(%rip),%rax        # 3fe0 <exit@plt+0x2e90>
    11aa:	test   %rax,%rax
    11ad:	je     11b8 <exit@plt+0x68>
    11af:	jmp    *%rax
    11b1:	nopl   0x0(%rax)
    11b8:	ret
    11b9:	nopl   0x0(%rax)
    11c0:	lea    0x2e49(%rip),%rdi        # 4010 <exit@plt+0x2ec0>
    11c7:	lea    0x2e42(%rip),%rsi        # 4010 <exit@plt+0x2ec0>
    11ce:	sub    %rdi,%rsi
    11d1:	mov    %rsi,%rax
    11d4:	shr    $0x3f,%rsi
    11d8:	sar    $0x3,%rax
    11dc:	add    %rax,%rsi
    11df:	sar    $1,%rsi
    11e2:	je     11f8 <exit@plt+0xa8>
    11e4:	mov    0x2e05(%rip),%rax        # 3ff0 <exit@plt+0x2ea0>
    11eb:	test   %rax,%rax
    11ee:	je     11f8 <exit@plt+0xa8>
    11f0:	jmp    *%rax
    11f2:	nopw   0x0(%rax,%rax,1)
    11f8:	ret
    11f9:	nopl   0x0(%rax)
    1200:	endbr64
    1204:	cmpb   $0x0,0x2e3d(%rip)        # 4048 <stderr@GLIBC_2.2.5+0x8>
    120b:	jne    1238 <exit@plt+0xe8>
    120d:	push   %rbp
    120e:	cmpq   $0x0,0x2de2(%rip)        # 3ff8 <exit@plt+0x2ea8>
    1216:	mov    %rsp,%rbp
    1219:	je     1227 <exit@plt+0xd7>
    121b:	mov    0x2de6(%rip),%rdi        # 4008 <exit@plt+0x2eb8>
    1222:	call   10c0 <__cxa_finalize@plt>
    1227:	call   1190 <exit@plt+0x40>
    122c:	movb   $0x1,0x2e15(%rip)        # 4048 <stderr@GLIBC_2.2.5+0x8>
    1233:	pop    %rbp
    1234:	ret
    1235:	nopl   (%rax)
    1238:	ret
    1239:	nopl   0x0(%rax)
    1240:	endbr64
    1244:	jmp    11c0 <exit@plt+0x70>
    1249:	endbr64
    124d:	push   %rbp
    124e:	mov    %rsp,%rbp
    1251:	sub    $0x10,%rsp
    1255:	mov    0x2dd4(%rip),%rax        # 4030 <stdin@GLIBC_2.2.5>
    125c:	mov    $0x0,%ecx
    1261:	mov    $0x2,%edx
    1266:	mov    $0x0,%esi
    126b:	mov    %rax,%rdi
    126e:	call   1130 <setvbuf@plt>
    1273:	mov    0x2da6(%rip),%rax        # 4020 <stdout@GLIBC_2.2.5>
    127a:	mov    $0x0,%ecx
    127f:	mov    $0x2,%edx
    1284:	mov    $0x0,%esi
    1289:	mov    %rax,%rdi
    128c:	call   1130 <setvbuf@plt>
    1291:	mov    0x2da8(%rip),%rax        # 4040 <stderr@GLIBC_2.2.5>
    1298:	mov    $0x0,%ecx
    129d:	mov    $0x2,%edx
    12a2:	mov    $0x0,%esi
    12a7:	mov    %rax,%rdi
    12aa:	call   1130 <setvbuf@plt>
    12af:	mov    $0x258,%edi
    12b4:	call   1120 <alarm@plt>
    12b9:	movl   $0x0,-0xc(%rbp)
    12c0:	jmp    12fc <exit@plt+0x1ac>
    12c2:	mov    -0xc(%rbp),%eax
    12c5:	cltq
    12c7:	lea    0x0(,%rax,8),%rdx
    12cf:	lea    0x2dca(%rip),%rax        # 40a0 <stderr@GLIBC_2.2.5+0x60>
    12d6:	movl   $0xffffffff,(%rdx,%rax,1)
    12dd:	mov    -0xc(%rbp),%eax
    12e0:	cltq
    12e2:	lea    0x0(,%rax,8),%rdx
    12ea:	lea    0x2db3(%rip),%rax        # 40a4 <stderr@GLIBC_2.2.5+0x64>
    12f1:	movl   $0xffffffff,(%rdx,%rax,1)
    12f8:	addl   $0x1,-0xc(%rbp)
    12fc:	cmpl   $0x18,-0xc(%rbp)
    1300:	jle    12c2 <exit@plt+0x172>
    1302:	movl   $0x1,0x2d94(%rip)        # 40a0 <stderr@GLIBC_2.2.5+0x60>
    130c:	movl   $0x1,0x2d8e(%rip)        # 40a4 <stderr@GLIBC_2.2.5+0x64>
    1316:	movl   $0x4,0x2d98(%rip)        # 40b8 <stderr@GLIBC_2.2.5+0x78>
    1320:	movl   $0x3,0x2d92(%rip)        # 40bc <stderr@GLIBC_2.2.5+0x7c>
    132a:	movl   $0x4,0x2dd4(%rip)        # 4108 <stderr@GLIBC_2.2.5+0xc8>
    1334:	movl   $0x1,0x2dce(%rip)        # 410c <stderr@GLIBC_2.2.5+0xcc>
    133e:	movl   $0x4,0x2e18(%rip)        # 4160 <stderr@GLIBC_2.2.5+0x120>
    1348:	movl   $0x4,0x2e12(%rip)        # 4164 <stderr@GLIBC_2.2.5+0x124>
    1352:	mov    0x2d47(%rip),%rax        # 40a0 <stderr@GLIBC_2.2.5+0x60>
    1359:	mov    %rax,0x2e08(%rip)        # 4168 <stderr@GLIBC_2.2.5+0x128>
    1360:	movl   $0x0,-0x8(%rbp)
    1367:	jmp    13d0 <exit@plt+0x280>
    1369:	movl   $0x0,-0x4(%rbp)
    1370:	jmp    13c6 <exit@plt+0x276>
    1372:	mov    -0x4(%rbp),%eax
    1375:	movslq %eax,%rcx
    1378:	mov    -0x8(%rbp),%eax
    137b:	movslq %eax,%rdx
    137e:	mov    %rdx,%rax
    1381:	shl    $0x2,%rax
    1385:	add    %rdx,%rax
    1388:	add    %rcx,%rax
    138b:	lea    (%rax,%rax,1),%rdx
    138f:	lea    0x2cca(%rip),%rax        # 4060 <stderr@GLIBC_2.2.5+0x20>
    1396:	movb   $0x0,(%rdx,%rax,1)
    139a:	mov    -0x4(%rbp),%eax
    139d:	movslq %eax,%rcx
    13a0:	mov    -0x8(%rbp),%eax
    13a3:	movslq %eax,%rdx
    13a6:	mov    %rdx,%rax
    13a9:	shl    $0x2,%rax
    13ad:	add    %rdx,%rax
    13b0:	add    %rcx,%rax
    13b3:	lea    (%rax,%rax,1),%rdx
    13b7:	lea    0x2ca3(%rip),%rax        # 4061 <stderr@GLIBC_2.2.5+0x21>
    13be:	movb   $0x0,(%rdx,%rax,1)
    13c2:	addl   $0x1,-0x4(%rbp)
    13c6:	cmpl   $0x4,-0x4(%rbp)
    13ca:	jle    1372 <exit@plt+0x222>
    13cc:	addl   $0x1,-0x8(%rbp)
    13d0:	cmpl   $0x4,-0x8(%rbp)
    13d4:	jle    1369 <exit@plt+0x219>
    13d6:	mov    0x2d8c(%rip),%eax        # 4168 <stderr@GLIBC_2.2.5+0x128>
    13dc:	mov    0x2d8a(%rip),%edx        # 416c <stderr@GLIBC_2.2.5+0x12c>
    13e2:	movslq %edx,%rcx
    13e5:	movslq %eax,%rdx
    13e8:	mov    %rdx,%rax
    13eb:	shl    $0x2,%rax
    13ef:	add    %rdx,%rax
    13f2:	add    %rcx,%rax
    13f5:	lea    (%rax,%rax,1),%rdx
    13f9:	lea    0x2c60(%rip),%rax        # 4060 <stderr@GLIBC_2.2.5+0x20>
    1400:	movb   $0x1,(%rdx,%rax,1)
    1404:	mov    0x2d5e(%rip),%eax        # 4168 <stderr@GLIBC_2.2.5+0x128>
    140a:	mov    0x2d5c(%rip),%edx        # 416c <stderr@GLIBC_2.2.5+0x12c>
    1410:	movslq %edx,%rcx
    1413:	movslq %eax,%rdx
    1416:	mov    %rdx,%rax
    1419:	shl    $0x2,%rax
    141d:	add    %rdx,%rax
    1420:	add    %rcx,%rax
    1423:	lea    (%rax,%rax,1),%rdx
    1427:	lea    0x2c33(%rip),%rax        # 4061 <stderr@GLIBC_2.2.5+0x21>
    142e:	movb   $0x1,(%rdx,%rax,1)
    1432:	nop
    1433:	leave
    1434:	ret
    1435:	endbr64
    1439:	push   %rbp
    143a:	mov    %rsp,%rbp
    143d:	sub    $0x20,%rsp
    1441:	lea    0xbc0(%rip),%rax        # 2008 <exit@plt+0xeb8>
    1448:	mov    %rax,%rdi
    144b:	call   10e0 <puts@plt>
    1450:	lea    0xbd6(%rip),%rax        # 202d <exit@plt+0xedd>
    1457:	mov    %rax,%rdi
    145a:	mov    $0x0,%eax
    145f:	call   1110 <printf@plt>
    1464:	movl   $0x0,-0x14(%rbp)
    146b:	jmp    148a <exit@plt+0x33a>
    146d:	mov    -0x14(%rbp),%eax
    1470:	mov    %eax,%esi
    1472:	lea    0xbb7(%rip),%rax        # 2030 <exit@plt+0xee0>
    1479:	mov    %rax,%rdi
    147c:	mov    $0x0,%eax
    1481:	call   1110 <printf@plt>
    1486:	addl   $0x1,-0x14(%rbp)
    148a:	cmpl   $0x4,-0x14(%rbp)
    148e:	jbe    146d <exit@plt+0x31d>
    1490:	mov    $0xa,%edi
    1495:	call   10d0 <putchar@plt>
    149a:	movl   $0x0,-0x10(%rbp)
    14a1:	jmp    152c <exit@plt+0x3dc>
    14a6:	mov    -0x10(%rbp),%eax
    14a9:	mov    %eax,%esi
    14ab:	lea    0xb82(%rip),%rax        # 2034 <exit@plt+0xee4>
    14b2:	mov    %rax,%rdi
    14b5:	mov    $0x0,%eax
    14ba:	call   1110 <printf@plt>
    14bf:	movl   $0x0,-0xc(%rbp)
    14c6:	jmp    1518 <exit@plt+0x3c8>
    14c8:	mov    0x2c9a(%rip),%eax        # 4168 <stderr@GLIBC_2.2.5+0x128>
    14ce:	cmp    %eax,-0x10(%rbp)
    14d1:	jne    14f4 <exit@plt+0x3a4>
    14d3:	mov    0x2c93(%rip),%eax        # 416c <stderr@GLIBC_2.2.5+0x12c>
    14d9:	cmp    %eax,-0xc(%rbp)
    14dc:	jne    14f4 <exit@plt+0x3a4>
    14de:	lea    0xb48(%rip),%rax        # 202d <exit@plt+0xedd>
    14e5:	mov    %rax,%rdi
    14e8:	mov    $0x0,%eax
    14ed:	call   1110 <printf@plt>
    14f2:	jmp    1514 <exit@plt+0x3c4>
    14f4:	mov    -0xc(%rbp),%eax
    14f7:	mov    %eax,-0x8(%rbp)
    14fa:	mov    -0x10(%rbp),%eax
    14fd:	mov    %eax,-0x4(%rbp)
    1500:	lea    0xb32(%rip),%rax        # 2039 <exit@plt+0xee9>
    1507:	mov    %rax,%rdi
    150a:	mov    $0x0,%eax
    150f:	call   1110 <printf@plt>
    1514:	addl   $0x1,-0xc(%rbp)
    1518:	cmpl   $0x4,-0xc(%rbp)
    151c:	jbe    14c8 <exit@plt+0x378>
    151e:	mov    $0xa,%edi
    1523:	call   10d0 <putchar@plt>
    1528:	addl   $0x1,-0x10(%rbp)
    152c:	cmpl   $0x4,-0x10(%rbp)
    1530:	jbe    14a6 <exit@plt+0x356>
    1536:	nop
    1537:	nop
    1538:	leave
    1539:	ret
    153a:	endbr64
    153e:	push   %rbp
    153f:	mov    %rsp,%rbp
    1542:	mov    %rdi,-0x18(%rbp)
    1546:	mov    %rsi,-0x20(%rbp)
    154a:	mov    -0x20(%rbp),%rax
    154e:	mov    (%rax),%edx
    1550:	mov    -0x18(%rbp),%rax
    1554:	mov    (%rax),%eax
    1556:	sub    %eax,%edx
    1558:	mov    %edx,-0x10(%rbp)
    155b:	mov    -0x20(%rbp),%rax
    155f:	mov    0x4(%rax),%edx
    1562:	mov    -0x18(%rbp),%rax
    1566:	mov    0x4(%rax),%eax
    1569:	sub    %eax,%edx
    156b:	mov    %edx,-0xc(%rbp)
    156e:	mov    -0x20(%rbp),%rax
    1572:	mov    (%rax),%edx
    1574:	mov    -0x20(%rbp),%rax
    1578:	mov    0x4(%rax),%eax
    157b:	movslq %eax,%rcx
    157e:	movslq %edx,%rdx
    1581:	mov    %rdx,%rax
    1584:	shl    $0x2,%rax
    1588:	add    %rdx,%rax
    158b:	add    %rcx,%rax
    158e:	lea    (%rax,%rax,1),%rdx
    1592:	lea    0x2ac7(%rip),%rax        # 4060 <stderr@GLIBC_2.2.5+0x20>
    1599:	add    %rdx,%rax
    159c:	mov    %rax,-0x8(%rbp)
    15a0:	mov    -0x10(%rbp),%eax
    15a3:	imul   %eax,%eax
    15a6:	mov    %eax,%edx
    15a8:	mov    -0xc(%rbp),%eax
    15ab:	imul   %eax,%eax
    15ae:	add    %edx,%eax
    15b0:	cmp    $0x5,%eax
    15b3:	je     15bf <exit@plt+0x46f>
    15b5:	mov    -0x8(%rbp),%rax
    15b9:	movb   $0x0,0x1(%rax)
    15bd:	jmp    15c7 <exit@plt+0x477>
    15bf:	mov    -0x8(%rbp),%rax
    15c3:	movb   $0x1,0x1(%rax)
    15c7:	nop
    15c8:	pop    %rbp
    15c9:	ret
    15ca:	endbr64
    15ce:	push   %rbp
    15cf:	mov    %rsp,%rbp
    15d2:	sub    $0x20,%rsp
    15d6:	movl   $0x0,-0x1c(%rbp)
    15dd:	movl   $0x7fffffff,-0x18(%rbp)
    15e4:	movl   $0x0,-0x14(%rbp)
    15eb:	movl   $0x0,-0x10(%rbp)
    15f2:	jmp    16ff <exit@plt+0x5af>
    15f7:	movl   $0x0,-0xc(%rbp)
    15fe:	jmp    16f1 <exit@plt+0x5a1>
    1603:	mov    -0xc(%rbp),%eax
    1606:	movslq %eax,%rcx
    1609:	mov    -0x10(%rbp),%eax
    160c:	movslq %eax,%rdx
    160f:	mov    %rdx,%rax
    1612:	shl    $0x2,%rax
    1616:	add    %rdx,%rax
    1619:	add    %rcx,%rax
    161c:	lea    (%rax,%rax,1),%rdx
    1620:	lea    0x2a39(%rip),%rax        # 4060 <stderr@GLIBC_2.2.5+0x20>
    1627:	movzbl (%rdx,%rax,1),%eax
    162b:	movsbl %al,%eax
    162e:	add    %eax,-0x1c(%rbp)
    1631:	mov    -0xc(%rbp),%eax
    1634:	movslq %eax,%rcx
    1637:	mov    -0x10(%rbp),%eax
    163a:	movslq %eax,%rdx
    163d:	mov    %rdx,%rax
    1640:	shl    $0x2,%rax
    1644:	add    %rdx,%rax
    1647:	add    %rcx,%rax
    164a:	lea    (%rax,%rax,1),%rdx
    164e:	lea    0x2a0b(%rip),%rax        # 4060 <stderr@GLIBC_2.2.5+0x20>
    1655:	movzbl (%rdx,%rax,1),%eax
    1659:	movsbl %al,%eax
    165c:	cmp    %eax,-0x18(%rbp)
    165f:	jle    168f <exit@plt+0x53f>
    1661:	mov    -0xc(%rbp),%eax
    1664:	movslq %eax,%rcx
    1667:	mov    -0x10(%rbp),%eax
    166a:	movslq %eax,%rdx
    166d:	mov    %rdx,%rax
    1670:	shl    $0x2,%rax
    1674:	add    %rdx,%rax
    1677:	add    %rcx,%rax
    167a:	lea    (%rax,%rax,1),%rdx
    167e:	lea    0x29db(%rip),%rax        # 4060 <stderr@GLIBC_2.2.5+0x20>
    1685:	movzbl (%rdx,%rax,1),%eax
    1689:	movsbl %al,%eax
    168c:	mov    %eax,-0x18(%rbp)
    168f:	mov    -0xc(%rbp),%eax
    1692:	movslq %eax,%rcx
    1695:	mov    -0x10(%rbp),%eax
    1698:	movslq %eax,%rdx
    169b:	mov    %rdx,%rax
    169e:	shl    $0x2,%rax
    16a2:	add    %rdx,%rax
    16a5:	add    %rcx,%rax
    16a8:	lea    (%rax,%rax,1),%rdx
    16ac:	lea    0x29ad(%rip),%rax        # 4060 <stderr@GLIBC_2.2.5+0x20>
    16b3:	movzbl (%rdx,%rax,1),%eax
    16b7:	movsbl %al,%eax
    16ba:	cmp    %eax,-0x14(%rbp)
    16bd:	jge    16ed <exit@plt+0x59d>
    16bf:	mov    -0xc(%rbp),%eax
    16c2:	movslq %eax,%rcx
    16c5:	mov    -0x10(%rbp),%eax
    16c8:	movslq %eax,%rdx
    16cb:	mov    %rdx,%rax
    16ce:	shl    $0x2,%rax
    16d2:	add    %rdx,%rax
    16d5:	add    %rcx,%rax
    16d8:	lea    (%rax,%rax,1),%rdx
    16dc:	lea    0x297d(%rip),%rax        # 4060 <stderr@GLIBC_2.2.5+0x20>
    16e3:	movzbl (%rdx,%rax,1),%eax
    16e7:	movsbl %al,%eax
    16ea:	mov    %eax,-0x14(%rbp)
    16ed:	addl   $0x1,-0xc(%rbp)
    16f1:	cmpl   $0x4,-0xc(%rbp)
    16f5:	jle    1603 <exit@plt+0x4b3>
    16fb:	addl   $0x1,-0x10(%rbp)
    16ff:	cmpl   $0x4,-0x10(%rbp)
    1703:	jle    15f7 <exit@plt+0x4a7>
    1709:	cmpl   $0x19,-0x1c(%rbp)
    170d:	je     1728 <exit@plt+0x5d8>
    170f:	lea    0x926(%rip),%rax        # 203c <exit@plt+0xeec>
    1716:	mov    %rax,%rdi
    1719:	call   10e0 <puts@plt>
    171e:	mov    $0x1,%edi
    1723:	call   1150 <exit@plt>
    1728:	mov    -0x14(%rbp),%eax
    172b:	sub    -0x18(%rbp),%eax
    172e:	test   %eax,%eax
    1730:	jle    174b <exit@plt+0x5fb>
    1732:	lea    0x903(%rip),%rax        # 203c <exit@plt+0xeec>
    1739:	mov    %rax,%rdi
    173c:	call   10e0 <puts@plt>
    1741:	mov    $0x1,%edi
    1746:	call   1150 <exit@plt>
    174b:	movl   $0x0,-0x8(%rbp)
    1752:	jmp    17b0 <exit@plt+0x660>
    1754:	movl   $0x0,-0x4(%rbp)
    175b:	jmp    17a6 <exit@plt+0x656>
    175d:	mov    -0x4(%rbp),%eax
    1760:	movslq %eax,%rcx
    1763:	mov    -0x8(%rbp),%eax
    1766:	movslq %eax,%rdx
    1769:	mov    %rdx,%rax
    176c:	shl    $0x2,%rax
    1770:	add    %rdx,%rax
    1773:	add    %rcx,%rax
    1776:	lea    (%rax,%rax,1),%rdx
    177a:	lea    0x28e0(%rip),%rax        # 4061 <stderr@GLIBC_2.2.5+0x21>
    1781:	movzbl (%rdx,%rax,1),%eax
    1785:	test   %al,%al
    1787:	jne    17a2 <exit@plt+0x652>
    1789:	lea    0x8ac(%rip),%rax        # 203c <exit@plt+0xeec>
    1790:	mov    %rax,%rdi
    1793:	call   10e0 <puts@plt>
    1798:	mov    $0x1,%edi
    179d:	call   1150 <exit@plt>
    17a2:	addl   $0x1,-0x4(%rbp)
    17a6:	cmpl   $0x4,-0x4(%rbp)
    17aa:	jle    175d <exit@plt+0x60d>
    17ac:	addl   $0x1,-0x8(%rbp)
    17b0:	cmpl   $0x4,-0x8(%rbp)
    17b4:	jle    1754 <exit@plt+0x604>
    17b6:	nop
    17b7:	nop
    17b8:	leave
    17b9:	ret
    17ba:	endbr64
    17be:	push   %rbp
    17bf:	mov    %rsp,%rbp
    17c2:	sub    $0x30,%rsp
    17c6:	mov    %edi,-0x24(%rbp)
    17c9:	mov    %rsi,-0x30(%rbp)
    17cd:	mov    %fs:0x28,%rax
    17d6:	mov    %rax,-0x8(%rbp)
    17da:	xor    %eax,%eax
    17dc:	mov    $0x0,%eax
    17e1:	call   1249 <exit@plt+0xf9>
    17e6:	lea    0x863(%rip),%rax        # 2050 <exit@plt+0xf00>
    17ed:	mov    %rax,%rdi
    17f0:	call   10e0 <puts@plt>
    17f5:	lea    0x884(%rip),%rax        # 2080 <exit@plt+0xf30>
    17fc:	mov    %rax,%rdi
    17ff:	call   10e0 <puts@plt>
    1804:	lea    0x8a5(%rip),%rax        # 20b0 <exit@plt+0xf60>
    180b:	mov    %rax,%rdi
    180e:	call   10e0 <puts@plt>
    1813:	movl   $0x0,-0x18(%rbp)
    181a:	mov    $0x0,%eax
    181f:	call   1435 <exit@plt+0x2e5>
    1824:	mov    0x2942(%rip),%edx        # 416c <stderr@GLIBC_2.2.5+0x12c>
    182a:	mov    0x2938(%rip),%eax        # 4168 <stderr@GLIBC_2.2.5+0x128>
    1830:	mov    %eax,%esi
    1832:	lea    0x8be(%rip),%rax        # 20f7 <exit@plt+0xfa7>
    1839:	mov    %rax,%rdi
    183c:	mov    $0x0,%eax
    1841:	call   1110 <printf@plt>
    1846:	lea    0x8c3(%rip),%rax        # 2110 <exit@plt+0xfc0>
    184d:	mov    %rax,%rdi
    1850:	call   10e0 <puts@plt>
    1855:	lea    -0x10(%rbp),%rax
    1859:	lea    0x4(%rax),%rdx
    185d:	lea    -0x10(%rbp),%rax
    1861:	mov    %rax,%rsi
    1864:	lea    0x8cf(%rip),%rax        # 213a <exit@plt+0xfea>
    186b:	mov    %rax,%rdi
    186e:	mov    $0x0,%eax
    1873:	call   1140 <__isoc99_scanf@plt>
    1878:	mov    -0x10(%rbp),%eax
    187b:	cmp    $0xffffffff,%eax
    187e:	jne    18eb <exit@plt+0x79b>
    1880:	mov    -0xc(%rbp),%eax
    1883:	cmp    $0xffffffff,%eax
    1886:	jne    18eb <exit@plt+0x79b>
    1888:	mov    $0x0,%eax
    188d:	call   15ca <exit@plt+0x47a>
    1892:	lea    0x8a7(%rip),%rax        # 2140 <exit@plt+0xff0>
    1899:	mov    %rax,%rdi
    189c:	call   10e0 <puts@plt>
    18a1:	lea    0x8b0(%rip),%rax        # 2158 <exit@plt+0x1008>
    18a8:	mov    %rax,%rdi
    18ab:	mov    $0x0,%eax
    18b0:	call   1110 <printf@plt>
    18b5:	lea    0x8b0(%rip),%rax        # 216c <exit@plt+0x101c>
    18bc:	mov    %rax,%rdi
    18bf:	call   1100 <system@plt>
    18c4:	mov    $0xa,%edi
    18c9:	call   10d0 <putchar@plt>
    18ce:	mov    $0x0,%eax
    18d3:	mov    -0x8(%rbp),%rdx
    18d7:	sub    %fs:0x28,%rdx
    18e0:	je     1a5b <exit@plt+0x90b>
    18e6:	jmp    1a56 <exit@plt+0x906>
    18eb:	mov    -0x10(%rbp),%eax
    18ee:	test   %eax,%eax
    18f0:	js     1909 <exit@plt+0x7b9>
    18f2:	mov    -0x10(%rbp),%eax
    18f5:	cmp    $0x4,%eax
    18f8:	jg     1909 <exit@plt+0x7b9>
    18fa:	mov    -0xc(%rbp),%eax
    18fd:	test   %eax,%eax
    18ff:	js     1909 <exit@plt+0x7b9>
    1901:	mov    -0xc(%rbp),%eax
    1904:	cmp    $0x4,%eax
    1907:	jle    1922 <exit@plt+0x7d2>
    1909:	lea    0x865(%rip),%rax        # 2175 <exit@plt+0x1025>
    1910:	mov    %rax,%rdi
    1913:	call   10e0 <puts@plt>
    1918:	mov    $0x1,%edi
    191d:	call   1150 <exit@plt>
    1922:	lea    -0x10(%rbp),%rax
    1926:	mov    %rax,%rsi
    1929:	lea    0x2838(%rip),%rax        # 4168 <stderr@GLIBC_2.2.5+0x128>
    1930:	mov    %rax,%rdi
    1933:	call   153a <exit@plt+0x3ea>
    1938:	mov    -0x10(%rbp),%rax
    193c:	mov    %rax,0x2825(%rip)        # 4168 <stderr@GLIBC_2.2.5+0x128>
    1943:	mov    0x281f(%rip),%edx        # 4168 <stderr@GLIBC_2.2.5+0x128>
    1949:	mov    0x281d(%rip),%ecx        # 416c <stderr@GLIBC_2.2.5+0x12c>
    194f:	movslq %ecx,%rdi
    1952:	movslq %edx,%rsi
    1955:	mov    %rsi,%rax
    1958:	shl    $0x2,%rax
    195c:	add    %rsi,%rax
    195f:	add    %rdi,%rax
    1962:	lea    (%rax,%rax,1),%rsi
    1966:	lea    0x26f3(%rip),%rax        # 4060 <stderr@GLIBC_2.2.5+0x20>
    196d:	movzbl (%rsi,%rax,1),%eax
    1971:	add    $0x1,%eax
    1974:	mov    %eax,%esi
    1976:	movslq %ecx,%rcx
    1979:	movslq %edx,%rdx
    197c:	mov    %rdx,%rax
    197f:	shl    $0x2,%rax
    1983:	add    %rdx,%rax
    1986:	add    %rcx,%rax
    1989:	lea    (%rax,%rax,1),%rdx
    198d:	lea    0x26cc(%rip),%rax        # 4060 <stderr@GLIBC_2.2.5+0x20>
    1994:	mov    %sil,(%rdx,%rax,1)
    1998:	mov    -0x18(%rbp),%eax
    199b:	add    $0x1,%eax
    199e:	mov    %eax,-0x14(%rbp)
    19a1:	mov    -0x14(%rbp),%eax
    19a4:	cltq
    19a6:	lea    0x0(,%rax,8),%rdx
    19ae:	lea    0x26eb(%rip),%rax        # 40a0 <stderr@GLIBC_2.2.5+0x60>
    19b5:	mov    (%rdx,%rax,1),%eax
    19b8:	cmp    $0xffffffff,%eax
    19bb:	je     1a4d <exit@plt+0x8fd>
    19c1:	mov    -0x14(%rbp),%eax
    19c4:	cltq
    19c6:	lea    0x0(,%rax,8),%rdx
    19ce:	lea    0x26cf(%rip),%rax        # 40a4 <stderr@GLIBC_2.2.5+0x64>
    19d5:	mov    (%rdx,%rax,1),%eax
    19d8:	cmp    $0xffffffff,%eax
    19db:	je     1a4d <exit@plt+0x8fd>
    19dd:	mov    0x2785(%rip),%edx        # 4168 <stderr@GLIBC_2.2.5+0x128>
    19e3:	mov    -0x14(%rbp),%eax
    19e6:	cltq
    19e8:	lea    0x0(,%rax,8),%rcx
    19f0:	lea    0x26a9(%rip),%rax        # 40a0 <stderr@GLIBC_2.2.5+0x60>
    19f7:	mov    (%rcx,%rax,1),%eax
    19fa:	cmp    %eax,%edx
    19fc:	jne    1a1f <exit@plt+0x8cf>
    19fe:	mov    0x2768(%rip),%edx        # 416c <stderr@GLIBC_2.2.5+0x12c>
    1a04:	mov    -0x14(%rbp),%eax
    1a07:	cltq
    1a09:	lea    0x0(,%rax,8),%rcx
    1a11:	lea    0x268c(%rip),%rax        # 40a4 <stderr@GLIBC_2.2.5+0x64>
    1a18:	mov    (%rcx,%rax,1),%eax
    1a1b:	cmp    %eax,%edx
    1a1d:	je     1a4d <exit@plt+0x8fd>
    1a1f:	mov    0x2743(%rip),%eax        # 4168 <stderr@GLIBC_2.2.5+0x128>
    1a25:	mov    0x2741(%rip),%edx        # 416c <stderr@GLIBC_2.2.5+0x12c>
    1a2b:	movslq %edx,%rcx
    1a2e:	movslq %eax,%rdx
    1a31:	mov    %rdx,%rax
    1a34:	shl    $0x2,%rax
    1a38:	add    %rdx,%rax
    1a3b:	add    %rcx,%rax
    1a3e:	lea    (%rax,%rax,1),%rdx
    1a42:	lea    0x2618(%rip),%rax        # 4061 <stderr@GLIBC_2.2.5+0x21>
    1a49:	movb   $0x0,(%rdx,%rax,1)
    1a4d:	addl   $0x1,-0x18(%rbp)
    1a51:	jmp    181a <exit@plt+0x6ca>
    1a56:	call   10f0 <__stack_chk_fail@plt>
    1a5b:	leave
    1a5c:	ret

Déassemblage de la section .fini :

0000000000001a60 <.fini>:
    1a60:	endbr64
    1a64:	sub    $0x8,%rsp
    1a68:	add    $0x8,%rsp
    1a6c:	ret
