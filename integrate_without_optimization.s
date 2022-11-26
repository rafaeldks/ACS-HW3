	.intel_syntax noprefix # Указание синтаксиса Intel
	.text # Начало новой секции
	
	.globl	integrate
	.type	integrate, @function
integrate:
	push	rbp # Кладём rbp на стек
	mov	rbp, rsp # rbp:= rsp
	movsd	QWORD PTR -24[rbp], xmm0 # rbp[-24]:= xmm0 (представляет из себя первый параметр функции integrate в коде на C)
	movsd	QWORD PTR -32[rbp], xmm1 # rbp[-32]:= xmm0 (представляет из себя второй параметр функции integrate в коде на C)
	mov	DWORD PTR -36[rbp], edi # rbp[-36]:= xmm0 (представляет из себя третий параметр функции integrate в коде на C)
	mov	DWORD PTR -40[rbp], esi # rbp[-40]:= xmm0 (представляет из себя четвёртый параметр функции integrate в коде на C)
	pxor	xmm0, xmm0 # xmm0:= 0
	movsd	QWORD PTR -16[rbp], xmm0 # result = 0
	pxor	xmm0, xmm0 # xmm0:= 0
	cvtsi2sd	xmm0, DWORD PTR -36[rbp] #  xmm0 = double(left)
	movsd	QWORD PTR -8[rbp], xmm0 # rbp[-8]:= xmm0 - l = left
	jmp	.L2 # Переходим на .L2
.L3:
	movsd	xmm0, QWORD PTR -24[rbp] # xmm0:= rbp[-24] = a
	movapd	xmm1, xmm0 # xmm1:= xmm0
	addsd	xmm1, xmm0 # xmm1 += xmm0
	movsd	xmm0, QWORD PTR -8[rbp] # xmm0:= rbp[-8] = l
	mulsd	xmm0, xmm0 # xmm0 *= xmm0
	movapd	xmm2, xmm0 # xmm2 := xmm0
	mulsd	xmm2, QWORD PTR -8[rbp] # xmm2*= left
	movsd	xmm3, QWORD PTR -8[rbp] # xmm3:= left
	movsd	xmm0, QWORD PTR .LC1[rip] # xmm0:= 0.000001
	addsd	xmm3, xmm0 # xmm3 += xmm0
	movsd	xmm4, QWORD PTR -8[rbp] # xmm4:= l
	addsd	xmm0, xmm4 # xmm0 += l
	mulsd	xmm3, xmm0 # xmm3 *= l + 0.000001
	movsd	xmm4, QWORD PTR -8[rbp] # xmm4:= l
	movsd	xmm0, QWORD PTR .LC1[rip] # xmm0:= 0.000001
	addsd	xmm0, xmm4 # xmm0 += l
	mulsd	xmm0, xmm3 # xmm0 *= xmm0
	addsd	xmm0, xmm2 # xmm0 += xmm2
	mulsd	xmm0, QWORD PTR -32[rbp] # xmm0 *= b
	addsd	xmm1, xmm0 # xmm1 += xmm0
	movsd	xmm0, QWORD PTR .LC1[rip] # xmm0:= 0.000001
	mulsd	xmm0, xmm1 # xmm0*= xmm1
	movsd	xmm1, QWORD PTR .LC2[rip] # xmm1:= 2
	divsd	xmm0, xmm1 # xmm0 /= 2
	movsd	xmm1, QWORD PTR -16[rbp] # xmm1:= result
	addsd	xmm0, xmm1 # xmm0 += xmm1
	movsd	QWORD PTR -16[rbp], xmm0 # result:= xmm0
	movsd	xmm1, QWORD PTR -8[rbp] # xmm1:= l
	movsd	xmm0, QWORD PTR .LC1[rip] # xmm0:= 0.000001
	addsd	xmm0, xmm1 # xmm0+= xmm1
	movsd	QWORD PTR -8[rbp], xmm0 # l:= l + 0.000001
.L2:
	pxor	xmm0, xmm0 # xmm0 := 0
	cvtsi2sd	xmm0, DWORD PTR -40[rbp] #  xmm0 = double(right)
	comisd	xmm0, QWORD PTR -8[rbp] # Сравнение xmm0 и l
	ja	.L3 # Если xmm0<l
	movsd	xmm0, QWORD PTR -16[rbp] # xmm0:= result
	movq	rax, xmm0 # rax:= result
	movq	xmm0, rax # xmm0:= rax
	pop	rbp # Убираем rbp со стека
	ret # завершение функции
	.size	integrate, .-integrate # метаданные
	
	.section	.rodata # секция read-only
	.align 8 # Дополняет счётчик места до 8
.LC1: # хранение для числа 0.000001 в double
	.long	-1598689907
	.long	1051772663
	.align 8 # Дополняет счётчик места до 8
.LC2: # хранение для числа 2.000 в double
	.long	0
	.long	1073741824
	