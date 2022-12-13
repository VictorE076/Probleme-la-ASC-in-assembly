.data
	n: .long 23
	v: .long 237, 6, 10, -6, 99, 100, 23, -236, -238, 3, 99, -237, 73, 99, 64, -1, 100, 237, 100, 100, 236, 50, -45
	max: .space 4
	nr: .space 4
.text
.globl main
main:
Pas1:

	lea v, %esi
	xor %ecx, %ecx
	xor %eax, %eax
for:
	cmp n, %ecx
	je et
	
	cmp (%esi, %ecx, 4), %eax
	jge att
	
	movl (%esi, %ecx, 4), %eax
	
att:	
	inc %ecx
	jmp for
	
et:
	mov %eax, max
	
	
Pas2:
	
	xor %ecx, %ecx
	xor %ebx, %ebx
	
for_2:
	cmp n, %ecx
	je et_2
	mov (%esi, %ecx, 4), %eax
	cmp max, %eax
	jne att_2
	
	inc %ebx
	
att_2:
	
	inc %ecx
	jmp for_2


et_2:
	mov %ebx, nr
 
etexit:
	

	mov $1, %eax
	xor %ebx, %ebx
	int $0x80
