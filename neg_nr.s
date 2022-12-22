// Test de nr. negative
.data
	a: .space 4
	b: .space 4
	da: .asciz "Sunt egale!\n"
	nu: .asciz "NU sunt egale!\n"
.text
.globl main
main:
	
	// movl $4294967295, a
	// movl $-1, b
	// a == b true
	
	movl $2147483648, a
	movl $-2147483648, b
	// a == b true
	
	// MOTIV: se lucreaza in modulo 2^32 deoarece avem la dispozitie 32 de biti;
compare:
	movl a, %eax
	cmp b, %eax
	je DA
	
	pushl $nu
	call printf
	addl $4, %esp
	
	jmp next

DA:
	pushl $da
	call printf
	addl $4, %esp

next:
	pushl $0
	call fflush
	addl $4, %esp
etexit:
	movl $1, %eax
	xor %ebx, %ebx
	int $0x80
