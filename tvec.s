// Afisare inversa a stringului citit din terminal.
.data
	s: .space 100
	t: .space 100
	nr: .space 4
	en: .asciz "\n"
	tr: .asciz "\0"
	

.text
.globl main
main:
citire:

	mov $3, %eax
	mov $1, %ebx
	mov $s, %ecx
	mov $100, %edx
	int $0x80
	
	xor %ecx, %ecx
	lea s, %esi
	
for_c:
	mov (%esi, %ecx, 1), %al
	cmp en, %al
	je prelucrare
	
	inc %ecx
	jmp for_c
	
prelucrare:
	
	// mov s, %eax
	// mov %eax, t
	
	// dec %ecx
	
	mov %ecx, nr
	xor %ecx, %ecx
	lea t, %edi
	
for_p:
	cmp nr, %ecx
	je tt
	
	mov nr, %eax
	dec %eax
	sub %ecx, %eax
	
	mov (%esi, %eax, 1), %bl
	mov %bl, (%edi, %ecx, 1)

	inc %ecx
	jmp for_p
	
tt:

	mov en, %al
	mov %al, (%edi, %ecx, 1)
	
	inc %ecx
	mov tr, %al
	mov %al, (%edi, %ecx, 1)
	
	

afisare:
	
	mov $4, %eax
	mov $1, %ebx
	mov $t, %ecx
	mov $100, %edx
	int $0x80
	
etexit:
	mov $1, %eax
	xor %ebx, %ebx
	int $0x80
	
