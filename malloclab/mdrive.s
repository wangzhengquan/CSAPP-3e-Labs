
mdriver：     文件格式 elf64-x86-64


Disassembly of section .init:

0000000000400b68 <_init>:
  400b68:	48 83 ec 08          	sub    $0x8,%rsp
  400b6c:	48 8b 05 85 64 20 00 	mov    0x206485(%rip),%rax        # 606ff8 <_DYNAMIC+0x1d0>
  400b73:	48 85 c0             	test   %rax,%rax
  400b76:	74 05                	je     400b7d <_init+0x15>
  400b78:	e8 23 02 00 00       	callq  400da0 <sleep@plt+0x10>
  400b7d:	48 83 c4 08          	add    $0x8,%rsp
  400b81:	c3                   	retq   

Disassembly of section .plt:

0000000000400b90 <free@plt-0x10>:
  400b90:	ff 35 72 64 20 00    	pushq  0x206472(%rip)        # 607008 <_GLOBAL_OFFSET_TABLE_+0x8>
  400b96:	ff 25 74 64 20 00    	jmpq   *0x206474(%rip)        # 607010 <_GLOBAL_OFFSET_TABLE_+0x10>
  400b9c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400ba0 <free@plt>:
  400ba0:	ff 25 72 64 20 00    	jmpq   *0x206472(%rip)        # 607018 <_GLOBAL_OFFSET_TABLE_+0x18>
  400ba6:	68 00 00 00 00       	pushq  $0x0
  400bab:	e9 e0 ff ff ff       	jmpq   400b90 <_init+0x28>

0000000000400bb0 <putchar@plt>:
  400bb0:	ff 25 6a 64 20 00    	jmpq   *0x20646a(%rip)        # 607020 <_GLOBAL_OFFSET_TABLE_+0x20>
  400bb6:	68 01 00 00 00       	pushq  $0x1
  400bbb:	e9 d0 ff ff ff       	jmpq   400b90 <_init+0x28>

0000000000400bc0 <__errno_location@plt>:
  400bc0:	ff 25 62 64 20 00    	jmpq   *0x206462(%rip)        # 607028 <_GLOBAL_OFFSET_TABLE_+0x28>
  400bc6:	68 02 00 00 00       	pushq  $0x2
  400bcb:	e9 c0 ff ff ff       	jmpq   400b90 <_init+0x28>

0000000000400bd0 <strcpy@plt>:
  400bd0:	ff 25 5a 64 20 00    	jmpq   *0x20645a(%rip)        # 607030 <_GLOBAL_OFFSET_TABLE_+0x30>
  400bd6:	68 03 00 00 00       	pushq  $0x3
  400bdb:	e9 b0 ff ff ff       	jmpq   400b90 <_init+0x28>

0000000000400be0 <__isoc99_fscanf@plt>:
  400be0:	ff 25 52 64 20 00    	jmpq   *0x206452(%rip)        # 607038 <_GLOBAL_OFFSET_TABLE_+0x38>
  400be6:	68 04 00 00 00       	pushq  $0x4
  400beb:	e9 a0 ff ff ff       	jmpq   400b90 <_init+0x28>

0000000000400bf0 <puts@plt>:
  400bf0:	ff 25 4a 64 20 00    	jmpq   *0x20644a(%rip)        # 607040 <_GLOBAL_OFFSET_TABLE_+0x40>
  400bf6:	68 05 00 00 00       	pushq  $0x5
  400bfb:	e9 90 ff ff ff       	jmpq   400b90 <_init+0x28>

0000000000400c00 <fclose@plt>:
  400c00:	ff 25 42 64 20 00    	jmpq   *0x206442(%rip)        # 607048 <_GLOBAL_OFFSET_TABLE_+0x48>
  400c06:	68 06 00 00 00       	pushq  $0x6
  400c0b:	e9 80 ff ff ff       	jmpq   400b90 <_init+0x28>

0000000000400c10 <strlen@plt>:
  400c10:	ff 25 3a 64 20 00    	jmpq   *0x20643a(%rip)        # 607050 <_GLOBAL_OFFSET_TABLE_+0x50>
  400c16:	68 07 00 00 00       	pushq  $0x7
  400c1b:	e9 70 ff ff ff       	jmpq   400b90 <_init+0x28>

0000000000400c20 <__stack_chk_fail@plt>:
  400c20:	ff 25 32 64 20 00    	jmpq   *0x206432(%rip)        # 607058 <_GLOBAL_OFFSET_TABLE_+0x58>
  400c26:	68 08 00 00 00       	pushq  $0x8
  400c2b:	e9 60 ff ff ff       	jmpq   400b90 <_init+0x28>

0000000000400c30 <printf@plt>:
  400c30:	ff 25 2a 64 20 00    	jmpq   *0x20642a(%rip)        # 607060 <_GLOBAL_OFFSET_TABLE_+0x60>
  400c36:	68 09 00 00 00       	pushq  $0x9
  400c3b:	e9 50 ff ff ff       	jmpq   400b90 <_init+0x28>

0000000000400c40 <gettimeofday@plt>:
  400c40:	ff 25 22 64 20 00    	jmpq   *0x206422(%rip)        # 607068 <_GLOBAL_OFFSET_TABLE_+0x68>
  400c46:	68 0a 00 00 00       	pushq  $0xa
  400c4b:	e9 40 ff ff ff       	jmpq   400b90 <_init+0x28>

0000000000400c50 <__assert_fail@plt>:
  400c50:	ff 25 1a 64 20 00    	jmpq   *0x20641a(%rip)        # 607070 <_GLOBAL_OFFSET_TABLE_+0x70>
  400c56:	68 0b 00 00 00       	pushq  $0xb
  400c5b:	e9 30 ff ff ff       	jmpq   400b90 <_init+0x28>

0000000000400c60 <memset@plt>:
  400c60:	ff 25 12 64 20 00    	jmpq   *0x206412(%rip)        # 607078 <_GLOBAL_OFFSET_TABLE_+0x78>
  400c66:	68 0c 00 00 00       	pushq  $0xc
  400c6b:	e9 20 ff ff ff       	jmpq   400b90 <_init+0x28>

0000000000400c70 <__libc_start_main@plt>:
  400c70:	ff 25 0a 64 20 00    	jmpq   *0x20640a(%rip)        # 607080 <_GLOBAL_OFFSET_TABLE_+0x80>
  400c76:	68 0d 00 00 00       	pushq  $0xd
  400c7b:	e9 10 ff ff ff       	jmpq   400b90 <_init+0x28>

0000000000400c80 <calloc@plt>:
  400c80:	ff 25 02 64 20 00    	jmpq   *0x206402(%rip)        # 607088 <_GLOBAL_OFFSET_TABLE_+0x88>
  400c86:	68 0e 00 00 00       	pushq  $0xe
  400c8b:	e9 00 ff ff ff       	jmpq   400b90 <_init+0x28>

0000000000400c90 <memcpy@plt>:
  400c90:	ff 25 fa 63 20 00    	jmpq   *0x2063fa(%rip)        # 607090 <_GLOBAL_OFFSET_TABLE_+0x90>
  400c96:	68 0f 00 00 00       	pushq  $0xf
  400c9b:	e9 f0 fe ff ff       	jmpq   400b90 <_init+0x28>

0000000000400ca0 <malloc@plt>:
  400ca0:	ff 25 f2 63 20 00    	jmpq   *0x2063f2(%rip)        # 607098 <_GLOBAL_OFFSET_TABLE_+0x98>
  400ca6:	68 10 00 00 00       	pushq  $0x10
  400cab:	e9 e0 fe ff ff       	jmpq   400b90 <_init+0x28>

0000000000400cb0 <realloc@plt>:
  400cb0:	ff 25 ea 63 20 00    	jmpq   *0x2063ea(%rip)        # 6070a0 <_GLOBAL_OFFSET_TABLE_+0xa0>
  400cb6:	68 11 00 00 00       	pushq  $0x11
  400cbb:	e9 d0 fe ff ff       	jmpq   400b90 <_init+0x28>

0000000000400cc0 <setitimer@plt>:
  400cc0:	ff 25 e2 63 20 00    	jmpq   *0x2063e2(%rip)        # 6070a8 <_GLOBAL_OFFSET_TABLE_+0xa8>
  400cc6:	68 12 00 00 00       	pushq  $0x12
  400ccb:	e9 c0 fe ff ff       	jmpq   400b90 <_init+0x28>

0000000000400cd0 <times@plt>:
  400cd0:	ff 25 da 63 20 00    	jmpq   *0x2063da(%rip)        # 6070b0 <_GLOBAL_OFFSET_TABLE_+0xb0>
  400cd6:	68 13 00 00 00       	pushq  $0x13
  400cdb:	e9 b0 fe ff ff       	jmpq   400b90 <_init+0x28>

0000000000400ce0 <fopen@plt>:
  400ce0:	ff 25 d2 63 20 00    	jmpq   *0x2063d2(%rip)        # 6070b8 <_GLOBAL_OFFSET_TABLE_+0xb8>
  400ce6:	68 14 00 00 00       	pushq  $0x14
  400ceb:	e9 a0 fe ff ff       	jmpq   400b90 <_init+0x28>

0000000000400cf0 <getitimer@plt>:
  400cf0:	ff 25 ca 63 20 00    	jmpq   *0x2063ca(%rip)        # 6070c0 <_GLOBAL_OFFSET_TABLE_+0xc0>
  400cf6:	68 15 00 00 00       	pushq  $0x15
  400cfb:	e9 90 fe ff ff       	jmpq   400b90 <_init+0x28>

0000000000400d00 <getopt@plt>:
  400d00:	ff 25 c2 63 20 00    	jmpq   *0x2063c2(%rip)        # 6070c8 <_GLOBAL_OFFSET_TABLE_+0xc8>
  400d06:	68 16 00 00 00       	pushq  $0x16
  400d0b:	e9 80 fe ff ff       	jmpq   400b90 <_init+0x28>

0000000000400d10 <atoi@plt>:
  400d10:	ff 25 ba 63 20 00    	jmpq   *0x2063ba(%rip)        # 6070d0 <_GLOBAL_OFFSET_TABLE_+0xd0>
  400d16:	68 17 00 00 00       	pushq  $0x17
  400d1b:	e9 70 fe ff ff       	jmpq   400b90 <_init+0x28>

0000000000400d20 <strcat@plt>:
  400d20:	ff 25 b2 63 20 00    	jmpq   *0x2063b2(%rip)        # 6070d8 <_GLOBAL_OFFSET_TABLE_+0xd8>
  400d26:	68 18 00 00 00       	pushq  $0x18
  400d2b:	e9 60 fe ff ff       	jmpq   400b90 <_init+0x28>

0000000000400d30 <getpagesize@plt>:
  400d30:	ff 25 aa 63 20 00    	jmpq   *0x2063aa(%rip)        # 6070e0 <_GLOBAL_OFFSET_TABLE_+0xe0>
  400d36:	68 19 00 00 00       	pushq  $0x19
  400d3b:	e9 50 fe ff ff       	jmpq   400b90 <_init+0x28>

0000000000400d40 <sprintf@plt>:
  400d40:	ff 25 a2 63 20 00    	jmpq   *0x2063a2(%rip)        # 6070e8 <_GLOBAL_OFFSET_TABLE_+0xe8>
  400d46:	68 1a 00 00 00       	pushq  $0x1a
  400d4b:	e9 40 fe ff ff       	jmpq   400b90 <_init+0x28>

0000000000400d50 <exit@plt>:
  400d50:	ff 25 9a 63 20 00    	jmpq   *0x20639a(%rip)        # 6070f0 <_GLOBAL_OFFSET_TABLE_+0xf0>
  400d56:	68 1b 00 00 00       	pushq  $0x1b
  400d5b:	e9 30 fe ff ff       	jmpq   400b90 <_init+0x28>

0000000000400d60 <fwrite@plt>:
  400d60:	ff 25 92 63 20 00    	jmpq   *0x206392(%rip)        # 6070f8 <_GLOBAL_OFFSET_TABLE_+0xf8>
  400d66:	68 1c 00 00 00       	pushq  $0x1c
  400d6b:	e9 20 fe ff ff       	jmpq   400b90 <_init+0x28>

0000000000400d70 <strdup@plt>:
  400d70:	ff 25 8a 63 20 00    	jmpq   *0x20638a(%rip)        # 607100 <_GLOBAL_OFFSET_TABLE_+0x100>
  400d76:	68 1d 00 00 00       	pushq  $0x1d
  400d7b:	e9 10 fe ff ff       	jmpq   400b90 <_init+0x28>

0000000000400d80 <strerror@plt>:
  400d80:	ff 25 82 63 20 00    	jmpq   *0x206382(%rip)        # 607108 <_GLOBAL_OFFSET_TABLE_+0x108>
  400d86:	68 1e 00 00 00       	pushq  $0x1e
  400d8b:	e9 00 fe ff ff       	jmpq   400b90 <_init+0x28>

0000000000400d90 <sleep@plt>:
  400d90:	ff 25 7a 63 20 00    	jmpq   *0x20637a(%rip)        # 607110 <_GLOBAL_OFFSET_TABLE_+0x110>
  400d96:	68 1f 00 00 00       	pushq  $0x1f
  400d9b:	e9 f0 fd ff ff       	jmpq   400b90 <_init+0x28>

Disassembly of section .plt.got:

0000000000400da0 <.plt.got>:
  400da0:	ff 25 52 62 20 00    	jmpq   *0x206252(%rip)        # 606ff8 <_DYNAMIC+0x1d0>
  400da6:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

0000000000400db0 <_start>:
  400db0:	31 ed                	xor    %ebp,%ebp
  400db2:	49 89 d1             	mov    %rdx,%r9
  400db5:	5e                   	pop    %rsi
  400db6:	48 89 e2             	mov    %rsp,%rdx
  400db9:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  400dbd:	50                   	push   %rax
  400dbe:	54                   	push   %rsp
  400dbf:	49 c7 c0 70 4b 40 00 	mov    $0x404b70,%r8
  400dc6:	48 c7 c1 00 4b 40 00 	mov    $0x404b00,%rcx
  400dcd:	48 c7 c7 a6 0e 40 00 	mov    $0x400ea6,%rdi
  400dd4:	e8 97 fe ff ff       	callq  400c70 <__libc_start_main@plt>
  400dd9:	f4                   	hlt    
  400dda:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400de0 <deregister_tm_clones>:
  400de0:	b8 ef 75 60 00       	mov    $0x6075ef,%eax
  400de5:	55                   	push   %rbp
  400de6:	48 2d e8 75 60 00    	sub    $0x6075e8,%rax
  400dec:	48 83 f8 0e          	cmp    $0xe,%rax
  400df0:	48 89 e5             	mov    %rsp,%rbp
  400df3:	76 1b                	jbe    400e10 <deregister_tm_clones+0x30>
  400df5:	b8 00 00 00 00       	mov    $0x0,%eax
  400dfa:	48 85 c0             	test   %rax,%rax
  400dfd:	74 11                	je     400e10 <deregister_tm_clones+0x30>
  400dff:	5d                   	pop    %rbp
  400e00:	bf e8 75 60 00       	mov    $0x6075e8,%edi
  400e05:	ff e0                	jmpq   *%rax
  400e07:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  400e0e:	00 00 
  400e10:	5d                   	pop    %rbp
  400e11:	c3                   	retq   
  400e12:	0f 1f 40 00          	nopl   0x0(%rax)
  400e16:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400e1d:	00 00 00 

0000000000400e20 <register_tm_clones>:
  400e20:	be e8 75 60 00       	mov    $0x6075e8,%esi
  400e25:	55                   	push   %rbp
  400e26:	48 81 ee e8 75 60 00 	sub    $0x6075e8,%rsi
  400e2d:	48 c1 fe 03          	sar    $0x3,%rsi
  400e31:	48 89 e5             	mov    %rsp,%rbp
  400e34:	48 89 f0             	mov    %rsi,%rax
  400e37:	48 c1 e8 3f          	shr    $0x3f,%rax
  400e3b:	48 01 c6             	add    %rax,%rsi
  400e3e:	48 d1 fe             	sar    %rsi
  400e41:	74 15                	je     400e58 <register_tm_clones+0x38>
  400e43:	b8 00 00 00 00       	mov    $0x0,%eax
  400e48:	48 85 c0             	test   %rax,%rax
  400e4b:	74 0b                	je     400e58 <register_tm_clones+0x38>
  400e4d:	5d                   	pop    %rbp
  400e4e:	bf e8 75 60 00       	mov    $0x6075e8,%edi
  400e53:	ff e0                	jmpq   *%rax
  400e55:	0f 1f 00             	nopl   (%rax)
  400e58:	5d                   	pop    %rbp
  400e59:	c3                   	retq   
  400e5a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400e60 <__do_global_dtors_aux>:
  400e60:	80 3d c1 67 20 00 00 	cmpb   $0x0,0x2067c1(%rip)        # 607628 <completed.7594>
  400e67:	75 11                	jne    400e7a <__do_global_dtors_aux+0x1a>
  400e69:	55                   	push   %rbp
  400e6a:	48 89 e5             	mov    %rsp,%rbp
  400e6d:	e8 6e ff ff ff       	callq  400de0 <deregister_tm_clones>
  400e72:	5d                   	pop    %rbp
  400e73:	c6 05 ae 67 20 00 01 	movb   $0x1,0x2067ae(%rip)        # 607628 <completed.7594>
  400e7a:	f3 c3                	repz retq 
  400e7c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400e80 <frame_dummy>:
  400e80:	bf 20 6e 60 00       	mov    $0x606e20,%edi
  400e85:	48 83 3f 00          	cmpq   $0x0,(%rdi)
  400e89:	75 05                	jne    400e90 <frame_dummy+0x10>
  400e8b:	eb 93                	jmp    400e20 <register_tm_clones>
  400e8d:	0f 1f 00             	nopl   (%rax)
  400e90:	b8 00 00 00 00       	mov    $0x0,%eax
  400e95:	48 85 c0             	test   %rax,%rax
  400e98:	74 f1                	je     400e8b <frame_dummy+0xb>
  400e9a:	55                   	push   %rbp
  400e9b:	48 89 e5             	mov    %rsp,%rbp
  400e9e:	ff d0                	callq  *%rax
  400ea0:	5d                   	pop    %rbp
  400ea1:	e9 7a ff ff ff       	jmpq   400e20 <register_tm_clones>

