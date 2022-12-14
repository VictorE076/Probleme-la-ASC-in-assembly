// Parcurgerea si afisarea unor elemente dintr-un array.
.data
	v: .long 10, 20, 30, 40
	n: .long 4
	fp: .asciz "%d "
	en: .asciz "\n"
.text

.globl main

main:
	// lea v, %edi
	pushl $v
	popl %edi; // este echivalenta cu "lea v, %edi";
	
	xor %ecx, %ecx
et_for:
	cmp n, %ecx
	je etexit
	
	movl (%edi, %ecx, 4), %eax
		
	pushl %ecx
	
	pushl %eax
	pushl $fp
	call printf
	addl $8, %esp
	
	pushl $0
	call fflush
	addl $4, %esp
	
	popl %ecx
	
	incl %ecx
	jmp et_for
etexit:
	pushl $en
	call printf
	pop %ebx
	
	pushl $0
	call fflush
	addl $4, %esp	
	
	movl $1, %eax
	xor %ebx, %ebx
	int $0x80
