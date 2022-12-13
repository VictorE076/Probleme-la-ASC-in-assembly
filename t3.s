.data
	x: 	.long 45
	y: 	.long 31
	sum1: 	.space 4	
	sum2: 	.space 4
	a: 	.asciz "PASS\n"
	b: 	.asciz "FAIL\n"
.text	
.globl main
main:
rez_1:
	mov $0, %edx
	

	mov x, %eax
	mov $16, %ebx
	idiv %ebx
	mov %eax, sum1
	

	mov y, %eax 
	// mov $16, %ebx
	imul %ebx
	add %eax, sum1
	
	// mov $0, %edx
	
 	mov sum1, %ebx
 	
rez_2: 	
 	mov x, %eax
 	shr $4, %eax
 	mov %eax, sum2
 	
 	mov y, %eax
 	shl $4, %eax
 	add %eax, sum2
 	
 	mov sum2, %eax
 
stp:

	// add $1, %eax

	cmp %eax, %ebx
	je pass
	
	mov $4, %eax
	mov $1, %ebx
	mov $b, %ecx
	mov $6, %edx
	int $0x80
	
	jmp etexit
	
pass:
	mov $4, %eax
	mov $1, %ebx
	mov $a, %ecx
	mov $6, %edx	
	int $0x80

etexit:
	mov $1, %eax
	mov $0, %ebx
	int $0x80
