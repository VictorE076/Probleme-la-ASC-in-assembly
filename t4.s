.data
	a: 	.long 34
	b: 	.long 34
	c: 	.long 29
	min: 	.space 4
.text
.globl main
main:
nr_1:
	mov a, %eax
	mov %eax, min
	mov b, %ebx
	mov c, %ecx
	
	cmp %eax, %ebx
	jl nr_2
	
	jmp cd_4
	

nr_2:
	// mov %ebx, %eax
	mov %ebx, min
	
	cmp %ebx, %ecx
	jl nr_3
	
	jmp etexit

nr_3:
	mov %ecx, min
	jmp etexit
	
cd_4:
	cmp %eax, %ecx
	jl cd_5
	
	jmp etexit
cd_5:
	mov %ecx, min
etexit:
	mov $1, %eax
	mov $0, %ebx
	int $0x80
