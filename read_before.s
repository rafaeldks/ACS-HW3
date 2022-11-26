	.file	"read.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"\320\222\320\262\320\265\320\264\320\270\321\202\320\265 \321\207\320\270\321\201\320\273\320\260 a \320\270 b: "
.LC1:
	.string	"%lf"
	.align 8
.LC4:
	.string	"\320\247\320\270\321\201\320\273\320\260 a \320\270 b \320\264\320\276\320\273\320\266\320\275\321\213 \320\261\321\213\321\202\321\214 \320\262 \320\264\320\270\320\260\320\277\320\260\320\267\320\276\320\275\320\265 [-100;100]"
	.align 8
.LC5:
	.string	"\320\222\320\262\320\265\320\264\320\270\321\202\320\265 \320\273\320\265\320\262\321\203\321\216 \320\270 \320\277\321\200\320\260\320\262\321\203\321\216 \320\263\321\200\320\260\320\275\320\270\321\206\321\213 \320\270\320\275\321\202\320\265\320\263\321\200\320\270\321\200\320\276\320\262\320\260\320\275\320\270\321\217: "
.LC6:
	.string	"%d"
	.align 8
.LC7:
	.string	"\320\223\321\200\320\260\320\275\320\270\321\206\321\213 \320\264\320\276\320\273\320\266\320\275\321\213 \320\261\321\213\321\202\321\214 \320\262 \320\264\320\270\320\260\320\277\320\260\320\267\320\276\320\275\320\265 [-100;100]"
	.align 8
.LC8:
	.string	"\320\233\320\265\320\262\320\260\321\217 \320\263\321\200\320\260\320\275\320\270\321\206\320\260 \320\264\320\276\320\273\320\266\320\275\320\260 \320\261\321\213\321\202\321\214 \320\275\320\265 \320\261\320\276\320\273\321\214\321\210\320\265 \320\277\321\200\320\260\320\262\320\276\320\271"
	.text
	.globl	read
	.type	read, @function
read:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	QWORD PTR -8[rbp], rdi
	mov	QWORD PTR -16[rbp], rsi
	mov	QWORD PTR -24[rbp], rdx
	mov	QWORD PTR -32[rbp], rcx
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	rax, QWORD PTR -16[rbp]
	mov	rsi, rax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	rax, QWORD PTR -8[rbp]
	movsd	xmm1, QWORD PTR [rax]
	movsd	xmm0, QWORD PTR .LC2[rip]
	comisd	xmm0, xmm1
	ja	.L2
	mov	rax, QWORD PTR -8[rbp]
	movsd	xmm0, QWORD PTR [rax]
	comisd	xmm0, QWORD PTR .LC3[rip]
	ja	.L2
	mov	rax, QWORD PTR -16[rbp]
	movsd	xmm1, QWORD PTR [rax]
	movsd	xmm0, QWORD PTR .LC2[rip]
	comisd	xmm0, xmm1
	ja	.L2
	mov	rax, QWORD PTR -16[rbp]
	movsd	xmm0, QWORD PTR [rax]
	comisd	xmm0, QWORD PTR .LC3[rip]
	jbe	.L8
.L2:
	lea	rax, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	edi, 1
	call	exit@PLT
.L8:
	lea	rax, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR -24[rbp]
	mov	rsi, rax
	lea	rax, .LC6[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	rax, QWORD PTR -32[rbp]
	mov	rsi, rax
	lea	rax, .LC6[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	rax, QWORD PTR -24[rbp]
	mov	eax, DWORD PTR [rax]
	cmp	eax, -100
	jl	.L5
	mov	rax, QWORD PTR -24[rbp]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 100
	jg	.L5
	mov	rax, QWORD PTR -32[rbp]
	mov	eax, DWORD PTR [rax]
	cmp	eax, -100
	jl	.L5
	mov	rax, QWORD PTR -32[rbp]
	mov	eax, DWORD PTR [rax]
	cmp	eax, 100
	jle	.L6
.L5:
	lea	rax, .LC7[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	edi, 1
	call	exit@PLT
.L6:
	mov	rax, QWORD PTR -24[rbp]
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR -32[rbp]
	mov	eax, DWORD PTR [rax]
	cmp	edx, eax
	jle	.L9
	lea	rax, .LC8[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	edi, 1
	call	exit@PLT
.L9:
	nop
	leave
	ret
	.size	read, .-read
	.section	.rodata
	.align 8
.LC2:
	.long	0
	.long	-1067909120
	.align 8
.LC3:
	.long	0
	.long	1079574528
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