0000000000400ea6 <main>:
  400ea6:	55                   	push   %rbp
  400ea7:	48 89 e5             	mov    %rsp,%rbp
  400eaa:	53                   	push   %rbx
  400eab:	48 81 ec d8 00 00 00 	sub    $0xd8,%rsp
  400eb2:	89 bd 3c ff ff ff    	mov    %edi,-0xc4(%rbp)
  400eb8:	48 89 b5 30 ff ff ff 	mov    %rsi,-0xd0(%rbp)
  400ebf:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  400ec6:	00 00 
  400ec8:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  400ecc:	31 c0                	xor    %eax,%eax
  400ece:	48 c7 85 70 ff ff ff 	movq   $0x0,-0x90(%rbp)
  400ed5:	00 00 00 00 
  400ed9:	c7 85 54 ff ff ff 00 	movl   $0x0,-0xac(%rbp)
  400ee0:	00 00 00 
  400ee3:	48 c7 45 a0 00 00 00 	movq   $0x0,-0x60(%rbp)
  400eea:	00 
  400eeb:	48 c7 85 68 ff ff ff 	movq   $0x0,-0x98(%rbp)
  400ef2:	00 00 00 00 
  400ef6:	48 c7 45 a8 00 00 00 	movq   $0x0,-0x58(%rbp)
  400efd:	00 
  400efe:	48 c7 45 b0 00 00 00 	movq   $0x0,-0x50(%rbp)
  400f05:	00 
  400f06:	c7 85 58 ff ff ff 01 	movl   $0x1,-0xa8(%rbp)
  400f0d:	00 00 00 
  400f10:	c7 85 5c ff ff ff 00 	movl   $0x0,-0xa4(%rbp)
  400f17:	00 00 00 
  400f1a:	c7 85 60 ff ff ff 00 	movl   $0x0,-0xa0(%rbp)
  400f21:	00 00 00 
  400f24:	e9 62 01 00 00       	jmpq   40108b <main+0x1e5>
  400f29:	0f be 85 4f ff ff ff 	movsbl -0xb1(%rbp),%eax
  400f30:	83 e8 61             	sub    $0x61,%eax
  400f33:	83 f8 15             	cmp    $0x15,%eax
  400f36:	0f 87 40 01 00 00    	ja     40107c <main+0x1d6>
  400f3c:	89 c0                	mov    %eax,%eax
  400f3e:	48 8b 04 c5 f0 4e 40 	mov    0x404ef0(,%rax,8),%rax
  400f45:	00 
  400f46:	ff e0                	jmpq   *%rax
  400f48:	c7 85 60 ff ff ff 01 	movl   $0x1,-0xa0(%rbp)
  400f4f:	00 00 00 
  400f52:	e9 34 01 00 00       	jmpq   40108b <main+0x1e5>
  400f57:	c7 85 54 ff ff ff 01 	movl   $0x1,-0xac(%rbp)
  400f5e:	00 00 00 
  400f61:	48 8b 85 70 ff ff ff 	mov    -0x90(%rbp),%rax
  400f68:	be 10 00 00 00       	mov    $0x10,%esi
  400f6d:	48 89 c7             	mov    %rax,%rdi
  400f70:	e8 3b fd ff ff       	callq  400cb0 <realloc@plt>
  400f75:	48 89 85 70 ff ff ff 	mov    %rax,-0x90(%rbp)
  400f7c:	48 83 bd 70 ff ff ff 	cmpq   $0x0,-0x90(%rbp)
  400f83:	00 
  400f84:	75 0a                	jne    400f90 <main+0xea>
  400f86:	bf 0e 4c 40 00       	mov    $0x404c0e,%edi
  400f8b:	e8 12 22 00 00       	callq  4031a2 <unix_error>
  400f90:	66 c7 05 a7 61 20 00 	movw   $0x2f2e,0x2061a7(%rip)        # 607140 <tracedir>
  400f97:	2e 2f 
  400f99:	c6 05 a2 61 20 00 00 	movb   $0x0,0x2061a2(%rip)        # 607142 <tracedir+0x2>
  400fa0:	48 8b 05 59 66 20 00 	mov    0x206659(%rip),%rax        # 607600 <optarg@@GLIBC_2.2.5>
  400fa7:	48 89 c7             	mov    %rax,%rdi
  400faa:	e8 c1 fd ff ff       	callq  400d70 <strdup@plt>
  400faf:	48 89 c2             	mov    %rax,%rdx
  400fb2:	48 8b 85 70 ff ff ff 	mov    -0x90(%rbp),%rax
  400fb9:	48 89 10             	mov    %rdx,(%rax)
  400fbc:	48 8b 85 70 ff ff ff 	mov    -0x90(%rbp),%rax
  400fc3:	48 83 c0 08          	add    $0x8,%rax
  400fc7:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  400fce:	e9 b8 00 00 00       	jmpq   40108b <main+0x1e5>
  400fd3:	83 bd 54 ff ff ff 01 	cmpl   $0x1,-0xac(%rbp)
  400fda:	75 05                	jne    400fe1 <main+0x13b>
  400fdc:	e9 aa 00 00 00       	jmpq   40108b <main+0x1e5>
  400fe1:	48 8b 05 18 66 20 00 	mov    0x206618(%rip),%rax        # 607600 <optarg@@GLIBC_2.2.5>
  400fe8:	48 89 c6             	mov    %rax,%rsi
  400feb:	bf 40 71 60 00       	mov    $0x607140,%edi
  400ff0:	e8 db fb ff ff       	callq  400bd0 <strcpy@plt>
  400ff5:	bf 40 71 60 00       	mov    $0x607140,%edi
  400ffa:	e8 11 fc ff ff       	callq  400c10 <strlen@plt>
  400fff:	48 83 e8 01          	sub    $0x1,%rax
  401003:	0f b6 80 40 71 60 00 	movzbl 0x607140(%rax),%eax
  40100a:	3c 2f                	cmp    $0x2f,%al
  40100c:	74 7d                	je     40108b <main+0x1e5>
  40100e:	b8 40 71 60 00       	mov    $0x607140,%eax
  401013:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  40101a:	48 89 c2             	mov    %rax,%rdx
  40101d:	b8 00 00 00 00       	mov    $0x0,%eax
  401022:	48 89 d7             	mov    %rdx,%rdi
  401025:	f2 ae                	repnz scas %es:(%rdi),%al
  401027:	48 89 c8             	mov    %rcx,%rax
  40102a:	48 f7 d0             	not    %rax
  40102d:	48 83 e8 01          	sub    $0x1,%rax
  401031:	48 05 40 71 60 00    	add    $0x607140,%rax
  401037:	66 c7 00 2f 00       	movw   $0x2f,(%rax)
  40103c:	eb 4d                	jmp    40108b <main+0x1e5>
  40103e:	c7 85 58 ff ff ff 00 	movl   $0x0,-0xa8(%rbp)
  401045:	00 00 00 
  401048:	eb 41                	jmp    40108b <main+0x1e5>
  40104a:	c7 85 5c ff ff ff 01 	movl   $0x1,-0xa4(%rbp)
  401051:	00 00 00 
  401054:	eb 35                	jmp    40108b <main+0x1e5>
  401056:	48 8b 05 a3 65 20 00 	mov    0x2065a3(%rip),%rax        # 607600 <optarg@@GLIBC_2.2.5>
  40105d:	48 89 c7             	mov    %rax,%rdi
  401060:	e8 ab fc ff ff       	callq  400d10 <atoi@plt>
  401065:	89 05 c1 65 20 00    	mov    %eax,0x2065c1(%rip)        # 60762c <verbose>
  40106b:	eb 1e                	jmp    40108b <main+0x1e5>
  40106d:	e8 b4 21 00 00       	callq  403226 <usage>
  401072:	bf 00 00 00 00       	mov    $0x0,%edi
  401077:	e8 d4 fc ff ff       	callq  400d50 <exit@plt>
  40107c:	e8 a5 21 00 00       	callq  403226 <usage>
  401081:	bf 01 00 00 00       	mov    $0x1,%edi
  401086:	e8 c5 fc ff ff       	callq  400d50 <exit@plt>
  40108b:	48 8b 8d 30 ff ff ff 	mov    -0xd0(%rbp),%rcx
  401092:	8b 85 3c ff ff ff    	mov    -0xc4(%rbp),%eax
  401098:	ba 2c 4c 40 00       	mov    $0x404c2c,%edx
  40109d:	48 89 ce             	mov    %rcx,%rsi
  4010a0:	89 c7                	mov    %eax,%edi
  4010a2:	e8 59 fc ff ff       	callq  400d00 <getopt@plt>
  4010a7:	88 85 4f ff ff ff    	mov    %al,-0xb1(%rbp)
  4010ad:	80 bd 4f ff ff ff ff 	cmpb   $0xff,-0xb1(%rbp)
  4010b4:	0f 85 6f fe ff ff    	jne    400f29 <main+0x83>
  4010ba:	83 bd 58 ff ff ff 00 	cmpl   $0x0,-0xa8(%rbp)
  4010c1:	0f 84 05 01 00 00    	je     4011cc <main+0x326>
  4010c7:	48 8b 05 f2 64 20 00 	mov    0x2064f2(%rip),%rax        # 6075c0 <team>
  4010ce:	0f b6 00             	movzbl (%rax),%eax
  4010d1:	84 c0                	test   %al,%al
  4010d3:	75 14                	jne    4010e9 <main+0x243>
  4010d5:	bf 38 4c 40 00       	mov    $0x404c38,%edi
  4010da:	e8 11 fb ff ff       	callq  400bf0 <puts@plt>
  4010df:	bf 01 00 00 00       	mov    $0x1,%edi
  4010e4:	e8 67 fc ff ff       	callq  400d50 <exit@plt>
  4010e9:	48 8b 05 d0 64 20 00 	mov    0x2064d0(%rip),%rax        # 6075c0 <team>
  4010f0:	48 89 c6             	mov    %rax,%rsi
  4010f3:	bf 77 4c 40 00       	mov    $0x404c77,%edi
  4010f8:	b8 00 00 00 00       	mov    $0x0,%eax
  4010fd:	e8 2e fb ff ff       	callq  400c30 <printf@plt>
  401102:	48 8b 05 bf 64 20 00 	mov    0x2064bf(%rip),%rax        # 6075c8 <team+0x8>
  401109:	0f b6 00             	movzbl (%rax),%eax
  40110c:	84 c0                	test   %al,%al
  40110e:	74 0e                	je     40111e <main+0x278>
  401110:	48 8b 05 b9 64 20 00 	mov    0x2064b9(%rip),%rax        # 6075d0 <team+0x10>
  401117:	0f b6 00             	movzbl (%rax),%eax
  40111a:	84 c0                	test   %al,%al
  40111c:	75 14                	jne    401132 <main+0x28c>
  40111e:	bf 88 4c 40 00       	mov    $0x404c88,%edi
  401123:	e8 c8 fa ff ff       	callq  400bf0 <puts@plt>
  401128:	bf 01 00 00 00       	mov    $0x1,%edi
  40112d:	e8 1e fc ff ff       	callq  400d50 <exit@plt>
  401132:	48 8b 15 97 64 20 00 	mov    0x206497(%rip),%rdx        # 6075d0 <team+0x10>
  401139:	48 8b 05 88 64 20 00 	mov    0x206488(%rip),%rax        # 6075c8 <team+0x8>
  401140:	48 89 c6             	mov    %rax,%rsi
  401143:	bf bb 4c 40 00       	mov    $0x404cbb,%edi
  401148:	b8 00 00 00 00       	mov    $0x0,%eax
  40114d:	e8 de fa ff ff       	callq  400c30 <printf@plt>
  401152:	48 8b 05 7f 64 20 00 	mov    0x20647f(%rip),%rax        # 6075d8 <team+0x18>
  401159:	0f b6 00             	movzbl (%rax),%eax
  40115c:	84 c0                	test   %al,%al
  40115e:	74 0e                	je     40116e <main+0x2c8>
  401160:	48 8b 05 79 64 20 00 	mov    0x206479(%rip),%rax        # 6075e0 <team+0x20>
  401167:	0f b6 00             	movzbl (%rax),%eax
  40116a:	84 c0                	test   %al,%al
  40116c:	74 1c                	je     40118a <main+0x2e4>
  40116e:	48 8b 05 63 64 20 00 	mov    0x206463(%rip),%rax        # 6075d8 <team+0x18>
  401175:	0f b6 00             	movzbl (%rax),%eax
  401178:	84 c0                	test   %al,%al
  40117a:	75 22                	jne    40119e <main+0x2f8>
  40117c:	48 8b 05 5d 64 20 00 	mov    0x20645d(%rip),%rax        # 6075e0 <team+0x20>
  401183:	0f b6 00             	movzbl (%rax),%eax
  401186:	84 c0                	test   %al,%al
  401188:	74 14                	je     40119e <main+0x2f8>
  40118a:	bf d0 4c 40 00       	mov    $0x404cd0,%edi
  40118f:	e8 5c fa ff ff       	callq  400bf0 <puts@plt>
  401194:	bf 01 00 00 00       	mov    $0x1,%edi
  401199:	e8 b2 fb ff ff       	callq  400d50 <exit@plt>
  40119e:	48 8b 05 33 64 20 00 	mov    0x206433(%rip),%rax        # 6075d8 <team+0x18>
  4011a5:	0f b6 00             	movzbl (%rax),%eax
  4011a8:	84 c0                	test   %al,%al
  4011aa:	74 20                	je     4011cc <main+0x326>
  4011ac:	48 8b 15 2d 64 20 00 	mov    0x20642d(%rip),%rdx        # 6075e0 <team+0x20>
  4011b3:	48 8b 05 1e 64 20 00 	mov    0x20641e(%rip),%rax        # 6075d8 <team+0x18>
  4011ba:	48 89 c6             	mov    %rax,%rsi
  4011bd:	bf 15 4d 40 00       	mov    $0x404d15,%edi
  4011c2:	b8 00 00 00 00       	mov    $0x0,%eax
  4011c7:	e8 64 fa ff ff       	callq  400c30 <printf@plt>
  4011cc:	48 83 bd 70 ff ff ff 	cmpq   $0x0,-0x90(%rbp)
  4011d3:	00 
  4011d4:	75 29                	jne    4011ff <main+0x359>
  4011d6:	48 c7 85 70 ff ff ff 	movq   $0x607540,-0x90(%rbp)
  4011dd:	40 75 60 00 
  4011e1:	c7 85 54 ff ff ff 0c 	movl   $0xc,-0xac(%rbp)
  4011e8:	00 00 00 
  4011eb:	be 40 71 60 00       	mov    $0x607140,%esi
  4011f0:	bf 28 4d 40 00       	mov    $0x404d28,%edi
  4011f5:	b8 00 00 00 00       	mov    $0x0,%eax
  4011fa:	e8 31 fa ff ff       	callq  400c30 <printf@plt>
  4011ff:	e8 bb 22 00 00       	callq  4034bf <init_fsecs>
  401204:	83 bd 5c ff ff ff 00 	cmpl   $0x0,-0xa4(%rbp)
  40120b:	0f 84 a2 01 00 00    	je     4013b3 <main+0x50d>
  401211:	8b 05 15 64 20 00    	mov    0x206415(%rip),%eax        # 60762c <verbose>
  401217:	85 c0                	test   %eax,%eax
  401219:	74 0a                	je     401225 <main+0x37f>
  40121b:	bf 48 4d 40 00       	mov    $0x404d48,%edi
  401220:	e8 cb f9 ff ff       	callq  400bf0 <puts@plt>
  401225:	8b 85 54 ff ff ff    	mov    -0xac(%rbp),%eax
  40122b:	48 98                	cltq   
  40122d:	be 20 00 00 00       	mov    $0x20,%esi
  401232:	48 89 c7             	mov    %rax,%rdi
  401235:	e8 46 fa ff ff       	callq  400c80 <calloc@plt>
  40123a:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
  40123e:	48 83 7d a8 00       	cmpq   $0x0,-0x58(%rbp)
  401243:	75 0a                	jne    40124f <main+0x3a9>
  401245:	bf 60 4d 40 00       	mov    $0x404d60,%edi
  40124a:	e8 53 1f 00 00       	callq  4031a2 <unix_error>
  40124f:	c7 85 50 ff ff ff 00 	movl   $0x0,-0xb0(%rbp)
  401256:	00 00 00 
  401259:	e9 1b 01 00 00       	jmpq   401379 <main+0x4d3>
  40125e:	8b 85 50 ff ff ff    	mov    -0xb0(%rbp),%eax
  401264:	48 98                	cltq   
  401266:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  40126d:	00 
  40126e:	48 8b 85 70 ff ff ff 	mov    -0x90(%rbp),%rax
  401275:	48 01 d0             	add    %rdx,%rax
  401278:	48 8b 00             	mov    (%rax),%rax
  40127b:	48 89 c6             	mov    %rax,%rsi
  40127e:	bf 40 71 60 00       	mov    $0x607140,%edi
  401283:	e8 4d 09 00 00       	callq  401bd5 <read_trace>
  401288:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
  40128c:	8b 85 50 ff ff ff    	mov    -0xb0(%rbp),%eax
  401292:	48 98                	cltq   
  401294:	48 c1 e0 05          	shl    $0x5,%rax
  401298:	48 89 c2             	mov    %rax,%rdx
  40129b:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  40129f:	48 01 c2             	add    %rax,%rdx
  4012a2:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
  4012a6:	8b 40 08             	mov    0x8(%rax),%eax
  4012a9:	66 0f ef c0          	pxor   %xmm0,%xmm0
  4012ad:	f2 0f 2a c0          	cvtsi2sd %eax,%xmm0
  4012b1:	f2 0f 11 02          	movsd  %xmm0,(%rdx)
  4012b5:	8b 05 71 63 20 00    	mov    0x206371(%rip),%eax        # 60762c <verbose>
  4012bb:	85 c0                	test   %eax,%eax
  4012bd:	74 0f                	je     4012ce <main+0x428>
  4012bf:	bf 88 4d 40 00       	mov    $0x404d88,%edi
  4012c4:	b8 00 00 00 00       	mov    $0x0,%eax
  4012c9:	e8 62 f9 ff ff       	callq  400c30 <printf@plt>
  4012ce:	8b 85 50 ff ff ff    	mov    -0xb0(%rbp),%eax
  4012d4:	48 98                	cltq   
  4012d6:	48 c1 e0 05          	shl    $0x5,%rax
  4012da:	48 89 c2             	mov    %rax,%rdx
  4012dd:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  4012e1:	48 8d 1c 02          	lea    (%rdx,%rax,1),%rbx
  4012e5:	8b 95 50 ff ff ff    	mov    -0xb0(%rbp),%edx
  4012eb:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
  4012ef:	89 d6                	mov    %edx,%esi
  4012f1:	48 89 c7             	mov    %rax,%rdi
  4012f4:	e8 46 18 00 00       	callq  402b3f <eval_libc_valid>
  4012f9:	89 43 08             	mov    %eax,0x8(%rbx)
  4012fc:	8b 85 50 ff ff ff    	mov    -0xb0(%rbp),%eax
  401302:	48 98                	cltq   
  401304:	48 c1 e0 05          	shl    $0x5,%rax
  401308:	48 89 c2             	mov    %rax,%rdx
  40130b:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  40130f:	48 01 d0             	add    %rdx,%rax
  401312:	8b 40 08             	mov    0x8(%rax),%eax
  401315:	85 c0                	test   %eax,%eax
  401317:	74 4d                	je     401366 <main+0x4c0>
  401319:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
  40131d:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  401321:	8b 05 05 63 20 00    	mov    0x206305(%rip),%eax        # 60762c <verbose>
  401327:	85 c0                	test   %eax,%eax
  401329:	74 0a                	je     401335 <main+0x48f>
  40132b:	bf af 4d 40 00       	mov    $0x404daf,%edi
  401330:	e8 bb f8 ff ff       	callq  400bf0 <puts@plt>
  401335:	8b 85 50 ff ff ff    	mov    -0xb0(%rbp),%eax
  40133b:	48 98                	cltq   
  40133d:	48 c1 e0 05          	shl    $0x5,%rax
  401341:	48 89 c2             	mov    %rax,%rdx
  401344:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  401348:	48 8d 1c 02          	lea    (%rdx,%rax,1),%rbx
  40134c:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  401350:	48 89 c6             	mov    %rax,%rsi
  401353:	bf 23 2d 40 00       	mov    $0x402d23,%edi
  401358:	e8 89 21 00 00       	callq  4034e6 <fsecs>
  40135d:	66 48 0f 7e c0       	movq   %xmm0,%rax
  401362:	48 89 43 10          	mov    %rax,0x10(%rbx)
  401366:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
  40136a:	48 89 c7             	mov    %rax,%rdi
  40136d:	e8 79 0d 00 00       	callq  4020eb <free_trace>
  401372:	83 85 50 ff ff ff 01 	addl   $0x1,-0xb0(%rbp)
  401379:	8b 85 50 ff ff ff    	mov    -0xb0(%rbp),%eax
  40137f:	3b 85 54 ff ff ff    	cmp    -0xac(%rbp),%eax
  401385:	0f 8c d3 fe ff ff    	jl     40125e <main+0x3b8>
  40138b:	8b 05 9b 62 20 00    	mov    0x20629b(%rip),%eax        # 60762c <verbose>
  401391:	85 c0                	test   %eax,%eax
  401393:	74 1e                	je     4013b3 <main+0x50d>
  401395:	bf c0 4d 40 00       	mov    $0x404dc0,%edi
  40139a:	e8 51 f8 ff ff       	callq  400bf0 <puts@plt>
  40139f:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
  4013a3:	8b 85 54 ff ff ff    	mov    -0xac(%rbp),%eax
  4013a9:	48 89 d6             	mov    %rdx,%rsi
  4013ac:	89 c7                	mov    %eax,%edi
  4013ae:	e8 32 1b 00 00       	callq  402ee5 <printresults>
  4013b3:	8b 05 73 62 20 00    	mov    0x206273(%rip),%eax        # 60762c <verbose>
  4013b9:	85 c0                	test   %eax,%eax
  4013bb:	74 0a                	je     4013c7 <main+0x521>
  4013bd:	bf da 4d 40 00       	mov    $0x404dda,%edi
  4013c2:	e8 29 f8 ff ff       	callq  400bf0 <puts@plt>
  4013c7:	8b 85 54 ff ff ff    	mov    -0xac(%rbp),%eax
  4013cd:	48 98                	cltq   
  4013cf:	be 20 00 00 00       	mov    $0x20,%esi
  4013d4:	48 89 c7             	mov    %rax,%rdi
  4013d7:	e8 a4 f8 ff ff       	callq  400c80 <calloc@plt>
  4013dc:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
  4013e0:	48 83 7d b0 00       	cmpq   $0x0,-0x50(%rbp)
  4013e5:	75 0a                	jne    4013f1 <main+0x54b>
  4013e7:	bf f0 4d 40 00       	mov    $0x404df0,%edi
  4013ec:	e8 b1 1d 00 00       	callq  4031a2 <unix_error>
  4013f1:	e8 63 1f 00 00       	callq  403359 <mem_init>
  4013f6:	c7 85 50 ff ff ff 00 	movl   $0x0,-0xb0(%rbp)
  4013fd:	00 00 00 
  401400:	e9 85 01 00 00       	jmpq   40158a <main+0x6e4>
  401405:	8b 85 50 ff ff ff    	mov    -0xb0(%rbp),%eax
  40140b:	48 98                	cltq   
  40140d:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  401414:	00 
  401415:	48 8b 85 70 ff ff ff 	mov    -0x90(%rbp),%rax
  40141c:	48 01 d0             	add    %rdx,%rax
  40141f:	48 8b 00             	mov    (%rax),%rax
  401422:	48 89 c6             	mov    %rax,%rsi
  401425:	bf 40 71 60 00       	mov    $0x607140,%edi
  40142a:	e8 a6 07 00 00       	callq  401bd5 <read_trace>
  40142f:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
  401433:	8b 85 50 ff ff ff    	mov    -0xb0(%rbp),%eax
  401439:	48 98                	cltq   
  40143b:	48 c1 e0 05          	shl    $0x5,%rax
  40143f:	48 89 c2             	mov    %rax,%rdx
  401442:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
  401446:	48 01 c2             	add    %rax,%rdx
  401449:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
  40144d:	8b 40 08             	mov    0x8(%rax),%eax
  401450:	66 0f ef c0          	pxor   %xmm0,%xmm0
  401454:	f2 0f 2a c0          	cvtsi2sd %eax,%xmm0
  401458:	f2 0f 11 02          	movsd  %xmm0,(%rdx)
  40145c:	8b 05 ca 61 20 00    	mov    0x2061ca(%rip),%eax        # 60762c <verbose>
  401462:	85 c0                	test   %eax,%eax
  401464:	74 0f                	je     401475 <main+0x5cf>
  401466:	bf 10 4e 40 00       	mov    $0x404e10,%edi
  40146b:	b8 00 00 00 00       	mov    $0x0,%eax
  401470:	e8 bb f7 ff ff       	callq  400c30 <printf@plt>
  401475:	8b 85 50 ff ff ff    	mov    -0xb0(%rbp),%eax
  40147b:	48 98                	cltq   
  40147d:	48 c1 e0 05          	shl    $0x5,%rax
  401481:	48 89 c2             	mov    %rax,%rdx
  401484:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
  401488:	48 8d 1c 02          	lea    (%rdx,%rax,1),%rbx
  40148c:	48 8d 95 68 ff ff ff 	lea    -0x98(%rbp),%rdx
  401493:	8b 8d 50 ff ff ff    	mov    -0xb0(%rbp),%ecx
  401499:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
  40149d:	89 ce                	mov    %ecx,%esi
  40149f:	48 89 c7             	mov    %rax,%rdi
  4014a2:	e8 8f 0c 00 00       	callq  402136 <eval_mm_valid>
  4014a7:	89 43 08             	mov    %eax,0x8(%rbx)
  4014aa:	8b 85 50 ff ff ff    	mov    -0xb0(%rbp),%eax
  4014b0:	48 98                	cltq   
  4014b2:	48 c1 e0 05          	shl    $0x5,%rax
  4014b6:	48 89 c2             	mov    %rax,%rdx
  4014b9:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
  4014bd:	48 01 d0             	add    %rdx,%rax
  4014c0:	8b 40 08             	mov    0x8(%rax),%eax
  4014c3:	85 c0                	test   %eax,%eax
  4014c5:	0f 84 ac 00 00 00    	je     401577 <main+0x6d1>
  4014cb:	8b 05 5b 61 20 00    	mov    0x20615b(%rip),%eax        # 60762c <verbose>
  4014d1:	85 c0                	test   %eax,%eax
  4014d3:	74 0f                	je     4014e4 <main+0x63e>
  4014d5:	bf 38 4e 40 00       	mov    $0x404e38,%edi
  4014da:	b8 00 00 00 00       	mov    $0x0,%eax
  4014df:	e8 4c f7 ff ff       	callq  400c30 <printf@plt>
  4014e4:	8b 85 50 ff ff ff    	mov    -0xb0(%rbp),%eax
  4014ea:	48 98                	cltq   
  4014ec:	48 c1 e0 05          	shl    $0x5,%rax
  4014f0:	48 89 c2             	mov    %rax,%rdx
  4014f3:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
  4014f7:	48 8d 1c 02          	lea    (%rdx,%rax,1),%rbx
  4014fb:	48 8d 95 68 ff ff ff 	lea    -0x98(%rbp),%rdx
  401502:	8b 8d 50 ff ff ff    	mov    -0xb0(%rbp),%ecx
  401508:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
  40150c:	89 ce                	mov    %ecx,%esi
  40150e:	48 89 c7             	mov    %rax,%rdi
  401511:	e8 9a 10 00 00       	callq  4025b0 <eval_mm_util>
  401516:	66 48 0f 7e c0       	movq   %xmm0,%rax
  40151b:	48 89 43 18          	mov    %rax,0x18(%rbx)
  40151f:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
  401523:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  401527:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  40152e:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  401532:	8b 05 f4 60 20 00    	mov    0x2060f4(%rip),%eax        # 60762c <verbose>
  401538:	85 c0                	test   %eax,%eax
  40153a:	74 0a                	je     401546 <main+0x6a0>
  40153c:	bf 51 4e 40 00       	mov    $0x404e51,%edi
  401541:	e8 aa f6 ff ff       	callq  400bf0 <puts@plt>
  401546:	8b 85 50 ff ff ff    	mov    -0xb0(%rbp),%eax
  40154c:	48 98                	cltq   
  40154e:	48 c1 e0 05          	shl    $0x5,%rax
  401552:	48 89 c2             	mov    %rax,%rdx
  401555:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
  401559:	48 8d 1c 02          	lea    (%rdx,%rax,1),%rbx
  40155d:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  401561:	48 89 c6             	mov    %rax,%rsi
  401564:	bf ff 28 40 00       	mov    $0x4028ff,%edi
  401569:	e8 78 1f 00 00       	callq  4034e6 <fsecs>
  40156e:	66 48 0f 7e c0       	movq   %xmm0,%rax
  401573:	48 89 43 10          	mov    %rax,0x10(%rbx)
  401577:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
  40157b:	48 89 c7             	mov    %rax,%rdi
  40157e:	e8 68 0b 00 00       	callq  4020eb <free_trace>
  401583:	83 85 50 ff ff ff 01 	addl   $0x1,-0xb0(%rbp)
  40158a:	8b 85 50 ff ff ff    	mov    -0xb0(%rbp),%eax
  401590:	3b 85 54 ff ff ff    	cmp    -0xac(%rbp),%eax
  401596:	0f 8c 69 fe ff ff    	jl     401405 <main+0x55f>
  40159c:	8b 05 8a 60 20 00    	mov    0x20608a(%rip),%eax        # 60762c <verbose>
  4015a2:	85 c0                	test   %eax,%eax
  4015a4:	74 28                	je     4015ce <main+0x728>
  4015a6:	bf 6a 4e 40 00       	mov    $0x404e6a,%edi
  4015ab:	e8 40 f6 ff ff       	callq  400bf0 <puts@plt>
  4015b0:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  4015b4:	8b 85 54 ff ff ff    	mov    -0xac(%rbp),%eax
  4015ba:	48 89 d6             	mov    %rdx,%rsi
  4015bd:	89 c7                	mov    %eax,%edi
  4015bf:	e8 21 19 00 00       	callq  402ee5 <printresults>
  4015c4:	bf 0a 00 00 00       	mov    $0xa,%edi
  4015c9:	e8 e2 f5 ff ff       	callq  400bb0 <putchar@plt>
  4015ce:	66 0f ef c0          	pxor   %xmm0,%xmm0
  4015d2:	f2 0f 11 85 78 ff ff 	movsd  %xmm0,-0x88(%rbp)
  4015d9:	ff 
  4015da:	66 0f ef c0          	pxor   %xmm0,%xmm0
  4015de:	f2 0f 11 45 80       	movsd  %xmm0,-0x80(%rbp)
  4015e3:	66 0f ef c0          	pxor   %xmm0,%xmm0
  4015e7:	f2 0f 11 45 88       	movsd  %xmm0,-0x78(%rbp)
  4015ec:	c7 85 64 ff ff ff 00 	movl   $0x0,-0x9c(%rbp)
  4015f3:	00 00 00 
  4015f6:	c7 85 50 ff ff ff 00 	movl   $0x0,-0xb0(%rbp)
  4015fd:	00 00 00 
  401600:	e9 ab 00 00 00       	jmpq   4016b0 <main+0x80a>
  401605:	8b 85 50 ff ff ff    	mov    -0xb0(%rbp),%eax
  40160b:	48 98                	cltq   
  40160d:	48 c1 e0 05          	shl    $0x5,%rax
  401611:	48 89 c2             	mov    %rax,%rdx
  401614:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
  401618:	48 01 d0             	add    %rdx,%rax
  40161b:	f2 0f 10 40 10       	movsd  0x10(%rax),%xmm0
  401620:	f2 0f 10 8d 78 ff ff 	movsd  -0x88(%rbp),%xmm1
  401627:	ff 
  401628:	f2 0f 58 c1          	addsd  %xmm1,%xmm0
  40162c:	f2 0f 11 85 78 ff ff 	movsd  %xmm0,-0x88(%rbp)
  401633:	ff 
  401634:	8b 85 50 ff ff ff    	mov    -0xb0(%rbp),%eax
  40163a:	48 98                	cltq   
  40163c:	48 c1 e0 05          	shl    $0x5,%rax
  401640:	48 89 c2             	mov    %rax,%rdx
  401643:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
  401647:	48 01 d0             	add    %rdx,%rax
  40164a:	f2 0f 10 00          	movsd  (%rax),%xmm0
  40164e:	f2 0f 10 4d 80       	movsd  -0x80(%rbp),%xmm1
  401653:	f2 0f 58 c1          	addsd  %xmm1,%xmm0
  401657:	f2 0f 11 45 80       	movsd  %xmm0,-0x80(%rbp)
  40165c:	8b 85 50 ff ff ff    	mov    -0xb0(%rbp),%eax
  401662:	48 98                	cltq   
  401664:	48 c1 e0 05          	shl    $0x5,%rax
  401668:	48 89 c2             	mov    %rax,%rdx
  40166b:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
  40166f:	48 01 d0             	add    %rdx,%rax
  401672:	f2 0f 10 40 18       	movsd  0x18(%rax),%xmm0
  401677:	f2 0f 10 4d 88       	movsd  -0x78(%rbp),%xmm1
  40167c:	f2 0f 58 c1          	addsd  %xmm1,%xmm0
  401680:	f2 0f 11 45 88       	movsd  %xmm0,-0x78(%rbp)
  401685:	8b 85 50 ff ff ff    	mov    -0xb0(%rbp),%eax
  40168b:	48 98                	cltq   
  40168d:	48 c1 e0 05          	shl    $0x5,%rax
  401691:	48 89 c2             	mov    %rax,%rdx
  401694:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
  401698:	48 01 d0             	add    %rdx,%rax
  40169b:	8b 40 08             	mov    0x8(%rax),%eax
  40169e:	85 c0                	test   %eax,%eax
  4016a0:	74 07                	je     4016a9 <main+0x803>
  4016a2:	83 85 64 ff ff ff 01 	addl   $0x1,-0x9c(%rbp)
  4016a9:	83 85 50 ff ff ff 01 	addl   $0x1,-0xb0(%rbp)
  4016b0:	8b 85 50 ff ff ff    	mov    -0xb0(%rbp),%eax
  4016b6:	3b 85 54 ff ff ff    	cmp    -0xac(%rbp),%eax
  4016bc:	0f 8c 43 ff ff ff    	jl     401605 <main+0x75f>
  4016c2:	66 0f ef c0          	pxor   %xmm0,%xmm0
  4016c6:	f2 0f 2a 85 54 ff ff 	cvtsi2sdl -0xac(%rbp),%xmm0
  4016cd:	ff 
  4016ce:	f2 0f 10 4d 88       	movsd  -0x78(%rbp),%xmm1
  4016d3:	f2 0f 5e c8          	divsd  %xmm0,%xmm1
  4016d7:	66 0f 28 c1          	movapd %xmm1,%xmm0
  4016db:	f2 0f 11 45 b8       	movsd  %xmm0,-0x48(%rbp)
  4016e0:	8b 05 4a 5f 20 00    	mov    0x205f4a(%rip),%eax        # 607630 <errors>
  4016e6:	85 c0                	test   %eax,%eax
  4016e8:	0f 85 c7 00 00 00    	jne    4017b5 <main+0x90f>
  4016ee:	f2 0f 10 45 80       	movsd  -0x80(%rbp),%xmm0
  4016f3:	f2 0f 5e 85 78 ff ff 	divsd  -0x88(%rbp),%xmm0
  4016fa:	ff 
  4016fb:	f2 0f 11 45 c0       	movsd  %xmm0,-0x40(%rbp)
  401700:	f2 0f 10 4d b8       	movsd  -0x48(%rbp),%xmm1
  401705:	f2 0f 10 05 e3 3f 00 	movsd  0x3fe3(%rip),%xmm0        # 4056f0 <__PRETTY_FUNCTION__.3917+0x10>
  40170c:	00 
  40170d:	f2 0f 59 c1          	mulsd  %xmm1,%xmm0
  401711:	f2 0f 11 45 c8       	movsd  %xmm0,-0x38(%rbp)
  401716:	f2 0f 10 45 c0       	movsd  -0x40(%rbp),%xmm0
  40171b:	66 0f 2e 05 d5 3f 00 	ucomisd 0x3fd5(%rip),%xmm0        # 4056f8 <__PRETTY_FUNCTION__.3917+0x18>
  401722:	00 
  401723:	76 0f                	jbe    401734 <main+0x88e>
  401725:	f2 0f 10 05 d3 3f 00 	movsd  0x3fd3(%rip),%xmm0        # 405700 <__PRETTY_FUNCTION__.3917+0x20>
  40172c:	00 
  40172d:	f2 0f 11 45 90       	movsd  %xmm0,-0x70(%rbp)
  401732:	eb 22                	jmp    401756 <main+0x8b0>
  401734:	f2 0f 10 45 c0       	movsd  -0x40(%rbp),%xmm0
  401739:	f2 0f 10 0d b7 3f 00 	movsd  0x3fb7(%rip),%xmm1        # 4056f8 <__PRETTY_FUNCTION__.3917+0x18>
  401740:	00 
  401741:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
  401745:	f2 0f 10 0d b3 3f 00 	movsd  0x3fb3(%rip),%xmm1        # 405700 <__PRETTY_FUNCTION__.3917+0x20>
  40174c:	00 
  40174d:	f2 0f 59 c1          	mulsd  %xmm1,%xmm0
  401751:	f2 0f 11 45 90       	movsd  %xmm0,-0x70(%rbp)
  401756:	f2 0f 10 45 c8       	movsd  -0x38(%rbp),%xmm0
  40175b:	f2 0f 58 45 90       	addsd  -0x70(%rbp),%xmm0
  401760:	f2 0f 10 0d a0 3f 00 	movsd  0x3fa0(%rip),%xmm1        # 405708 <__PRETTY_FUNCTION__.3917+0x28>
  401767:	00 
  401768:	f2 0f 59 c1          	mulsd  %xmm1,%xmm0
  40176c:	f2 0f 11 45 98       	movsd  %xmm0,-0x68(%rbp)
  401771:	f2 0f 10 4d 90       	movsd  -0x70(%rbp),%xmm1
  401776:	f2 0f 10 05 8a 3f 00 	movsd  0x3f8a(%rip),%xmm0        # 405708 <__PRETTY_FUNCTION__.3917+0x28>
  40177d:	00 
  40177e:	66 0f 28 d9          	movapd %xmm1,%xmm3
  401782:	f2 0f 59 d8          	mulsd  %xmm0,%xmm3
  401786:	f2 0f 10 4d c8       	movsd  -0x38(%rbp),%xmm1
  40178b:	f2 0f 10 05 75 3f 00 	movsd  0x3f75(%rip),%xmm0        # 405708 <__PRETTY_FUNCTION__.3917+0x28>
  401792:	00 
  401793:	f2 0f 59 c1          	mulsd  %xmm1,%xmm0
  401797:	f2 0f 10 4d 98       	movsd  -0x68(%rbp),%xmm1
  40179c:	66 0f 28 d1          	movapd %xmm1,%xmm2
  4017a0:	66 0f 28 cb          	movapd %xmm3,%xmm1
  4017a4:	bf 88 4e 40 00       	mov    $0x404e88,%edi
  4017a9:	b8 03 00 00 00       	mov    $0x3,%eax
  4017ae:	e8 7d f4 ff ff       	callq  400c30 <printf@plt>
  4017b3:	eb 20                	jmp    4017d5 <main+0x92f>
  4017b5:	66 0f ef c0          	pxor   %xmm0,%xmm0
  4017b9:	f2 0f 11 45 98       	movsd  %xmm0,-0x68(%rbp)
  4017be:	8b 05 6c 5e 20 00    	mov    0x205e6c(%rip),%eax        # 607630 <errors>
  4017c4:	89 c6                	mov    %eax,%esi
  4017c6:	bf bb 4e 40 00       	mov    $0x404ebb,%edi
  4017cb:	b8 00 00 00 00       	mov    $0x0,%eax
  4017d0:	e8 5b f4 ff ff       	callq  400c30 <printf@plt>
  4017d5:	83 bd 60 ff ff ff 00 	cmpl   $0x0,-0xa0(%rbp)
  4017dc:	74 39                	je     401817 <main+0x971>
  4017de:	8b 85 64 ff ff ff    	mov    -0x9c(%rbp),%eax
  4017e4:	89 c6                	mov    %eax,%esi
  4017e6:	bf d6 4e 40 00       	mov    $0x404ed6,%edi
  4017eb:	b8 00 00 00 00       	mov    $0x0,%eax
  4017f0:	e8 3b f4 ff ff       	callq  400c30 <printf@plt>
  4017f5:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  4017f9:	48 89 85 28 ff ff ff 	mov    %rax,-0xd8(%rbp)
  401800:	f2 0f 10 85 28 ff ff 	movsd  -0xd8(%rbp),%xmm0
  401807:	ff 
  401808:	bf e2 4e 40 00       	mov    $0x404ee2,%edi
  40180d:	b8 01 00 00 00       	mov    $0x1,%eax
  401812:	e8 19 f4 ff ff       	callq  400c30 <printf@plt>
  401817:	bf 00 00 00 00       	mov    $0x0,%edi
  40181c:	e8 2f f5 ff ff       	callq  400d50 <exit@plt>

0000000000401821 <add_range>:
  401821:	55                   	push   %rbp
  401822:	48 89 e5             	mov    %rsp,%rbp
  401825:	53                   	push   %rbx
  401826:	48 81 ec 48 04 00 00 	sub    $0x448,%rsp
  40182d:	48 89 bd c8 fb ff ff 	mov    %rdi,-0x438(%rbp)
  401834:	48 89 b5 c0 fb ff ff 	mov    %rsi,-0x440(%rbp)
  40183b:	89 95 bc fb ff ff    	mov    %edx,-0x444(%rbp)
  401841:	89 8d b8 fb ff ff    	mov    %ecx,-0x448(%rbp)
  401847:	44 89 85 b4 fb ff ff 	mov    %r8d,-0x44c(%rbp)
  40184e:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401855:	00 00 
  401857:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  40185b:	31 c0                	xor    %eax,%eax
  40185d:	8b 85 bc fb ff ff    	mov    -0x444(%rbp),%eax
  401863:	48 98                	cltq   
  401865:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  401869:	48 8b 85 c0 fb ff ff 	mov    -0x440(%rbp),%rax
  401870:	48 01 d0             	add    %rdx,%rax
  401873:	48 89 85 d8 fb ff ff 	mov    %rax,-0x428(%rbp)
  40187a:	83 bd bc fb ff ff 00 	cmpl   $0x0,-0x444(%rbp)
  401881:	7f 19                	jg     40189c <add_range+0x7b>
  401883:	b9 d0 56 40 00       	mov    $0x4056d0,%ecx
  401888:	ba 9b 01 00 00       	mov    $0x19b,%edx
  40188d:	be a0 4f 40 00       	mov    $0x404fa0,%esi
  401892:	bf aa 4f 40 00       	mov    $0x404faa,%edi
  401897:	e8 b4 f3 ff ff       	callq  400c50 <__assert_fail@plt>
  40189c:	48 8b 85 c0 fb ff ff 	mov    -0x440(%rbp),%rax
  4018a3:	83 e0 07             	and    $0x7,%eax
  4018a6:	85 c0                	test   %eax,%eax
  4018a8:	74 4b                	je     4018f5 <add_range+0xd4>
  4018aa:	48 8b 95 c0 fb ff ff 	mov    -0x440(%rbp),%rdx
  4018b1:	48 8d 85 e0 fb ff ff 	lea    -0x420(%rbp),%rax
  4018b8:	b9 08 00 00 00       	mov    $0x8,%ecx
  4018bd:	be b8 4f 40 00       	mov    $0x404fb8,%esi
  4018c2:	48 89 c7             	mov    %rax,%rdi
  4018c5:	b8 00 00 00 00       	mov    $0x0,%eax
  4018ca:	e8 71 f4 ff ff       	callq  400d40 <sprintf@plt>
  4018cf:	48 8d 95 e0 fb ff ff 	lea    -0x420(%rbp),%rdx
  4018d6:	8b 8d b4 fb ff ff    	mov    -0x44c(%rbp),%ecx
  4018dc:	8b 85 b8 fb ff ff    	mov    -0x448(%rbp),%eax
  4018e2:	89 ce                	mov    %ecx,%esi
  4018e4:	89 c7                	mov    %eax,%edi
  4018e6:	e8 f4 18 00 00       	callq  4031df <malloc_error>
  4018eb:	b8 00 00 00 00       	mov    $0x0,%eax
  4018f0:	e9 fa 01 00 00       	jmpq   401aef <add_range+0x2ce>
  4018f5:	e8 7d 1b 00 00       	callq  403477 <mem_heap_lo>
  4018fa:	48 3b 85 c0 fb ff ff 	cmp    -0x440(%rbp),%rax
  401901:	77 2a                	ja     40192d <add_range+0x10c>
  401903:	e8 7c 1b 00 00       	callq  403484 <mem_heap_hi>
  401908:	48 3b 85 c0 fb ff ff 	cmp    -0x440(%rbp),%rax
  40190f:	72 1c                	jb     40192d <add_range+0x10c>
  401911:	e8 61 1b 00 00       	callq  403477 <mem_heap_lo>
  401916:	48 3b 85 d8 fb ff ff 	cmp    -0x428(%rbp),%rax
  40191d:	77 0e                	ja     40192d <add_range+0x10c>
  40191f:	e8 60 1b 00 00       	callq  403484 <mem_heap_hi>
  401924:	48 3b 85 d8 fb ff ff 	cmp    -0x428(%rbp),%rax
  40192b:	73 63                	jae    401990 <add_range+0x16f>
  40192d:	e8 52 1b 00 00       	callq  403484 <mem_heap_hi>
  401932:	48 89 c3             	mov    %rax,%rbx
  401935:	e8 3d 1b 00 00       	callq  403477 <mem_heap_lo>
  40193a:	48 89 c6             	mov    %rax,%rsi
  40193d:	48 8b 8d d8 fb ff ff 	mov    -0x428(%rbp),%rcx
  401944:	48 8b 95 c0 fb ff ff 	mov    -0x440(%rbp),%rdx
  40194b:	48 8d 85 e0 fb ff ff 	lea    -0x420(%rbp),%rax
  401952:	49 89 d9             	mov    %rbx,%r9
  401955:	49 89 f0             	mov    %rsi,%r8
  401958:	be e8 4f 40 00       	mov    $0x404fe8,%esi
  40195d:	48 89 c7             	mov    %rax,%rdi
  401960:	b8 00 00 00 00       	mov    $0x0,%eax
  401965:	e8 d6 f3 ff ff       	callq  400d40 <sprintf@plt>
  40196a:	48 8d 95 e0 fb ff ff 	lea    -0x420(%rbp),%rdx
  401971:	8b 8d b4 fb ff ff    	mov    -0x44c(%rbp),%ecx
  401977:	8b 85 b8 fb ff ff    	mov    -0x448(%rbp),%eax
  40197d:	89 ce                	mov    %ecx,%esi
  40197f:	89 c7                	mov    %eax,%edi
  401981:	e8 59 18 00 00       	callq  4031df <malloc_error>
  401986:	b8 00 00 00 00       	mov    $0x0,%eax
  40198b:	e9 5f 01 00 00       	jmpq   401aef <add_range+0x2ce>
  401990:	48 8b 85 c8 fb ff ff 	mov    -0x438(%rbp),%rax
  401997:	48 8b 00             	mov    (%rax),%rax
  40199a:	48 89 85 d0 fb ff ff 	mov    %rax,-0x430(%rbp)
  4019a1:	e9 c8 00 00 00       	jmpq   401a6e <add_range+0x24d>
  4019a6:	48 8b 85 d0 fb ff ff 	mov    -0x430(%rbp),%rax
  4019ad:	48 8b 00             	mov    (%rax),%rax
  4019b0:	48 3b 85 c0 fb ff ff 	cmp    -0x440(%rbp),%rax
  4019b7:	77 14                	ja     4019cd <add_range+0x1ac>
  4019b9:	48 8b 85 d0 fb ff ff 	mov    -0x430(%rbp),%rax
  4019c0:	48 8b 40 08          	mov    0x8(%rax),%rax
  4019c4:	48 3b 85 c0 fb ff ff 	cmp    -0x440(%rbp),%rax
  4019cb:	73 27                	jae    4019f4 <add_range+0x1d3>
  4019cd:	48 8b 85 d0 fb ff ff 	mov    -0x430(%rbp),%rax
  4019d4:	48 8b 00             	mov    (%rax),%rax
  4019d7:	48 3b 85 d8 fb ff ff 	cmp    -0x428(%rbp),%rax
  4019de:	77 7c                	ja     401a5c <add_range+0x23b>
  4019e0:	48 8b 85 d0 fb ff ff 	mov    -0x430(%rbp),%rax
  4019e7:	48 8b 40 08          	mov    0x8(%rax),%rax
  4019eb:	48 3b 85 d8 fb ff ff 	cmp    -0x428(%rbp),%rax
  4019f2:	72 68                	jb     401a5c <add_range+0x23b>
  4019f4:	48 8b 85 d0 fb ff ff 	mov    -0x430(%rbp),%rax
  4019fb:	48 8b 78 08          	mov    0x8(%rax),%rdi
  4019ff:	48 8b 85 d0 fb ff ff 	mov    -0x430(%rbp),%rax
  401a06:	48 8b 30             	mov    (%rax),%rsi
  401a09:	48 8b 8d d8 fb ff ff 	mov    -0x428(%rbp),%rcx
  401a10:	48 8b 95 c0 fb ff ff 	mov    -0x440(%rbp),%rdx
  401a17:	48 8d 85 e0 fb ff ff 	lea    -0x420(%rbp),%rax
  401a1e:	49 89 f9             	mov    %rdi,%r9
  401a21:	49 89 f0             	mov    %rsi,%r8
  401a24:	be 18 50 40 00       	mov    $0x405018,%esi
  401a29:	48 89 c7             	mov    %rax,%rdi
  401a2c:	b8 00 00 00 00       	mov    $0x0,%eax
  401a31:	e8 0a f3 ff ff       	callq  400d40 <sprintf@plt>
  401a36:	48 8d 95 e0 fb ff ff 	lea    -0x420(%rbp),%rdx
  401a3d:	8b 8d b4 fb ff ff    	mov    -0x44c(%rbp),%ecx
  401a43:	8b 85 b8 fb ff ff    	mov    -0x448(%rbp),%eax
  401a49:	89 ce                	mov    %ecx,%esi
  401a4b:	89 c7                	mov    %eax,%edi
  401a4d:	e8 8d 17 00 00       	callq  4031df <malloc_error>
  401a52:	b8 00 00 00 00       	mov    $0x0,%eax
  401a57:	e9 93 00 00 00       	jmpq   401aef <add_range+0x2ce>
  401a5c:	48 8b 85 d0 fb ff ff 	mov    -0x430(%rbp),%rax
  401a63:	48 8b 40 10          	mov    0x10(%rax),%rax
  401a67:	48 89 85 d0 fb ff ff 	mov    %rax,-0x430(%rbp)
  401a6e:	48 83 bd d0 fb ff ff 	cmpq   $0x0,-0x430(%rbp)
  401a75:	00 
  401a76:	0f 85 2a ff ff ff    	jne    4019a6 <add_range+0x185>
  401a7c:	bf 18 00 00 00       	mov    $0x18,%edi
  401a81:	e8 1a f2 ff ff       	callq  400ca0 <malloc@plt>
  401a86:	48 89 85 d0 fb ff ff 	mov    %rax,-0x430(%rbp)
  401a8d:	48 83 bd d0 fb ff ff 	cmpq   $0x0,-0x430(%rbp)
  401a94:	00 
  401a95:	75 0a                	jne    401aa1 <add_range+0x280>
  401a97:	bf 4a 50 40 00       	mov    $0x40504a,%edi
  401a9c:	e8 01 17 00 00       	callq  4031a2 <unix_error>
  401aa1:	48 8b 85 c8 fb ff ff 	mov    -0x438(%rbp),%rax
  401aa8:	48 8b 10             	mov    (%rax),%rdx
  401aab:	48 8b 85 d0 fb ff ff 	mov    -0x430(%rbp),%rax
  401ab2:	48 89 50 10          	mov    %rdx,0x10(%rax)
  401ab6:	48 8b 85 d0 fb ff ff 	mov    -0x430(%rbp),%rax
  401abd:	48 8b 95 c0 fb ff ff 	mov    -0x440(%rbp),%rdx
  401ac4:	48 89 10             	mov    %rdx,(%rax)
  401ac7:	48 8b 85 d0 fb ff ff 	mov    -0x430(%rbp),%rax
  401ace:	48 8b 95 d8 fb ff ff 	mov    -0x428(%rbp),%rdx
  401ad5:	48 89 50 08          	mov    %rdx,0x8(%rax)
  401ad9:	48 8b 85 c8 fb ff ff 	mov    -0x438(%rbp),%rax
  401ae0:	48 8b 95 d0 fb ff ff 	mov    -0x430(%rbp),%rdx
  401ae7:	48 89 10             	mov    %rdx,(%rax)
  401aea:	b8 01 00 00 00       	mov    $0x1,%eax
  401aef:	48 8b 5d e8          	mov    -0x18(%rbp),%rbx
  401af3:	64 48 33 1c 25 28 00 	xor    %fs:0x28,%rbx
  401afa:	00 00 
  401afc:	74 05                	je     401b03 <add_range+0x2e2>
  401afe:	e8 1d f1 ff ff       	callq  400c20 <__stack_chk_fail@plt>
  401b03:	48 81 c4 48 04 00 00 	add    $0x448,%rsp
  401b0a:	5b                   	pop    %rbx
  401b0b:	5d                   	pop    %rbp
  401b0c:	c3                   	retq   

