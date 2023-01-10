// Numarul de autoapeluri ale procedurii "f";
.data
	nr: .long 0
	x: .space 4
	
	fs: .asciz "%ld"
	fpr: .asciz "\n%ld\n"
	
////
	ftest: .asciz "%ld "
////	
	
.text

f:
	pushl %ebp
	movl %esp, %ebp
	
		pushl %ebx
		pushl %esi
		pushl %edi
	
	

	pushl 8(%ebp)
	pushl $ftest
	call printf
	addl $8, %esp

	
	movl 8(%ebp), %eax
	cmp $1, %eax
	je final
	
	
	incl nr
	
	
	andl $1, %eax
	
	cmp $0, %eax
	jne impar

par:
	
	movl 8(%ebp), %eax
	shr $1, %eax
	
	pushl %eax
	call f
	addl $4, %esp
	
	jmp final	
	
impar:
	
	movl 8(%ebp), %eax
	xor %edx, %edx
	movl $3, %ebx
	mull %ebx
	addl $1, %eax
	
	pushl %eax
	call f
	addl $4, %esp


final:	
		popl %edi
		popl %esi
		popl %ebx		
			
	popl %ebp
	ret

.globl main
main:
	pushl $x
	pushl $fs
	call scanf
	addl $8, %esp

Func:	
	pushl x
	call f
	addl $4, %esp
	
	pushl nr
	pushl $fpr
	call printf
	addl $8, %esp
	
	pushl $0
	call fflush
	addl $4, %esp
etexit:
	movl $1, %eax
	xor %ebx, %ebx
	int $0x80
