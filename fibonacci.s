// Calculam al n-lea termen al sirului Fibonacci;
.data	

	n: .space 4
	
	
	fs: .asciz "%ld"
	fpr: .asciz "Al %ld-lea termen din sirul lui Fibonacci este: %ld\n"
.text
.globl main

fib:

	pushl %ebp
	movl %esp, %ebp
	
		pushl %ebx
		pushl %esi
		pushl %edi
	
	movl 8(%ebp), %ebx
	
	cmp $0, %ebx
	je ex
	
	cmp $1, %ebx
	je ex

//	
	decl 8(%ebp)
	
	pushl 8(%ebp)
	call fib
	addl $4, %esp
	
	decl 8(%ebp)
	
	pushl 8(%ebp)
	call fib
	addl $4, %esp
	
//	

	jmp ex_fib
	
ex:
	addl 8(%ebp), %eax

ex_fib:
		
		popl %edi
		popl %esi
		popl %ebx
	
	popl %ebp
	ret

main:
	pushl $n
	pushl $fs
	call scanf
	addl $8, %esp
	
	xor %eax, %eax
	
	pushl n
	call fib
	addl $4, %esp
	
	pushl %eax
	pushl n
	pushl $fpr
	call printf
	addl $12, %esp
	
	pushl $0
	call fflush
	addl $4, %esp
	
etexit:
	movl $1, %eax
	xor %ebx, %ebx
	int $0x80