0000000000401b0d <remove_range>:
  401b0d:	55                   	push   %rbp
  401b0e:	48 89 e5             	mov    %rsp,%rbp
  401b11:	48 83 ec 20          	sub    $0x20,%rsp
  401b15:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  401b19:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  401b1d:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  401b22:	74 60                	je     401b84 <remove_range+0x77>
  401b24:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  401b28:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  401b2c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  401b30:	48 8b 00             	mov    (%rax),%rax
  401b33:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  401b37:	eb 42                	jmp    401b7b <remove_range+0x6e>
  401b39:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  401b3d:	48 8b 00             	mov    (%rax),%rax
  401b40:	48 3b 45 e0          	cmp    -0x20(%rbp),%rax
  401b44:	75 1d                	jne    401b63 <remove_range+0x56>
  401b46:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  401b4a:	48 8b 50 10          	mov    0x10(%rax),%rdx
  401b4e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  401b52:	48 89 10             	mov    %rdx,(%rax)
  401b55:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  401b59:	48 89 c7             	mov    %rax,%rdi
  401b5c:	e8 3f f0 ff ff       	callq  400ba0 <free@plt>
  401b61:	eb 22                	jmp    401b85 <remove_range+0x78>
  401b63:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  401b67:	48 83 c0 10          	add    $0x10,%rax
  401b6b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  401b6f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  401b73:	48 8b 40 10          	mov    0x10(%rax),%rax
  401b77:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  401b7b:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
  401b80:	75 b7                	jne    401b39 <remove_range+0x2c>
  401b82:	eb 01                	jmp    401b85 <remove_range+0x78>
  401b84:	90                   	nop
  401b85:	c9                   	leaveq 
  401b86:	c3                   	retq   

0000000000401b87 <clear_ranges>:
  401b87:	55                   	push   %rbp
  401b88:	48 89 e5             	mov    %rsp,%rbp
  401b8b:	48 83 ec 20          	sub    $0x20,%rsp
  401b8f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  401b93:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  401b97:	48 8b 00             	mov    (%rax),%rax
  401b9a:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  401b9e:	eb 20                	jmp    401bc0 <clear_ranges+0x39>
  401ba0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  401ba4:	48 8b 40 10          	mov    0x10(%rax),%rax
  401ba8:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  401bac:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  401bb0:	48 89 c7             	mov    %rax,%rdi
  401bb3:	e8 e8 ef ff ff       	callq  400ba0 <free@plt>
  401bb8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  401bbc:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  401bc0:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
  401bc5:	75 d9                	jne    401ba0 <clear_ranges+0x19>
  401bc7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  401bcb:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  401bd2:	90                   	nop
  401bd3:	c9                   	leaveq 
  401bd4:	c3                   	retq   

0000000000401bd5 <read_trace>:
  401bd5:	55                   	push   %rbp
  401bd6:	48 89 e5             	mov    %rsp,%rbp
  401bd9:	48 81 ec 40 08 00 00 	sub    $0x840,%rsp
  401be0:	48 89 bd c8 f7 ff ff 	mov    %rdi,-0x838(%rbp)
  401be7:	48 89 b5 c0 f7 ff ff 	mov    %rsi,-0x840(%rbp)
  401bee:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401bf5:	00 00 
  401bf7:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  401bfb:	31 c0                	xor    %eax,%eax
  401bfd:	c7 85 d8 f7 ff ff 00 	movl   $0x0,-0x828(%rbp)
  401c04:	00 00 00 
  401c07:	8b 05 1f 5a 20 00    	mov    0x205a1f(%rip),%eax        # 60762c <verbose>
  401c0d:	85 c0                	test   %eax,%eax
  401c0f:	74 19                	je     401c2a <read_trace+0x55>
  401c11:	48 8b 85 c0 f7 ff ff 	mov    -0x840(%rbp),%rax
  401c18:	48 89 c6             	mov    %rax,%rsi
  401c1b:	bf 64 50 40 00       	mov    $0x405064,%edi
  401c20:	b8 00 00 00 00       	mov    $0x0,%eax
  401c25:	e8 06 f0 ff ff       	callq  400c30 <printf@plt>
  401c2a:	bf 28 00 00 00       	mov    $0x28,%edi
  401c2f:	e8 6c f0 ff ff       	callq  400ca0 <malloc@plt>
  401c34:	48 89 85 e0 f7 ff ff 	mov    %rax,-0x820(%rbp)
  401c3b:	48 83 bd e0 f7 ff ff 	cmpq   $0x0,-0x820(%rbp)
  401c42:	00 
  401c43:	75 0a                	jne    401c4f <read_trace+0x7a>
  401c45:	bf 80 50 40 00       	mov    $0x405080,%edi
  401c4a:	e8 53 15 00 00       	callq  4031a2 <unix_error>
  401c4f:	48 8b 95 c8 f7 ff ff 	mov    -0x838(%rbp),%rdx
  401c56:	48 8d 85 f0 fb ff ff 	lea    -0x410(%rbp),%rax
  401c5d:	48 89 d6             	mov    %rdx,%rsi
  401c60:	48 89 c7             	mov    %rax,%rdi
  401c63:	e8 68 ef ff ff       	callq  400bd0 <strcpy@plt>
  401c68:	48 8b 95 c0 f7 ff ff 	mov    -0x840(%rbp),%rdx
  401c6f:	48 8d 85 f0 fb ff ff 	lea    -0x410(%rbp),%rax
  401c76:	48 89 d6             	mov    %rdx,%rsi
  401c79:	48 89 c7             	mov    %rax,%rdi
  401c7c:	e8 9f f0 ff ff       	callq  400d20 <strcat@plt>
  401c81:	48 8d 85 f0 fb ff ff 	lea    -0x410(%rbp),%rax
  401c88:	be 9f 50 40 00       	mov    $0x40509f,%esi
  401c8d:	48 89 c7             	mov    %rax,%rdi
  401c90:	e8 4b f0 ff ff       	callq  400ce0 <fopen@plt>
  401c95:	48 89 85 e8 f7 ff ff 	mov    %rax,-0x818(%rbp)
  401c9c:	48 83 bd e8 f7 ff ff 	cmpq   $0x0,-0x818(%rbp)
  401ca3:	00 
  401ca4:	75 28                	jne    401cce <read_trace+0xf9>
  401ca6:	48 8d 85 f0 fb ff ff 	lea    -0x410(%rbp),%rax
  401cad:	48 89 c2             	mov    %rax,%rdx
  401cb0:	be a8 50 40 00       	mov    $0x4050a8,%esi
  401cb5:	bf 20 77 60 00       	mov    $0x607720,%edi
  401cba:	b8 00 00 00 00       	mov    $0x0,%eax
  401cbf:	e8 7c f0 ff ff       	callq  400d40 <sprintf@plt>
  401cc4:	bf 20 77 60 00       	mov    $0x607720,%edi
  401cc9:	e8 d4 14 00 00       	callq  4031a2 <unix_error>
  401cce:	48 8b 95 e0 f7 ff ff 	mov    -0x820(%rbp),%rdx
  401cd5:	48 8b 85 e8 f7 ff ff 	mov    -0x818(%rbp),%rax
  401cdc:	be c8 50 40 00       	mov    $0x4050c8,%esi
  401ce1:	48 89 c7             	mov    %rax,%rdi
  401ce4:	b8 00 00 00 00       	mov    $0x0,%eax
  401ce9:	e8 f2 ee ff ff       	callq  400be0 <__isoc99_fscanf@plt>
  401cee:	48 8b 85 e0 f7 ff ff 	mov    -0x820(%rbp),%rax
  401cf5:	48 8d 50 04          	lea    0x4(%rax),%rdx
  401cf9:	48 8b 85 e8 f7 ff ff 	mov    -0x818(%rbp),%rax
  401d00:	be c8 50 40 00       	mov    $0x4050c8,%esi
  401d05:	48 89 c7             	mov    %rax,%rdi
  401d08:	b8 00 00 00 00       	mov    $0x0,%eax
  401d0d:	e8 ce ee ff ff       	callq  400be0 <__isoc99_fscanf@plt>
  401d12:	48 8b 85 e0 f7 ff ff 	mov    -0x820(%rbp),%rax
  401d19:	48 8d 50 08          	lea    0x8(%rax),%rdx
  401d1d:	48 8b 85 e8 f7 ff ff 	mov    -0x818(%rbp),%rax
  401d24:	be c8 50 40 00       	mov    $0x4050c8,%esi
  401d29:	48 89 c7             	mov    %rax,%rdi
  401d2c:	b8 00 00 00 00       	mov    $0x0,%eax
  401d31:	e8 aa ee ff ff       	callq  400be0 <__isoc99_fscanf@plt>
  401d36:	48 8b 85 e0 f7 ff ff 	mov    -0x820(%rbp),%rax
  401d3d:	48 8d 50 0c          	lea    0xc(%rax),%rdx
  401d41:	48 8b 85 e8 f7 ff ff 	mov    -0x818(%rbp),%rax
  401d48:	be c8 50 40 00       	mov    $0x4050c8,%esi
  401d4d:	48 89 c7             	mov    %rax,%rdi
  401d50:	b8 00 00 00 00       	mov    $0x0,%eax
  401d55:	e8 86 ee ff ff       	callq  400be0 <__isoc99_fscanf@plt>
  401d5a:	48 8b 85 e0 f7 ff ff 	mov    -0x820(%rbp),%rax
  401d61:	8b 40 08             	mov    0x8(%rax),%eax
  401d64:	48 98                	cltq   
  401d66:	be 10 00 00 00       	mov    $0x10,%esi
  401d6b:	48 89 c7             	mov    %rax,%rdi
  401d6e:	e8 0d ef ff ff       	callq  400c80 <calloc@plt>
  401d73:	48 89 c2             	mov    %rax,%rdx
  401d76:	48 8b 85 e0 f7 ff ff 	mov    -0x820(%rbp),%rax
  401d7d:	48 89 50 10          	mov    %rdx,0x10(%rax)
  401d81:	48 8b 85 e0 f7 ff ff 	mov    -0x820(%rbp),%rax
  401d88:	48 8b 40 10          	mov    0x10(%rax),%rax
  401d8c:	48 85 c0             	test   %rax,%rax
  401d8f:	75 0a                	jne    401d9b <read_trace+0x1c6>
  401d91:	bf cb 50 40 00       	mov    $0x4050cb,%edi
  401d96:	e8 07 14 00 00       	callq  4031a2 <unix_error>
  401d9b:	48 8b 85 e0 f7 ff ff 	mov    -0x820(%rbp),%rax
  401da2:	8b 40 04             	mov    0x4(%rax),%eax
  401da5:	48 98                	cltq   
  401da7:	48 c1 e0 03          	shl    $0x3,%rax
  401dab:	48 89 c7             	mov    %rax,%rdi
  401dae:	e8 ed ee ff ff       	callq  400ca0 <malloc@plt>
  401db3:	48 89 c2             	mov    %rax,%rdx
  401db6:	48 8b 85 e0 f7 ff ff 	mov    -0x820(%rbp),%rax
  401dbd:	48 89 50 18          	mov    %rdx,0x18(%rax)
  401dc1:	48 8b 85 e0 f7 ff ff 	mov    -0x820(%rbp),%rax
  401dc8:	48 8b 40 18          	mov    0x18(%rax),%rax
  401dcc:	48 85 c0             	test   %rax,%rax
  401dcf:	75 0a                	jne    401ddb <read_trace+0x206>
  401dd1:	bf e9 50 40 00       	mov    $0x4050e9,%edi
  401dd6:	e8 c7 13 00 00       	callq  4031a2 <unix_error>
  401ddb:	48 8b 85 e0 f7 ff ff 	mov    -0x820(%rbp),%rax
  401de2:	8b 40 04             	mov    0x4(%rax),%eax
  401de5:	48 98                	cltq   
  401de7:	48 c1 e0 03          	shl    $0x3,%rax
  401deb:	48 89 c7             	mov    %rax,%rdi
  401dee:	e8 ad ee ff ff       	callq  400ca0 <malloc@plt>
  401df3:	48 89 c2             	mov    %rax,%rdx
  401df6:	48 8b 85 e0 f7 ff ff 	mov    -0x820(%rbp),%rax
  401dfd:	48 89 50 20          	mov    %rdx,0x20(%rax)
  401e01:	48 8b 85 e0 f7 ff ff 	mov    -0x820(%rbp),%rax
  401e08:	48 8b 40 20          	mov    0x20(%rax),%rax
  401e0c:	48 85 c0             	test   %rax,%rax
  401e0f:	75 0a                	jne    401e1b <read_trace+0x246>
  401e11:	bf 07 51 40 00       	mov    $0x405107,%edi
  401e16:	e8 87 13 00 00       	callq  4031a2 <unix_error>
  401e1b:	c7 85 d0 f7 ff ff 00 	movl   $0x0,-0x830(%rbp)
  401e22:	00 00 00 
  401e25:	c7 85 dc f7 ff ff 00 	movl   $0x0,-0x824(%rbp)
  401e2c:	00 00 00 
  401e2f:	e9 09 02 00 00       	jmpq   40203d <read_trace+0x468>
  401e34:	0f b6 85 f0 f7 ff ff 	movzbl -0x810(%rbp),%eax
  401e3b:	0f be c0             	movsbl %al,%eax
  401e3e:	83 f8 66             	cmp    $0x66,%eax
  401e41:	0f 84 62 01 00 00    	je     401fa9 <read_trace+0x3d4>
  401e47:	83 f8 72             	cmp    $0x72,%eax
  401e4a:	0f 84 b1 00 00 00    	je     401f01 <read_trace+0x32c>
  401e50:	83 f8 61             	cmp    $0x61,%eax
  401e53:	0f 85 b1 01 00 00    	jne    40200a <read_trace+0x435>
  401e59:	48 8d 8d d4 f7 ff ff 	lea    -0x82c(%rbp),%rcx
  401e60:	48 8d 95 d0 f7 ff ff 	lea    -0x830(%rbp),%rdx
  401e67:	48 8b 85 e8 f7 ff ff 	mov    -0x818(%rbp),%rax
  401e6e:	be 25 51 40 00       	mov    $0x405125,%esi
  401e73:	48 89 c7             	mov    %rax,%rdi
  401e76:	b8 00 00 00 00       	mov    $0x0,%eax
  401e7b:	e8 60 ed ff ff       	callq  400be0 <__isoc99_fscanf@plt>
  401e80:	48 8b 85 e0 f7 ff ff 	mov    -0x820(%rbp),%rax
  401e87:	48 8b 40 10          	mov    0x10(%rax),%rax
  401e8b:	8b 95 dc f7 ff ff    	mov    -0x824(%rbp),%edx
  401e91:	48 c1 e2 04          	shl    $0x4,%rdx
  401e95:	48 01 d0             	add    %rdx,%rax
  401e98:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  401e9e:	48 8b 85 e0 f7 ff ff 	mov    -0x820(%rbp),%rax
  401ea5:	48 8b 40 10          	mov    0x10(%rax),%rax
  401ea9:	8b 95 dc f7 ff ff    	mov    -0x824(%rbp),%edx
  401eaf:	48 c1 e2 04          	shl    $0x4,%rdx
  401eb3:	48 01 d0             	add    %rdx,%rax
  401eb6:	8b 95 d0 f7 ff ff    	mov    -0x830(%rbp),%edx
  401ebc:	89 50 04             	mov    %edx,0x4(%rax)
  401ebf:	48 8b 85 e0 f7 ff ff 	mov    -0x820(%rbp),%rax
  401ec6:	48 8b 40 10          	mov    0x10(%rax),%rax
  401eca:	8b 95 dc f7 ff ff    	mov    -0x824(%rbp),%edx
  401ed0:	48 c1 e2 04          	shl    $0x4,%rdx
  401ed4:	48 01 d0             	add    %rdx,%rax
  401ed7:	8b 95 d4 f7 ff ff    	mov    -0x82c(%rbp),%edx
  401edd:	89 d2                	mov    %edx,%edx
  401edf:	48 89 50 08          	mov    %rdx,0x8(%rax)
  401ee3:	8b 85 d0 f7 ff ff    	mov    -0x830(%rbp),%eax
  401ee9:	39 85 d8 f7 ff ff    	cmp    %eax,-0x828(%rbp)
  401eef:	0f 43 85 d8 f7 ff ff 	cmovae -0x828(%rbp),%eax
  401ef6:	89 85 d8 f7 ff ff    	mov    %eax,-0x828(%rbp)
  401efc:	e9 35 01 00 00       	jmpq   402036 <read_trace+0x461>
  401f01:	48 8d 8d d4 f7 ff ff 	lea    -0x82c(%rbp),%rcx
  401f08:	48 8d 95 d0 f7 ff ff 	lea    -0x830(%rbp),%rdx
  401f0f:	48 8b 85 e8 f7 ff ff 	mov    -0x818(%rbp),%rax
  401f16:	be 25 51 40 00       	mov    $0x405125,%esi
  401f1b:	48 89 c7             	mov    %rax,%rdi
  401f1e:	b8 00 00 00 00       	mov    $0x0,%eax
  401f23:	e8 b8 ec ff ff       	callq  400be0 <__isoc99_fscanf@plt>
  401f28:	48 8b 85 e0 f7 ff ff 	mov    -0x820(%rbp),%rax
  401f2f:	48 8b 40 10          	mov    0x10(%rax),%rax
  401f33:	8b 95 dc f7 ff ff    	mov    -0x824(%rbp),%edx
  401f39:	48 c1 e2 04          	shl    $0x4,%rdx
  401f3d:	48 01 d0             	add    %rdx,%rax
  401f40:	c7 00 02 00 00 00    	movl   $0x2,(%rax)
  401f46:	48 8b 85 e0 f7 ff ff 	mov    -0x820(%rbp),%rax
  401f4d:	48 8b 40 10          	mov    0x10(%rax),%rax
  401f51:	8b 95 dc f7 ff ff    	mov    -0x824(%rbp),%edx
  401f57:	48 c1 e2 04          	shl    $0x4,%rdx
  401f5b:	48 01 d0             	add    %rdx,%rax
  401f5e:	8b 95 d0 f7 ff ff    	mov    -0x830(%rbp),%edx
  401f64:	89 50 04             	mov    %edx,0x4(%rax)
  401f67:	48 8b 85 e0 f7 ff ff 	mov    -0x820(%rbp),%rax
  401f6e:	48 8b 40 10          	mov    0x10(%rax),%rax
  401f72:	8b 95 dc f7 ff ff    	mov    -0x824(%rbp),%edx
  401f78:	48 c1 e2 04          	shl    $0x4,%rdx
  401f7c:	48 01 d0             	add    %rdx,%rax
  401f7f:	8b 95 d4 f7 ff ff    	mov    -0x82c(%rbp),%edx
  401f85:	89 d2                	mov    %edx,%edx
  401f87:	48 89 50 08          	mov    %rdx,0x8(%rax)
  401f8b:	8b 85 d0 f7 ff ff    	mov    -0x830(%rbp),%eax
  401f91:	39 85 d8 f7 ff ff    	cmp    %eax,-0x828(%rbp)
  401f97:	0f 43 85 d8 f7 ff ff 	cmovae -0x828(%rbp),%eax
  401f9e:	89 85 d8 f7 ff ff    	mov    %eax,-0x828(%rbp)
  401fa4:	e9 8d 00 00 00       	jmpq   402036 <read_trace+0x461>
  401fa9:	48 8d 95 d0 f7 ff ff 	lea    -0x830(%rbp),%rdx
  401fb0:	48 8b 85 e8 f7 ff ff 	mov    -0x818(%rbp),%rax
  401fb7:	be 2b 51 40 00       	mov    $0x40512b,%esi
  401fbc:	48 89 c7             	mov    %rax,%rdi
  401fbf:	b8 00 00 00 00       	mov    $0x0,%eax
  401fc4:	e8 17 ec ff ff       	callq  400be0 <__isoc99_fscanf@plt>
  401fc9:	48 8b 85 e0 f7 ff ff 	mov    -0x820(%rbp),%rax
  401fd0:	48 8b 40 10          	mov    0x10(%rax),%rax
  401fd4:	8b 95 dc f7 ff ff    	mov    -0x824(%rbp),%edx
  401fda:	48 c1 e2 04          	shl    $0x4,%rdx
  401fde:	48 01 d0             	add    %rdx,%rax
  401fe1:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
  401fe7:	48 8b 85 e0 f7 ff ff 	mov    -0x820(%rbp),%rax
  401fee:	48 8b 40 10          	mov    0x10(%rax),%rax
  401ff2:	8b 95 dc f7 ff ff    	mov    -0x824(%rbp),%edx
  401ff8:	48 c1 e2 04          	shl    $0x4,%rdx
  401ffc:	48 01 d0             	add    %rdx,%rax
  401fff:	8b 95 d0 f7 ff ff    	mov    -0x830(%rbp),%edx
  402005:	89 50 04             	mov    %edx,0x4(%rax)
  402008:	eb 2c                	jmp    402036 <read_trace+0x461>
  40200a:	0f b6 85 f0 f7 ff ff 	movzbl -0x810(%rbp),%eax
  402011:	0f be c0             	movsbl %al,%eax
  402014:	48 8d 95 f0 fb ff ff 	lea    -0x410(%rbp),%rdx
  40201b:	89 c6                	mov    %eax,%esi
  40201d:	bf 30 51 40 00       	mov    $0x405130,%edi
  402022:	b8 00 00 00 00       	mov    $0x0,%eax
  402027:	e8 04 ec ff ff       	callq  400c30 <printf@plt>
  40202c:	bf 01 00 00 00       	mov    $0x1,%edi
  402031:	e8 1a ed ff ff       	callq  400d50 <exit@plt>
  402036:	83 85 dc f7 ff ff 01 	addl   $0x1,-0x824(%rbp)
  40203d:	48 8d 95 f0 f7 ff ff 	lea    -0x810(%rbp),%rdx
  402044:	48 8b 85 e8 f7 ff ff 	mov    -0x818(%rbp),%rax
  40204b:	be 5b 51 40 00       	mov    $0x40515b,%esi
  402050:	48 89 c7             	mov    %rax,%rdi
  402053:	b8 00 00 00 00       	mov    $0x0,%eax
  402058:	e8 83 eb ff ff       	callq  400be0 <__isoc99_fscanf@plt>
  40205d:	83 f8 ff             	cmp    $0xffffffff,%eax
  402060:	0f 85 ce fd ff ff    	jne    401e34 <read_trace+0x25f>
  402066:	48 8b 85 e8 f7 ff ff 	mov    -0x818(%rbp),%rax
  40206d:	48 89 c7             	mov    %rax,%rdi
  402070:	e8 8b eb ff ff       	callq  400c00 <fclose@plt>
  402075:	48 8b 85 e0 f7 ff ff 	mov    -0x820(%rbp),%rax
  40207c:	8b 40 04             	mov    0x4(%rax),%eax
  40207f:	83 e8 01             	sub    $0x1,%eax
  402082:	3b 85 d8 f7 ff ff    	cmp    -0x828(%rbp),%eax
  402088:	74 19                	je     4020a3 <read_trace+0x4ce>
  40208a:	b9 e0 56 40 00       	mov    $0x4056e0,%ecx
  40208f:	ba 4a 02 00 00       	mov    $0x24a,%edx
  402094:	be a0 4f 40 00       	mov    $0x404fa0,%esi
  402099:	bf 60 51 40 00       	mov    $0x405160,%edi
  40209e:	e8 ad eb ff ff       	callq  400c50 <__assert_fail@plt>
  4020a3:	48 8b 85 e0 f7 ff ff 	mov    -0x820(%rbp),%rax
  4020aa:	8b 40 08             	mov    0x8(%rax),%eax
  4020ad:	3b 85 dc f7 ff ff    	cmp    -0x824(%rbp),%eax
  4020b3:	74 19                	je     4020ce <read_trace+0x4f9>
  4020b5:	b9 e0 56 40 00       	mov    $0x4056e0,%ecx
  4020ba:	ba 4b 02 00 00       	mov    $0x24b,%edx
  4020bf:	be a0 4f 40 00       	mov    $0x404fa0,%esi
  4020c4:	bf 80 51 40 00       	mov    $0x405180,%edi
  4020c9:	e8 82 eb ff ff       	callq  400c50 <__assert_fail@plt>
  4020ce:	48 8b 85 e0 f7 ff ff 	mov    -0x820(%rbp),%rax
  4020d5:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  4020d9:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  4020e0:	00 00 
  4020e2:	74 05                	je     4020e9 <read_trace+0x514>
  4020e4:	e8 37 eb ff ff       	callq  400c20 <__stack_chk_fail@plt>
  4020e9:	c9                   	leaveq 
  4020ea:	c3                   	retq   

00000000004020eb <free_trace>:
  4020eb:	55                   	push   %rbp
  4020ec:	48 89 e5             	mov    %rsp,%rbp
  4020ef:	48 83 ec 10          	sub    $0x10,%rsp
  4020f3:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  4020f7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4020fb:	48 8b 40 10          	mov    0x10(%rax),%rax
  4020ff:	48 89 c7             	mov    %rax,%rdi
  402102:	e8 99 ea ff ff       	callq  400ba0 <free@plt>
  402107:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  40210b:	48 8b 40 18          	mov    0x18(%rax),%rax
  40210f:	48 89 c7             	mov    %rax,%rdi
  402112:	e8 89 ea ff ff       	callq  400ba0 <free@plt>
  402117:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  40211b:	48 8b 40 20          	mov    0x20(%rax),%rax
  40211f:	48 89 c7             	mov    %rax,%rdi
  402122:	e8 79 ea ff ff       	callq  400ba0 <free@plt>
  402127:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  40212b:	48 89 c7             	mov    %rax,%rdi
  40212e:	e8 6d ea ff ff       	callq  400ba0 <free@plt>
  402133:	90                   	nop
  402134:	c9                   	leaveq 
  402135:	c3                   	retq   

