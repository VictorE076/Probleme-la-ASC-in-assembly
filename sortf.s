// Sortarea crescatoare a unui array citit de la tastatura;
.data
	n: .space 4
	x: .space 4
	v: .space 404
	fread: .asciz "%d"
	fprint: .asciz "%d  "
	end: .asciz "\n"
.text
.globl main
main:
Citire_n:
	push $n
	push $fread
	call scanf
	pop %ebx
	pop %ebx

Citire_array:
	lea v, %esi
	xor %ecx, %ecx

for_c:
	cmp n, %ecx
	je sortare
	
	pusha
	push $x
	push $fread
	call scanf
	pop %ebx
	pop %ebx
	popa
	
	mov x, %eax
	movl %eax, (%esi, %ecx, 4)
	
	inc %ecx
	jmp for_c
	
sortare:

	xor %ecx, %ecx
	xor %ebx, %ebx
	
for_i:
	cmp n, %ecx
	je Afisare
	mov %ecx, %ebx
	
	for_j:
		cmp n, %ebx
		je aft
		
		movl (%esi, %ecx, 4), %eax
		movl (%esi, %ebx, 4), %edx
		
		cmp %edx, %eax
		jle next
		
	swap:
		movl %edx, (%esi, %ecx, 4)
		movl %eax, (%esi, %ebx, 4)
			
	next:
		inc %ebx
		jmp for_j
aft:
	inc %ecx
	jmp for_i	
		

Afisare:
	xor %ecx, %ecx
	
for_c2:
	cmp n, %ecx
	je fin
	
	// mov (%esi, %ecx, 4), %eax
	// movl %eax, x
	
	pusha
	push (%esi, %ecx, 4)
	push $fprint
	call printf
	pop %ebx
	pop %ebx
	
	push $0
	call fflush
	pop %ebx
	popa
	
	inc %ecx
	jmp for_c2

fin:
	push $end
	call printf
	pop %ebx
	
	push $0
	call fflush
	pop %ebx
	
etexit:
	mov $1, %eax
	xor %ebx, %ebx
	int $0x80
