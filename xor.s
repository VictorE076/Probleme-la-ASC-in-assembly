.data
	n: .long 9
	v: .long 10, 15, 3, 8, 10, 8, 15, 6, 3
	r: .space 4
.text

.globl main

main:
	
	lea v, %esi
	xor %ecx, %ecx
	xor %ebx, %ebx
	
for:
	cmp n, %ecx
	je etexit
	
	xor (%esi, %ecx, 4), %ebx
	inc %ecx
	
	jmp for
	
etexit:
	mov %ebx, r
	
	mov $1, %eax
	xor %ebx, %ebx
	int $0x80