0000000000402136 <eval_mm_valid>:
  402136:	55                   	push   %rbp
  402137:	48 89 e5             	mov    %rsp,%rbp
  40213a:	48 83 ec 60          	sub    $0x60,%rsp
  40213e:	48 89 7d b8          	mov    %rdi,-0x48(%rbp)
  402142:	89 75 b4             	mov    %esi,-0x4c(%rbp)
  402145:	48 89 55 a8          	mov    %rdx,-0x58(%rbp)
  402149:	e8 8f 12 00 00       	callq  4033dd <mem_reset_brk>
  40214e:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  402152:	48 89 c7             	mov    %rax,%rdi
  402155:	e8 2d fa ff ff       	callq  401b87 <clear_ranges>
  40215a:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  40215e:	8b 40 04             	mov    0x4(%rax),%eax
  402161:	48 98                	cltq   
  402163:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  40216a:	00 
  40216b:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  40216f:	48 8b 40 18          	mov    0x18(%rax),%rax
  402173:	be 00 00 00 00       	mov    $0x0,%esi
  402178:	48 89 c7             	mov    %rax,%rdi
  40217b:	e8 e0 ea ff ff       	callq  400c60 <memset@plt>
  402180:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  402184:	8b 40 04             	mov    0x4(%rax),%eax
  402187:	48 98                	cltq   
  402189:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  402190:	00 
  402191:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  402195:	48 8b 40 20          	mov    0x20(%rax),%rax
  402199:	be 00 00 00 00       	mov    $0x0,%esi
  40219e:	48 89 c7             	mov    %rax,%rdi
  4021a1:	e8 ba ea ff ff       	callq  400c60 <memset@plt>
  4021a6:	e8 c8 1e 00 00       	callq  404073 <mm_init>
  4021ab:	85 c0                	test   %eax,%eax
  4021ad:	79 1e                	jns    4021cd <eval_mm_valid+0x97>
  4021af:	8b 45 b4             	mov    -0x4c(%rbp),%eax
  4021b2:	ba 9b 51 40 00       	mov    $0x40519b,%edx
  4021b7:	be 00 00 00 00       	mov    $0x0,%esi
  4021bc:	89 c7                	mov    %eax,%edi
  4021be:	e8 1c 10 00 00       	callq  4031df <malloc_error>
  4021c3:	b8 00 00 00 00       	mov    $0x0,%eax
  4021c8:	e9 e1 03 00 00       	jmpq   4025ae <eval_mm_valid+0x478>
  4021cd:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%rbp)
  4021d4:	e9 c0 03 00 00       	jmpq   402599 <eval_mm_valid+0x463>
  4021d9:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  4021dd:	48 8b 40 10          	mov    0x10(%rax),%rax
  4021e1:	8b 55 cc             	mov    -0x34(%rbp),%edx
  4021e4:	48 63 d2             	movslq %edx,%rdx
  4021e7:	48 c1 e2 04          	shl    $0x4,%rdx
  4021eb:	48 01 d0             	add    %rdx,%rax
  4021ee:	8b 40 04             	mov    0x4(%rax),%eax
  4021f1:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  4021f4:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  4021f8:	48 8b 40 10          	mov    0x10(%rax),%rax
  4021fc:	8b 55 cc             	mov    -0x34(%rbp),%edx
  4021ff:	48 63 d2             	movslq %edx,%rdx
  402202:	48 c1 e2 04          	shl    $0x4,%rdx
  402206:	48 01 d0             	add    %rdx,%rax
  402209:	48 8b 40 08          	mov    0x8(%rax),%rax
  40220d:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  402211:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  402215:	48 8b 40 10          	mov    0x10(%rax),%rax
  402219:	8b 55 cc             	mov    -0x34(%rbp),%edx
  40221c:	48 63 d2             	movslq %edx,%rdx
  40221f:	48 c1 e2 04          	shl    $0x4,%rdx
  402223:	48 01 d0             	add    %rdx,%rax
  402226:	8b 00                	mov    (%rax),%eax
  402228:	83 f8 01             	cmp    $0x1,%eax
  40222b:	0f 84 08 03 00 00    	je     402539 <eval_mm_valid+0x403>
  402231:	83 f8 01             	cmp    $0x1,%eax
  402234:	72 0e                	jb     402244 <eval_mm_valid+0x10e>
  402236:	83 f8 02             	cmp    $0x2,%eax
  402239:	0f 84 c0 00 00 00    	je     4022ff <eval_mm_valid+0x1c9>
  40223f:	e9 32 03 00 00       	jmpq   402576 <eval_mm_valid+0x440>
  402244:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  402248:	48 89 c7             	mov    %rax,%rdi
  40224b:	e8 f1 1e 00 00       	callq  404141 <mm_malloc>
  402250:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  402254:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  402259:	75 1e                	jne    402279 <eval_mm_valid+0x143>
  40225b:	8b 4d cc             	mov    -0x34(%rbp),%ecx
  40225e:	8b 45 b4             	mov    -0x4c(%rbp),%eax
  402261:	ba ab 51 40 00       	mov    $0x4051ab,%edx
  402266:	89 ce                	mov    %ecx,%esi
  402268:	89 c7                	mov    %eax,%edi
  40226a:	e8 70 0f 00 00       	callq  4031df <malloc_error>
  40226f:	b8 00 00 00 00       	mov    $0x0,%eax
  402274:	e9 35 03 00 00       	jmpq   4025ae <eval_mm_valid+0x478>
  402279:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  40227d:	89 c7                	mov    %eax,%edi
  40227f:	8b 4d cc             	mov    -0x34(%rbp),%ecx
  402282:	8b 55 b4             	mov    -0x4c(%rbp),%edx
  402285:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
  402289:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  40228d:	41 89 c8             	mov    %ecx,%r8d
  402290:	89 d1                	mov    %edx,%ecx
  402292:	89 fa                	mov    %edi,%edx
  402294:	48 89 c7             	mov    %rax,%rdi
  402297:	e8 85 f5 ff ff       	callq  401821 <add_range>
  40229c:	85 c0                	test   %eax,%eax
  40229e:	75 0a                	jne    4022aa <eval_mm_valid+0x174>
  4022a0:	b8 00 00 00 00       	mov    $0x0,%eax
  4022a5:	e9 04 03 00 00       	jmpq   4025ae <eval_mm_valid+0x478>
  4022aa:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  4022ad:	0f b6 c8             	movzbl %al,%ecx
  4022b0:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  4022b4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4022b8:	89 ce                	mov    %ecx,%esi
  4022ba:	48 89 c7             	mov    %rax,%rdi
  4022bd:	e8 9e e9 ff ff       	callq  400c60 <memset@plt>
  4022c2:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  4022c6:	48 8b 40 18          	mov    0x18(%rax),%rax
  4022ca:	8b 55 d4             	mov    -0x2c(%rbp),%edx
  4022cd:	48 63 d2             	movslq %edx,%rdx
  4022d0:	48 c1 e2 03          	shl    $0x3,%rdx
  4022d4:	48 01 c2             	add    %rax,%rdx
  4022d7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4022db:	48 89 02             	mov    %rax,(%rdx)
  4022de:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  4022e2:	48 8b 40 20          	mov    0x20(%rax),%rax
  4022e6:	8b 55 d4             	mov    -0x2c(%rbp),%edx
  4022e9:	48 63 d2             	movslq %edx,%rdx
  4022ec:	48 c1 e2 03          	shl    $0x3,%rdx
  4022f0:	48 01 c2             	add    %rax,%rdx
  4022f3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  4022f7:	48 89 02             	mov    %rax,(%rdx)
  4022fa:	e9 81 02 00 00       	jmpq   402580 <eval_mm_valid+0x44a>
  4022ff:	81 7d cc f8 01 00 00 	cmpl   $0x1f8,-0x34(%rbp)
  402306:	75 55                	jne    40235d <eval_mm_valid+0x227>
  402308:	bf 01 00 00 00       	mov    $0x1,%edi
  40230d:	e8 fb 26 00 00       	callq  404a0d <mm_checkheap>
  402312:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  402316:	48 8b 40 20          	mov    0x20(%rax),%rax
  40231a:	8b 55 d4             	mov    -0x2c(%rbp),%edx
  40231d:	48 63 d2             	movslq %edx,%rdx
  402320:	48 c1 e2 03          	shl    $0x3,%rdx
  402324:	48 01 d0             	add    %rdx,%rax
  402327:	48 8b 08             	mov    (%rax),%rcx
  40232a:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  40232e:	48 8b 40 18          	mov    0x18(%rax),%rax
  402332:	8b 55 d4             	mov    -0x2c(%rbp),%edx
  402335:	48 63 d2             	movslq %edx,%rdx
  402338:	48 c1 e2 03          	shl    $0x3,%rdx
  40233c:	48 01 d0             	add    %rdx,%rax
  40233f:	48 8b 10             	mov    (%rax),%rdx
  402342:	48 8b 75 e0          	mov    -0x20(%rbp),%rsi
  402346:	8b 45 cc             	mov    -0x34(%rbp),%eax
  402349:	49 89 f0             	mov    %rsi,%r8
  40234c:	89 c6                	mov    %eax,%esi
  40234e:	bf c0 51 40 00       	mov    $0x4051c0,%edi
  402353:	b8 00 00 00 00       	mov    $0x0,%eax
  402358:	e8 d3 e8 ff ff       	callq  400c30 <printf@plt>
  40235d:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  402361:	48 8b 40 18          	mov    0x18(%rax),%rax
  402365:	8b 55 d4             	mov    -0x2c(%rbp),%edx
  402368:	48 63 d2             	movslq %edx,%rdx
  40236b:	48 c1 e2 03          	shl    $0x3,%rdx
  40236f:	48 01 d0             	add    %rdx,%rax
  402372:	48 8b 00             	mov    (%rax),%rax
  402375:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  402379:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  40237d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  402381:	48 89 d6             	mov    %rdx,%rsi
  402384:	48 89 c7             	mov    %rax,%rdi
  402387:	e8 14 1f 00 00       	callq  4042a0 <mm_realloc>
  40238c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  402390:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  402395:	75 18                	jne    4023af <eval_mm_valid+0x279>
  402397:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  40239b:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  40239f:	48 89 d6             	mov    %rdx,%rsi
  4023a2:	48 89 c7             	mov    %rax,%rdi
  4023a5:	e8 63 f7 ff ff       	callq  401b0d <remove_range>
  4023aa:	e9 d1 01 00 00       	jmpq   402580 <eval_mm_valid+0x44a>
  4023af:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
  4023b4:	75 1e                	jne    4023d4 <eval_mm_valid+0x29e>
  4023b6:	8b 4d cc             	mov    -0x34(%rbp),%ecx
  4023b9:	8b 45 b4             	mov    -0x4c(%rbp),%eax
  4023bc:	ba e9 51 40 00       	mov    $0x4051e9,%edx
  4023c1:	89 ce                	mov    %ecx,%esi
  4023c3:	89 c7                	mov    %eax,%edi
  4023c5:	e8 15 0e 00 00       	callq  4031df <malloc_error>
  4023ca:	b8 00 00 00 00       	mov    $0x0,%eax
  4023cf:	e9 da 01 00 00       	jmpq   4025ae <eval_mm_valid+0x478>
  4023d4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  4023d8:	89 c7                	mov    %eax,%edi
  4023da:	8b 4d cc             	mov    -0x34(%rbp),%ecx
  4023dd:	8b 55 b4             	mov    -0x4c(%rbp),%edx
  4023e0:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  4023e4:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  4023e8:	41 89 c8             	mov    %ecx,%r8d
  4023eb:	89 d1                	mov    %edx,%ecx
  4023ed:	89 fa                	mov    %edi,%edx
  4023ef:	48 89 c7             	mov    %rax,%rdi
  4023f2:	e8 2a f4 ff ff       	callq  401821 <add_range>
  4023f7:	85 c0                	test   %eax,%eax
  4023f9:	75 0a                	jne    402405 <eval_mm_valid+0x2cf>
  4023fb:	b8 00 00 00 00       	mov    $0x0,%eax
  402400:	e9 a9 01 00 00       	jmpq   4025ae <eval_mm_valid+0x478>
  402405:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  402409:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  40240d:	48 89 d6             	mov    %rdx,%rsi
  402410:	48 89 c7             	mov    %rax,%rdi
  402413:	e8 f5 f6 ff ff       	callq  401b0d <remove_range>
  402418:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  40241c:	48 8b 40 20          	mov    0x20(%rax),%rax
  402420:	8b 55 d4             	mov    -0x2c(%rbp),%edx
  402423:	48 63 d2             	movslq %edx,%rdx
  402426:	48 c1 e2 03          	shl    $0x3,%rdx
  40242a:	48 01 d0             	add    %rdx,%rax
  40242d:	48 8b 00             	mov    (%rax),%rax
  402430:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  402434:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  402438:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  40243c:	73 08                	jae    402446 <eval_mm_valid+0x310>
  40243e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  402442:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  402446:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%rbp)
  40244d:	e9 86 00 00 00       	jmpq   4024d8 <eval_mm_valid+0x3a2>
  402452:	8b 45 d0             	mov    -0x30(%rbp),%eax
  402455:	48 63 d0             	movslq %eax,%rdx
  402458:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  40245c:	48 01 d0             	add    %rdx,%rax
  40245f:	0f b6 00             	movzbl (%rax),%eax
  402462:	0f be d0             	movsbl %al,%edx
  402465:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  402468:	0f b6 c0             	movzbl %al,%eax
  40246b:	39 c2                	cmp    %eax,%edx
  40246d:	74 65                	je     4024d4 <eval_mm_valid+0x39e>
  40246f:	8b 45 d0             	mov    -0x30(%rbp),%eax
  402472:	48 63 d0             	movslq %eax,%rdx
  402475:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  402479:	48 01 d0             	add    %rdx,%rax
  40247c:	0f b6 00             	movzbl (%rax),%eax
  40247f:	88 45 cb             	mov    %al,-0x35(%rbp)
  402482:	0f be 75 cb          	movsbl -0x35(%rbp),%esi
  402486:	8b 45 d0             	mov    -0x30(%rbp),%eax
  402489:	48 63 d0             	movslq %eax,%rdx
  40248c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  402490:	48 01 d0             	add    %rdx,%rax
  402493:	0f b6 00             	movzbl (%rax),%eax
  402496:	0f be c8             	movsbl %al,%ecx
  402499:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  40249c:	0f b6 d0             	movzbl %al,%edx
  40249f:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  4024a2:	41 89 f0             	mov    %esi,%r8d
  4024a5:	89 c6                	mov    %eax,%esi
  4024a7:	bf fc 51 40 00       	mov    $0x4051fc,%edi
  4024ac:	b8 00 00 00 00       	mov    $0x0,%eax
  4024b1:	e8 7a e7 ff ff       	callq  400c30 <printf@plt>
  4024b6:	8b 4d cc             	mov    -0x34(%rbp),%ecx
  4024b9:	8b 45 b4             	mov    -0x4c(%rbp),%eax
  4024bc:	ba 10 52 40 00       	mov    $0x405210,%edx
  4024c1:	89 ce                	mov    %ecx,%esi
  4024c3:	89 c7                	mov    %eax,%edi
  4024c5:	e8 15 0d 00 00       	callq  4031df <malloc_error>
  4024ca:	b8 00 00 00 00       	mov    $0x0,%eax
  4024cf:	e9 da 00 00 00       	jmpq   4025ae <eval_mm_valid+0x478>
  4024d4:	83 45 d0 01          	addl   $0x1,-0x30(%rbp)
  4024d8:	8b 45 d0             	mov    -0x30(%rbp),%eax
  4024db:	48 98                	cltq   
  4024dd:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  4024e1:	0f 82 6b ff ff ff    	jb     402452 <eval_mm_valid+0x31c>
  4024e7:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  4024ea:	0f b6 c8             	movzbl %al,%ecx
  4024ed:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  4024f1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  4024f5:	89 ce                	mov    %ecx,%esi
  4024f7:	48 89 c7             	mov    %rax,%rdi
  4024fa:	e8 61 e7 ff ff       	callq  400c60 <memset@plt>
  4024ff:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  402503:	48 8b 40 18          	mov    0x18(%rax),%rax
  402507:	8b 55 d4             	mov    -0x2c(%rbp),%edx
  40250a:	48 63 d2             	movslq %edx,%rdx
  40250d:	48 c1 e2 03          	shl    $0x3,%rdx
  402511:	48 01 c2             	add    %rax,%rdx
  402514:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  402518:	48 89 02             	mov    %rax,(%rdx)
  40251b:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  40251f:	48 8b 40 20          	mov    0x20(%rax),%rax
  402523:	8b 55 d4             	mov    -0x2c(%rbp),%edx
  402526:	48 63 d2             	movslq %edx,%rdx
  402529:	48 c1 e2 03          	shl    $0x3,%rdx
  40252d:	48 01 c2             	add    %rax,%rdx
  402530:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  402534:	48 89 02             	mov    %rax,(%rdx)
  402537:	eb 47                	jmp    402580 <eval_mm_valid+0x44a>
  402539:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  40253d:	48 8b 40 18          	mov    0x18(%rax),%rax
  402541:	8b 55 d4             	mov    -0x2c(%rbp),%edx
  402544:	48 63 d2             	movslq %edx,%rdx
  402547:	48 c1 e2 03          	shl    $0x3,%rdx
  40254b:	48 01 d0             	add    %rdx,%rax
  40254e:	48 8b 00             	mov    (%rax),%rax
  402551:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  402555:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  402559:	48 89 c7             	mov    %rax,%rdi
  40255c:	e8 9b 1c 00 00       	callq  4041fc <mm_free>
  402561:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  402565:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  402569:	48 89 d6             	mov    %rdx,%rsi
  40256c:	48 89 c7             	mov    %rax,%rdi
  40256f:	e8 99 f5 ff ff       	callq  401b0d <remove_range>
  402574:	eb 0a                	jmp    402580 <eval_mm_valid+0x44a>
  402576:	bf 48 52 40 00       	mov    $0x405248,%edi
  40257b:	e8 00 0c 00 00       	callq  403180 <app_error>
  402580:	8b 05 a6 50 20 00    	mov    0x2050a6(%rip),%eax        # 60762c <verbose>
  402586:	83 f8 01             	cmp    $0x1,%eax
  402589:	7e 0a                	jle    402595 <eval_mm_valid+0x45f>
  40258b:	bf 01 00 00 00       	mov    $0x1,%edi
  402590:	e8 78 24 00 00       	callq  404a0d <mm_checkheap>
  402595:	83 45 cc 01          	addl   $0x1,-0x34(%rbp)
  402599:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  40259d:	8b 40 08             	mov    0x8(%rax),%eax
  4025a0:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  4025a3:	0f 8f 30 fc ff ff    	jg     4021d9 <eval_mm_valid+0xa3>
  4025a9:	b8 01 00 00 00       	mov    $0x1,%eax
  4025ae:	c9                   	leaveq 
  4025af:	c3                   	retq   

00000000004025b0 <eval_mm_util>:
  4025b0:	55                   	push   %rbp
  4025b1:	48 89 e5             	mov    %rsp,%rbp
  4025b4:	48 83 ec 60          	sub    $0x60,%rsp
  4025b8:	48 89 7d b8          	mov    %rdi,-0x48(%rbp)
  4025bc:	89 75 b4             	mov    %esi,-0x4c(%rbp)
  4025bf:	48 89 55 a8          	mov    %rdx,-0x58(%rbp)
  4025c3:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  4025ca:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  4025d1:	e8 07 0e 00 00       	callq  4033dd <mem_reset_brk>
  4025d6:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  4025da:	8b 40 04             	mov    0x4(%rax),%eax
  4025dd:	48 98                	cltq   
  4025df:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  4025e6:	00 
  4025e7:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  4025eb:	48 8b 40 18          	mov    0x18(%rax),%rax
  4025ef:	be 00 00 00 00       	mov    $0x0,%esi
  4025f4:	48 89 c7             	mov    %rax,%rdi
  4025f7:	e8 64 e6 ff ff       	callq  400c60 <memset@plt>
  4025fc:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  402600:	8b 40 04             	mov    0x4(%rax),%eax
  402603:	48 98                	cltq   
  402605:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  40260c:	00 
  40260d:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  402611:	48 8b 40 20          	mov    0x20(%rax),%rax
  402615:	be 00 00 00 00       	mov    $0x0,%esi
  40261a:	48 89 c7             	mov    %rax,%rdi
  40261d:	e8 3e e6 ff ff       	callq  400c60 <memset@plt>
  402622:	e8 4c 1a 00 00       	callq  404073 <mm_init>
  402627:	85 c0                	test   %eax,%eax
  402629:	79 0a                	jns    402635 <eval_mm_util+0x85>
  40262b:	bf 78 52 40 00       	mov    $0x405278,%edi
  402630:	e8 4b 0b 00 00       	callq  403180 <app_error>
  402635:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%rbp)
  40263c:	e9 63 02 00 00       	jmpq   4028a4 <eval_mm_util+0x2f4>
  402641:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  402645:	48 8b 40 10          	mov    0x10(%rax),%rax
  402649:	8b 55 cc             	mov    -0x34(%rbp),%edx
  40264c:	48 63 d2             	movslq %edx,%rdx
  40264f:	48 c1 e2 04          	shl    $0x4,%rdx
  402653:	48 01 d0             	add    %rdx,%rax
  402656:	8b 00                	mov    (%rax),%eax
  402658:	83 f8 01             	cmp    $0x1,%eax
  40265b:	0f 84 ba 01 00 00    	je     40281b <eval_mm_util+0x26b>
  402661:	83 f8 01             	cmp    $0x1,%eax
  402664:	72 0e                	jb     402674 <eval_mm_util+0xc4>
  402666:	83 f8 02             	cmp    $0x2,%eax
  402669:	0f 84 af 00 00 00    	je     40271e <eval_mm_util+0x16e>
  40266f:	e9 0d 02 00 00       	jmpq   402881 <eval_mm_util+0x2d1>
  402674:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  402678:	48 8b 40 10          	mov    0x10(%rax),%rax
  40267c:	8b 55 cc             	mov    -0x34(%rbp),%edx
  40267f:	48 63 d2             	movslq %edx,%rdx
  402682:	48 c1 e2 04          	shl    $0x4,%rdx
  402686:	48 01 d0             	add    %rdx,%rax
  402689:	8b 40 04             	mov    0x4(%rax),%eax
  40268c:	89 45 dc             	mov    %eax,-0x24(%rbp)
  40268f:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  402693:	48 8b 40 10          	mov    0x10(%rax),%rax
  402697:	8b 55 cc             	mov    -0x34(%rbp),%edx
  40269a:	48 63 d2             	movslq %edx,%rdx
  40269d:	48 c1 e2 04          	shl    $0x4,%rdx
  4026a1:	48 01 d0             	add    %rdx,%rax
  4026a4:	48 8b 40 08          	mov    0x8(%rax),%rax
  4026a8:	89 45 d0             	mov    %eax,-0x30(%rbp)
  4026ab:	8b 45 d0             	mov    -0x30(%rbp),%eax
  4026ae:	48 98                	cltq   
  4026b0:	48 89 c7             	mov    %rax,%rdi
  4026b3:	e8 89 1a 00 00       	callq  404141 <mm_malloc>
  4026b8:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  4026bc:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  4026c1:	75 0a                	jne    4026cd <eval_mm_util+0x11d>
  4026c3:	bf 98 52 40 00       	mov    $0x405298,%edi
  4026c8:	e8 b3 0a 00 00       	callq  403180 <app_error>
  4026cd:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  4026d1:	48 8b 40 18          	mov    0x18(%rax),%rax
  4026d5:	8b 55 dc             	mov    -0x24(%rbp),%edx
  4026d8:	48 63 d2             	movslq %edx,%rdx
  4026db:	48 c1 e2 03          	shl    $0x3,%rdx
  4026df:	48 01 c2             	add    %rax,%rdx
  4026e2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  4026e6:	48 89 02             	mov    %rax,(%rdx)
  4026e9:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  4026ed:	48 8b 40 20          	mov    0x20(%rax),%rax
  4026f1:	8b 55 dc             	mov    -0x24(%rbp),%edx
  4026f4:	48 63 d2             	movslq %edx,%rdx
  4026f7:	48 c1 e2 03          	shl    $0x3,%rdx
  4026fb:	48 01 c2             	add    %rax,%rdx
  4026fe:	8b 45 d0             	mov    -0x30(%rbp),%eax
  402701:	48 98                	cltq   
  402703:	48 89 02             	mov    %rax,(%rdx)
  402706:	8b 45 d0             	mov    -0x30(%rbp),%eax
  402709:	01 45 d8             	add    %eax,-0x28(%rbp)
  40270c:	8b 45 d8             	mov    -0x28(%rbp),%eax
  40270f:	39 45 d4             	cmp    %eax,-0x2c(%rbp)
  402712:	0f 4d 45 d4          	cmovge -0x2c(%rbp),%eax
  402716:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  402719:	e9 6d 01 00 00       	jmpq   40288b <eval_mm_util+0x2db>
  40271e:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  402722:	48 8b 40 10          	mov    0x10(%rax),%rax
  402726:	8b 55 cc             	mov    -0x34(%rbp),%edx
  402729:	48 63 d2             	movslq %edx,%rdx
  40272c:	48 c1 e2 04          	shl    $0x4,%rdx
  402730:	48 01 d0             	add    %rdx,%rax
  402733:	8b 40 04             	mov    0x4(%rax),%eax
  402736:	89 45 dc             	mov    %eax,-0x24(%rbp)
  402739:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  40273d:	48 8b 40 10          	mov    0x10(%rax),%rax
  402741:	8b 55 cc             	mov    -0x34(%rbp),%edx
  402744:	48 63 d2             	movslq %edx,%rdx
  402747:	48 c1 e2 04          	shl    $0x4,%rdx
  40274b:	48 01 d0             	add    %rdx,%rax
  40274e:	48 8b 40 08          	mov    0x8(%rax),%rax
  402752:	89 45 e0             	mov    %eax,-0x20(%rbp)
  402755:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  402759:	48 8b 40 20          	mov    0x20(%rax),%rax
  40275d:	8b 55 dc             	mov    -0x24(%rbp),%edx
  402760:	48 63 d2             	movslq %edx,%rdx
  402763:	48 c1 e2 03          	shl    $0x3,%rdx
  402767:	48 01 d0             	add    %rdx,%rax
  40276a:	48 8b 00             	mov    (%rax),%rax
  40276d:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  402770:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  402774:	48 8b 40 18          	mov    0x18(%rax),%rax
  402778:	8b 55 dc             	mov    -0x24(%rbp),%edx
  40277b:	48 63 d2             	movslq %edx,%rdx
  40277e:	48 c1 e2 03          	shl    $0x3,%rdx
  402782:	48 01 d0             	add    %rdx,%rax
  402785:	48 8b 00             	mov    (%rax),%rax
  402788:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  40278c:	8b 45 e0             	mov    -0x20(%rbp),%eax
  40278f:	48 63 d0             	movslq %eax,%rdx
  402792:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  402796:	48 89 d6             	mov    %rdx,%rsi
  402799:	48 89 c7             	mov    %rax,%rdi
  40279c:	e8 ff 1a 00 00       	callq  4042a0 <mm_realloc>
  4027a1:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  4027a5:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  4027aa:	75 10                	jne    4027bc <eval_mm_util+0x20c>
  4027ac:	83 7d e0 00          	cmpl   $0x0,-0x20(%rbp)
  4027b0:	74 0a                	je     4027bc <eval_mm_util+0x20c>
  4027b2:	bf c0 52 40 00       	mov    $0x4052c0,%edi
  4027b7:	e8 c4 09 00 00       	callq  403180 <app_error>
  4027bc:	83 7d e0 00          	cmpl   $0x0,-0x20(%rbp)
  4027c0:	74 51                	je     402813 <eval_mm_util+0x263>
  4027c2:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  4027c6:	48 8b 40 18          	mov    0x18(%rax),%rax
  4027ca:	8b 55 dc             	mov    -0x24(%rbp),%edx
  4027cd:	48 63 d2             	movslq %edx,%rdx
  4027d0:	48 c1 e2 03          	shl    $0x3,%rdx
  4027d4:	48 01 c2             	add    %rax,%rdx
  4027d7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4027db:	48 89 02             	mov    %rax,(%rdx)
  4027de:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  4027e2:	48 8b 40 20          	mov    0x20(%rax),%rax
  4027e6:	8b 55 dc             	mov    -0x24(%rbp),%edx
  4027e9:	48 63 d2             	movslq %edx,%rdx
  4027ec:	48 c1 e2 03          	shl    $0x3,%rdx
  4027f0:	48 01 c2             	add    %rax,%rdx
  4027f3:	8b 45 e0             	mov    -0x20(%rbp),%eax
  4027f6:	48 98                	cltq   
  4027f8:	48 89 02             	mov    %rax,(%rdx)
  4027fb:	8b 45 e0             	mov    -0x20(%rbp),%eax
  4027fe:	2b 45 e4             	sub    -0x1c(%rbp),%eax
  402801:	01 45 d8             	add    %eax,-0x28(%rbp)
  402804:	8b 45 d8             	mov    -0x28(%rbp),%eax
  402807:	39 45 d4             	cmp    %eax,-0x2c(%rbp)
  40280a:	0f 4d 45 d4          	cmovge -0x2c(%rbp),%eax
  40280e:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  402811:	eb 78                	jmp    40288b <eval_mm_util+0x2db>
  402813:	8b 45 d0             	mov    -0x30(%rbp),%eax
  402816:	29 45 d8             	sub    %eax,-0x28(%rbp)
  402819:	eb 70                	jmp    40288b <eval_mm_util+0x2db>
  40281b:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  40281f:	48 8b 40 10          	mov    0x10(%rax),%rax
  402823:	8b 55 cc             	mov    -0x34(%rbp),%edx
  402826:	48 63 d2             	movslq %edx,%rdx
  402829:	48 c1 e2 04          	shl    $0x4,%rdx
  40282d:	48 01 d0             	add    %rdx,%rax
  402830:	8b 40 04             	mov    0x4(%rax),%eax
  402833:	89 45 dc             	mov    %eax,-0x24(%rbp)
  402836:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  40283a:	48 8b 40 20          	mov    0x20(%rax),%rax
  40283e:	8b 55 dc             	mov    -0x24(%rbp),%edx
  402841:	48 63 d2             	movslq %edx,%rdx
  402844:	48 c1 e2 03          	shl    $0x3,%rdx
  402848:	48 01 d0             	add    %rdx,%rax
  40284b:	48 8b 00             	mov    (%rax),%rax
  40284e:	89 45 d0             	mov    %eax,-0x30(%rbp)
  402851:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  402855:	48 8b 40 18          	mov    0x18(%rax),%rax
  402859:	8b 55 dc             	mov    -0x24(%rbp),%edx
  40285c:	48 63 d2             	movslq %edx,%rdx
  40285f:	48 c1 e2 03          	shl    $0x3,%rdx
  402863:	48 01 d0             	add    %rdx,%rax
  402866:	48 8b 00             	mov    (%rax),%rax
  402869:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  40286d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  402871:	48 89 c7             	mov    %rax,%rdi
  402874:	e8 83 19 00 00       	callq  4041fc <mm_free>
  402879:	8b 45 d0             	mov    -0x30(%rbp),%eax
  40287c:	29 45 d8             	sub    %eax,-0x28(%rbp)
  40287f:	eb 0a                	jmp    40288b <eval_mm_util+0x2db>
  402881:	bf e8 52 40 00       	mov    $0x4052e8,%edi
  402886:	e8 f5 08 00 00       	callq  403180 <app_error>
  40288b:	8b 05 9b 4d 20 00    	mov    0x204d9b(%rip),%eax        # 60762c <verbose>
  402891:	83 f8 01             	cmp    $0x1,%eax
  402894:	7e 0a                	jle    4028a0 <eval_mm_util+0x2f0>
  402896:	bf 01 00 00 00       	mov    $0x1,%edi
  40289b:	e8 6d 21 00 00       	callq  404a0d <mm_checkheap>
  4028a0:	83 45 cc 01          	addl   $0x1,-0x34(%rbp)
  4028a4:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  4028a8:	8b 40 08             	mov    0x8(%rax),%eax
  4028ab:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  4028ae:	0f 8f 8d fd ff ff    	jg     402641 <eval_mm_util+0x91>
  4028b4:	66 0f ef d2          	pxor   %xmm2,%xmm2
  4028b8:	f2 0f 2a 55 d4       	cvtsi2sdl -0x2c(%rbp),%xmm2
  4028bd:	f2 0f 11 55 a0       	movsd  %xmm2,-0x60(%rbp)
  4028c2:	e8 ce 0b 00 00       	callq  403495 <mem_heapsize>
  4028c7:	48 85 c0             	test   %rax,%rax
  4028ca:	78 0b                	js     4028d7 <eval_mm_util+0x327>
  4028cc:	66 0f ef c0          	pxor   %xmm0,%xmm0
  4028d0:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
  4028d5:	eb 19                	jmp    4028f0 <eval_mm_util+0x340>
  4028d7:	48 89 c2             	mov    %rax,%rdx
  4028da:	48 d1 ea             	shr    %rdx
  4028dd:	83 e0 01             	and    $0x1,%eax
  4028e0:	48 09 c2             	or     %rax,%rdx
  4028e3:	66 0f ef c0          	pxor   %xmm0,%xmm0
  4028e7:	f2 48 0f 2a c2       	cvtsi2sd %rdx,%xmm0
  4028ec:	f2 0f 58 c0          	addsd  %xmm0,%xmm0
  4028f0:	f2 0f 10 4d a0       	movsd  -0x60(%rbp),%xmm1
  4028f5:	f2 0f 5e c8          	divsd  %xmm0,%xmm1
  4028f9:	66 0f 28 c1          	movapd %xmm1,%xmm0
  4028fd:	c9                   	leaveq 
  4028fe:	c3                   	retq   

00000000004028ff <eval_mm_speed>:
  4028ff:	55                   	push   %rbp
  402900:	48 89 e5             	mov    %rsp,%rbp
  402903:	48 83 ec 50          	sub    $0x50,%rsp
  402907:	48 89 7d b8          	mov    %rdi,-0x48(%rbp)
  40290b:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  40290f:	48 8b 00             	mov    (%rax),%rax
  402912:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  402916:	e8 c2 0a 00 00       	callq  4033dd <mem_reset_brk>
  40291b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  40291f:	8b 40 04             	mov    0x4(%rax),%eax
  402922:	48 98                	cltq   
  402924:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  40292b:	00 
  40292c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  402930:	48 8b 40 18          	mov    0x18(%rax),%rax
  402934:	be 00 00 00 00       	mov    $0x0,%esi
  402939:	48 89 c7             	mov    %rax,%rdi
  40293c:	e8 1f e3 ff ff       	callq  400c60 <memset@plt>
  402941:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  402945:	8b 40 04             	mov    0x4(%rax),%eax
  402948:	48 98                	cltq   
  40294a:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  402951:	00 
  402952:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  402956:	48 8b 40 20          	mov    0x20(%rax),%rax
  40295a:	be 00 00 00 00       	mov    $0x0,%esi
  40295f:	48 89 c7             	mov    %rax,%rdi
  402962:	e8 f9 e2 ff ff       	callq  400c60 <memset@plt>
  402967:	e8 07 17 00 00       	callq  404073 <mm_init>
  40296c:	85 c0                	test   %eax,%eax
  40296e:	79 0a                	jns    40297a <eval_mm_speed+0x7b>
  402970:	bf 18 53 40 00       	mov    $0x405318,%edi
  402975:	e8 06 08 00 00       	callq  403180 <app_error>
  40297a:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%rbp)
  402981:	e9 a6 01 00 00       	jmpq   402b2c <eval_mm_speed+0x22d>
  402986:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  40298a:	48 8b 40 10          	mov    0x10(%rax),%rax
  40298e:	8b 55 c8             	mov    -0x38(%rbp),%edx
  402991:	48 63 d2             	movslq %edx,%rdx
  402994:	48 c1 e2 04          	shl    $0x4,%rdx
  402998:	48 01 d0             	add    %rdx,%rax
  40299b:	8b 00                	mov    (%rax),%eax
  40299d:	83 f8 01             	cmp    $0x1,%eax
  4029a0:	0f 84 30 01 00 00    	je     402ad6 <eval_mm_speed+0x1d7>
  4029a6:	83 f8 01             	cmp    $0x1,%eax
  4029a9:	72 0a                	jb     4029b5 <eval_mm_speed+0xb6>
  4029ab:	83 f8 02             	cmp    $0x2,%eax
  4029ae:	74 7f                	je     402a2f <eval_mm_speed+0x130>
  4029b0:	e9 66 01 00 00       	jmpq   402b1b <eval_mm_speed+0x21c>
  4029b5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  4029b9:	48 8b 40 10          	mov    0x10(%rax),%rax
  4029bd:	8b 55 c8             	mov    -0x38(%rbp),%edx
  4029c0:	48 63 d2             	movslq %edx,%rdx
  4029c3:	48 c1 e2 04          	shl    $0x4,%rdx
  4029c7:	48 01 d0             	add    %rdx,%rax
  4029ca:	8b 40 04             	mov    0x4(%rax),%eax
  4029cd:	89 45 cc             	mov    %eax,-0x34(%rbp)
  4029d0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  4029d4:	48 8b 40 10          	mov    0x10(%rax),%rax
  4029d8:	8b 55 c8             	mov    -0x38(%rbp),%edx
  4029db:	48 63 d2             	movslq %edx,%rdx
  4029de:	48 c1 e2 04          	shl    $0x4,%rdx
  4029e2:	48 01 d0             	add    %rdx,%rax
  4029e5:	48 8b 40 08          	mov    0x8(%rax),%rax
  4029e9:	89 45 d0             	mov    %eax,-0x30(%rbp)
  4029ec:	8b 45 d0             	mov    -0x30(%rbp),%eax
  4029ef:	48 98                	cltq   
  4029f1:	48 89 c7             	mov    %rax,%rdi
  4029f4:	e8 48 17 00 00       	callq  404141 <mm_malloc>
  4029f9:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  4029fd:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  402a02:	75 0a                	jne    402a0e <eval_mm_speed+0x10f>
  402a04:	bf 38 53 40 00       	mov    $0x405338,%edi
  402a09:	e8 72 07 00 00       	callq  403180 <app_error>
  402a0e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  402a12:	48 8b 40 18          	mov    0x18(%rax),%rax
  402a16:	8b 55 cc             	mov    -0x34(%rbp),%edx
  402a19:	48 63 d2             	movslq %edx,%rdx
  402a1c:	48 c1 e2 03          	shl    $0x3,%rdx
  402a20:	48 01 c2             	add    %rax,%rdx
  402a23:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  402a27:	48 89 02             	mov    %rax,(%rdx)
  402a2a:	e9 f9 00 00 00       	jmpq   402b28 <eval_mm_speed+0x229>
  402a2f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  402a33:	48 8b 40 10          	mov    0x10(%rax),%rax
  402a37:	8b 55 c8             	mov    -0x38(%rbp),%edx
  402a3a:	48 63 d2             	movslq %edx,%rdx
  402a3d:	48 c1 e2 04          	shl    $0x4,%rdx
  402a41:	48 01 d0             	add    %rdx,%rax
  402a44:	8b 40 04             	mov    0x4(%rax),%eax
  402a47:	89 45 cc             	mov    %eax,-0x34(%rbp)
  402a4a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  402a4e:	48 8b 40 10          	mov    0x10(%rax),%rax
  402a52:	8b 55 c8             	mov    -0x38(%rbp),%edx
  402a55:	48 63 d2             	movslq %edx,%rdx
  402a58:	48 c1 e2 04          	shl    $0x4,%rdx
  402a5c:	48 01 d0             	add    %rdx,%rax
  402a5f:	48 8b 40 08          	mov    0x8(%rax),%rax
  402a63:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  402a66:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  402a6a:	48 8b 40 18          	mov    0x18(%rax),%rax
  402a6e:	8b 55 cc             	mov    -0x34(%rbp),%edx
  402a71:	48 63 d2             	movslq %edx,%rdx
  402a74:	48 c1 e2 03          	shl    $0x3,%rdx
  402a78:	48 01 d0             	add    %rdx,%rax
  402a7b:	48 8b 00             	mov    (%rax),%rax
  402a7e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  402a82:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  402a85:	48 63 d0             	movslq %eax,%rdx
  402a88:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  402a8c:	48 89 d6             	mov    %rdx,%rsi
  402a8f:	48 89 c7             	mov    %rax,%rdi
  402a92:	e8 09 18 00 00       	callq  4042a0 <mm_realloc>
  402a97:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  402a9b:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
  402aa0:	75 10                	jne    402ab2 <eval_mm_speed+0x1b3>
  402aa2:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  402aa6:	74 0a                	je     402ab2 <eval_mm_speed+0x1b3>
  402aa8:	bf 60 53 40 00       	mov    $0x405360,%edi
  402aad:	e8 ce 06 00 00       	callq  403180 <app_error>
  402ab2:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  402ab6:	74 6f                	je     402b27 <eval_mm_speed+0x228>
  402ab8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  402abc:	48 8b 40 18          	mov    0x18(%rax),%rax
  402ac0:	8b 55 cc             	mov    -0x34(%rbp),%edx
  402ac3:	48 63 d2             	movslq %edx,%rdx
  402ac6:	48 c1 e2 03          	shl    $0x3,%rdx
  402aca:	48 01 c2             	add    %rax,%rdx
  402acd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  402ad1:	48 89 02             	mov    %rax,(%rdx)
  402ad4:	eb 51                	jmp    402b27 <eval_mm_speed+0x228>
  402ad6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  402ada:	48 8b 40 10          	mov    0x10(%rax),%rax
  402ade:	8b 55 c8             	mov    -0x38(%rbp),%edx
  402ae1:	48 63 d2             	movslq %edx,%rdx
  402ae4:	48 c1 e2 04          	shl    $0x4,%rdx
  402ae8:	48 01 d0             	add    %rdx,%rax
  402aeb:	8b 40 04             	mov    0x4(%rax),%eax
  402aee:	89 45 cc             	mov    %eax,-0x34(%rbp)
  402af1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  402af5:	48 8b 40 18          	mov    0x18(%rax),%rax
  402af9:	8b 55 cc             	mov    -0x34(%rbp),%edx
  402afc:	48 63 d2             	movslq %edx,%rdx
  402aff:	48 c1 e2 03          	shl    $0x3,%rdx
  402b03:	48 01 d0             	add    %rdx,%rax
  402b06:	48 8b 00             	mov    (%rax),%rax
  402b09:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  402b0d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  402b11:	48 89 c7             	mov    %rax,%rdi
  402b14:	e8 e3 16 00 00       	callq  4041fc <mm_free>
  402b19:	eb 0d                	jmp    402b28 <eval_mm_speed+0x229>
  402b1b:	bf 48 52 40 00       	mov    $0x405248,%edi
  402b20:	e8 5b 06 00 00       	callq  403180 <app_error>
  402b25:	eb 01                	jmp    402b28 <eval_mm_speed+0x229>
  402b27:	90                   	nop
  402b28:	83 45 c8 01          	addl   $0x1,-0x38(%rbp)
  402b2c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  402b30:	8b 40 08             	mov    0x8(%rax),%eax
  402b33:	3b 45 c8             	cmp    -0x38(%rbp),%eax
  402b36:	0f 8f 4a fe ff ff    	jg     402986 <eval_mm_speed+0x87>
  402b3c:	90                   	nop
  402b3d:	c9                   	leaveq 
  402b3e:	c3                   	retq   

