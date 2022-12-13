//Sa se afiseze toti divizorii lui a pe ecran.
.data
	a: .space 4
	a2: .space 4
	fread: .asciz "%d"
	fprint: .asciz "%d "
	end: .asciz "\n"
.text
.globl main
main:
Citire:
	push $a
	push $fread
	call scanf
	pop %ebx
	pop %ebx
	
	mov a, %eax
	mov %eax, a2
	incl a2

Prelucrare:
	mov $1, %ecx
	
for_a:
	cmp a2, %ecx
	je afisare_end
	
	xor %edx, %edx
	mov a, %eax
	idiv %ecx
	
	cmp $0, %edx
	jne next
	
Afisare_d:	
	pusha
	push %ecx
	push $fprint
	call printf
	pop %ebx
	pop %ebx
	
	push $0
	call fflush
	pop %ebx
	popa
	
next:
	inc %ecx
	jmp for_a
	
afisare_end:

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
