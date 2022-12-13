// Problema lab 4:
//
.data
	end: .asciz "\n"
	fread: .asciz "%d"
	fr1: .asciz "%d%d"
	ff: .asciz "%d\n"
	n: .space 4
	x: .space 4
	v: .space 404
	a: .space 4
	b: .space 4
	sum: .space 4
.text
.globl main
main:
Citire:
	push $n
	push $fread
	call scanf
	pop %ebx
	pop %ebx
	
	lea v, %esi
	xor %ecx, %ecx
for_c:
	cmp n, %ecx
	je next
	
	pusha
	
	push $x
	push $fread
	call scanf
	pop %ebx
	pop %ebx
	
	popa
	
	mov x, %eax
	mov %eax, (%esi, %ecx, 4)
	
	inc %ecx
	jmp for_c

next:
	push $b
	push $a
	push $fr1
	call scanf
	pop %ebx
	pop %ebx
	pop %ebx
Prel:

	mov $0, %eax
	mov %eax, sum
	mov a, %ecx
	incl b
for_f:
	cmp b, %ecx
	je Af
	
	mov (%esi, %ecx, 4), %ebx
	add %ebx, %eax
	
	inc %ecx
	jmp for_f
Af:
	mov %eax, sum

	push sum
	push $ff
	call printf
	pop %ebx
	pop %ebx
	
	push $0
	call fflush
	pop %ebx

etexit:
	mov $1, %eax
	xor %ebx, %ebx
	int $0x80



/*

	push $0
	call fflush
	pop %ebx
	

*/




/*

Nr_caractere_strlen:
	
	push $...
	call strlen
	pop %ebx
	mov %eax, ...
	
*/




/*
	decl n
	incl n
	// n este variabila;
*/



/*

Afisare_end:	
	push $end
	call printf
	pop %ebx
	
	push $0
	call fflush
	pop %ebx

*/
