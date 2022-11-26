	.intel_syntax noprefix # Указание синтаксиса Intel
	.text # Начало новой секции
	
	.section	.rodata # Начало секции read-only
	.align 8 # Дополняет счётчик места до 8
.LC0:
	.string	"\320\222\320\262\320\265\320\264\320\270\321\202\320\265 \321\207\320\270\321\201\320\273\320\260 a \320\270 b: "
	# "Введите числа a и b: "
.LC1:
	.string	"%lf"
	.align 8 # Дополняет счётчик места до 8
.LC4:
	.string	"\320\247\320\270\321\201\320\273\320\260 a \320\270 b \320\264\320\276\320\273\320\266\320\275\321\213 \320\261\321\213\321\202\321\214 \320\262 \320\264\320\270\320\260\320\277\320\260\320\267\320\276\320\275\320\265 [-100;100]"
	# "Числа a и b должны быть в диапазоне [-100;100]"
	.align 8 # Дополняет счётчик места до 8
.LC5:
	.string	"\320\222\320\262\320\265\320\264\320\270\321\202\320\265 \320\273\320\265\320\262\321\203\321\216 \320\270 \320\277\321\200\320\260\320\262\321\203\321\216 \320\263\321\200\320\260\320\275\320\270\321\206\321\213 \320\270\320\275\321\202\320\265\320\263\321\200\320\270\321\200\320\276\320\262\320\260\320\275\320\270\321\217: "
	# "Введите левую и правую границы интегрирования:"
.LC6:
	.string	"%d"
	.align 8 # Дополняет счётчик места до 8
.LC7:
	.string	"\320\223\321\200\320\260\320\275\320\270\321\206\321\213 \320\264\320\276\320\273\320\266\320\275\321\213 \320\261\321\213\321\202\321\214 \320\262 \320\264\320\270\320\260\320\277\320\260\320\267\320\276\320\275\320\265 [-100;100]"
	# "Границы должны быть в диапазоне [-100;100]"
	.align 8 # Дополняет счётчик места до 8
.LC8:
	.string	"\320\233\320\265\320\262\320\260\321\217 \320\263\321\200\320\260\320\275\320\270\321\206\320\260 \320\264\320\276\320\273\320\266\320\275\320\260 \320\261\321\213\321\202\321\214 \320\275\320\265 \320\261\320\276\320\273\321\214\321\210\320\265 \320\277\321\200\320\260\320\262\320\276\320\271"
	# "Левая граница должна быть не больше правой"
	.text
	
	.globl	read
	.type	read, @function
read:
	push	rbp # Кладём rbp на стек
	mov	rbp, rsp # rbp:= rsp
	sub	rsp, 32 # rsp -= 32 (выделение памяти под функцию)
	mov	QWORD PTR -8[rbp], rdi # rbp[-8] := rdi (представляет из себя первый параметр функции read в коде на C)
	mov	QWORD PTR -16[rbp], rsi # rbp[-16] := rsi (представляет из себя второй параметр функции read в коде на C)
	mov	QWORD PTR -24[rbp], rdx # rbp[-24] := rdx (представляет из себя третий параметр функции read в коде на C)
	mov	QWORD PTR -32[rbp], rcx # rbp[-32] := rcx (представляет из себя четвёртый параметр функции read в коде на C)
	lea	rax, .LC0[rip] # rax:= &"Введите числа a и b: "
	mov	rdi, rax # rdi:= rax
	mov	eax, 0 #eax:= 0
	call	printf@PLT # Вызов функции printf
	mov	rsi, QWORD PTR -8[rbp] # rax:= rbp[-8] (переменная double a в Си) - Оптимизировано
	lea	rax, .LC1[rip] # rax:= &"%lf"
	mov	rdi, rax # rdi:= rax
	xor	eax, eax # eax:= 0 - Оптимизировано
	call	__isoc99_scanf@PLT # Вызов функции scanf
	mov	rax, QWORD PTR -16[rbp] # rax:= rbp[-16] (переменная double b в Си)
	mov	rsi, rax # rsi:=rax
	lea	rax, .LC1[rip] # rax:= &"%lf"
	mov	rdi, rax # rdi:= rax
	xor	eax, eax # eax:= 0 - Оптимизировано
	call	__isoc99_scanf@PLT # Вызов функции scanf
	mov	rax, QWORD PTR -8[rbp] # rax:= rbp[-8] (переменная double a в Си)
	movsd	xmm1, QWORD PTR [rax] # xmm1:= [rax]
	movsd	xmm0, QWORD PTR .LC2[rip] # xmm0:= -100
	comisd	xmm0, xmm1 # сравнение a<-100
	ja	.L2 # если a<-100, то переходим к .L2
	movsd	xmm0, QWORD PTR [rax] # xmm0 := [rax]
	comisd	xmm0, QWORD PTR .LC3[rip] # сравнение a>100
	ja	.L2 # если a>100, то переходим к .L2
	mov	rax, QWORD PTR -16[rbp] # rax:= rbp[-8] (переменная double b в Си)
	movsd	xmm1, QWORD PTR [rax] # xmm1:= [rax]
	movsd	xmm0, QWORD PTR .LC2[rip] # xmm0:= -100
	comisd	xmm0, xmm1 # сравнение b<-100
	ja	.L2 # если b<-100, то переходим к .L2
	movsd	xmm0, QWORD PTR [rax] # xmm0:= [rax]
	comisd	xmm0, QWORD PTR .LC3[rip] # сравнение b>100
	jbe	.L8 # если b<=100, то переходим к .L8
