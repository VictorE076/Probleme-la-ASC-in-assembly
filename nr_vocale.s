// Afiseaza nr de vocale dintr-un string citit;
.data
	sir: .space 202
	freads: .asciz "%[^\n]s"
	fprint: .asciz "Nr. de vocale este: %d\n"
	vocale: .asciz "AEIOUaeiou"
	len: .space 4
	nr: .long 0
.text
.globl main
main:
Citire:
	push $sir
	push $freads
	call scanf
	pop %ebx
	pop %ebx
	
	push $sir
	call strlen
	pop %ebx
	mov %eax, len
	
/*	

Afisare_len:
	push len
	push $fprint
	call printf
	pop %ebx
	pop %ebx
	
	push $0
	call fflush
	pop %ebx
	
*/

Prelucrare:
	xor %ecx, %ecx
	lea sir, %esi
	lea vocale, %edi
	
for_sir:
	cmp len, %ecx
	je Afisare
	
	xor %ebx, %ebx
	for_vc:
		cmp $10, %ebx
		je next
		
		mov (%esi, %ecx, 1), %al
		mov (%edi, %ebx, 1), %dl
		
		cmp %al, %dl
		je add_nr
		
		inc %ebx
		jmp for_vc
		
add_nr:
	incl nr		
	
next:	
	inc %ecx
	jmp for_sir


Afisare:
	push nr
	push $fprint
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