0000000000402b3f <eval_libc_valid>:
  402b3f:	55                   	push   %rbp
  402b40:	48 89 e5             	mov    %rsp,%rbp
  402b43:	48 83 ec 30          	sub    $0x30,%rsp
  402b47:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  402b4b:	89 75 d4             	mov    %esi,-0x2c(%rbp)
  402b4e:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  402b55:	e9 b2 01 00 00       	jmpq   402d0c <eval_libc_valid+0x1cd>
  402b5a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  402b5e:	48 8b 40 10          	mov    0x10(%rax),%rax
  402b62:	8b 55 e0             	mov    -0x20(%rbp),%edx
  402b65:	48 63 d2             	movslq %edx,%rdx
  402b68:	48 c1 e2 04          	shl    $0x4,%rdx
  402b6c:	48 01 d0             	add    %rdx,%rax
  402b6f:	8b 00                	mov    (%rax),%eax
  402b71:	83 f8 01             	cmp    $0x1,%eax
  402b74:	0f 84 4e 01 00 00    	je     402cc8 <eval_libc_valid+0x189>
  402b7a:	83 f8 01             	cmp    $0x1,%eax
  402b7d:	72 0e                	jb     402b8d <eval_libc_valid+0x4e>
  402b7f:	83 f8 02             	cmp    $0x2,%eax
  402b82:	0f 84 84 00 00 00    	je     402c0c <eval_libc_valid+0xcd>
  402b88:	e9 71 01 00 00       	jmpq   402cfe <eval_libc_valid+0x1bf>
  402b8d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  402b91:	48 8b 40 10          	mov    0x10(%rax),%rax
  402b95:	8b 55 e0             	mov    -0x20(%rbp),%edx
  402b98:	48 63 d2             	movslq %edx,%rdx
  402b9b:	48 c1 e2 04          	shl    $0x4,%rdx
  402b9f:	48 01 d0             	add    %rdx,%rax
  402ba2:	48 8b 40 08          	mov    0x8(%rax),%rax
  402ba6:	48 89 c7             	mov    %rax,%rdi
  402ba9:	e8 f2 e0 ff ff       	callq  400ca0 <malloc@plt>
  402bae:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  402bb2:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  402bb7:	75 1e                	jne    402bd7 <eval_libc_valid+0x98>
  402bb9:	8b 4d e0             	mov    -0x20(%rbp),%ecx
  402bbc:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  402bbf:	ba 82 53 40 00       	mov    $0x405382,%edx
  402bc4:	89 ce                	mov    %ecx,%esi
  402bc6:	89 c7                	mov    %eax,%edi
  402bc8:	e8 12 06 00 00       	callq  4031df <malloc_error>
  402bcd:	bf 95 53 40 00       	mov    $0x405395,%edi
  402bd2:	e8 cb 05 00 00       	callq  4031a2 <unix_error>
  402bd7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  402bdb:	48 8b 50 18          	mov    0x18(%rax),%rdx
  402bdf:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  402be3:	48 8b 40 10          	mov    0x10(%rax),%rax
  402be7:	8b 4d e0             	mov    -0x20(%rbp),%ecx
  402bea:	48 63 c9             	movslq %ecx,%rcx
  402bed:	48 c1 e1 04          	shl    $0x4,%rcx
  402bf1:	48 01 c8             	add    %rcx,%rax
  402bf4:	8b 40 04             	mov    0x4(%rax),%eax
  402bf7:	48 98                	cltq   
  402bf9:	48 c1 e0 03          	shl    $0x3,%rax
  402bfd:	48 01 c2             	add    %rax,%rdx
  402c00:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  402c04:	48 89 02             	mov    %rax,(%rdx)
  402c07:	e9 fc 00 00 00       	jmpq   402d08 <eval_libc_valid+0x1c9>
  402c0c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  402c10:	48 8b 40 10          	mov    0x10(%rax),%rax
  402c14:	8b 55 e0             	mov    -0x20(%rbp),%edx
  402c17:	48 63 d2             	movslq %edx,%rdx
  402c1a:	48 c1 e2 04          	shl    $0x4,%rdx
  402c1e:	48 01 d0             	add    %rdx,%rax
  402c21:	48 8b 40 08          	mov    0x8(%rax),%rax
  402c25:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  402c28:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  402c2c:	48 8b 50 18          	mov    0x18(%rax),%rdx
  402c30:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  402c34:	48 8b 40 10          	mov    0x10(%rax),%rax
  402c38:	8b 4d e0             	mov    -0x20(%rbp),%ecx
  402c3b:	48 63 c9             	movslq %ecx,%rcx
  402c3e:	48 c1 e1 04          	shl    $0x4,%rcx
  402c42:	48 01 c8             	add    %rcx,%rax
  402c45:	8b 40 04             	mov    0x4(%rax),%eax
  402c48:	48 98                	cltq   
  402c4a:	48 c1 e0 03          	shl    $0x3,%rax
  402c4e:	48 01 d0             	add    %rdx,%rax
  402c51:	48 8b 00             	mov    (%rax),%rax
  402c54:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  402c58:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  402c5b:	48 63 d0             	movslq %eax,%rdx
  402c5e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  402c62:	48 89 d6             	mov    %rdx,%rsi
  402c65:	48 89 c7             	mov    %rax,%rdi
  402c68:	e8 43 e0 ff ff       	callq  400cb0 <realloc@plt>
  402c6d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  402c71:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  402c76:	75 1e                	jne    402c96 <eval_libc_valid+0x157>
  402c78:	8b 4d e0             	mov    -0x20(%rbp),%ecx
  402c7b:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  402c7e:	ba a4 53 40 00       	mov    $0x4053a4,%edx
  402c83:	89 ce                	mov    %ecx,%esi
  402c85:	89 c7                	mov    %eax,%edi
  402c87:	e8 53 05 00 00       	callq  4031df <malloc_error>
  402c8c:	bf 95 53 40 00       	mov    $0x405395,%edi
  402c91:	e8 0c 05 00 00       	callq  4031a2 <unix_error>
  402c96:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  402c9a:	48 8b 50 18          	mov    0x18(%rax),%rdx
  402c9e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  402ca2:	48 8b 40 10          	mov    0x10(%rax),%rax
  402ca6:	8b 4d e0             	mov    -0x20(%rbp),%ecx
  402ca9:	48 63 c9             	movslq %ecx,%rcx
  402cac:	48 c1 e1 04          	shl    $0x4,%rcx
  402cb0:	48 01 c8             	add    %rcx,%rax
  402cb3:	8b 40 04             	mov    0x4(%rax),%eax
  402cb6:	48 98                	cltq   
  402cb8:	48 c1 e0 03          	shl    $0x3,%rax
  402cbc:	48 01 c2             	add    %rax,%rdx
  402cbf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  402cc3:	48 89 02             	mov    %rax,(%rdx)
  402cc6:	eb 40                	jmp    402d08 <eval_libc_valid+0x1c9>
  402cc8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  402ccc:	48 8b 50 18          	mov    0x18(%rax),%rdx
  402cd0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  402cd4:	48 8b 40 10          	mov    0x10(%rax),%rax
  402cd8:	8b 4d e0             	mov    -0x20(%rbp),%ecx
  402cdb:	48 63 c9             	movslq %ecx,%rcx
  402cde:	48 c1 e1 04          	shl    $0x4,%rcx
  402ce2:	48 01 c8             	add    %rcx,%rax
  402ce5:	8b 40 04             	mov    0x4(%rax),%eax
  402ce8:	48 98                	cltq   
  402cea:	48 c1 e0 03          	shl    $0x3,%rax
  402cee:	48 01 d0             	add    %rdx,%rax
  402cf1:	48 8b 00             	mov    (%rax),%rax
  402cf4:	48 89 c7             	mov    %rax,%rdi
  402cf7:	e8 a4 de ff ff       	callq  400ba0 <free@plt>
  402cfc:	eb 0a                	jmp    402d08 <eval_libc_valid+0x1c9>
  402cfe:	bf b8 53 40 00       	mov    $0x4053b8,%edi
  402d03:	e8 78 04 00 00       	callq  403180 <app_error>
  402d08:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  402d0c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  402d10:	8b 40 08             	mov    0x8(%rax),%eax
  402d13:	3b 45 e0             	cmp    -0x20(%rbp),%eax
  402d16:	0f 8f 3e fe ff ff    	jg     402b5a <eval_libc_valid+0x1b>
  402d1c:	b8 01 00 00 00       	mov    $0x1,%eax
  402d21:	c9                   	leaveq 
  402d22:	c3                   	retq   

0000000000402d23 <eval_libc_speed>:
  402d23:	55                   	push   %rbp
  402d24:	48 89 e5             	mov    %rsp,%rbp
  402d27:	48 83 ec 50          	sub    $0x50,%rsp
  402d2b:	48 89 7d b8          	mov    %rdi,-0x48(%rbp)
  402d2f:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  402d33:	48 8b 00             	mov    (%rax),%rax
  402d36:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  402d3a:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%rbp)
  402d41:	e9 8c 01 00 00       	jmpq   402ed2 <eval_libc_speed+0x1af>
  402d46:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  402d4a:	48 8b 40 10          	mov    0x10(%rax),%rax
  402d4e:	8b 55 c8             	mov    -0x38(%rbp),%edx
  402d51:	48 63 d2             	movslq %edx,%rdx
  402d54:	48 c1 e2 04          	shl    $0x4,%rdx
  402d58:	48 01 d0             	add    %rdx,%rax
  402d5b:	8b 00                	mov    (%rax),%eax
  402d5d:	83 f8 01             	cmp    $0x1,%eax
  402d60:	0f 84 24 01 00 00    	je     402e8a <eval_libc_speed+0x167>
  402d66:	83 f8 01             	cmp    $0x1,%eax
  402d69:	72 0a                	jb     402d75 <eval_libc_speed+0x52>
  402d6b:	83 f8 02             	cmp    $0x2,%eax
  402d6e:	74 7f                	je     402def <eval_libc_speed+0xcc>
  402d70:	e9 59 01 00 00       	jmpq   402ece <eval_libc_speed+0x1ab>
  402d75:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  402d79:	48 8b 40 10          	mov    0x10(%rax),%rax
  402d7d:	8b 55 c8             	mov    -0x38(%rbp),%edx
  402d80:	48 63 d2             	movslq %edx,%rdx
  402d83:	48 c1 e2 04          	shl    $0x4,%rdx
  402d87:	48 01 d0             	add    %rdx,%rax
  402d8a:	8b 40 04             	mov    0x4(%rax),%eax
  402d8d:	89 45 cc             	mov    %eax,-0x34(%rbp)
  402d90:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  402d94:	48 8b 40 10          	mov    0x10(%rax),%rax
  402d98:	8b 55 c8             	mov    -0x38(%rbp),%edx
  402d9b:	48 63 d2             	movslq %edx,%rdx
  402d9e:	48 c1 e2 04          	shl    $0x4,%rdx
  402da2:	48 01 d0             	add    %rdx,%rax
  402da5:	48 8b 40 08          	mov    0x8(%rax),%rax
  402da9:	89 45 d0             	mov    %eax,-0x30(%rbp)
  402dac:	8b 45 d0             	mov    -0x30(%rbp),%eax
  402daf:	48 98                	cltq   
  402db1:	48 89 c7             	mov    %rax,%rdi
  402db4:	e8 e7 de ff ff       	callq  400ca0 <malloc@plt>
  402db9:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  402dbd:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  402dc2:	75 0a                	jne    402dce <eval_libc_speed+0xab>
  402dc4:	bf e8 53 40 00       	mov    $0x4053e8,%edi
  402dc9:	e8 d4 03 00 00       	callq  4031a2 <unix_error>
  402dce:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  402dd2:	48 8b 40 18          	mov    0x18(%rax),%rax
  402dd6:	8b 55 cc             	mov    -0x34(%rbp),%edx
  402dd9:	48 63 d2             	movslq %edx,%rdx
  402ddc:	48 c1 e2 03          	shl    $0x3,%rdx
  402de0:	48 01 c2             	add    %rax,%rdx
  402de3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  402de7:	48 89 02             	mov    %rax,(%rdx)
  402dea:	e9 df 00 00 00       	jmpq   402ece <eval_libc_speed+0x1ab>
  402def:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  402df3:	48 8b 40 10          	mov    0x10(%rax),%rax
  402df7:	8b 55 c8             	mov    -0x38(%rbp),%edx
  402dfa:	48 63 d2             	movslq %edx,%rdx
  402dfd:	48 c1 e2 04          	shl    $0x4,%rdx
  402e01:	48 01 d0             	add    %rdx,%rax
  402e04:	8b 40 04             	mov    0x4(%rax),%eax
  402e07:	89 45 cc             	mov    %eax,-0x34(%rbp)
  402e0a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  402e0e:	48 8b 40 10          	mov    0x10(%rax),%rax
  402e12:	8b 55 c8             	mov    -0x38(%rbp),%edx
  402e15:	48 63 d2             	movslq %edx,%rdx
  402e18:	48 c1 e2 04          	shl    $0x4,%rdx
  402e1c:	48 01 d0             	add    %rdx,%rax
  402e1f:	48 8b 40 08          	mov    0x8(%rax),%rax
  402e23:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  402e26:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  402e2a:	48 8b 40 18          	mov    0x18(%rax),%rax
  402e2e:	8b 55 cc             	mov    -0x34(%rbp),%edx
  402e31:	48 63 d2             	movslq %edx,%rdx
  402e34:	48 c1 e2 03          	shl    $0x3,%rdx
  402e38:	48 01 d0             	add    %rdx,%rax
  402e3b:	48 8b 00             	mov    (%rax),%rax
  402e3e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  402e42:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  402e45:	48 63 d0             	movslq %eax,%rdx
  402e48:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  402e4c:	48 89 d6             	mov    %rdx,%rsi
  402e4f:	48 89 c7             	mov    %rax,%rdi
  402e52:	e8 59 de ff ff       	callq  400cb0 <realloc@plt>
  402e57:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  402e5b:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
  402e60:	75 0a                	jne    402e6c <eval_libc_speed+0x149>
  402e62:	bf 10 54 40 00       	mov    $0x405410,%edi
  402e67:	e8 36 03 00 00       	callq  4031a2 <unix_error>
  402e6c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  402e70:	48 8b 40 18          	mov    0x18(%rax),%rax
  402e74:	8b 55 cc             	mov    -0x34(%rbp),%edx
  402e77:	48 63 d2             	movslq %edx,%rdx
  402e7a:	48 c1 e2 03          	shl    $0x3,%rdx
  402e7e:	48 01 c2             	add    %rax,%rdx
  402e81:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  402e85:	48 89 02             	mov    %rax,(%rdx)
  402e88:	eb 44                	jmp    402ece <eval_libc_speed+0x1ab>
  402e8a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  402e8e:	48 8b 40 10          	mov    0x10(%rax),%rax
  402e92:	8b 55 c8             	mov    -0x38(%rbp),%edx
  402e95:	48 63 d2             	movslq %edx,%rdx
  402e98:	48 c1 e2 04          	shl    $0x4,%rdx
  402e9c:	48 01 d0             	add    %rdx,%rax
  402e9f:	8b 40 04             	mov    0x4(%rax),%eax
  402ea2:	89 45 cc             	mov    %eax,-0x34(%rbp)
  402ea5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  402ea9:	48 8b 40 18          	mov    0x18(%rax),%rax
  402ead:	8b 55 cc             	mov    -0x34(%rbp),%edx
  402eb0:	48 63 d2             	movslq %edx,%rdx
  402eb3:	48 c1 e2 03          	shl    $0x3,%rdx
  402eb7:	48 01 d0             	add    %rdx,%rax
  402eba:	48 8b 00             	mov    (%rax),%rax
  402ebd:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  402ec1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  402ec5:	48 89 c7             	mov    %rax,%rdi
  402ec8:	e8 d3 dc ff ff       	callq  400ba0 <free@plt>
  402ecd:	90                   	nop
  402ece:	83 45 c8 01          	addl   $0x1,-0x38(%rbp)
  402ed2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  402ed6:	8b 40 08             	mov    0x8(%rax),%eax
  402ed9:	3b 45 c8             	cmp    -0x38(%rbp),%eax
  402edc:	0f 8f 64 fe ff ff    	jg     402d46 <eval_libc_speed+0x23>
  402ee2:	90                   	nop
  402ee3:	c9                   	leaveq 
  402ee4:	c3                   	retq   

0000000000402ee5 <printresults>:
  402ee5:	55                   	push   %rbp
  402ee6:	48 89 e5             	mov    %rsp,%rbp
  402ee9:	48 83 ec 30          	sub    $0x30,%rsp
  402eed:	89 7d dc             	mov    %edi,-0x24(%rbp)
  402ef0:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  402ef4:	66 0f ef c0          	pxor   %xmm0,%xmm0
  402ef8:	f2 0f 11 45 e8       	movsd  %xmm0,-0x18(%rbp)
  402efd:	66 0f ef c0          	pxor   %xmm0,%xmm0
  402f01:	f2 0f 11 45 f0       	movsd  %xmm0,-0x10(%rbp)
  402f06:	66 0f ef c0          	pxor   %xmm0,%xmm0
  402f0a:	f2 0f 11 45 f8       	movsd  %xmm0,-0x8(%rbp)
  402f0f:	48 83 ec 08          	sub    $0x8,%rsp
  402f13:	68 64 54 40 00       	pushq  $0x405464
  402f18:	41 b9 33 54 40 00    	mov    $0x405433,%r9d
  402f1e:	41 b8 38 54 40 00    	mov    $0x405438,%r8d
  402f24:	b9 3c 54 40 00       	mov    $0x40543c,%ecx
  402f29:	ba 41 54 40 00       	mov    $0x405441,%edx
  402f2e:	be 48 54 40 00       	mov    $0x405448,%esi
  402f33:	bf 4e 54 40 00       	mov    $0x40544e,%edi
  402f38:	b8 00 00 00 00       	mov    $0x0,%eax
  402f3d:	e8 ee dc ff ff       	callq  400c30 <printf@plt>
  402f42:	48 83 c4 10          	add    $0x10,%rsp
  402f46:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
  402f4d:	e9 87 01 00 00       	jmpq   4030d9 <printresults+0x1f4>
  402f52:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  402f55:	48 98                	cltq   
  402f57:	48 c1 e0 05          	shl    $0x5,%rax
  402f5b:	48 89 c2             	mov    %rax,%rdx
  402f5e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  402f62:	48 01 d0             	add    %rdx,%rax
  402f65:	8b 40 08             	mov    0x8(%rax),%eax
  402f68:	85 c0                	test   %eax,%eax
  402f6a:	0f 84 2e 01 00 00    	je     40309e <printresults+0x1b9>
  402f70:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  402f73:	48 98                	cltq   
  402f75:	48 c1 e0 05          	shl    $0x5,%rax
  402f79:	48 89 c2             	mov    %rax,%rdx
  402f7c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  402f80:	48 01 d0             	add    %rdx,%rax
  402f83:	f2 0f 10 00          	movsd  (%rax),%xmm0
  402f87:	f2 0f 10 0d 81 27 00 	movsd  0x2781(%rip),%xmm1        # 405710 <__PRETTY_FUNCTION__.3917+0x30>
  402f8e:	00 
  402f8f:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
  402f93:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  402f96:	48 98                	cltq   
  402f98:	48 c1 e0 05          	shl    $0x5,%rax
  402f9c:	48 89 c2             	mov    %rax,%rdx
  402f9f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  402fa3:	48 01 d0             	add    %rdx,%rax
  402fa6:	f2 0f 10 48 10       	movsd  0x10(%rax),%xmm1
  402fab:	66 0f 28 d0          	movapd %xmm0,%xmm2
  402faf:	f2 0f 5e d1          	divsd  %xmm1,%xmm2
  402fb3:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  402fb6:	48 98                	cltq   
  402fb8:	48 c1 e0 05          	shl    $0x5,%rax
  402fbc:	48 89 c2             	mov    %rax,%rdx
  402fbf:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  402fc3:	48 01 d0             	add    %rdx,%rax
  402fc6:	f2 0f 10 68 10       	movsd  0x10(%rax),%xmm5
  402fcb:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  402fce:	48 98                	cltq   
  402fd0:	48 c1 e0 05          	shl    $0x5,%rax
  402fd4:	48 89 c2             	mov    %rax,%rdx
  402fd7:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  402fdb:	48 01 d0             	add    %rdx,%rax
  402fde:	f2 0f 10 20          	movsd  (%rax),%xmm4
  402fe2:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  402fe5:	48 98                	cltq   
  402fe7:	48 c1 e0 05          	shl    $0x5,%rax
  402feb:	48 89 c2             	mov    %rax,%rdx
  402fee:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  402ff2:	48 01 d0             	add    %rdx,%rax
  402ff5:	f2 0f 10 48 18       	movsd  0x18(%rax),%xmm1
  402ffa:	f2 0f 10 05 06 27 00 	movsd  0x2706(%rip),%xmm0        # 405708 <__PRETTY_FUNCTION__.3917+0x28>
  403001:	00 
  403002:	f2 0f 59 c1          	mulsd  %xmm1,%xmm0
  403006:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  403009:	66 0f 28 da          	movapd %xmm2,%xmm3
  40300d:	66 0f 28 d5          	movapd %xmm5,%xmm2
  403011:	66 0f 28 cc          	movapd %xmm4,%xmm1
  403015:	ba 69 54 40 00       	mov    $0x405469,%edx
  40301a:	89 c6                	mov    %eax,%esi
  40301c:	bf 70 54 40 00       	mov    $0x405470,%edi
  403021:	b8 04 00 00 00       	mov    $0x4,%eax
  403026:	e8 05 dc ff ff       	callq  400c30 <printf@plt>
  40302b:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  40302e:	48 98                	cltq   
  403030:	48 c1 e0 05          	shl    $0x5,%rax
  403034:	48 89 c2             	mov    %rax,%rdx
  403037:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  40303b:	48 01 d0             	add    %rdx,%rax
  40303e:	f2 0f 10 40 10       	movsd  0x10(%rax),%xmm0
  403043:	f2 0f 10 4d e8       	movsd  -0x18(%rbp),%xmm1
  403048:	f2 0f 58 c1          	addsd  %xmm1,%xmm0
  40304c:	f2 0f 11 45 e8       	movsd  %xmm0,-0x18(%rbp)
  403051:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  403054:	48 98                	cltq   
  403056:	48 c1 e0 05          	shl    $0x5,%rax
  40305a:	48 89 c2             	mov    %rax,%rdx
  40305d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  403061:	48 01 d0             	add    %rdx,%rax
  403064:	f2 0f 10 00          	movsd  (%rax),%xmm0
  403068:	f2 0f 10 4d f0       	movsd  -0x10(%rbp),%xmm1
  40306d:	f2 0f 58 c1          	addsd  %xmm1,%xmm0
  403071:	f2 0f 11 45 f0       	movsd  %xmm0,-0x10(%rbp)
  403076:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  403079:	48 98                	cltq   
  40307b:	48 c1 e0 05          	shl    $0x5,%rax
  40307f:	48 89 c2             	mov    %rax,%rdx
  403082:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  403086:	48 01 d0             	add    %rdx,%rax
  403089:	f2 0f 10 40 18       	movsd  0x18(%rax),%xmm0
  40308e:	f2 0f 10 4d f8       	movsd  -0x8(%rbp),%xmm1
  403093:	f2 0f 58 c1          	addsd  %xmm1,%xmm0
  403097:	f2 0f 11 45 f8       	movsd  %xmm0,-0x8(%rbp)
  40309c:	eb 37                	jmp    4030d5 <printresults+0x1f0>
  40309e:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  4030a1:	48 83 ec 08          	sub    $0x8,%rsp
  4030a5:	68 90 54 40 00       	pushq  $0x405490
  4030aa:	41 b9 90 54 40 00    	mov    $0x405490,%r9d
  4030b0:	41 b8 90 54 40 00    	mov    $0x405490,%r8d
  4030b6:	b9 90 54 40 00       	mov    $0x405490,%ecx
  4030bb:	ba 92 54 40 00       	mov    $0x405492,%edx
  4030c0:	89 c6                	mov    %eax,%esi
  4030c2:	bf 95 54 40 00       	mov    $0x405495,%edi
  4030c7:	b8 00 00 00 00       	mov    $0x0,%eax
  4030cc:	e8 5f db ff ff       	callq  400c30 <printf@plt>
  4030d1:	48 83 c4 10          	add    $0x10,%rsp
  4030d5:	83 45 e4 01          	addl   $0x1,-0x1c(%rbp)
  4030d9:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  4030dc:	3b 45 dc             	cmp    -0x24(%rbp),%eax
  4030df:	0f 8c 6d fe ff ff    	jl     402f52 <printresults+0x6d>
  4030e5:	8b 05 45 45 20 00    	mov    0x204545(%rip),%eax        # 607630 <errors>
  4030eb:	85 c0                	test   %eax,%eax
  4030ed:	75 64                	jne    403153 <printresults+0x26e>
  4030ef:	f2 0f 10 45 f0       	movsd  -0x10(%rbp),%xmm0
  4030f4:	f2 0f 10 0d 14 26 00 	movsd  0x2614(%rip),%xmm1        # 405710 <__PRETTY_FUNCTION__.3917+0x30>
  4030fb:	00 
  4030fc:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
  403100:	66 0f 28 d0          	movapd %xmm0,%xmm2
  403104:	f2 0f 5e 55 e8       	divsd  -0x18(%rbp),%xmm2
  403109:	66 0f ef c0          	pxor   %xmm0,%xmm0
  40310d:	f2 0f 2a 45 dc       	cvtsi2sdl -0x24(%rbp),%xmm0
  403112:	f2 0f 10 4d f8       	movsd  -0x8(%rbp),%xmm1
  403117:	f2 0f 5e c8          	divsd  %xmm0,%xmm1
  40311b:	66 0f 28 c1          	movapd %xmm1,%xmm0
  40311f:	f2 0f 10 0d e1 25 00 	movsd  0x25e1(%rip),%xmm1        # 405708 <__PRETTY_FUNCTION__.3917+0x28>
  403126:	00 
  403127:	f2 0f 59 c1          	mulsd  %xmm1,%xmm0
  40312b:	f2 0f 10 65 e8       	movsd  -0x18(%rbp),%xmm4
  403130:	f2 0f 10 4d f0       	movsd  -0x10(%rbp),%xmm1
  403135:	66 0f 28 da          	movapd %xmm2,%xmm3
  403139:	66 0f 28 d4          	movapd %xmm4,%xmm2
  40313d:	be ab 54 40 00       	mov    $0x4054ab,%esi
  403142:	bf b8 54 40 00       	mov    $0x4054b8,%edi
  403147:	b8 04 00 00 00       	mov    $0x4,%eax
  40314c:	e8 df da ff ff       	callq  400c30 <printf@plt>
  403151:	eb 2a                	jmp    40317d <printresults+0x298>
  403153:	41 b9 90 54 40 00    	mov    $0x405490,%r9d
  403159:	41 b8 90 54 40 00    	mov    $0x405490,%r8d
  40315f:	b9 90 54 40 00       	mov    $0x405490,%ecx
  403164:	ba 90 54 40 00       	mov    $0x405490,%edx
  403169:	be ab 54 40 00       	mov    $0x4054ab,%esi
  40316e:	bf d5 54 40 00       	mov    $0x4054d5,%edi
  403173:	b8 00 00 00 00       	mov    $0x0,%eax
  403178:	e8 b3 da ff ff       	callq  400c30 <printf@plt>
  40317d:	90                   	nop
  40317e:	c9                   	leaveq 
  40317f:	c3                   	retq   

0000000000403180 <app_error>:
  403180:	55                   	push   %rbp
  403181:	48 89 e5             	mov    %rsp,%rbp
  403184:	48 83 ec 10          	sub    $0x10,%rsp
  403188:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  40318c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  403190:	48 89 c7             	mov    %rax,%rdi
  403193:	e8 58 da ff ff       	callq  400bf0 <puts@plt>
  403198:	bf 01 00 00 00       	mov    $0x1,%edi
  40319d:	e8 ae db ff ff       	callq  400d50 <exit@plt>

00000000004031a2 <unix_error>:
  4031a2:	55                   	push   %rbp
  4031a3:	48 89 e5             	mov    %rsp,%rbp
  4031a6:	48 83 ec 10          	sub    $0x10,%rsp
  4031aa:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  4031ae:	e8 0d da ff ff       	callq  400bc0 <__errno_location@plt>
  4031b3:	8b 00                	mov    (%rax),%eax
  4031b5:	89 c7                	mov    %eax,%edi
  4031b7:	e8 c4 db ff ff       	callq  400d80 <strerror@plt>
  4031bc:	48 89 c2             	mov    %rax,%rdx
  4031bf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4031c3:	48 89 c6             	mov    %rax,%rsi
  4031c6:	bf e8 54 40 00       	mov    $0x4054e8,%edi
  4031cb:	b8 00 00 00 00       	mov    $0x0,%eax
  4031d0:	e8 5b da ff ff       	callq  400c30 <printf@plt>
  4031d5:	bf 01 00 00 00       	mov    $0x1,%edi
  4031da:	e8 71 db ff ff       	callq  400d50 <exit@plt>

00000000004031df <malloc_error>:
  4031df:	55                   	push   %rbp
  4031e0:	48 89 e5             	mov    %rsp,%rbp
  4031e3:	48 83 ec 10          	sub    $0x10,%rsp
  4031e7:	89 7d fc             	mov    %edi,-0x4(%rbp)
  4031ea:	89 75 f8             	mov    %esi,-0x8(%rbp)
  4031ed:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
  4031f1:	8b 05 39 44 20 00    	mov    0x204439(%rip),%eax        # 607630 <errors>
  4031f7:	83 c0 01             	add    $0x1,%eax
  4031fa:	89 05 30 44 20 00    	mov    %eax,0x204430(%rip)        # 607630 <errors>
  403200:	8b 45 f8             	mov    -0x8(%rbp),%eax
  403203:	8d 70 05             	lea    0x5(%rax),%esi
  403206:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  40320a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  40320d:	48 89 d1             	mov    %rdx,%rcx
  403210:	89 f2                	mov    %esi,%edx
  403212:	89 c6                	mov    %eax,%esi
  403214:	bf f0 54 40 00       	mov    $0x4054f0,%edi
  403219:	b8 00 00 00 00       	mov    $0x0,%eax
  40321e:	e8 0d da ff ff       	callq  400c30 <printf@plt>
  403223:	90                   	nop
  403224:	c9                   	leaveq 
  403225:	c3                   	retq   

0000000000403226 <usage>:
  403226:	55                   	push   %rbp
  403227:	48 89 e5             	mov    %rsp,%rbp
  40322a:	48 8b 05 ef 43 20 00 	mov    0x2043ef(%rip),%rax        # 607620 <stderr@@GLIBC_2.2.5>
  403231:	48 89 c1             	mov    %rax,%rcx
  403234:	ba 2f 00 00 00       	mov    $0x2f,%edx
  403239:	be 01 00 00 00       	mov    $0x1,%esi
  40323e:	bf 10 55 40 00       	mov    $0x405510,%edi
  403243:	e8 18 db ff ff       	callq  400d60 <fwrite@plt>
  403248:	48 8b 05 d1 43 20 00 	mov    0x2043d1(%rip),%rax        # 607620 <stderr@@GLIBC_2.2.5>
  40324f:	48 89 c1             	mov    %rax,%rcx
  403252:	ba 08 00 00 00       	mov    $0x8,%edx
  403257:	be 01 00 00 00       	mov    $0x1,%esi
  40325c:	bf 40 55 40 00       	mov    $0x405540,%edi
  403261:	e8 fa da ff ff       	callq  400d60 <fwrite@plt>
  403266:	48 8b 05 b3 43 20 00 	mov    0x2043b3(%rip),%rax        # 607620 <stderr@@GLIBC_2.2.5>
  40326d:	48 89 c1             	mov    %rax,%rcx
  403270:	ba 2c 00 00 00       	mov    $0x2c,%edx
  403275:	be 01 00 00 00       	mov    $0x1,%esi
  40327a:	bf 50 55 40 00       	mov    $0x405550,%edi
  40327f:	e8 dc da ff ff       	callq  400d60 <fwrite@plt>
  403284:	48 8b 05 95 43 20 00 	mov    0x204395(%rip),%rax        # 607620 <stderr@@GLIBC_2.2.5>
  40328b:	48 89 c1             	mov    %rax,%rcx
  40328e:	ba 2a 00 00 00       	mov    $0x2a,%edx
  403293:	be 01 00 00 00       	mov    $0x1,%esi
  403298:	bf 80 55 40 00       	mov    $0x405580,%edi
  40329d:	e8 be da ff ff       	callq  400d60 <fwrite@plt>
  4032a2:	48 8b 05 77 43 20 00 	mov    0x204377(%rip),%rax        # 607620 <stderr@@GLIBC_2.2.5>
  4032a9:	48 89 c1             	mov    %rax,%rcx
  4032ac:	ba 32 00 00 00       	mov    $0x32,%edx
  4032b1:	be 01 00 00 00       	mov    $0x1,%esi
  4032b6:	bf b0 55 40 00       	mov    $0x4055b0,%edi
  4032bb:	e8 a0 da ff ff       	callq  400d60 <fwrite@plt>
  4032c0:	48 8b 05 59 43 20 00 	mov    0x204359(%rip),%rax        # 607620 <stderr@@GLIBC_2.2.5>
  4032c7:	48 89 c1             	mov    %rax,%rcx
  4032ca:	ba 20 00 00 00       	mov    $0x20,%edx
  4032cf:	be 01 00 00 00       	mov    $0x1,%esi
  4032d4:	bf e8 55 40 00       	mov    $0x4055e8,%edi
  4032d9:	e8 82 da ff ff       	callq  400d60 <fwrite@plt>
  4032de:	48 8b 05 3b 43 20 00 	mov    0x20433b(%rip),%rax        # 607620 <stderr@@GLIBC_2.2.5>
  4032e5:	48 89 c1             	mov    %rax,%rcx
  4032e8:	ba 25 00 00 00       	mov    $0x25,%edx
  4032ed:	be 01 00 00 00       	mov    $0x1,%esi
  4032f2:	bf 10 56 40 00       	mov    $0x405610,%edi
  4032f7:	e8 64 da ff ff       	callq  400d60 <fwrite@plt>
  4032fc:	48 8b 05 1d 43 20 00 	mov    0x20431d(%rip),%rax        # 607620 <stderr@@GLIBC_2.2.5>
  403303:	48 89 c1             	mov    %rax,%rcx
  403306:	ba 2e 00 00 00       	mov    $0x2e,%edx
  40330b:	be 01 00 00 00       	mov    $0x1,%esi
  403310:	bf 38 56 40 00       	mov    $0x405638,%edi
  403315:	e8 46 da ff ff       	callq  400d60 <fwrite@plt>
  40331a:	48 8b 05 ff 42 20 00 	mov    0x2042ff(%rip),%rax        # 607620 <stderr@@GLIBC_2.2.5>
  403321:	48 89 c1             	mov    %rax,%rcx
  403324:	ba 34 00 00 00       	mov    $0x34,%edx
  403329:	be 01 00 00 00       	mov    $0x1,%esi
  40332e:	bf 68 56 40 00       	mov    $0x405668,%edi
  403333:	e8 28 da ff ff       	callq  400d60 <fwrite@plt>
  403338:	48 8b 05 e1 42 20 00 	mov    0x2042e1(%rip),%rax        # 607620 <stderr@@GLIBC_2.2.5>
  40333f:	48 89 c1             	mov    %rax,%rcx
  403342:	ba 29 00 00 00       	mov    $0x29,%edx
  403347:	be 01 00 00 00       	mov    $0x1,%esi
  40334c:	bf a0 56 40 00       	mov    $0x4056a0,%edi
  403351:	e8 0a da ff ff       	callq  400d60 <fwrite@plt>
  403356:	90                   	nop
  403357:	5d                   	pop    %rbp
  403358:	c3                   	retq   

