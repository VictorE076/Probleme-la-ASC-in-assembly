// Suma elementelor pare din matrice;
.data
	i: .space 4
	j: .space 4
	n: .long 5
	m: .long 6
	
	matrix: .long 10, 12, 13, 1, 21, 33
		.long 5, 17, 18, 2, 11, 121
		.long 13, 4, 21, 6, 100, 1
		.long 0, 9, 3, 5, 98, 887
		.long 34, 15, 34, 12, 3, 1
	
	sum: .space 4
	
	formatPrint: .asciz "Suma este: %d\n\n"
	formatmat: .asciz "%d "
	end: .asciz "\n"
.text
.globl main
main:
	movl $0, sum
	lea matrix, %esi
	xor %ecx, %ecx
	movl $0, i
	
for_i:
	movl i, %ecx
	cmp %ecx, n
	je Afisare_sum
	
	movl $0, j
	
	for_j:
		movl j, %ecx
		cmp %ecx, m
		je next_i
		
		xor %edx, %edx
		movl i, %eax
		mull m
		addl %eax, %ecx
		
		movl (%esi, %ecx, 4), %eax
		and $1, %eax
		
		cmp $1, %eax
		je next_j
		
		movl (%esi, %ecx, 4), %eax
		addl %eax, sum
		
	next_j:
		incl j
		jmp for_j
		
next_i:
	
	incl i
	jmp for_i


Afisare_sum:
	push sum
	push $formatPrint
	call printf
	addl $8, %esp
	
	push $0
	call fflush
	addl $4, %esp
	
Afisare_matrix:
	movl $0, i
	xor %ecx, %ecx

for_ai:
	movl i, %ecx
	cmp n, %ecx
	je etexit
	
	movl $0, j
	
	for_aj:
		movl j, %ecx
		cmp m, %ecx
		je next_a
		
		xor %edx, %edx
		movl i, %eax
		mull m
		addl %eax, %ecx
		
		pusha
		push (%esi, %ecx, 4)
		push $formatmat
		call printf
		addl $8, %esp
		
		push $0
		call fflush
		addl $4, %esp
		popa
		
		incl j
		jmp for_aj


next_a:
	
	push $end
	call printf
	addl $4, %esp	
	
	push $0
	call fflush
	addl $4, %esp
		
	incl i
	jmp for_ai
	
		
etexit:
	movl $1, %eax
	xor %ebx, %ebx
	int $0x80
