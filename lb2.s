.data
	x: 	.long 30
	y: 	.long 7
	prod: 	.space 4
	cat: 	.space 4
	rest: 	.space 4
.text
.globl main
main:
	mov $0, %edx
	

	mov x, %eax
	mov y, %ebx
	mul %ebx
	
	// %eax = %eax * %ebx = x * y
	
	mov %eax, prod
	
	// jmp etexit
	
	mov x, %eax
	div %ebx
	
	// (%edx, %eax) = %eax / %ebx = x / y
	
	mov %edx, rest
	mov %eax, cat
etexit:
	mov $1, %eax
	mov $0, %ebx
	int $0x80