0000000000403359 <mem_init>:
  403359:	55                   	push   %rbp
  40335a:	48 89 e5             	mov    %rsp,%rbp
  40335d:	bf 00 00 40 01       	mov    $0x1400000,%edi
  403362:	e8 39 d9 ff ff       	callq  400ca0 <malloc@plt>
  403367:	48 89 05 ca 42 20 00 	mov    %rax,0x2042ca(%rip)        # 607638 <mem_start_brk>
  40336e:	48 8b 05 c3 42 20 00 	mov    0x2042c3(%rip),%rax        # 607638 <mem_start_brk>
  403375:	48 85 c0             	test   %rax,%rax
  403378:	75 28                	jne    4033a2 <mem_init+0x49>
  40337a:	48 8b 05 9f 42 20 00 	mov    0x20429f(%rip),%rax        # 607620 <stderr@@GLIBC_2.2.5>
  403381:	48 89 c1             	mov    %rax,%rcx
  403384:	ba 1a 00 00 00       	mov    $0x1a,%edx
  403389:	be 01 00 00 00       	mov    $0x1,%esi
  40338e:	bf 18 57 40 00       	mov    $0x405718,%edi
  403393:	e8 c8 d9 ff ff       	callq  400d60 <fwrite@plt>
  403398:	bf 01 00 00 00       	mov    $0x1,%edi
  40339d:	e8 ae d9 ff ff       	callq  400d50 <exit@plt>
  4033a2:	48 8b 05 8f 42 20 00 	mov    0x20428f(%rip),%rax        # 607638 <mem_start_brk>
  4033a9:	48 05 00 00 40 01    	add    $0x1400000,%rax
  4033af:	48 89 05 92 42 20 00 	mov    %rax,0x204292(%rip)        # 607648 <mem_max_addr>
  4033b6:	48 8b 05 7b 42 20 00 	mov    0x20427b(%rip),%rax        # 607638 <mem_start_brk>
  4033bd:	48 89 05 7c 42 20 00 	mov    %rax,0x20427c(%rip)        # 607640 <mem_brk>
  4033c4:	90                   	nop
  4033c5:	5d                   	pop    %rbp
  4033c6:	c3                   	retq   

00000000004033c7 <mem_deinit>:
  4033c7:	55                   	push   %rbp
  4033c8:	48 89 e5             	mov    %rsp,%rbp
  4033cb:	48 8b 05 66 42 20 00 	mov    0x204266(%rip),%rax        # 607638 <mem_start_brk>
  4033d2:	48 89 c7             	mov    %rax,%rdi
  4033d5:	e8 c6 d7 ff ff       	callq  400ba0 <free@plt>
  4033da:	90                   	nop
  4033db:	5d                   	pop    %rbp
  4033dc:	c3                   	retq   

00000000004033dd <mem_reset_brk>:
  4033dd:	55                   	push   %rbp
  4033de:	48 89 e5             	mov    %rsp,%rbp
  4033e1:	48 8b 05 50 42 20 00 	mov    0x204250(%rip),%rax        # 607638 <mem_start_brk>
  4033e8:	48 89 05 51 42 20 00 	mov    %rax,0x204251(%rip)        # 607640 <mem_brk>
  4033ef:	90                   	nop
  4033f0:	5d                   	pop    %rbp
  4033f1:	c3                   	retq   

00000000004033f2 <mem_sbrk>:
  4033f2:	55                   	push   %rbp
  4033f3:	48 89 e5             	mov    %rsp,%rbp
  4033f6:	48 83 ec 20          	sub    $0x20,%rsp
  4033fa:	89 7d ec             	mov    %edi,-0x14(%rbp)
  4033fd:	48 8b 05 3c 42 20 00 	mov    0x20423c(%rip),%rax        # 607640 <mem_brk>
  403404:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  403408:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  40340c:	78 1b                	js     403429 <mem_sbrk+0x37>
  40340e:	48 8b 15 2b 42 20 00 	mov    0x20422b(%rip),%rdx        # 607640 <mem_brk>
  403415:	8b 45 ec             	mov    -0x14(%rbp),%eax
  403418:	48 98                	cltq   
  40341a:	48 01 c2             	add    %rax,%rdx
  40341d:	48 8b 05 24 42 20 00 	mov    0x204224(%rip),%rax        # 607648 <mem_max_addr>
  403424:	48 39 c2             	cmp    %rax,%rdx
  403427:	76 32                	jbe    40345b <mem_sbrk+0x69>
  403429:	e8 92 d7 ff ff       	callq  400bc0 <__errno_location@plt>
  40342e:	c7 00 0c 00 00 00    	movl   $0xc,(%rax)
  403434:	48 8b 05 e5 41 20 00 	mov    0x2041e5(%rip),%rax        # 607620 <stderr@@GLIBC_2.2.5>
  40343b:	48 89 c1             	mov    %rax,%rcx
  40343e:	ba 2d 00 00 00       	mov    $0x2d,%edx
  403443:	be 01 00 00 00       	mov    $0x1,%esi
  403448:	bf 38 57 40 00       	mov    $0x405738,%edi
  40344d:	e8 0e d9 ff ff       	callq  400d60 <fwrite@plt>
  403452:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  403459:	eb 1a                	jmp    403475 <mem_sbrk+0x83>
  40345b:	48 8b 15 de 41 20 00 	mov    0x2041de(%rip),%rdx        # 607640 <mem_brk>
  403462:	8b 45 ec             	mov    -0x14(%rbp),%eax
  403465:	48 98                	cltq   
  403467:	48 01 d0             	add    %rdx,%rax
  40346a:	48 89 05 cf 41 20 00 	mov    %rax,0x2041cf(%rip)        # 607640 <mem_brk>
  403471:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  403475:	c9                   	leaveq 
  403476:	c3                   	retq   

0000000000403477 <mem_heap_lo>:
  403477:	55                   	push   %rbp
  403478:	48 89 e5             	mov    %rsp,%rbp
  40347b:	48 8b 05 b6 41 20 00 	mov    0x2041b6(%rip),%rax        # 607638 <mem_start_brk>
  403482:	5d                   	pop    %rbp
  403483:	c3                   	retq   

0000000000403484 <mem_heap_hi>:
  403484:	55                   	push   %rbp
  403485:	48 89 e5             	mov    %rsp,%rbp
  403488:	48 8b 05 b1 41 20 00 	mov    0x2041b1(%rip),%rax        # 607640 <mem_brk>
  40348f:	48 83 e8 01          	sub    $0x1,%rax
  403493:	5d                   	pop    %rbp
  403494:	c3                   	retq   

0000000000403495 <mem_heapsize>:
  403495:	55                   	push   %rbp
  403496:	48 89 e5             	mov    %rsp,%rbp
  403499:	48 8b 05 a0 41 20 00 	mov    0x2041a0(%rip),%rax        # 607640 <mem_brk>
  4034a0:	48 89 c2             	mov    %rax,%rdx
  4034a3:	48 8b 05 8e 41 20 00 	mov    0x20418e(%rip),%rax        # 607638 <mem_start_brk>
  4034aa:	48 29 c2             	sub    %rax,%rdx
  4034ad:	48 89 d0             	mov    %rdx,%rax
  4034b0:	5d                   	pop    %rbp
  4034b1:	c3                   	retq   

00000000004034b2 <mem_pagesize>:
  4034b2:	55                   	push   %rbp
  4034b3:	48 89 e5             	mov    %rsp,%rbp
  4034b6:	e8 75 d8 ff ff       	callq  400d30 <getpagesize@plt>
  4034bb:	48 98                	cltq   
  4034bd:	5d                   	pop    %rbp
  4034be:	c3                   	retq   

00000000004034bf <init_fsecs>:
  4034bf:	55                   	push   %rbp
  4034c0:	48 89 e5             	mov    %rsp,%rbp
  4034c3:	66 0f ef c0          	pxor   %xmm0,%xmm0
  4034c7:	f2 0f 11 05 81 41 20 	movsd  %xmm0,0x204181(%rip)        # 607650 <Mhz>
  4034ce:	00 
  4034cf:	8b 05 57 41 20 00    	mov    0x204157(%rip),%eax        # 60762c <verbose>
  4034d5:	85 c0                	test   %eax,%eax
  4034d7:	74 0a                	je     4034e3 <init_fsecs+0x24>
  4034d9:	bf 68 57 40 00       	mov    $0x405768,%edi
  4034de:	e8 0d d7 ff ff       	callq  400bf0 <puts@plt>
  4034e3:	90                   	nop
  4034e4:	5d                   	pop    %rbp
  4034e5:	c3                   	retq   

00000000004034e6 <fsecs>:
  4034e6:	55                   	push   %rbp
  4034e7:	48 89 e5             	mov    %rsp,%rbp
  4034ea:	48 83 ec 20          	sub    $0x20,%rsp
  4034ee:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  4034f2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  4034f6:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  4034fa:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4034fe:	ba 0a 00 00 00       	mov    $0xa,%edx
  403503:	48 89 ce             	mov    %rcx,%rsi
  403506:	48 89 c7             	mov    %rax,%rdi
  403509:	e8 03 09 00 00       	callq  403e11 <ftimer_gettod>
  40350e:	66 48 0f 7e c0       	movq   %xmm0,%rax
  403513:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  403517:	f2 0f 10 45 e8       	movsd  -0x18(%rbp),%xmm0
  40351c:	c9                   	leaveq 
  40351d:	c3                   	retq   

000000000040351e <init_sampler>:
  40351e:	55                   	push   %rbp
  40351f:	48 89 e5             	mov    %rsp,%rbp
  403522:	48 8b 05 3f 41 20 00 	mov    0x20413f(%rip),%rax        # 607668 <values>
  403529:	48 85 c0             	test   %rax,%rax
  40352c:	74 0f                	je     40353d <init_sampler+0x1f>
  40352e:	48 8b 05 33 41 20 00 	mov    0x204133(%rip),%rax        # 607668 <values>
  403535:	48 89 c7             	mov    %rax,%rdi
  403538:	e8 63 d6 ff ff       	callq  400ba0 <free@plt>
  40353d:	8b 05 65 40 20 00    	mov    0x204065(%rip),%eax        # 6075a8 <kbest>
  403543:	48 98                	cltq   
  403545:	be 08 00 00 00       	mov    $0x8,%esi
  40354a:	48 89 c7             	mov    %rax,%rdi
  40354d:	e8 2e d7 ff ff       	callq  400c80 <calloc@plt>
  403552:	48 89 05 0f 41 20 00 	mov    %rax,0x20410f(%rip)        # 607668 <values>
  403559:	c7 05 0d 41 20 00 00 	movl   $0x0,0x20410d(%rip)        # 607670 <samplecount>
  403560:	00 00 00 
  403563:	90                   	nop
  403564:	5d                   	pop    %rbp
  403565:	c3                   	retq   

0000000000403566 <add_sample>:
  403566:	55                   	push   %rbp
  403567:	48 89 e5             	mov    %rsp,%rbp
  40356a:	f2 0f 11 45 e8       	movsd  %xmm0,-0x18(%rbp)
  40356f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
  403576:	8b 15 f4 40 20 00    	mov    0x2040f4(%rip),%edx        # 607670 <samplecount>
  40357c:	8b 05 26 40 20 00    	mov    0x204026(%rip),%eax        # 6075a8 <kbest>
  403582:	39 c2                	cmp    %eax,%edx
  403584:	7d 28                	jge    4035ae <add_sample+0x48>
  403586:	8b 05 e4 40 20 00    	mov    0x2040e4(%rip),%eax        # 607670 <samplecount>
  40358c:	89 45 f4             	mov    %eax,-0xc(%rbp)
  40358f:	48 8b 05 d2 40 20 00 	mov    0x2040d2(%rip),%rax        # 607668 <values>
  403596:	8b 55 f4             	mov    -0xc(%rbp),%edx
  403599:	48 63 d2             	movslq %edx,%rdx
  40359c:	48 c1 e2 03          	shl    $0x3,%rdx
  4035a0:	48 01 d0             	add    %rdx,%rax
  4035a3:	f2 0f 10 45 e8       	movsd  -0x18(%rbp),%xmm0
  4035a8:	f2 0f 11 00          	movsd  %xmm0,(%rax)
  4035ac:	eb 4f                	jmp    4035fd <add_sample+0x97>
  4035ae:	48 8b 05 b3 40 20 00 	mov    0x2040b3(%rip),%rax        # 607668 <values>
  4035b5:	8b 15 ed 3f 20 00    	mov    0x203fed(%rip),%edx        # 6075a8 <kbest>
  4035bb:	48 63 d2             	movslq %edx,%rdx
  4035be:	48 c1 e2 03          	shl    $0x3,%rdx
  4035c2:	48 83 ea 08          	sub    $0x8,%rdx
  4035c6:	48 01 d0             	add    %rdx,%rax
  4035c9:	f2 0f 10 00          	movsd  (%rax),%xmm0
  4035cd:	66 0f 2e 45 e8       	ucomisd -0x18(%rbp),%xmm0
  4035d2:	76 29                	jbe    4035fd <add_sample+0x97>
  4035d4:	8b 05 ce 3f 20 00    	mov    0x203fce(%rip),%eax        # 6075a8 <kbest>
  4035da:	83 e8 01             	sub    $0x1,%eax
  4035dd:	89 45 f4             	mov    %eax,-0xc(%rbp)
  4035e0:	48 8b 05 81 40 20 00 	mov    0x204081(%rip),%rax        # 607668 <values>
  4035e7:	8b 55 f4             	mov    -0xc(%rbp),%edx
  4035ea:	48 63 d2             	movslq %edx,%rdx
  4035ed:	48 c1 e2 03          	shl    $0x3,%rdx
  4035f1:	48 01 d0             	add    %rdx,%rax
  4035f4:	f2 0f 10 45 e8       	movsd  -0x18(%rbp),%xmm0
  4035f9:	f2 0f 11 00          	movsd  %xmm0,(%rax)
  4035fd:	8b 05 6d 40 20 00    	mov    0x20406d(%rip),%eax        # 607670 <samplecount>
  403603:	83 c0 01             	add    $0x1,%eax
  403606:	89 05 64 40 20 00    	mov    %eax,0x204064(%rip)        # 607670 <samplecount>
  40360c:	eb 76                	jmp    403684 <add_sample+0x11e>
  40360e:	48 8b 05 53 40 20 00 	mov    0x204053(%rip),%rax        # 607668 <values>
  403615:	8b 55 f4             	mov    -0xc(%rbp),%edx
  403618:	48 63 d2             	movslq %edx,%rdx
  40361b:	48 c1 e2 03          	shl    $0x3,%rdx
  40361f:	48 83 ea 08          	sub    $0x8,%rdx
  403623:	48 01 d0             	add    %rdx,%rax
  403626:	f2 0f 10 00          	movsd  (%rax),%xmm0
  40362a:	f2 0f 11 45 f8       	movsd  %xmm0,-0x8(%rbp)
  40362f:	48 8b 05 32 40 20 00 	mov    0x204032(%rip),%rax        # 607668 <values>
  403636:	8b 55 f4             	mov    -0xc(%rbp),%edx
  403639:	48 63 d2             	movslq %edx,%rdx
  40363c:	48 c1 e2 03          	shl    $0x3,%rdx
  403640:	48 83 ea 08          	sub    $0x8,%rdx
  403644:	48 01 d0             	add    %rdx,%rax
  403647:	48 8b 15 1a 40 20 00 	mov    0x20401a(%rip),%rdx        # 607668 <values>
  40364e:	8b 4d f4             	mov    -0xc(%rbp),%ecx
  403651:	48 63 c9             	movslq %ecx,%rcx
  403654:	48 c1 e1 03          	shl    $0x3,%rcx
  403658:	48 01 ca             	add    %rcx,%rdx
  40365b:	f2 0f 10 02          	movsd  (%rdx),%xmm0
  40365f:	f2 0f 11 00          	movsd  %xmm0,(%rax)
  403663:	48 8b 05 fe 3f 20 00 	mov    0x203ffe(%rip),%rax        # 607668 <values>
  40366a:	8b 55 f4             	mov    -0xc(%rbp),%edx
  40366d:	48 63 d2             	movslq %edx,%rdx
  403670:	48 c1 e2 03          	shl    $0x3,%rdx
  403674:	48 01 d0             	add    %rdx,%rax
  403677:	f2 0f 10 45 f8       	movsd  -0x8(%rbp),%xmm0
  40367c:	f2 0f 11 00          	movsd  %xmm0,(%rax)
  403680:	83 6d f4 01          	subl   $0x1,-0xc(%rbp)
  403684:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  403688:	7e 3e                	jle    4036c8 <add_sample+0x162>
  40368a:	48 8b 05 d7 3f 20 00 	mov    0x203fd7(%rip),%rax        # 607668 <values>
  403691:	8b 55 f4             	mov    -0xc(%rbp),%edx
  403694:	48 63 d2             	movslq %edx,%rdx
  403697:	48 c1 e2 03          	shl    $0x3,%rdx
  40369b:	48 83 ea 08          	sub    $0x8,%rdx
  40369f:	48 01 d0             	add    %rdx,%rax
  4036a2:	f2 0f 10 00          	movsd  (%rax),%xmm0
  4036a6:	48 8b 05 bb 3f 20 00 	mov    0x203fbb(%rip),%rax        # 607668 <values>
  4036ad:	8b 55 f4             	mov    -0xc(%rbp),%edx
  4036b0:	48 63 d2             	movslq %edx,%rdx
  4036b3:	48 c1 e2 03          	shl    $0x3,%rdx
  4036b7:	48 01 d0             	add    %rdx,%rax
  4036ba:	f2 0f 10 08          	movsd  (%rax),%xmm1
  4036be:	66 0f 2e c1          	ucomisd %xmm1,%xmm0
  4036c2:	0f 87 46 ff ff ff    	ja     40360e <add_sample+0xa8>
  4036c8:	90                   	nop
  4036c9:	5d                   	pop    %rbp
  4036ca:	c3                   	retq   

00000000004036cb <has_converged>:
  4036cb:	55                   	push   %rbp
  4036cc:	48 89 e5             	mov    %rsp,%rbp
  4036cf:	8b 15 9b 3f 20 00    	mov    0x203f9b(%rip),%edx        # 607670 <samplecount>
  4036d5:	8b 05 cd 3e 20 00    	mov    0x203ecd(%rip),%eax        # 6075a8 <kbest>
  4036db:	39 c2                	cmp    %eax,%edx
  4036dd:	7c 4f                	jl     40372e <has_converged+0x63>
  4036df:	f2 0f 10 0d c9 3e 20 	movsd  0x203ec9(%rip),%xmm1        # 6075b0 <epsilon>
  4036e6:	00 
  4036e7:	f2 0f 10 05 e9 20 00 	movsd  0x20e9(%rip),%xmm0        # 4057d8 <__PRETTY_FUNCTION__.3917+0xf8>
  4036ee:	00 
  4036ef:	f2 0f 58 c1          	addsd  %xmm1,%xmm0
  4036f3:	48 8b 05 6e 3f 20 00 	mov    0x203f6e(%rip),%rax        # 607668 <values>
  4036fa:	f2 0f 10 08          	movsd  (%rax),%xmm1
  4036fe:	f2 0f 59 c1          	mulsd  %xmm1,%xmm0
  403702:	48 8b 05 5f 3f 20 00 	mov    0x203f5f(%rip),%rax        # 607668 <values>
  403709:	8b 15 99 3e 20 00    	mov    0x203e99(%rip),%edx        # 6075a8 <kbest>
  40370f:	48 63 d2             	movslq %edx,%rdx
  403712:	48 c1 e2 03          	shl    $0x3,%rdx
  403716:	48 83 ea 08          	sub    $0x8,%rdx
  40371a:	48 01 d0             	add    %rdx,%rax
  40371d:	f2 0f 10 08          	movsd  (%rax),%xmm1
  403721:	66 0f 2e c1          	ucomisd %xmm1,%xmm0
  403725:	72 07                	jb     40372e <has_converged+0x63>
  403727:	b8 01 00 00 00       	mov    $0x1,%eax
  40372c:	eb 05                	jmp    403733 <has_converged+0x68>
  40372e:	b8 00 00 00 00       	mov    $0x0,%eax
  403733:	5d                   	pop    %rbp
  403734:	c3                   	retq   

0000000000403735 <clear>:
  403735:	55                   	push   %rbp
  403736:	48 89 e5             	mov    %rsp,%rbp
  403739:	48 83 ec 20          	sub    $0x20,%rsp
  40373d:	8b 05 31 3f 20 00    	mov    0x203f31(%rip),%eax        # 607674 <sink>
  403743:	89 45 e8             	mov    %eax,-0x18(%rbp)
  403746:	8b 05 70 3e 20 00    	mov    0x203e70(%rip),%eax        # 6075bc <cache_block>
  40374c:	48 98                	cltq   
  40374e:	48 c1 e8 02          	shr    $0x2,%rax
  403752:	89 45 ec             	mov    %eax,-0x14(%rbp)
  403755:	48 8b 05 04 3f 20 00 	mov    0x203f04(%rip),%rax        # 607660 <cache_buf>
  40375c:	48 85 c0             	test   %rax,%rax
  40375f:	75 4b                	jne    4037ac <clear+0x77>
  403761:	8b 05 51 3e 20 00    	mov    0x203e51(%rip),%eax        # 6075b8 <cache_bytes>
  403767:	48 98                	cltq   
  403769:	48 89 c7             	mov    %rax,%rdi
  40376c:	e8 2f d5 ff ff       	callq  400ca0 <malloc@plt>
  403771:	48 89 05 e8 3e 20 00 	mov    %rax,0x203ee8(%rip)        # 607660 <cache_buf>
  403778:	48 8b 05 e1 3e 20 00 	mov    0x203ee1(%rip),%rax        # 607660 <cache_buf>
  40377f:	48 85 c0             	test   %rax,%rax
  403782:	75 28                	jne    4037ac <clear+0x77>
  403784:	48 8b 05 95 3e 20 00 	mov    0x203e95(%rip),%rax        # 607620 <stderr@@GLIBC_2.2.5>
  40378b:	48 89 c1             	mov    %rax,%rcx
  40378e:	ba 3e 00 00 00       	mov    $0x3e,%edx
  403793:	be 01 00 00 00       	mov    $0x1,%esi
  403798:	bf 98 57 40 00       	mov    $0x405798,%edi
  40379d:	e8 be d5 ff ff       	callq  400d60 <fwrite@plt>
  4037a2:	bf 01 00 00 00       	mov    $0x1,%edi
  4037a7:	e8 a4 d5 ff ff       	callq  400d50 <exit@plt>
  4037ac:	48 8b 05 ad 3e 20 00 	mov    0x203ead(%rip),%rax        # 607660 <cache_buf>
  4037b3:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  4037b7:	8b 05 fb 3d 20 00    	mov    0x203dfb(%rip),%eax        # 6075b8 <cache_bytes>
  4037bd:	48 98                	cltq   
  4037bf:	48 c1 e8 02          	shr    $0x2,%rax
  4037c3:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
  4037ca:	00 
  4037cb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  4037cf:	48 01 d0             	add    %rdx,%rax
  4037d2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  4037d6:	eb 16                	jmp    4037ee <clear+0xb9>
  4037d8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  4037dc:	8b 00                	mov    (%rax),%eax
  4037de:	01 45 e8             	add    %eax,-0x18(%rbp)
  4037e1:	8b 45 ec             	mov    -0x14(%rbp),%eax
  4037e4:	48 98                	cltq   
  4037e6:	48 c1 e0 02          	shl    $0x2,%rax
  4037ea:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  4037ee:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  4037f2:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  4037f6:	72 e0                	jb     4037d8 <clear+0xa3>
  4037f8:	8b 45 e8             	mov    -0x18(%rbp),%eax
  4037fb:	89 05 73 3e 20 00    	mov    %eax,0x203e73(%rip)        # 607674 <sink>
  403801:	90                   	nop
  403802:	c9                   	leaveq 
  403803:	c3                   	retq   

0000000000403804 <fcyc>:
  403804:	55                   	push   %rbp
  403805:	48 89 e5             	mov    %rsp,%rbp
  403808:	48 83 ec 40          	sub    $0x40,%rsp
  40380c:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  403810:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  403814:	b8 00 00 00 00       	mov    $0x0,%eax
  403819:	e8 00 fd ff ff       	callq  40351e <init_sampler>
  40381e:	8b 05 34 3e 20 00    	mov    0x203e34(%rip),%eax        # 607658 <compensate>
  403824:	85 c0                	test   %eax,%eax
  403826:	74 74                	je     40389c <fcyc+0x98>
  403828:	8b 05 2e 3e 20 00    	mov    0x203e2e(%rip),%eax        # 60765c <clear_cache>
  40382e:	85 c0                	test   %eax,%eax
  403830:	74 0a                	je     40383c <fcyc+0x38>
  403832:	b8 00 00 00 00       	mov    $0x0,%eax
  403837:	e8 f9 fe ff ff       	callq  403735 <clear>
  40383c:	b8 00 00 00 00       	mov    $0x0,%eax
  403841:	e8 59 04 00 00       	callq  403c9f <start_comp_counter>
  403846:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  40384a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  40384e:	48 89 d7             	mov    %rdx,%rdi
  403851:	ff d0                	callq  *%rax
  403853:	b8 00 00 00 00       	mov    $0x0,%eax
  403858:	e8 b7 04 00 00       	callq  403d14 <get_comp_counter>
  40385d:	66 48 0f 7e c0       	movq   %xmm0,%rax
  403862:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  403866:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  40386a:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  40386e:	f2 0f 10 45 c8       	movsd  -0x38(%rbp),%xmm0
  403873:	e8 ee fc ff ff       	callq  403566 <add_sample>
  403878:	b8 00 00 00 00       	mov    $0x0,%eax
  40387d:	e8 49 fe ff ff       	callq  4036cb <has_converged>
  403882:	85 c0                	test   %eax,%eax
  403884:	0f 85 80 00 00 00    	jne    40390a <fcyc+0x106>
  40388a:	8b 15 e0 3d 20 00    	mov    0x203de0(%rip),%edx        # 607670 <samplecount>
  403890:	8b 05 16 3d 20 00    	mov    0x203d16(%rip),%eax        # 6075ac <maxsamples>
  403896:	39 c2                	cmp    %eax,%edx
  403898:	7c 8e                	jl     403828 <fcyc+0x24>
  40389a:	eb 6e                	jmp    40390a <fcyc+0x106>
  40389c:	8b 05 ba 3d 20 00    	mov    0x203dba(%rip),%eax        # 60765c <clear_cache>
  4038a2:	85 c0                	test   %eax,%eax
  4038a4:	74 0a                	je     4038b0 <fcyc+0xac>
  4038a6:	b8 00 00 00 00       	mov    $0x0,%eax
  4038ab:	e8 85 fe ff ff       	callq  403735 <clear>
  4038b0:	b8 00 00 00 00       	mov    $0x0,%eax
  4038b5:	e8 41 01 00 00       	callq  4039fb <start_counter>
  4038ba:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  4038be:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  4038c2:	48 89 d7             	mov    %rdx,%rdi
  4038c5:	ff d0                	callq  *%rax
  4038c7:	b8 00 00 00 00       	mov    $0x0,%eax
  4038cc:	e8 56 01 00 00       	callq  403a27 <get_counter>
  4038d1:	66 48 0f 7e c0       	movq   %xmm0,%rax
  4038d6:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  4038da:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  4038de:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  4038e2:	f2 0f 10 45 c8       	movsd  -0x38(%rbp),%xmm0
  4038e7:	e8 7a fc ff ff       	callq  403566 <add_sample>
  4038ec:	b8 00 00 00 00       	mov    $0x0,%eax
  4038f1:	e8 d5 fd ff ff       	callq  4036cb <has_converged>
  4038f6:	85 c0                	test   %eax,%eax
  4038f8:	75 10                	jne    40390a <fcyc+0x106>
  4038fa:	8b 15 70 3d 20 00    	mov    0x203d70(%rip),%edx        # 607670 <samplecount>
  403900:	8b 05 a6 3c 20 00    	mov    0x203ca6(%rip),%eax        # 6075ac <maxsamples>
  403906:	39 c2                	cmp    %eax,%edx
  403908:	7c 92                	jl     40389c <fcyc+0x98>
  40390a:	48 8b 05 57 3d 20 00 	mov    0x203d57(%rip),%rax        # 607668 <values>
  403911:	f2 0f 10 00          	movsd  (%rax),%xmm0
  403915:	f2 0f 11 45 f8       	movsd  %xmm0,-0x8(%rbp)
  40391a:	48 8b 05 47 3d 20 00 	mov    0x203d47(%rip),%rax        # 607668 <values>
  403921:	48 89 c7             	mov    %rax,%rdi
  403924:	e8 77 d2 ff ff       	callq  400ba0 <free@plt>
  403929:	48 c7 05 34 3d 20 00 	movq   $0x0,0x203d34(%rip)        # 607668 <values>
  403930:	00 00 00 00 
  403934:	f2 0f 10 45 f8       	movsd  -0x8(%rbp),%xmm0
  403939:	c9                   	leaveq 
  40393a:	c3                   	retq   

000000000040393b <set_fcyc_clear_cache>:
  40393b:	55                   	push   %rbp
  40393c:	48 89 e5             	mov    %rsp,%rbp
  40393f:	89 7d fc             	mov    %edi,-0x4(%rbp)
  403942:	8b 45 fc             	mov    -0x4(%rbp),%eax
  403945:	89 05 11 3d 20 00    	mov    %eax,0x203d11(%rip)        # 60765c <clear_cache>
  40394b:	90                   	nop
  40394c:	5d                   	pop    %rbp
  40394d:	c3                   	retq   

000000000040394e <set_fcyc_cache_size>:
  40394e:	55                   	push   %rbp
  40394f:	48 89 e5             	mov    %rsp,%rbp
  403952:	48 83 ec 10          	sub    $0x10,%rsp
  403956:	89 7d fc             	mov    %edi,-0x4(%rbp)
  403959:	8b 05 59 3c 20 00    	mov    0x203c59(%rip),%eax        # 6075b8 <cache_bytes>
  40395f:	39 45 fc             	cmp    %eax,-0x4(%rbp)
  403962:	74 2f                	je     403993 <set_fcyc_cache_size+0x45>
  403964:	8b 45 fc             	mov    -0x4(%rbp),%eax
  403967:	89 05 4b 3c 20 00    	mov    %eax,0x203c4b(%rip)        # 6075b8 <cache_bytes>
  40396d:	48 8b 05 ec 3c 20 00 	mov    0x203cec(%rip),%rax        # 607660 <cache_buf>
  403974:	48 85 c0             	test   %rax,%rax
  403977:	74 1a                	je     403993 <set_fcyc_cache_size+0x45>
  403979:	48 8b 05 e0 3c 20 00 	mov    0x203ce0(%rip),%rax        # 607660 <cache_buf>
  403980:	48 89 c7             	mov    %rax,%rdi
  403983:	e8 18 d2 ff ff       	callq  400ba0 <free@plt>
  403988:	48 c7 05 cd 3c 20 00 	movq   $0x0,0x203ccd(%rip)        # 607660 <cache_buf>
  40398f:	00 00 00 00 
  403993:	90                   	nop
  403994:	c9                   	leaveq 
  403995:	c3                   	retq   

0000000000403996 <set_fcyc_cache_block>:
  403996:	55                   	push   %rbp
  403997:	48 89 e5             	mov    %rsp,%rbp
  40399a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  40399d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  4039a0:	89 05 16 3c 20 00    	mov    %eax,0x203c16(%rip)        # 6075bc <cache_block>
  4039a6:	90                   	nop
  4039a7:	5d                   	pop    %rbp
  4039a8:	c3                   	retq   

00000000004039a9 <set_fcyc_compensate>:
  4039a9:	55                   	push   %rbp
  4039aa:	48 89 e5             	mov    %rsp,%rbp
  4039ad:	89 7d fc             	mov    %edi,-0x4(%rbp)
  4039b0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  4039b3:	89 05 9f 3c 20 00    	mov    %eax,0x203c9f(%rip)        # 607658 <compensate>
  4039b9:	90                   	nop
  4039ba:	5d                   	pop    %rbp
  4039bb:	c3                   	retq   

00000000004039bc <set_fcyc_k>:
  4039bc:	55                   	push   %rbp
  4039bd:	48 89 e5             	mov    %rsp,%rbp
  4039c0:	89 7d fc             	mov    %edi,-0x4(%rbp)
  4039c3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  4039c6:	89 05 dc 3b 20 00    	mov    %eax,0x203bdc(%rip)        # 6075a8 <kbest>
  4039cc:	90                   	nop
  4039cd:	5d                   	pop    %rbp
  4039ce:	c3                   	retq   

