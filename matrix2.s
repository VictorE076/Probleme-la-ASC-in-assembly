// Suma elementelor pare din matrice;
.data
	i: .space 4
	j: .space 4
	n: .long 4
	m: .long 5
	
	matrix: .long 10, 12, 13, 1, 22
		.long 5, 17, 18, 2, 11
		.long 13, 4, 21, 6, 100
		.long 0, 9, 3, 5, 98
	
	sum: .space 4
	
	formatPrint: .asciz "Suma este: %d\n"
.text
.globl main
main:
	
etexit:
	movl $1, %eax
	xor %ebx, %ebx
	int $0x80
