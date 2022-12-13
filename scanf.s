// Apel functie scanf;
.data
	x: .space 4
	formatInt: .asciz "%d"
.text
.globl main
main:
	// scanf("%d", &x); -C standard;
	
Citire:	
	push $x
	push $formatInt
	
	call scanf
	
	pop %ebx
	pop %ebx
	
	
etexit:
	mov $1, %eax
	xor %ebx, %ebx
	int $0x80