00000000004039cf <set_fcyc_maxsamples>:
  4039cf:	55                   	push   %rbp
  4039d0:	48 89 e5             	mov    %rsp,%rbp
  4039d3:	89 7d fc             	mov    %edi,-0x4(%rbp)
  4039d6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  4039d9:	89 05 cd 3b 20 00    	mov    %eax,0x203bcd(%rip)        # 6075ac <maxsamples>
  4039df:	90                   	nop
  4039e0:	5d                   	pop    %rbp
  4039e1:	c3                   	retq   

00000000004039e2 <set_fcyc_epsilon>:
  4039e2:	55                   	push   %rbp
  4039e3:	48 89 e5             	mov    %rsp,%rbp
  4039e6:	f2 0f 11 45 f8       	movsd  %xmm0,-0x8(%rbp)
  4039eb:	f2 0f 10 45 f8       	movsd  -0x8(%rbp),%xmm0
  4039f0:	f2 0f 11 05 b8 3b 20 	movsd  %xmm0,0x203bb8(%rip)        # 6075b0 <epsilon>
  4039f7:	00 
  4039f8:	90                   	nop
  4039f9:	5d                   	pop    %rbp
  4039fa:	c3                   	retq   

00000000004039fb <start_counter>:
  4039fb:	55                   	push   %rbp
  4039fc:	48 89 e5             	mov    %rsp,%rbp
  4039ff:	bf e0 57 40 00       	mov    $0x4057e0,%edi
  403a04:	e8 e7 d1 ff ff       	callq  400bf0 <puts@plt>
  403a09:	bf 20 58 40 00       	mov    $0x405820,%edi
  403a0e:	e8 dd d1 ff ff       	callq  400bf0 <puts@plt>
  403a13:	bf 58 58 40 00       	mov    $0x405858,%edi
  403a18:	e8 d3 d1 ff ff       	callq  400bf0 <puts@plt>
  403a1d:	bf 01 00 00 00       	mov    $0x1,%edi
  403a22:	e8 29 d3 ff ff       	callq  400d50 <exit@plt>

0000000000403a27 <get_counter>:
  403a27:	55                   	push   %rbp
  403a28:	48 89 e5             	mov    %rsp,%rbp
  403a2b:	bf 90 58 40 00       	mov    $0x405890,%edi
  403a30:	e8 bb d1 ff ff       	callq  400bf0 <puts@plt>
  403a35:	bf 20 58 40 00       	mov    $0x405820,%edi
  403a3a:	e8 b1 d1 ff ff       	callq  400bf0 <puts@plt>
  403a3f:	bf 58 58 40 00       	mov    $0x405858,%edi
  403a44:	e8 a7 d1 ff ff       	callq  400bf0 <puts@plt>
  403a49:	bf 01 00 00 00       	mov    $0x1,%edi
  403a4e:	e8 fd d2 ff ff       	callq  400d50 <exit@plt>

0000000000403a53 <ovhd>:
  403a53:	55                   	push   %rbp
  403a54:	48 89 e5             	mov    %rsp,%rbp
  403a57:	48 83 ec 10          	sub    $0x10,%rsp
  403a5b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
  403a62:	eb 21                	jmp    403a85 <ovhd+0x32>
  403a64:	b8 00 00 00 00       	mov    $0x0,%eax
  403a69:	e8 8d ff ff ff       	callq  4039fb <start_counter>
  403a6e:	b8 00 00 00 00       	mov    $0x0,%eax
  403a73:	e8 af ff ff ff       	callq  403a27 <get_counter>
  403a78:	66 48 0f 7e c0       	movq   %xmm0,%rax
  403a7d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  403a81:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
  403a85:	83 7d f4 01          	cmpl   $0x1,-0xc(%rbp)
  403a89:	7e d9                	jle    403a64 <ovhd+0x11>
  403a8b:	f2 0f 10 45 f8       	movsd  -0x8(%rbp),%xmm0
  403a90:	c9                   	leaveq 
  403a91:	c3                   	retq   

0000000000403a92 <mhz_full>:
  403a92:	55                   	push   %rbp
  403a93:	48 89 e5             	mov    %rsp,%rbp
  403a96:	48 83 ec 20          	sub    $0x20,%rsp
  403a9a:	89 7d ec             	mov    %edi,-0x14(%rbp)
  403a9d:	89 75 e8             	mov    %esi,-0x18(%rbp)
  403aa0:	b8 00 00 00 00       	mov    $0x0,%eax
  403aa5:	e8 51 ff ff ff       	callq  4039fb <start_counter>
  403aaa:	8b 45 e8             	mov    -0x18(%rbp),%eax
  403aad:	89 c7                	mov    %eax,%edi
  403aaf:	e8 dc d2 ff ff       	callq  400d90 <sleep@plt>
  403ab4:	b8 00 00 00 00       	mov    $0x0,%eax
  403ab9:	e8 69 ff ff ff       	callq  403a27 <get_counter>
  403abe:	66 0f 28 d0          	movapd %xmm0,%xmm2
  403ac2:	66 0f ef c0          	pxor   %xmm0,%xmm0
  403ac6:	f2 0f 2a 45 e8       	cvtsi2sdl -0x18(%rbp),%xmm0
  403acb:	f2 0f 10 0d 3d 1e 00 	movsd  0x1e3d(%rip),%xmm1        # 405910 <__PRETTY_FUNCTION__.3917+0x230>
  403ad2:	00 
  403ad3:	f2 0f 59 c1          	mulsd  %xmm1,%xmm0
  403ad7:	f2 0f 5e d0          	divsd  %xmm0,%xmm2
  403adb:	66 0f 28 c2          	movapd %xmm2,%xmm0
  403adf:	f2 0f 11 45 f8       	movsd  %xmm0,-0x8(%rbp)
  403ae4:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  403ae8:	74 1c                	je     403b06 <mhz_full+0x74>
  403aea:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  403aee:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  403af2:	f2 0f 10 45 e0       	movsd  -0x20(%rbp),%xmm0
  403af7:	bf d0 58 40 00       	mov    $0x4058d0,%edi
  403afc:	b8 01 00 00 00       	mov    $0x1,%eax
  403b01:	e8 2a d1 ff ff       	callq  400c30 <printf@plt>
  403b06:	f2 0f 10 45 f8       	movsd  -0x8(%rbp),%xmm0
  403b0b:	c9                   	leaveq 
  403b0c:	c3                   	retq   

0000000000403b0d <mhz>:
  403b0d:	55                   	push   %rbp
  403b0e:	48 89 e5             	mov    %rsp,%rbp
  403b11:	48 83 ec 10          	sub    $0x10,%rsp
  403b15:	89 7d fc             	mov    %edi,-0x4(%rbp)
  403b18:	8b 45 fc             	mov    -0x4(%rbp),%eax
  403b1b:	be 02 00 00 00       	mov    $0x2,%esi
  403b20:	89 c7                	mov    %eax,%edi
  403b22:	e8 6b ff ff ff       	callq  403a92 <mhz_full>
  403b27:	66 48 0f 7e c0       	movq   %xmm0,%rax
  403b2c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  403b30:	f2 0f 10 45 f0       	movsd  -0x10(%rbp),%xmm0
  403b35:	c9                   	leaveq 
  403b36:	c3                   	retq   

0000000000403b37 <callibrate>:
  403b37:	55                   	push   %rbp
  403b38:	48 89 e5             	mov    %rsp,%rbp
  403b3b:	48 83 ec 70          	sub    $0x70,%rsp
  403b3f:	89 7d 9c             	mov    %edi,-0x64(%rbp)
  403b42:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  403b49:	00 00 
  403b4b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  403b4f:	31 c0                	xor    %eax,%eax
  403b51:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%rbp)
  403b58:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  403b5c:	48 89 c7             	mov    %rax,%rdi
  403b5f:	e8 6c d1 ff ff       	callq  400cd0 <times@plt>
  403b64:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  403b68:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
  403b6c:	b8 00 00 00 00       	mov    $0x0,%eax
  403b71:	e8 85 fe ff ff       	callq  4039fb <start_counter>
  403b76:	b8 00 00 00 00       	mov    $0x0,%eax
  403b7b:	e8 a7 fe ff ff       	callq  403a27 <get_counter>
  403b80:	66 48 0f 7e c0       	movq   %xmm0,%rax
  403b85:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
  403b89:	e9 cb 00 00 00       	jmpq   403c59 <callibrate+0x122>
  403b8e:	b8 00 00 00 00       	mov    $0x0,%eax
  403b93:	e8 8f fe ff ff       	callq  403a27 <get_counter>
  403b98:	66 48 0f 7e c0       	movq   %xmm0,%rax
  403b9d:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
  403ba1:	f2 0f 10 45 b8       	movsd  -0x48(%rbp),%xmm0
  403ba6:	f2 0f 5c 45 a8       	subsd  -0x58(%rbp),%xmm0
  403bab:	66 0f 2e 05 65 1d 00 	ucomisd 0x1d65(%rip),%xmm0        # 405918 <__PRETTY_FUNCTION__.3917+0x238>
  403bb2:	00 
  403bb3:	73 05                	jae    403bba <callibrate+0x83>
  403bb5:	e9 9f 00 00 00       	jmpq   403c59 <callibrate+0x122>
  403bba:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  403bbe:	48 89 c7             	mov    %rax,%rdi
  403bc1:	e8 0a d1 ff ff       	callq  400cd0 <times@plt>
  403bc6:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  403bca:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  403bce:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  403bd2:	48 3b 45 b0          	cmp    -0x50(%rbp),%rax
  403bd6:	7e 77                	jle    403c4f <callibrate+0x118>
  403bd8:	f2 0f 10 45 b8       	movsd  -0x48(%rbp),%xmm0
  403bdd:	f2 0f 5c 45 a8       	subsd  -0x58(%rbp),%xmm0
  403be2:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  403be6:	48 2b 45 b0          	sub    -0x50(%rbp),%rax
  403bea:	66 0f ef c9          	pxor   %xmm1,%xmm1
  403bee:	f2 48 0f 2a c8       	cvtsi2sd %rax,%xmm1
  403bf3:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
  403bf7:	f2 0f 11 45 c8       	movsd  %xmm0,-0x38(%rbp)
  403bfc:	f2 0f 10 05 74 3a 20 	movsd  0x203a74(%rip),%xmm0        # 607678 <cyc_per_tick>
  403c03:	00 
  403c04:	66 0f ef c9          	pxor   %xmm1,%xmm1
  403c08:	66 0f 2e c1          	ucomisd %xmm1,%xmm0
  403c0c:	7a 0a                	jp     403c18 <callibrate+0xe1>
  403c0e:	66 0f ef c9          	pxor   %xmm1,%xmm1
  403c12:	66 0f 2e c1          	ucomisd %xmm1,%xmm0
  403c16:	74 0f                	je     403c27 <callibrate+0xf0>
  403c18:	f2 0f 10 05 58 3a 20 	movsd  0x203a58(%rip),%xmm0        # 607678 <cyc_per_tick>
  403c1f:	00 
  403c20:	66 0f 2e 45 c8       	ucomisd -0x38(%rbp),%xmm0
  403c25:	76 1c                	jbe    403c43 <callibrate+0x10c>
  403c27:	f2 0f 10 45 c8       	movsd  -0x38(%rbp),%xmm0
  403c2c:	66 0f 2e 05 ec 1c 00 	ucomisd 0x1cec(%rip),%xmm0        # 405920 <__PRETTY_FUNCTION__.3917+0x240>
  403c33:	00 
  403c34:	76 0d                	jbe    403c43 <callibrate+0x10c>
  403c36:	f2 0f 10 45 c8       	movsd  -0x38(%rbp),%xmm0
  403c3b:	f2 0f 11 05 35 3a 20 	movsd  %xmm0,0x203a35(%rip)        # 607678 <cyc_per_tick>
  403c42:	00 
  403c43:	83 45 a4 01          	addl   $0x1,-0x5c(%rbp)
  403c47:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  403c4b:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
  403c4f:	f2 0f 10 45 b8       	movsd  -0x48(%rbp),%xmm0
  403c54:	f2 0f 11 45 a8       	movsd  %xmm0,-0x58(%rbp)
  403c59:	83 7d a4 63          	cmpl   $0x63,-0x5c(%rbp)
  403c5d:	0f 8e 2b ff ff ff    	jle    403b8e <callibrate+0x57>
  403c63:	83 7d 9c 00          	cmpl   $0x0,-0x64(%rbp)
  403c67:	74 1f                	je     403c88 <callibrate+0x151>
  403c69:	48 8b 05 08 3a 20 00 	mov    0x203a08(%rip),%rax        # 607678 <cyc_per_tick>
  403c70:	48 89 45 90          	mov    %rax,-0x70(%rbp)
  403c74:	f2 0f 10 45 90       	movsd  -0x70(%rbp),%xmm0
  403c79:	bf f2 58 40 00       	mov    $0x4058f2,%edi
  403c7e:	b8 01 00 00 00       	mov    $0x1,%eax
  403c83:	e8 a8 cf ff ff       	callq  400c30 <printf@plt>
  403c88:	90                   	nop
  403c89:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  403c8d:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  403c94:	00 00 
  403c96:	74 05                	je     403c9d <callibrate+0x166>
  403c98:	e8 83 cf ff ff       	callq  400c20 <__stack_chk_fail@plt>
  403c9d:	c9                   	leaveq 
  403c9e:	c3                   	retq   

0000000000403c9f <start_comp_counter>:
  403c9f:	55                   	push   %rbp
  403ca0:	48 89 e5             	mov    %rsp,%rbp
  403ca3:	48 83 ec 30          	sub    $0x30,%rsp
  403ca7:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  403cae:	00 00 
  403cb0:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  403cb4:	31 c0                	xor    %eax,%eax
  403cb6:	f2 0f 10 05 ba 39 20 	movsd  0x2039ba(%rip),%xmm0        # 607678 <cyc_per_tick>
  403cbd:	00 
  403cbe:	66 0f ef c9          	pxor   %xmm1,%xmm1
  403cc2:	66 0f 2e c1          	ucomisd %xmm1,%xmm0
  403cc6:	7a 14                	jp     403cdc <start_comp_counter+0x3d>
  403cc8:	66 0f ef c9          	pxor   %xmm1,%xmm1
  403ccc:	66 0f 2e c1          	ucomisd %xmm1,%xmm0
  403cd0:	75 0a                	jne    403cdc <start_comp_counter+0x3d>
  403cd2:	bf 00 00 00 00       	mov    $0x0,%edi
  403cd7:	e8 5b fe ff ff       	callq  403b37 <callibrate>
  403cdc:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  403ce0:	48 89 c7             	mov    %rax,%rdi
  403ce3:	e8 e8 cf ff ff       	callq  400cd0 <times@plt>
  403ce8:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  403cec:	48 89 05 8d 39 20 00 	mov    %rax,0x20398d(%rip)        # 607680 <start_tick>
  403cf3:	b8 00 00 00 00       	mov    $0x0,%eax
  403cf8:	e8 fe fc ff ff       	callq  4039fb <start_counter>
  403cfd:	90                   	nop
  403cfe:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  403d02:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  403d09:	00 00 
  403d0b:	74 05                	je     403d12 <start_comp_counter+0x73>
  403d0d:	e8 0e cf ff ff       	callq  400c20 <__stack_chk_fail@plt>
  403d12:	c9                   	leaveq 
  403d13:	c3                   	retq   

0000000000403d14 <get_comp_counter>:
  403d14:	55                   	push   %rbp
  403d15:	48 89 e5             	mov    %rsp,%rbp
  403d18:	48 83 ec 50          	sub    $0x50,%rsp
  403d1c:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  403d23:	00 00 
  403d25:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  403d29:	31 c0                	xor    %eax,%eax
  403d2b:	b8 00 00 00 00       	mov    $0x0,%eax
  403d30:	e8 f2 fc ff ff       	callq  403a27 <get_counter>
  403d35:	66 48 0f 7e c0       	movq   %xmm0,%rax
  403d3a:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
  403d3e:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  403d42:	48 89 c7             	mov    %rax,%rdi
  403d45:	e8 86 cf ff ff       	callq  400cd0 <times@plt>
  403d4a:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  403d4e:	48 8b 05 2b 39 20 00 	mov    0x20392b(%rip),%rax        # 607680 <start_tick>
  403d55:	48 29 c2             	sub    %rax,%rdx
  403d58:	48 89 d0             	mov    %rdx,%rax
  403d5b:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  403d5f:	66 0f ef c0          	pxor   %xmm0,%xmm0
  403d63:	f2 48 0f 2a 45 c0    	cvtsi2sdq -0x40(%rbp),%xmm0
  403d69:	f2 0f 10 0d 07 39 20 	movsd  0x203907(%rip),%xmm1        # 607678 <cyc_per_tick>
  403d70:	00 
  403d71:	f2 0f 59 c1          	mulsd  %xmm1,%xmm0
  403d75:	f2 0f 10 4d b8       	movsd  -0x48(%rbp),%xmm1
  403d7a:	f2 0f 5c c8          	subsd  %xmm0,%xmm1
  403d7e:	66 0f 28 c1          	movapd %xmm1,%xmm0
  403d82:	f2 0f 11 45 c8       	movsd  %xmm0,-0x38(%rbp)
  403d87:	f2 0f 10 45 c8       	movsd  -0x38(%rbp),%xmm0
  403d8c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  403d90:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  403d97:	00 00 
  403d99:	74 05                	je     403da0 <get_comp_counter+0x8c>
  403d9b:	e8 80 ce ff ff       	callq  400c20 <__stack_chk_fail@plt>
  403da0:	c9                   	leaveq 
  403da1:	c3                   	retq   

0000000000403da2 <ftimer_itimer>:
  403da2:	55                   	push   %rbp
  403da3:	48 89 e5             	mov    %rsp,%rbp
  403da6:	48 83 ec 40          	sub    $0x40,%rsp
  403daa:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  403dae:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  403db2:	89 55 cc             	mov    %edx,-0x34(%rbp)
  403db5:	e8 4e 01 00 00       	callq  403f08 <init_etime>
  403dba:	e8 10 02 00 00       	callq  403fcf <get_etime>
  403dbf:	66 48 0f 7e c0       	movq   %xmm0,%rax
  403dc4:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  403dc8:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
  403dcf:	eb 11                	jmp    403de2 <ftimer_itimer+0x40>
  403dd1:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  403dd5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  403dd9:	48 89 d7             	mov    %rdx,%rdi
  403ddc:	ff d0                	callq  *%rax
  403dde:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
  403de2:	8b 45 ec             	mov    -0x14(%rbp),%eax
  403de5:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  403de8:	7c e7                	jl     403dd1 <ftimer_itimer+0x2f>
  403dea:	e8 e0 01 00 00       	callq  403fcf <get_etime>
  403def:	f2 0f 5c 45 f0       	subsd  -0x10(%rbp),%xmm0
  403df4:	f2 0f 11 45 f8       	movsd  %xmm0,-0x8(%rbp)
  403df9:	66 0f ef c0          	pxor   %xmm0,%xmm0
  403dfd:	f2 0f 2a 45 cc       	cvtsi2sdl -0x34(%rbp),%xmm0
  403e02:	f2 0f 10 4d f8       	movsd  -0x8(%rbp),%xmm1
  403e07:	f2 0f 5e c8          	divsd  %xmm0,%xmm1
  403e0b:	66 0f 28 c1          	movapd %xmm1,%xmm0
  403e0f:	c9                   	leaveq 
  403e10:	c3                   	retq   

0000000000403e11 <ftimer_gettod>:
  403e11:	55                   	push   %rbp
  403e12:	48 89 e5             	mov    %rsp,%rbp
  403e15:	48 83 ec 60          	sub    $0x60,%rsp
  403e19:	48 89 7d b8          	mov    %rdi,-0x48(%rbp)
  403e1d:	48 89 75 b0          	mov    %rsi,-0x50(%rbp)
  403e21:	89 55 ac             	mov    %edx,-0x54(%rbp)
  403e24:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  403e2b:	00 00 
  403e2d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  403e31:	31 c0                	xor    %eax,%eax
  403e33:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  403e37:	be 00 00 00 00       	mov    $0x0,%esi
  403e3c:	48 89 c7             	mov    %rax,%rdi
  403e3f:	e8 fc cd ff ff       	callq  400c40 <gettimeofday@plt>
  403e44:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%rbp)
  403e4b:	eb 11                	jmp    403e5e <ftimer_gettod+0x4d>
  403e4d:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  403e51:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  403e55:	48 89 d7             	mov    %rdx,%rdi
  403e58:	ff d0                	callq  *%rax
  403e5a:	83 45 c4 01          	addl   $0x1,-0x3c(%rbp)
  403e5e:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  403e61:	3b 45 ac             	cmp    -0x54(%rbp),%eax
  403e64:	7c e7                	jl     403e4d <ftimer_gettod+0x3c>
  403e66:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  403e6a:	be 00 00 00 00       	mov    $0x0,%esi
  403e6f:	48 89 c7             	mov    %rax,%rdi
  403e72:	e8 c9 cd ff ff       	callq  400c40 <gettimeofday@plt>
  403e77:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  403e7b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  403e7f:	48 29 c2             	sub    %rax,%rdx
  403e82:	48 89 d0             	mov    %rdx,%rax
  403e85:	66 0f ef c0          	pxor   %xmm0,%xmm0
  403e89:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
  403e8e:	f2 0f 10 0d 92 1a 00 	movsd  0x1a92(%rip),%xmm1        # 405928 <__PRETTY_FUNCTION__.3917+0x248>
  403e95:	00 
  403e96:	f2 0f 59 c8          	mulsd  %xmm0,%xmm1
  403e9a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  403e9e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  403ea2:	48 29 c2             	sub    %rax,%rdx
  403ea5:	48 89 d0             	mov    %rdx,%rax
  403ea8:	66 0f ef c0          	pxor   %xmm0,%xmm0
  403eac:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
  403eb1:	f2 0f 10 15 77 1a 00 	movsd  0x1a77(%rip),%xmm2        # 405930 <__PRETTY_FUNCTION__.3917+0x250>
  403eb8:	00 
  403eb9:	f2 0f 59 c2          	mulsd  %xmm2,%xmm0
  403ebd:	f2 0f 58 c1          	addsd  %xmm1,%xmm0
  403ec1:	f2 0f 11 45 c8       	movsd  %xmm0,-0x38(%rbp)
  403ec6:	66 0f ef c0          	pxor   %xmm0,%xmm0
  403eca:	f2 0f 2a 45 ac       	cvtsi2sdl -0x54(%rbp),%xmm0
  403ecf:	f2 0f 10 4d c8       	movsd  -0x38(%rbp),%xmm1
  403ed4:	f2 0f 5e c8          	divsd  %xmm0,%xmm1
  403ed8:	66 0f 28 c1          	movapd %xmm1,%xmm0
  403edc:	f2 0f 11 45 c8       	movsd  %xmm0,-0x38(%rbp)
  403ee1:	f2 0f 10 4d c8       	movsd  -0x38(%rbp),%xmm1
  403ee6:	f2 0f 10 05 42 1a 00 	movsd  0x1a42(%rip),%xmm0        # 405930 <__PRETTY_FUNCTION__.3917+0x250>
  403eed:	00 
  403eee:	f2 0f 59 c1          	mulsd  %xmm1,%xmm0
  403ef2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  403ef6:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  403efd:	00 00 
  403eff:	74 05                	je     403f06 <ftimer_gettod+0xf5>
  403f01:	e8 1a cd ff ff       	callq  400c20 <__stack_chk_fail@plt>
  403f06:	c9                   	leaveq 
  403f07:	c3                   	retq   

0000000000403f08 <init_etime>:
  403f08:	55                   	push   %rbp
  403f09:	48 89 e5             	mov    %rsp,%rbp
  403f0c:	48 c7 05 89 37 20 00 	movq   $0x0,0x203789(%rip)        # 6076a0 <first_u>
  403f13:	00 00 00 00 
  403f17:	48 c7 05 86 37 20 00 	movq   $0x0,0x203786(%rip)        # 6076a8 <first_u+0x8>
  403f1e:	00 00 00 00 
  403f22:	48 c7 05 83 37 20 00 	movq   $0x15180,0x203783(%rip)        # 6076b0 <first_u+0x10>
  403f29:	80 51 01 00 
  403f2d:	48 c7 05 80 37 20 00 	movq   $0x0,0x203780(%rip)        # 6076b8 <first_u+0x18>
  403f34:	00 00 00 00 
  403f38:	ba 00 00 00 00       	mov    $0x0,%edx
  403f3d:	be a0 76 60 00       	mov    $0x6076a0,%esi
  403f42:	bf 01 00 00 00       	mov    $0x1,%edi
  403f47:	e8 74 cd ff ff       	callq  400cc0 <setitimer@plt>
  403f4c:	48 c7 05 69 37 20 00 	movq   $0x0,0x203769(%rip)        # 6076c0 <first_r>
  403f53:	00 00 00 00 
  403f57:	48 c7 05 66 37 20 00 	movq   $0x0,0x203766(%rip)        # 6076c8 <first_r+0x8>
  403f5e:	00 00 00 00 
  403f62:	48 c7 05 63 37 20 00 	movq   $0x15180,0x203763(%rip)        # 6076d0 <first_r+0x10>
  403f69:	80 51 01 00 
  403f6d:	48 c7 05 60 37 20 00 	movq   $0x0,0x203760(%rip)        # 6076d8 <first_r+0x18>
  403f74:	00 00 00 00 
  403f78:	ba 00 00 00 00       	mov    $0x0,%edx
  403f7d:	be c0 76 60 00       	mov    $0x6076c0,%esi
  403f82:	bf 00 00 00 00       	mov    $0x0,%edi
  403f87:	e8 34 cd ff ff       	callq  400cc0 <setitimer@plt>
  403f8c:	48 c7 05 49 37 20 00 	movq   $0x0,0x203749(%rip)        # 6076e0 <first_p>
  403f93:	00 00 00 00 
  403f97:	48 c7 05 46 37 20 00 	movq   $0x0,0x203746(%rip)        # 6076e8 <first_p+0x8>
  403f9e:	00 00 00 00 
  403fa2:	48 c7 05 43 37 20 00 	movq   $0x15180,0x203743(%rip)        # 6076f0 <first_p+0x10>
  403fa9:	80 51 01 00 
  403fad:	48 c7 05 40 37 20 00 	movq   $0x0,0x203740(%rip)        # 6076f8 <first_p+0x18>
  403fb4:	00 00 00 00 
  403fb8:	ba 00 00 00 00       	mov    $0x0,%edx
  403fbd:	be e0 76 60 00       	mov    $0x6076e0,%esi
  403fc2:	bf 02 00 00 00       	mov    $0x2,%edi
  403fc7:	e8 f4 cc ff ff       	callq  400cc0 <setitimer@plt>
  403fcc:	90                   	nop
  403fcd:	5d                   	pop    %rbp
  403fce:	c3                   	retq   

0000000000403fcf <get_etime>:
  403fcf:	55                   	push   %rbp
  403fd0:	48 89 e5             	mov    %rsp,%rbp
  403fd3:	48 83 ec 70          	sub    $0x70,%rsp
  403fd7:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  403fde:	00 00 
  403fe0:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  403fe4:	31 c0                	xor    %eax,%eax
  403fe6:	48 8d 45 90          	lea    -0x70(%rbp),%rax
  403fea:	48 89 c6             	mov    %rax,%rsi
  403fed:	bf 01 00 00 00       	mov    $0x1,%edi
  403ff2:	e8 f9 cc ff ff       	callq  400cf0 <getitimer@plt>
  403ff7:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
  403ffb:	48 89 c6             	mov    %rax,%rsi
  403ffe:	bf 00 00 00 00       	mov    $0x0,%edi
  404003:	e8 e8 cc ff ff       	callq  400cf0 <getitimer@plt>
  404008:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  40400c:	48 89 c6             	mov    %rax,%rsi
  40400f:	bf 02 00 00 00       	mov    $0x2,%edi
  404014:	e8 d7 cc ff ff       	callq  400cf0 <getitimer@plt>
  404019:	48 8b 15 d0 36 20 00 	mov    0x2036d0(%rip),%rdx        # 6076f0 <first_p+0x10>
  404020:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  404024:	48 29 c2             	sub    %rax,%rdx
  404027:	48 89 d0             	mov    %rdx,%rax
  40402a:	66 0f ef c9          	pxor   %xmm1,%xmm1
  40402e:	f2 48 0f 2a c8       	cvtsi2sd %rax,%xmm1
  404033:	48 8b 15 be 36 20 00 	mov    0x2036be(%rip),%rdx        # 6076f8 <first_p+0x18>
  40403a:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  40403e:	48 29 c2             	sub    %rax,%rdx
  404041:	48 89 d0             	mov    %rdx,%rax
  404044:	66 0f ef c0          	pxor   %xmm0,%xmm0
  404048:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
  40404d:	f2 0f 10 15 e3 18 00 	movsd  0x18e3(%rip),%xmm2        # 405938 <__PRETTY_FUNCTION__.3917+0x258>
  404054:	00 
  404055:	f2 0f 59 c2          	mulsd  %xmm2,%xmm0
  404059:	f2 0f 58 c1          	addsd  %xmm1,%xmm0
  40405d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  404061:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  404068:	00 00 
  40406a:	74 05                	je     404071 <get_etime+0xa2>
  40406c:	e8 af cb ff ff       	callq  400c20 <__stack_chk_fail@plt>
  404071:	c9                   	leaveq 
  404072:	c3                   	retq   

0000000000404073 <mm_init>:
  404073:	55                   	push   %rbp
  404074:	48 89 e5             	mov    %rsp,%rbp
  404077:	48 83 ec 10          	sub    $0x10,%rsp
  40407b:	c7 45 fc 18 00 00 00 	movl   $0x18,-0x4(%rbp)
  404082:	8b 45 fc             	mov    -0x4(%rbp),%eax
  404085:	89 c7                	mov    %eax,%edi
  404087:	e8 66 f3 ff ff       	callq  4033f2 <mem_sbrk>
  40408c:	48 89 05 6d 36 20 00 	mov    %rax,0x20366d(%rip)        # 607700 <heap_listp>
  404093:	48 8b 05 66 36 20 00 	mov    0x203666(%rip),%rax        # 607700 <heap_listp>
  40409a:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
  40409e:	75 0a                	jne    4040aa <mm_init+0x37>
  4040a0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4040a5:	e9 95 00 00 00       	jmpq   40413f <mm_init+0xcc>
  4040aa:	48 8b 05 4f 36 20 00 	mov    0x20364f(%rip),%rax        # 607700 <heap_listp>
  4040b1:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  4040b8:	48 8b 05 41 36 20 00 	mov    0x203641(%rip),%rax        # 607700 <heap_listp>
  4040bf:	8b 55 fc             	mov    -0x4(%rbp),%edx
  4040c2:	48 63 d2             	movslq %edx,%rdx
  4040c5:	48 83 ea 08          	sub    $0x8,%rdx
  4040c9:	48 01 d0             	add    %rdx,%rax
  4040cc:	48 c7 00 01 00 00 00 	movq   $0x1,(%rax)
  4040d3:	48 8b 05 26 36 20 00 	mov    0x203626(%rip),%rax        # 607700 <heap_listp>
  4040da:	8b 55 fc             	mov    -0x4(%rbp),%edx
  4040dd:	48 63 d2             	movslq %edx,%rdx
  4040e0:	48 83 ea 10          	sub    $0x10,%rdx
  4040e4:	48 01 d0             	add    %rdx,%rax
  4040e7:	48 c7 00 11 00 00 00 	movq   $0x11,(%rax)
  4040ee:	48 8b 05 0b 36 20 00 	mov    0x20360b(%rip),%rax        # 607700 <heap_listp>
  4040f5:	8b 55 fc             	mov    -0x4(%rbp),%edx
  4040f8:	48 63 d2             	movslq %edx,%rdx
  4040fb:	48 83 ea 18          	sub    $0x18,%rdx
  4040ff:	48 01 d0             	add    %rdx,%rax
  404102:	48 c7 00 11 00 00 00 	movq   $0x11,(%rax)
  404109:	48 8b 05 f0 35 20 00 	mov    0x2035f0(%rip),%rax        # 607700 <heap_listp>
  404110:	8b 55 fc             	mov    -0x4(%rbp),%edx
  404113:	48 63 d2             	movslq %edx,%rdx
  404116:	48 83 ea 10          	sub    $0x10,%rdx
  40411a:	48 01 d0             	add    %rdx,%rax
  40411d:	48 89 05 dc 35 20 00 	mov    %rax,0x2035dc(%rip)        # 607700 <heap_listp>
  404124:	bf 00 10 00 00       	mov    $0x1000,%edi
  404129:	e8 50 02 00 00       	callq  40437e <extend_heap>
  40412e:	48 85 c0             	test   %rax,%rax
  404131:	75 07                	jne    40413a <mm_init+0xc7>
  404133:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  404138:	eb 05                	jmp    40413f <mm_init+0xcc>
  40413a:	b8 00 00 00 00       	mov    $0x0,%eax
  40413f:	c9                   	leaveq 
  404140:	c3                   	retq   

0000000000404141 <mm_malloc>:
  404141:	55                   	push   %rbp
  404142:	48 89 e5             	mov    %rsp,%rbp
  404145:	48 83 ec 30          	sub    $0x30,%rsp
  404149:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  40414d:	48 8b 05 ac 35 20 00 	mov    0x2035ac(%rip),%rax        # 607700 <heap_listp>
  404154:	48 85 c0             	test   %rax,%rax
  404157:	75 05                	jne    40415e <mm_malloc+0x1d>
  404159:	e8 15 ff ff ff       	callq  404073 <mm_init>
  40415e:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  404163:	75 0a                	jne    40416f <mm_malloc+0x2e>
  404165:	b8 00 00 00 00       	mov    $0x0,%eax
  40416a:	e9 8b 00 00 00       	jmpq   4041fa <mm_malloc+0xb9>
  40416f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  404173:	48 83 c0 17          	add    $0x17,%rax
  404177:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  40417b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  40417f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  404183:	48 89 c7             	mov    %rax,%rdi
  404186:	e8 25 06 00 00       	callq  4047b0 <find_fit>
  40418b:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  40418f:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
  404194:	74 19                	je     4041af <mm_malloc+0x6e>
  404196:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  40419a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  40419e:	48 89 d6             	mov    %rdx,%rsi
  4041a1:	48 89 c7             	mov    %rax,%rdi
  4041a4:	e8 16 05 00 00       	callq  4046bf <place>
  4041a9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  4041ad:	eb 4b                	jmp    4041fa <mm_malloc+0xb9>
  4041af:	b8 00 10 00 00       	mov    $0x1000,%eax
  4041b4:	48 81 7d e8 00 10 00 	cmpq   $0x1000,-0x18(%rbp)
  4041bb:	00 
  4041bc:	48 0f 43 45 e8       	cmovae -0x18(%rbp),%rax
  4041c1:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  4041c5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4041c9:	48 89 c7             	mov    %rax,%rdi
  4041cc:	e8 ad 01 00 00       	callq  40437e <extend_heap>
  4041d1:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  4041d5:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
  4041da:	75 07                	jne    4041e3 <mm_malloc+0xa2>
  4041dc:	b8 00 00 00 00       	mov    $0x0,%eax
  4041e1:	eb 17                	jmp    4041fa <mm_malloc+0xb9>
  4041e3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  4041e7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  4041eb:	48 89 d6             	mov    %rdx,%rsi
  4041ee:	48 89 c7             	mov    %rax,%rdi
  4041f1:	e8 c9 04 00 00       	callq  4046bf <place>
  4041f6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  4041fa:	c9                   	leaveq 
  4041fb:	c3                   	retq   

