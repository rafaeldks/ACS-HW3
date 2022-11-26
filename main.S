	.intel_syntax noprefix # Указание синтаксиса Intel
	.text # Начало новой секции
	
	.section	.rodata # Начало секции read-only
.LC0:
	.string	"%lf" # Кладём строку "%d"
	.text # Начало новой секции
	
	.globl	main
	.type	main, @function
main:
	push	rbp # Кладём rbp на стек
	mov	rbp, rsp # rbp:= rsp
	sub	rsp, 32 # rsp-= 32 (выделение памяти под функцию)
	mov	rax, QWORD PTR fs:40 # rax:= <оффсет>
	mov	QWORD PTR -8[rbp], rax # rbp[-8] = rax
	xor	eax, eax # eax:=0
	lea	rcx, -28[rbp] # rcx = &rbp[-28] Получаем ссылку на (double a)
	lea	rdx, -32[rbp]  # rdx = &rbp[-32] Получаем ссылку на (double b)
	lea	rsi, -16[rbp] # rsi = &rbp[-16] Получаем ссылку на (int left)
	lea	rax, -24[rbp] # rax = &rbp[-24] Получаем ссылку на (int right)
	mov	rdi, rax # rdi:=rax
	call	read@PLT # Вызов функции read с переданными параметрами по ссылке
	mov	esi, DWORD PTR -28[rbp] # esi = rbp[-28] передаём параметр double a в функцию integrate - Оптимизировано
	mov	edi, DWORD PTR -32[rbp] # edi = rbp[-32] передаём параметр double b в функцию integrate - Оптимизировано
	movsd	xmm0, QWORD PTR -16[rbp] # xmm0 = rbp[-16] передаём параметр int left в функцию integrate
	mov	rax, QWORD PTR -24[rbp] # rax = rbp[-24] передаём параметр int right в функцию integrate
	movapd	xmm1, xmm0 # xmm1:= xmm0
	movq	xmm0, rax # xmm0:= rax
	call	integrate@PLT # Вызов функции integrate
	movq	rax, xmm0 # rax:= xmm0
	movq	xmm0, rax # xmm0:= rax
	lea	rax, .LC0[rip] # rax:=&"%lf"
	mov	rdi, rax # rdi:=rax
	mov	eax, 1 # eax:= 1
	call	printf@PLT # Вызов функции printf
	xor	eax, eax # eax:= 0 - Оптимизировано
	mov	rdx, QWORD PTR -8[rbp] # rdx:=rbp[-8]
	sub	rdx, QWORD PTR fs:40 # Очищаем память, выделенную под функцию
	je	.L3 # Переход к .L3
	call	__stack_chk_fail@PLT # Завершение функции в случае, если переполнен стек
.L3:
	leave # Выход из функции с удалением фрейма из стека
	ret # Выход из процедуры
	.size	main, .-main # Метаданные