//Construim un array mic in procedura si calculam numarul de aparitii a unui numar dat in array-ul
//respectiv (+ afisare);
.data
	x: .long 29
	
	fpr: .asciz "%d "
	fend: .asciz "\n\n"
	frez: .asciz "%d\n"
.text
Counting:
	pushl %ebp
	movl %esp, %ebp
	
		pushl %ebx
		pushl %esi
		pushl %edi
		
		
	subl $32, %esp
	
	
	movl $5, -16(%ebp); // len;
	movl $0, -40(%ebp); // index;
	movl $0, -44(%ebp); // numarul de aparitii ale lui x in array-ul local;
	
	
	lea -36(%ebp), %esi
	xor %eax, %eax
	
	movl $7, (%esi, %eax, 4)
	addl $1, %eax
	movl $29, (%esi, %eax, 4)
	addl $1, %eax
	movl $-6, (%esi, %eax, 4)
	addl $1, %eax
	movl $29, (%esi, %eax, 4)
	addl $1, %eax
	movl $-3, (%esi, %eax, 4)

for_1:
	movl -40(%ebp), %eax
	cmp -16(%ebp), %eax
	je ex_for_1
	
	lea -36(%ebp), %esi
	movl (%esi, %eax, 4), %ebx
	
	
//	
		pushl %eax
		pushl %ebx
	pushl %ebx
	pushl $fpr
	call printf
	addl $8, %esp
	
	pushl $0
	call fflush
	addl $4, %esp
		popl %ebx
		popl %eax
//
	
	
	
	cmp 8(%ebp), %ebx
	jne next

	incl -44(%ebp)

next:	
	incl -40(%ebp)
	jmp for_1
	
ex_for_1:

//	
	pushl $fend
	call printf
	addl $4, %esp
	
	pushl $0
	call fflush
	addl $4, %esp	
//
		
	
	movl -44(%ebp), %eax
	
	addl $32, %esp
	
	
		popl %edi
		popl %esi
		popl %ebx
	
	popl %ebp
	ret


.globl main
main:
	pushl x
	call Counting
	addl $4, %esp
	
	pushl %eax
	pushl $frez
	call printf
	addl $8, %esp
	
	pushl $0
	call fflush
	addl $4, %esp
	
etexit:
	movl $1, %eax
	xor %ebx, %ebx
	int $0x80
	
	
	
// v: .long 12, 56, 34, 12, 78, 12, 12, 34, 56
