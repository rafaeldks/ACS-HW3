	.file	"integrate.c"
	.intel_syntax noprefix
	.text
	.globl	integrate
	.type	integrate, @function
integrate:
	push	rbp
	mov	rbp, rsp
	movsd	QWORD PTR -24[rbp], xmm0
	movsd	QWORD PTR -32[rbp], xmm1
	mov	DWORD PTR -36[rbp], edi
	mov	DWORD PTR -40[rbp], esi
	pxor	xmm0, xmm0
	movsd	QWORD PTR -16[rbp], xmm0
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR -36[rbp]
	movsd	QWORD PTR -8[rbp], xmm0
	jmp	.L2
.L3:
	movsd	xmm0, QWORD PTR -24[rbp]
	movapd	xmm1, xmm0
	addsd	xmm1, xmm0
	movsd	xmm0, QWORD PTR -8[rbp]
	mulsd	xmm0, xmm0
	movapd	xmm2, xmm0
	mulsd	xmm2, QWORD PTR -8[rbp]
	movsd	xmm3, QWORD PTR -8[rbp]
	movsd	xmm0, QWORD PTR .LC1[rip]
	addsd	xmm3, xmm0
	movsd	xmm4, QWORD PTR -8[rbp]
	movsd	xmm0, QWORD PTR .LC1[rip]
	addsd	xmm0, xmm4
	mulsd	xmm3, xmm0
	movsd	xmm4, QWORD PTR -8[rbp]
	movsd	xmm0, QWORD PTR .LC1[rip]
	addsd	xmm0, xmm4
	mulsd	xmm0, xmm3
	addsd	xmm0, xmm2
	mulsd	xmm0, QWORD PTR -32[rbp]
	addsd	xmm1, xmm0
	movsd	xmm0, QWORD PTR .LC1[rip]
	mulsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR .LC2[rip]
	divsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR -16[rbp]
	addsd	xmm0, xmm1
	movsd	QWORD PTR -16[rbp], xmm0
	movsd	xmm1, QWORD PTR -8[rbp]
	movsd	xmm0, QWORD PTR .LC1[rip]
	addsd	xmm0, xmm1
	movsd	QWORD PTR -8[rbp], xmm0
.L2:
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR -40[rbp]
	comisd	xmm0, QWORD PTR -8[rbp]
	ja	.L3
	movsd	xmm0, QWORD PTR -16[rbp]
	movq	rax, xmm0
	movq	xmm0, rax
	pop	rbp
	ret
	.size	integrate, .-integrate
	.section	.rodata
	.align 8
.LC1:
	.long	-1598689907
	.long	1051772663
	.align 8
.LC2:
	.long	0
	.long	1073741824
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
