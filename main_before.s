	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"%lf"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	lea	rcx, -28[rbp]
	lea	rdx, -32[rbp]
	lea	rsi, -16[rbp]
	lea	rax, -24[rbp]
	mov	rdi, rax
	call	read@PLT
	mov	ecx, DWORD PTR -28[rbp]
	mov	edx, DWORD PTR -32[rbp]
	movsd	xmm0, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	esi, ecx
	mov	edi, edx
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	integrate@PLT
	movq	rax, xmm0
	movq	xmm0, rax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT
	mov	eax, 0
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L3
	call	__stack_chk_fail@PLT
.L3:
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
