//Construim un array mic in procedura si calculam numarul de aparitii a unui numar dat in array-ul
//respectiv (+ afisare);
.data
	n: .long 9
	
	fpr: .asciz "%d "
	fend: .asciz "\n"
.text
Counting:
	pushl %ebp
	movl %esp, %ebp
	
		pushl %ebx
		pushl %esi
		pushl %edi
		
		
	///
		
		
		popl %edi
		popl %esi
		popl %ebx
	
	popl %ebp
	ret


.globl main
main:
etexit:
	movl $1, %eax
	xor %ebx, %ebx
	int $0x80
	
	
	
// v: .long 12, 56, 34, 12, 78, 12, 12, 34, 56
