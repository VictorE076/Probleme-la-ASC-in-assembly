// Folosim o procedura care are doua adrese de matrici diferite transmise ca parametru;
.data
	v1: .long 45, 35, -90, 23, 120, 23, 89, 41, 67, 114441
	v2: .long -8, 5, -1, 0, -90, -1, 5, 1978, -67, -1
	vres: .space 100
	
	n: .long 10
	
	fpr: .asciz "%d "
	fend: .asciz "\n"
.text

Combine:
	pushl %ebp
	movl %esp, %ebp
	
		pushl %ebx
		pushl %esi
		pushl %edi
	
		subl $4, %esp
		
		
	movl $0, -16(%ebp)
	
for_1:
	movl -16(%ebp), %ecx
	cmp 20(%ebp), %ecx
	je next_1
	
	movl %ecx, %eax
	
	movl 8(%ebp), %esi
	movl (%esi, %eax, 4), %ebx
	
	movl 12(%ebp), %esi
	movl (%esi, %eax, 4), %ecx
	
	addl %eax, %eax
	
	movl 16(%ebp), %esi
	movl %ebx, (%esi, %eax, 4)
	
	addl $1, %eax
	movl %ecx, (%esi, %eax, 4)
	
	incl -16(%ebp)
	jmp for_1

next_1:			
	
		addl $4, %esp
	
		popl %edi
		popl %esi
		popl %ebx
	
	popl %ebp
	ret

.globl main
main:
	pushl n
	pushl $vres
	pushl $v2
	pushl $v1
	call Combine
	addl $16, %esp
nt:	
	
	movl n, %eax
	addl %eax, %eax
	movl %eax, n
	
	xor %ecx, %ecx	
for_2:
	cmp n, %ecx
	je etexit
	
	lea vres, %esi
	
		pushl %ecx
	pushl (%esi, %ecx, 4)
	pushl $fpr
	call printf
	addl $8, %esp
	
	pushl $0
	call fflush
	addl $4, %esp
		popl %ecx
		
	incl %ecx
	jmp for_2
etexit:
	
	pushl $fend
	call printf
	addl $4, %esp	
	
	pushl $0
	call fflush
	addl $4, %esp
	
	
	movl $1, %eax
	xor %ebx, %ebx
	int $0x80



// movl 8(%ebp), %esi
// movl 12(%ebp), %edi
