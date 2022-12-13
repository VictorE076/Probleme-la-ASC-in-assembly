.data
	x: .long 25
	y: .long 34
.text
.globl main
main:

	mov x, %eax
	mov y, %ebx
	mov %eax, y
	mov %ebx, x

etexit:	
	
	mov $1, %eax
	mov $0, %ebx
	int $0x80