.L2:
	lea	rax, .LC4[rip] # rax:= &"Числа a и b должны быть в диапазоне [-100;100]"
	mov	rdi, rax # rdi:= rax
	xor	eax, eax # eax:= 0 - Оптимизировано
	call	printf@PLT # Вызов функции printf
	mov	edi, 1 # edi:= 1 - return 1
	call	exit@PLT # Вызов функции exit
.L8:
	lea	rax, .LC5[rip] # rax:= &"Введите левую и правую границы интегрирования:"
	mov	rdi, rax # rdi:= rax
	xor	eax, eax # eax:= 0 - Оптимизировано
	call	printf@PLT # Вызов printf
	mov	rax, QWORD PTR -24[rbp] # rax:= rbp[-24] Переменная int left в Си
	mov	rsi, rax # rsi:= rax
	lea	rax, .LC6[rip] # rax:= &"%d"
	mov	rdi, rax # rdi:= rax
	xor	eax, eax # eax:= 0 - Оптимизировано
	call	__isoc99_scanf@PLT # Вызов функции scanf
	mov	rax, QWORD PTR -32[rbp] # rax:= rbp[-32] Переменная int right в Си
	mov	rsi, rax # rsi:= rax
	lea	rax, .LC6[rip] # rax:= &"%d"
	mov	rdi, rax # rdi:= rax
	xor	eax, eax # eax:= 0 - Оптимизировано
	call	__isoc99_scanf@PLT # Вызов функции scanf
	mov	rax, QWORD PTR -24[rbp] # rax:= rbp[-24] Переменная int left в Си
	mov	eax, DWORD PTR [rax] # eax:= [rax]
	cmp	eax, -100 # Сравнение left и -100
	jl	.L5 # Если left<-100, то переходим на .L5
	cmp	eax, 100 # Сравнение left и 100
	jg	.L5 # Если left>100, то переходим на .L5
	mov	rax, QWORD PTR -32[rbp] # rax:= rbp[-32] Переменная int right в Си
	mov	eax, DWORD PTR [rax] # eax:= [rax]
	cmp	eax, -100 # Сравнение right и -100
	jl	.L5 # Если right<-100, то переходим на .L5
	cmp	eax, 100 # Сравнение right и 100
	jle	.L6 # Если right<=100, то переходим на .L6
.L5:
	lea	rax, .LC7[rip] # rax:= &"Границы должны быть в диапазоне [-100;100]"
	mov	rdi, rax # rdi:= rax
	mov	eax, 0 # eax:= 0
	call	printf@PLT # Вызов функции printf
	mov	edi, 1 # edi:=1 - return 1
	call	exit@PLT # Вызов функции exit
.L6:
	mov	rax, QWORD PTR -24[rbp] # rax:= rbp[-24] Переменная int left в Си
	mov	edx, DWORD PTR [rax] # edx:= [rax]
	mov	rax, QWORD PTR -32[rbp] # rax:= rbp[-32] Переменная int right в Си
	mov	eax, DWORD PTR [rax] # eax:= [rax]
	cmp	edx, eax # сравнение lefft и right
	jle	.L9 # Если left<=right, то переходим на .L9
	lea	rax, .LC8[rip] # rax:= &"Левая граница должна быть не больше правой"
	mov	rdi, rax # rdi:= rax
	xor	eax, eax # eax:= 0 - Оптимизировано
	call	printf@PLT # Вызов функции printf
	mov	edi, 1 # edi:= 1 - return 1
	call	exit@PLT # Вызов функции exit
.L9:
	leave # Выход из функции с удалением фрейма из стека
	ret # Выход из процедуры
	.size	read, .-read
	.section	.rodata
	.align 8 # Дополняет счётчик места до 8
.LC2: # хранение для числа -100 в double
	.long	0
	.long	-1067909120
	.align 8 # Дополняет счётчик места до 8
.LC3: # хранение для числа 100 в double
	.long	0
	.long	1079574528
