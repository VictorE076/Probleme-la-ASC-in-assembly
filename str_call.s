// Citirea si afisarea unui string;
.data
	n: .space 4
	sh: .space 100
	fread: .asciz "%[^\n]s"
	fprintn: .asciz "Numarul de caractere este: %d\n"
	fprints: .asciz "Sirul citit este: %s\n"
	// tr: .asciz "\0"
.text
.globl main
main:
Citire_Sir:

	push $sh
	push $fread
	call scanf
	pop %ebx
	pop %ebx

/*
Nr_caractere_for:

	lea sh, %esi
	xor %ecx, %ecx
	xor %eax, %eax
for_c:
	
	mov (%esi, %ecx, 1), %al
	cmp $0, %al //terminatorul de sir - "\0";
	je Afisare_n
	
	inc %ecx
	jmp for_c
*/


Nr_caractere_strlen:
	
	push $sh
	call strlen
	pop %ebx
	
	mov %eax, n	

Afisare_n:
	
	// mov %ecx, n
	
	push n
	push $fprintn
	call printf
	pop %ebx
	pop %ebx
	
	push $0
	call fflush
	pop %ebx
	
Afisare_Sir:
	
	push $sh
	push $fprints
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
