//Suma a 2 nr folosind printf si scanf;
.data
	x: .space 4
	y: .space 4
	fread: .asciz "%d %d"
	fprint: .asciz "Suma celor 2 numere este: %d.\n"
.text
.globl main
main:
Citire:
	// scanf("%d %d", %x, %y); -C standard;
	
	push $y
	push $x
	push $fread
	
	call scanf
	
	pop %ebx
	pop %ebx
	pop %ebx
	
Pre:
	mov x, %eax
	add y, %eax
	
Afisare:

	push %eax
	push $fprint
	
	call printf
	
	pop %ebx
	pop %ebx
	
	
	push $0
	call fflush
	pop %ebx
	
etexit:
	mov $1, %eax
	xor %ebx, %ebx
	int $0x80
