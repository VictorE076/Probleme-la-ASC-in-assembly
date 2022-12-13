.data
	x: 	.long 6
	y: 	.long 8
	str1: 	.asciz "x < y\n"
	str2:	.asciz "x >= y\n"
.text
	// Va afisa str1 daca x < y
	// Va afisa str2 daca x >= y
.globl main
main:
	mov x, %eax
	mov y, %ebx
	
	cmp %eax, %ebx
	jg et_afis
	
	mov $4, %eax
	mov $1, %ebx
	mov $str2, %ecx
	mov $8, %edx
	int $0x80
	
	jmp etexit
		
et_afis:
	mov $4, %eax
	mov $1, %ebx
	mov $str1, %ecx
	mov $7, %edx
	int $0x80
	
etexit:
	mov $1, %eax
	mov $0, %ebx
	int $0x80
