// Se citeste un sir. Sa se transforme literele mici in litere mari si invers.  
.data
	dif: .space 4
	len: .space 4
	sir: .space 200
	fread: .asciz "%[^\n]s"
	fprint: .asciz "%s\n"
	ff: .asciz "%d\n"
.text
.globl main
main:
	mov $'a', %eax
	sub $'A', %eax
	mov %eax, dif
	
Citire:
	push $sir
	push $fread
	call scanf
	pop %ebx
	pop %ebx
	
Lungime:
	push $sir
	call strlen
	pop %ebx
	mov %eax, len
	
	
	push len
	push $ff
	call printf
	pop %ebx
	pop %ebx
	
	push $0
	call fflush
	pop %ebx


Prelucrare:
	lea sir, %esi
	xor %ecx, %ecx
	
for_sir:
	cmp len, %ecx
	je Afisare
	
	mov (%esi, %ecx, 1), %al
	
lM:	
	cmp $'A', %al
	jl lm
	
	cmp $'Z', %al
	jg lm
	
	add dif, %al
	mov %al, (%esi, %ecx, 1)
	jmp next

lm:
	cmp $'a', %al
	jl next
	
	cmp $'z', %al
	jg next
	
	sub dif, %al
	mov %al, (%esi, %ecx, 1)

next:	
	inc %ecx
	jmp for_sir
	
Afisare:
	
	push $sir
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
	
	
