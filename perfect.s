// Scrieti o procedura care sa verifice daca un numar este perfect(suma tuturor divizorilor pana la jumate este egala cu numarul).
// perfect(long x) care returneaza prin %eax valoarea 1 daca x este perfect si 0 altfel.
// perfect(28) - 1 in %eax
// perfect(13) - 0 in %eax
.data
	pr_1: .asciz "Numarul: %d dat ca argument este perfect!\n"
	pr_0: .asciz "Numarul: %d dat ca argument NU este perfect!\n"
	scan: .asciz "%d"
	x: .space 4
	sm: .asciz "%d\n"
	
.text

perf:
	pushl %ebp
	movl %esp, %ebp
	subl $8, %esp
	
//	
	movl $0, -4(%ebp); // aici avem "sum";
	movl 8(%ebp), %eax
	shr $1, %eax
	incl %eax
	movl %eax, -8(%ebp); // aici avem "x//2 + 1";
	
	movl $1, %ecx
	
for_p:
	cmp -8(%ebp), %ecx
	je decis

// x % i == 0:	
	xor %edx, %edx
	movl 8(%ebp), %eax
	divl %ecx
	
	cmp $0, %edx
	jne checked
	
	addl %ecx, -4(%ebp)
	
checked:	
	incl %ecx
	jmp for_p
	
decis:
	movl -4(%ebp), %ebx
	cmp 8(%ebp), %ebx
	je ok
	
	xor %eax, %eax
	jmp pas

ok:
	movl $1, %eax

pas:

///
	pushl %eax
	
	pushl %eax
	pushl $sm
	call printf
	addl $8, %esp
	
	pushl $0
	call fflush
	addl $4, %esp
	
	popl %eax
///

//
	addl $8, %esp	
	popl %ebp
	ret	
	
	
.globl main
main:
	pushl $x
	pushl $scan
	call scanf
	addl $8, %esp
	
	// movl $3, %eax
	// pushl %eax
	pushl x
	call perf
	pop %ebx
	// popl %eax

	pushl x
	
	cmp $1, %eax
	jne nt_0
	
	pushl $pr_1
	jmp next

nt_0:
	pushl $pr_0
	
next:
	call printf
	addl $4, %esp
	popl %ebx
	
	pushl %ebx
	
	pushl $0
	call fflush
	addl $4, %esp
	
	popl %ebx
	
etexit:
	movl $1, %eax
	xor %ebx, %ecx
	int $0x80
