.data
	s: .space 12
.text
.globl main
main:

	mov $3, %eax
	mov $1, %ebx
	mov $s, %ecx
	mov $12, %edx
	int $0x80
	
wrt:
	mov $4, %eax
	int $0x80
	
etexit:
	mov $1, %eax
	mov $0, %ebx
	int $0x80
