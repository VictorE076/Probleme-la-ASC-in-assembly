// Apel functie printf
.data
	formatPrint: .asciz "%d : %s\n"
	strr: .asciz "Doar un_test !"
.text
.globl main
main:
Afisare:
	push $strr
	push $177
	push $formatPrint
	// printf("%d : %d", 177, strr); in C standard.
	
	call printf
	
	pop %ebx
	pop %ebx
	pop %ebx
	

	push $0
	call fflush 
	// fflush(NULL); in C standard.
	pop %ebx


	
etexit:
	mov $1, %eax
	xor %ebx, %ebx
	int $0x80