00000000004041fc <mm_free>:
  4041fc:	55                   	push   %rbp
  4041fd:	48 89 e5             	mov    %rsp,%rbp
  404200:	48 83 ec 20          	sub    $0x20,%rsp
  404204:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  404208:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  40420d:	0f 84 8a 00 00 00    	je     40429d <mm_free+0xa1>
  404213:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  404217:	48 89 c7             	mov    %rax,%rdi
  40421a:	e8 02 06 00 00       	callq  404821 <is_allocated>
  40421f:	85 c0                	test   %eax,%eax
  404221:	75 18                	jne    40423b <mm_free+0x3f>
  404223:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  404227:	48 89 c6             	mov    %rax,%rsi
  40422a:	bf 68 59 40 00       	mov    $0x405968,%edi
  40422f:	b8 00 00 00 00       	mov    $0x0,%eax
  404234:	e8 f7 c9 ff ff       	callq  400c30 <printf@plt>
  404239:	eb 63                	jmp    40429e <mm_free+0xa2>
  40423b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  40423f:	48 83 e8 08          	sub    $0x8,%rax
  404243:	48 8b 00             	mov    (%rax),%rax
  404246:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  40424a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  40424e:	48 8b 05 ab 34 20 00 	mov    0x2034ab(%rip),%rax        # 607700 <heap_listp>
  404255:	48 85 c0             	test   %rax,%rax
  404258:	75 05                	jne    40425f <mm_free+0x63>
  40425a:	e8 14 fe ff ff       	callq  404073 <mm_init>
  40425f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  404263:	48 8d 50 f8          	lea    -0x8(%rax),%rdx
  404267:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  40426b:	48 89 02             	mov    %rax,(%rdx)
  40426e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  404272:	48 83 e8 08          	sub    $0x8,%rax
  404276:	48 8b 00             	mov    (%rax),%rax
  404279:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  40427d:	48 8d 50 f0          	lea    -0x10(%rax),%rdx
  404281:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  404285:	48 01 c2             	add    %rax,%rdx
  404288:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  40428c:	48 89 02             	mov    %rax,(%rdx)
  40428f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  404293:	48 89 c7             	mov    %rax,%rdi
  404296:	e8 7e 01 00 00       	callq  404419 <coalesce>
  40429b:	eb 01                	jmp    40429e <mm_free+0xa2>
  40429d:	90                   	nop
  40429e:	c9                   	leaveq 
  40429f:	c3                   	retq   

00000000004042a0 <mm_realloc>:
  4042a0:	55                   	push   %rbp
  4042a1:	48 89 e5             	mov    %rsp,%rbp
  4042a4:	48 83 ec 20          	sub    $0x20,%rsp
  4042a8:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  4042ac:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  4042b0:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  4042b5:	75 16                	jne    4042cd <mm_realloc+0x2d>
  4042b7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  4042bb:	48 89 c7             	mov    %rax,%rdi
  4042be:	e8 39 ff ff ff       	callq  4041fc <mm_free>
  4042c3:	b8 00 00 00 00       	mov    $0x0,%eax
  4042c8:	e9 af 00 00 00       	jmpq   40437c <mm_realloc+0xdc>
  4042cd:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  4042d2:	75 11                	jne    4042e5 <mm_realloc+0x45>
  4042d4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  4042d8:	48 89 c7             	mov    %rax,%rdi
  4042db:	e8 61 fe ff ff       	callq  404141 <mm_malloc>
  4042e0:	e9 97 00 00 00       	jmpq   40437c <mm_realloc+0xdc>
  4042e5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  4042e9:	48 89 c7             	mov    %rax,%rdi
  4042ec:	e8 30 05 00 00       	callq  404821 <is_allocated>
  4042f1:	85 c0                	test   %eax,%eax
  4042f3:	75 1d                	jne    404312 <mm_realloc+0x72>
  4042f5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  4042f9:	48 89 c6             	mov    %rax,%rsi
  4042fc:	bf 98 59 40 00       	mov    $0x405998,%edi
  404301:	b8 00 00 00 00       	mov    $0x0,%eax
  404306:	e8 25 c9 ff ff       	callq  400c30 <printf@plt>
  40430b:	b8 00 00 00 00       	mov    $0x0,%eax
  404310:	eb 6a                	jmp    40437c <mm_realloc+0xdc>
  404312:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  404316:	48 89 c7             	mov    %rax,%rdi
  404319:	e8 23 fe ff ff       	callq  404141 <mm_malloc>
  40431e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  404322:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  404327:	75 07                	jne    404330 <mm_realloc+0x90>
  404329:	b8 00 00 00 00       	mov    $0x0,%eax
  40432e:	eb 4c                	jmp    40437c <mm_realloc+0xdc>
  404330:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  404334:	48 83 e8 08          	sub    $0x8,%rax
  404338:	48 8b 00             	mov    (%rax),%rax
  40433b:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  40433f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  404343:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  404347:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  40434b:	73 08                	jae    404355 <mm_realloc+0xb5>
  40434d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  404351:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  404355:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  404359:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  40435d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  404361:	48 89 ce             	mov    %rcx,%rsi
  404364:	48 89 c7             	mov    %rax,%rdi
  404367:	e8 24 c9 ff ff       	callq  400c90 <memcpy@plt>
  40436c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  404370:	48 89 c7             	mov    %rax,%rdi
  404373:	e8 84 fe ff ff       	callq  4041fc <mm_free>
  404378:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  40437c:	c9                   	leaveq 
  40437d:	c3                   	retq   

000000000040437e <extend_heap>:
  40437e:	55                   	push   %rbp
  40437f:	48 89 e5             	mov    %rsp,%rbp
  404382:	48 83 ec 20          	sub    $0x20,%rsp
  404386:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  40438a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  40438e:	48 83 c0 07          	add    $0x7,%rax
  404392:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  404396:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  40439a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  40439e:	89 c7                	mov    %eax,%edi
  4043a0:	e8 4d f0 ff ff       	callq  4033f2 <mem_sbrk>
  4043a5:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  4043a9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4043ad:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
  4043b1:	75 07                	jne    4043ba <extend_heap+0x3c>
  4043b3:	b8 00 00 00 00       	mov    $0x0,%eax
  4043b8:	eb 5d                	jmp    404417 <extend_heap+0x99>
  4043ba:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4043be:	48 8d 50 f8          	lea    -0x8(%rax),%rdx
  4043c2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  4043c6:	48 89 02             	mov    %rax,(%rdx)
  4043c9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4043cd:	48 83 e8 08          	sub    $0x8,%rax
  4043d1:	48 8b 00             	mov    (%rax),%rax
  4043d4:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  4043d8:	48 8d 50 f0          	lea    -0x10(%rax),%rdx
  4043dc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4043e0:	48 01 c2             	add    %rax,%rdx
  4043e3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  4043e7:	48 89 02             	mov    %rax,(%rdx)
  4043ea:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4043ee:	48 83 e8 08          	sub    $0x8,%rax
  4043f2:	48 8b 00             	mov    (%rax),%rax
  4043f5:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  4043f9:	48 8d 50 f8          	lea    -0x8(%rax),%rdx
  4043fd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  404401:	48 01 d0             	add    %rdx,%rax
  404404:	48 c7 00 01 00 00 00 	movq   $0x1,(%rax)
  40440b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  40440f:	48 89 c7             	mov    %rax,%rdi
  404412:	e8 02 00 00 00       	callq  404419 <coalesce>
  404417:	c9                   	leaveq 
  404418:	c3                   	retq   

0000000000404419 <coalesce>:
  404419:	55                   	push   %rbp
  40441a:	48 89 e5             	mov    %rsp,%rbp
  40441d:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  404421:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  404425:	48 83 e8 10          	sub    $0x10,%rax
  404429:	48 8b 00             	mov    (%rax),%rax
  40442c:	48 f7 d0             	not    %rax
  40442f:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  404433:	48 89 c2             	mov    %rax,%rdx
  404436:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  40443a:	48 01 d0             	add    %rdx,%rax
  40443d:	48 8b 00             	mov    (%rax),%rax
  404440:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  404444:	48 89 c2             	mov    %rax,%rdx
  404447:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  40444b:	48 83 e8 10          	sub    $0x10,%rax
  40444f:	48 8b 00             	mov    (%rax),%rax
  404452:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  404456:	48 29 c2             	sub    %rax,%rdx
  404459:	48 89 d0             	mov    %rdx,%rax
  40445c:	48 8d 50 f0          	lea    -0x10(%rax),%rdx
  404460:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  404464:	48 01 d0             	add    %rdx,%rax
  404467:	48 8b 00             	mov    (%rax),%rax
  40446a:	83 e0 01             	and    $0x1,%eax
  40446d:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  404471:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  404475:	48 83 e8 08          	sub    $0x8,%rax
  404479:	48 8b 00             	mov    (%rax),%rax
  40447c:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  404480:	48 8d 50 f8          	lea    -0x8(%rax),%rdx
  404484:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  404488:	48 01 d0             	add    %rdx,%rax
  40448b:	48 8b 00             	mov    (%rax),%rax
  40448e:	83 e0 01             	and    $0x1,%eax
  404491:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  404495:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  404499:	48 83 e8 08          	sub    $0x8,%rax
  40449d:	48 8b 00             	mov    (%rax),%rax
  4044a0:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  4044a4:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  4044a8:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  4044ad:	74 10                	je     4044bf <coalesce+0xa6>
  4044af:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
  4044b4:	74 09                	je     4044bf <coalesce+0xa6>
  4044b6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  4044ba:	e9 fe 01 00 00       	jmpq   4046bd <coalesce+0x2a4>
  4044bf:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  4044c4:	74 61                	je     404527 <coalesce+0x10e>
  4044c6:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
  4044cb:	75 5a                	jne    404527 <coalesce+0x10e>
  4044cd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  4044d1:	48 83 e8 08          	sub    $0x8,%rax
  4044d5:	48 8b 00             	mov    (%rax),%rax
  4044d8:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  4044dc:	48 8d 50 f8          	lea    -0x8(%rax),%rdx
  4044e0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  4044e4:	48 01 d0             	add    %rdx,%rax
  4044e7:	48 8b 00             	mov    (%rax),%rax
  4044ea:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  4044ee:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  4044f2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  4044f6:	48 8d 50 f8          	lea    -0x8(%rax),%rdx
  4044fa:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4044fe:	48 89 02             	mov    %rax,(%rdx)
  404501:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  404505:	48 83 e8 08          	sub    $0x8,%rax
  404509:	48 8b 00             	mov    (%rax),%rax
  40450c:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  404510:	48 8d 50 f0          	lea    -0x10(%rax),%rdx
  404514:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  404518:	48 01 c2             	add    %rax,%rdx
  40451b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  40451f:	48 89 02             	mov    %rax,(%rdx)
  404522:	e9 92 01 00 00       	jmpq   4046b9 <coalesce+0x2a0>
  404527:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  40452c:	0f 85 91 00 00 00    	jne    4045c3 <coalesce+0x1aa>
  404532:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
  404537:	0f 84 86 00 00 00    	je     4045c3 <coalesce+0x1aa>
  40453d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  404541:	48 83 e8 10          	sub    $0x10,%rax
  404545:	48 8b 00             	mov    (%rax),%rax
  404548:	48 f7 d0             	not    %rax
  40454b:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  40454f:	48 89 c2             	mov    %rax,%rdx
  404552:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  404556:	48 01 d0             	add    %rdx,%rax
  404559:	48 8b 00             	mov    (%rax),%rax
  40455c:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  404560:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  404564:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  404568:	48 83 e8 08          	sub    $0x8,%rax
  40456c:	48 8b 00             	mov    (%rax),%rax
  40456f:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  404573:	48 8d 50 f0          	lea    -0x10(%rax),%rdx
  404577:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  40457b:	48 01 c2             	add    %rax,%rdx
  40457e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  404582:	48 89 02             	mov    %rax,(%rdx)
  404585:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  404589:	48 83 e8 10          	sub    $0x10,%rax
  40458d:	48 8b 00             	mov    (%rax),%rax
  404590:	48 f7 d0             	not    %rax
  404593:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  404597:	48 89 c2             	mov    %rax,%rdx
  40459a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  40459e:	48 01 c2             	add    %rax,%rdx
  4045a1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4045a5:	48 89 02             	mov    %rax,(%rdx)
  4045a8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  4045ac:	48 83 e8 10          	sub    $0x10,%rax
  4045b0:	48 8b 00             	mov    (%rax),%rax
  4045b3:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  4045b7:	48 f7 d8             	neg    %rax
  4045ba:	48 01 45 d8          	add    %rax,-0x28(%rbp)
  4045be:	e9 f6 00 00 00       	jmpq   4046b9 <coalesce+0x2a0>
  4045c3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  4045c7:	48 83 e8 10          	sub    $0x10,%rax
  4045cb:	48 8b 00             	mov    (%rax),%rax
  4045ce:	48 f7 d0             	not    %rax
  4045d1:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  4045d5:	48 89 c2             	mov    %rax,%rdx
  4045d8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  4045dc:	48 01 d0             	add    %rdx,%rax
  4045df:	48 8b 00             	mov    (%rax),%rax
  4045e2:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  4045e6:	48 89 c2             	mov    %rax,%rdx
  4045e9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  4045ed:	48 83 e8 08          	sub    $0x8,%rax
  4045f1:	48 8b 00             	mov    (%rax),%rax
  4045f4:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  4045f8:	48 89 c1             	mov    %rax,%rcx
  4045fb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  4045ff:	48 83 e8 08          	sub    $0x8,%rax
  404603:	48 8b 00             	mov    (%rax),%rax
  404606:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  40460a:	48 8d 70 f8          	lea    -0x8(%rax),%rsi
  40460e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  404612:	48 01 f0             	add    %rsi,%rax
  404615:	48 8b 00             	mov    (%rax),%rax
  404618:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  40461c:	48 01 c8             	add    %rcx,%rax
  40461f:	48 8d 48 f0          	lea    -0x10(%rax),%rcx
  404623:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  404627:	48 01 c8             	add    %rcx,%rax
  40462a:	48 8b 00             	mov    (%rax),%rax
  40462d:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  404631:	48 01 d0             	add    %rdx,%rax
  404634:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  404638:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  40463c:	48 83 e8 10          	sub    $0x10,%rax
  404640:	48 8b 00             	mov    (%rax),%rax
  404643:	48 f7 d0             	not    %rax
  404646:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  40464a:	48 89 c2             	mov    %rax,%rdx
  40464d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  404651:	48 01 c2             	add    %rax,%rdx
  404654:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  404658:	48 89 02             	mov    %rax,(%rdx)
  40465b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  40465f:	48 83 e8 08          	sub    $0x8,%rax
  404663:	48 8b 00             	mov    (%rax),%rax
  404666:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  40466a:	48 89 c2             	mov    %rax,%rdx
  40466d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  404671:	48 83 e8 08          	sub    $0x8,%rax
  404675:	48 8b 00             	mov    (%rax),%rax
  404678:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  40467c:	48 8d 48 f8          	lea    -0x8(%rax),%rcx
  404680:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  404684:	48 01 c8             	add    %rcx,%rax
  404687:	48 8b 00             	mov    (%rax),%rax
  40468a:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  40468e:	48 01 d0             	add    %rdx,%rax
  404691:	48 8d 50 f0          	lea    -0x10(%rax),%rdx
  404695:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  404699:	48 01 c2             	add    %rax,%rdx
  40469c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4046a0:	48 89 02             	mov    %rax,(%rdx)
  4046a3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  4046a7:	48 83 e8 10          	sub    $0x10,%rax
  4046ab:	48 8b 00             	mov    (%rax),%rax
  4046ae:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  4046b2:	48 f7 d8             	neg    %rax
  4046b5:	48 01 45 d8          	add    %rax,-0x28(%rbp)
  4046b9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  4046bd:	5d                   	pop    %rbp
  4046be:	c3                   	retq   

00000000004046bf <place>:
  4046bf:	55                   	push   %rbp
  4046c0:	48 89 e5             	mov    %rsp,%rbp
  4046c3:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  4046c7:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  4046cb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  4046cf:	48 83 e8 08          	sub    $0x8,%rax
  4046d3:	48 8b 00             	mov    (%rax),%rax
  4046d6:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  4046da:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  4046de:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4046e2:	48 2b 45 e0          	sub    -0x20(%rbp),%rax
  4046e6:	48 83 f8 17          	cmp    $0x17,%rax
  4046ea:	0f 86 85 00 00 00    	jbe    404775 <place+0xb6>
  4046f0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  4046f4:	48 83 e8 08          	sub    $0x8,%rax
  4046f8:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  4046fc:	48 83 ca 01          	or     $0x1,%rdx
  404700:	48 89 10             	mov    %rdx,(%rax)
  404703:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  404707:	48 83 e8 08          	sub    $0x8,%rax
  40470b:	48 8b 00             	mov    (%rax),%rax
  40470e:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  404712:	48 8d 50 f0          	lea    -0x10(%rax),%rdx
  404716:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  40471a:	48 01 d0             	add    %rdx,%rax
  40471d:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  404721:	48 83 ca 01          	or     $0x1,%rdx
  404725:	48 89 10             	mov    %rdx,(%rax)
  404728:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  40472c:	48 83 e8 08          	sub    $0x8,%rax
  404730:	48 8b 00             	mov    (%rax),%rax
  404733:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  404737:	48 01 45 e8          	add    %rax,-0x18(%rbp)
  40473b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  40473f:	48 8d 50 f8          	lea    -0x8(%rax),%rdx
  404743:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  404747:	48 2b 45 e0          	sub    -0x20(%rbp),%rax
  40474b:	48 89 02             	mov    %rax,(%rdx)
  40474e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  404752:	48 83 e8 08          	sub    $0x8,%rax
  404756:	48 8b 00             	mov    (%rax),%rax
  404759:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  40475d:	48 8d 50 f0          	lea    -0x10(%rax),%rdx
  404761:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  404765:	48 01 c2             	add    %rax,%rdx
  404768:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  40476c:	48 2b 45 e0          	sub    -0x20(%rbp),%rax
  404770:	48 89 02             	mov    %rax,(%rdx)
  404773:	eb 38                	jmp    4047ad <place+0xee>
  404775:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  404779:	48 83 e8 08          	sub    $0x8,%rax
  40477d:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  404781:	48 83 ca 01          	or     $0x1,%rdx
  404785:	48 89 10             	mov    %rdx,(%rax)
  404788:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  40478c:	48 83 e8 08          	sub    $0x8,%rax
  404790:	48 8b 00             	mov    (%rax),%rax
  404793:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  404797:	48 8d 50 f0          	lea    -0x10(%rax),%rdx
  40479b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  40479f:	48 01 d0             	add    %rdx,%rax
  4047a2:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  4047a6:	48 83 ca 01          	or     $0x1,%rdx
  4047aa:	48 89 10             	mov    %rdx,(%rax)
  4047ad:	90                   	nop
  4047ae:	5d                   	pop    %rbp
  4047af:	c3                   	retq   

00000000004047b0 <find_fit>:
  4047b0:	55                   	push   %rbp
  4047b1:	48 89 e5             	mov    %rsp,%rbp
  4047b4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  4047b8:	48 8b 05 41 2f 20 00 	mov    0x202f41(%rip),%rax        # 607700 <heap_listp>
  4047bf:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  4047c3:	eb 41                	jmp    404806 <find_fit+0x56>
  4047c5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4047c9:	48 83 e8 08          	sub    $0x8,%rax
  4047cd:	48 8b 00             	mov    (%rax),%rax
  4047d0:	83 e0 01             	and    $0x1,%eax
  4047d3:	48 85 c0             	test   %rax,%rax
  4047d6:	75 1b                	jne    4047f3 <find_fit+0x43>
  4047d8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4047dc:	48 83 e8 08          	sub    $0x8,%rax
  4047e0:	48 8b 00             	mov    (%rax),%rax
  4047e3:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  4047e7:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
  4047eb:	72 06                	jb     4047f3 <find_fit+0x43>
  4047ed:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4047f1:	eb 2c                	jmp    40481f <find_fit+0x6f>
  4047f3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4047f7:	48 83 e8 08          	sub    $0x8,%rax
  4047fb:	48 8b 00             	mov    (%rax),%rax
  4047fe:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  404802:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  404806:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  40480a:	48 83 e8 08          	sub    $0x8,%rax
  40480e:	48 8b 00             	mov    (%rax),%rax
  404811:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  404815:	48 85 c0             	test   %rax,%rax
  404818:	75 ab                	jne    4047c5 <find_fit+0x15>
  40481a:	b8 00 00 00 00       	mov    $0x0,%eax
  40481f:	5d                   	pop    %rbp
  404820:	c3                   	retq   

0000000000404821 <is_allocated>:
  404821:	55                   	push   %rbp
  404822:	48 89 e5             	mov    %rsp,%rbp
  404825:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  404829:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  40482e:	75 07                	jne    404837 <is_allocated+0x16>
  404830:	b8 00 00 00 00       	mov    $0x0,%eax
  404835:	eb 73                	jmp    4048aa <is_allocated+0x89>
  404837:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
  40483e:	48 8b 05 bb 2e 20 00 	mov    0x202ebb(%rip),%rax        # 607700 <heap_listp>
  404845:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  404849:	eb 39                	jmp    404884 <is_allocated+0x63>
  40484b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  40484f:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  404853:	75 1c                	jne    404871 <is_allocated+0x50>
  404855:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  404859:	48 83 e8 08          	sub    $0x8,%rax
  40485d:	48 8b 00             	mov    (%rax),%rax
  404860:	83 e0 01             	and    $0x1,%eax
  404863:	48 85 c0             	test   %rax,%rax
  404866:	74 09                	je     404871 <is_allocated+0x50>
  404868:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%rbp)
  40486f:	eb 27                	jmp    404898 <is_allocated+0x77>
  404871:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  404875:	48 83 e8 08          	sub    $0x8,%rax
  404879:	48 8b 00             	mov    (%rax),%rax
  40487c:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  404880:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  404884:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  404888:	48 83 e8 08          	sub    $0x8,%rax
  40488c:	48 8b 00             	mov    (%rax),%rax
  40488f:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  404893:	48 85 c0             	test   %rax,%rax
  404896:	75 b3                	jne    40484b <is_allocated+0x2a>
  404898:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  40489c:	75 07                	jne    4048a5 <is_allocated+0x84>
  40489e:	b8 00 00 00 00       	mov    $0x0,%eax
  4048a3:	eb 05                	jmp    4048aa <is_allocated+0x89>
  4048a5:	b8 01 00 00 00       	mov    $0x1,%eax
  4048aa:	5d                   	pop    %rbp
  4048ab:	c3                   	retq   

00000000004048ac <printblock>:
  4048ac:	55                   	push   %rbp
  4048ad:	48 89 e5             	mov    %rsp,%rbp
  4048b0:	48 83 ec 30          	sub    $0x30,%rsp
  4048b4:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  4048b8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  4048bc:	48 83 e8 08          	sub    $0x8,%rax
  4048c0:	48 8b 00             	mov    (%rax),%rax
  4048c3:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  4048c7:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  4048cb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  4048cf:	48 83 e8 08          	sub    $0x8,%rax
  4048d3:	48 8b 00             	mov    (%rax),%rax
  4048d6:	83 e0 01             	and    $0x1,%eax
  4048d9:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  4048dd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  4048e1:	48 83 e8 08          	sub    $0x8,%rax
  4048e5:	48 8b 00             	mov    (%rax),%rax
  4048e8:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  4048ec:	48 8d 50 f0          	lea    -0x10(%rax),%rdx
  4048f0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  4048f4:	48 01 d0             	add    %rdx,%rax
  4048f7:	48 8b 00             	mov    (%rax),%rax
  4048fa:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  4048fe:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  404902:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  404906:	48 83 e8 08          	sub    $0x8,%rax
  40490a:	48 8b 00             	mov    (%rax),%rax
  40490d:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  404911:	48 8d 50 f0          	lea    -0x10(%rax),%rdx
  404915:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  404919:	48 01 d0             	add    %rdx,%rax
  40491c:	48 8b 00             	mov    (%rax),%rax
  40491f:	83 e0 01             	and    $0x1,%eax
  404922:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  404926:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  40492b:	75 18                	jne    404945 <printblock+0x99>
  40492d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  404931:	48 89 c6             	mov    %rax,%rsi
  404934:	bf c4 59 40 00       	mov    $0x4059c4,%edi
  404939:	b8 00 00 00 00       	mov    $0x0,%eax
  40493e:	e8 ed c2 ff ff       	callq  400c30 <printf@plt>
  404943:	eb 4c                	jmp    404991 <printblock+0xe5>
  404945:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  40494a:	74 07                	je     404953 <printblock+0xa7>
  40494c:	bf 61 00 00 00       	mov    $0x61,%edi
  404951:	eb 05                	jmp    404958 <printblock+0xac>
  404953:	bf 66 00 00 00       	mov    $0x66,%edi
  404958:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  40495d:	74 07                	je     404966 <printblock+0xba>
  40495f:	be 61 00 00 00       	mov    $0x61,%esi
  404964:	eb 05                	jmp    40496b <printblock+0xbf>
  404966:	be 66 00 00 00       	mov    $0x66,%esi
  40496b:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  40496f:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  404973:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  404977:	41 89 f9             	mov    %edi,%r9d
  40497a:	49 89 c8             	mov    %rcx,%r8
  40497d:	89 f1                	mov    %esi,%ecx
  40497f:	48 89 c6             	mov    %rax,%rsi
  404982:	bf d0 59 40 00       	mov    $0x4059d0,%edi
  404987:	b8 00 00 00 00       	mov    $0x0,%eax
  40498c:	e8 9f c2 ff ff       	callq  400c30 <printf@plt>
  404991:	c9                   	leaveq 
  404992:	c3                   	retq   

0000000000404993 <checkblock>:
  404993:	55                   	push   %rbp
  404994:	48 89 e5             	mov    %rsp,%rbp
  404997:	48 83 ec 10          	sub    $0x10,%rsp
  40499b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  40499f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4049a3:	83 e0 07             	and    $0x7,%eax
  4049a6:	48 85 c0             	test   %rax,%rax
  4049a9:	74 1d                	je     4049c8 <checkblock+0x35>
  4049ab:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4049af:	48 89 c6             	mov    %rax,%rsi
  4049b2:	bf f8 59 40 00       	mov    $0x4059f8,%edi
  4049b7:	b8 00 00 00 00       	mov    $0x0,%eax
  4049bc:	e8 6f c2 ff ff       	callq  400c30 <printf@plt>
  4049c1:	b8 00 00 00 00       	mov    $0x0,%eax
  4049c6:	eb 43                	jmp    404a0b <checkblock+0x78>
  4049c8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4049cc:	48 83 e8 08          	sub    $0x8,%rax
  4049d0:	48 8b 10             	mov    (%rax),%rdx
  4049d3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4049d7:	48 83 e8 08          	sub    $0x8,%rax
  4049db:	48 8b 00             	mov    (%rax),%rax
  4049de:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  4049e2:	48 8d 48 f0          	lea    -0x10(%rax),%rcx
  4049e6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4049ea:	48 01 c8             	add    %rcx,%rax
  4049ed:	48 8b 00             	mov    (%rax),%rax
  4049f0:	48 39 c2             	cmp    %rax,%rdx
  4049f3:	74 11                	je     404a06 <checkblock+0x73>
  4049f5:	bf 20 5a 40 00       	mov    $0x405a20,%edi
  4049fa:	e8 f1 c1 ff ff       	callq  400bf0 <puts@plt>
  4049ff:	b8 00 00 00 00       	mov    $0x0,%eax
  404a04:	eb 05                	jmp    404a0b <checkblock+0x78>
  404a06:	b8 01 00 00 00       	mov    $0x1,%eax
  404a0b:	c9                   	leaveq 
  404a0c:	c3                   	retq   

0000000000404a0d <mm_checkheap>:
  404a0d:	55                   	push   %rbp
  404a0e:	48 89 e5             	mov    %rsp,%rbp
  404a11:	48 83 ec 20          	sub    $0x20,%rsp
  404a15:	89 7d ec             	mov    %edi,-0x14(%rbp)
  404a18:	48 8b 05 e1 2c 20 00 	mov    0x202ce1(%rip),%rax        # 607700 <heap_listp>
  404a1f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  404a23:	48 8b 05 d6 2c 20 00 	mov    0x202cd6(%rip),%rax        # 607700 <heap_listp>
  404a2a:	48 89 c6             	mov    %rax,%rsi
  404a2d:	bf 44 5a 40 00       	mov    $0x405a44,%edi
  404a32:	b8 00 00 00 00       	mov    $0x0,%eax
  404a37:	e8 f4 c1 ff ff       	callq  400c30 <printf@plt>
  404a3c:	48 8b 05 bd 2c 20 00 	mov    0x202cbd(%rip),%rax        # 607700 <heap_listp>
  404a43:	48 83 e8 08          	sub    $0x8,%rax
  404a47:	48 8b 00             	mov    (%rax),%rax
  404a4a:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  404a4e:	48 83 f8 10          	cmp    $0x10,%rax
  404a52:	75 16                	jne    404a6a <mm_checkheap+0x5d>
  404a54:	48 8b 05 a5 2c 20 00 	mov    0x202ca5(%rip),%rax        # 607700 <heap_listp>
  404a5b:	48 83 e8 08          	sub    $0x8,%rax
  404a5f:	48 8b 00             	mov    (%rax),%rax
  404a62:	83 e0 01             	and    $0x1,%eax
  404a65:	48 85 c0             	test   %rax,%rax
  404a68:	75 0a                	jne    404a74 <mm_checkheap+0x67>
  404a6a:	bf 50 5a 40 00       	mov    $0x405a50,%edi
  404a6f:	e8 7c c1 ff ff       	callq  400bf0 <puts@plt>
  404a74:	48 8b 05 85 2c 20 00 	mov    0x202c85(%rip),%rax        # 607700 <heap_listp>
  404a7b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  404a7f:	eb 2b                	jmp    404aac <mm_checkheap+0x9f>
  404a81:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  404a85:	48 89 c7             	mov    %rax,%rdi
  404a88:	e8 06 ff ff ff       	callq  404993 <checkblock>
  404a8d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  404a91:	48 89 c7             	mov    %rax,%rdi
  404a94:	e8 13 fe ff ff       	callq  4048ac <printblock>
  404a99:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  404a9d:	48 83 e8 08          	sub    $0x8,%rax
  404aa1:	48 8b 00             	mov    (%rax),%rax
  404aa4:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  404aa8:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  404aac:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  404ab0:	48 83 e8 08          	sub    $0x8,%rax
  404ab4:	48 8b 00             	mov    (%rax),%rax
  404ab7:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  404abb:	48 85 c0             	test   %rax,%rax
  404abe:	75 c1                	jne    404a81 <mm_checkheap+0x74>
  404ac0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  404ac4:	48 83 e8 08          	sub    $0x8,%rax
  404ac8:	48 8b 00             	mov    (%rax),%rax
  404acb:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  404acf:	48 85 c0             	test   %rax,%rax
  404ad2:	75 13                	jne    404ae7 <mm_checkheap+0xda>
  404ad4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  404ad8:	48 83 e8 08          	sub    $0x8,%rax
  404adc:	48 8b 00             	mov    (%rax),%rax
  404adf:	83 e0 01             	and    $0x1,%eax
  404ae2:	48 85 c0             	test   %rax,%rax
  404ae5:	75 0a                	jne    404af1 <mm_checkheap+0xe4>
  404ae7:	bf 64 5a 40 00       	mov    $0x405a64,%edi
  404aec:	e8 ff c0 ff ff       	callq  400bf0 <puts@plt>
  404af1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  404af5:	48 89 c7             	mov    %rax,%rdi
  404af8:	e8 af fd ff ff       	callq  4048ac <printblock>
  404afd:	90                   	nop
  404afe:	c9                   	leaveq 
  404aff:	c3                   	retq   

0000000000404b00 <__libc_csu_init>:
  404b00:	41 57                	push   %r15
  404b02:	41 56                	push   %r14
  404b04:	41 89 ff             	mov    %edi,%r15d
  404b07:	41 55                	push   %r13
  404b09:	41 54                	push   %r12
  404b0b:	4c 8d 25 fe 22 20 00 	lea    0x2022fe(%rip),%r12        # 606e10 <__frame_dummy_init_array_entry>
  404b12:	55                   	push   %rbp
  404b13:	48 8d 2d fe 22 20 00 	lea    0x2022fe(%rip),%rbp        # 606e18 <__init_array_end>
  404b1a:	53                   	push   %rbx
  404b1b:	49 89 f6             	mov    %rsi,%r14
  404b1e:	49 89 d5             	mov    %rdx,%r13
  404b21:	4c 29 e5             	sub    %r12,%rbp
  404b24:	48 83 ec 08          	sub    $0x8,%rsp
  404b28:	48 c1 fd 03          	sar    $0x3,%rbp
  404b2c:	e8 37 c0 ff ff       	callq  400b68 <_init>
  404b31:	48 85 ed             	test   %rbp,%rbp
  404b34:	74 20                	je     404b56 <__libc_csu_init+0x56>
  404b36:	31 db                	xor    %ebx,%ebx
  404b38:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  404b3f:	00 
  404b40:	4c 89 ea             	mov    %r13,%rdx
  404b43:	4c 89 f6             	mov    %r14,%rsi
  404b46:	44 89 ff             	mov    %r15d,%edi
  404b49:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  404b4d:	48 83 c3 01          	add    $0x1,%rbx
  404b51:	48 39 eb             	cmp    %rbp,%rbx
  404b54:	75 ea                	jne    404b40 <__libc_csu_init+0x40>
  404b56:	48 83 c4 08          	add    $0x8,%rsp
  404b5a:	5b                   	pop    %rbx
  404b5b:	5d                   	pop    %rbp
  404b5c:	41 5c                	pop    %r12
  404b5e:	41 5d                	pop    %r13
  404b60:	41 5e                	pop    %r14
  404b62:	41 5f                	pop    %r15
  404b64:	c3                   	retq   
  404b65:	90                   	nop
  404b66:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  404b6d:	00 00 00 

0000000000404b70 <__libc_csu_fini>:
  404b70:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000404b74 <_fini>:
  404b74:	48 83 ec 08          	sub    $0x8,%rsp
  404b78:	48 83 c4 08          	add    $0x8,%rsp
  404b7c:	c3                   	retq   
