// Sa se afiseze pe ecran doar acele nr. din vector care sunt multiplii de x;
.data
	x: .space 4
	el: .space 4
	n: .space 4
	nmul: .space 4
	v: .space 404
	vmul: .space 404
	fread: .asciz "%d"
	frv: .asciz "%d%d"
	fprint: .asciz "%d "
	end: .asciz "\n"
	eb: .space 4
	
.text
.globl main
main:
Citire_vl:
	push $n
	push $x
	push $frv
	call scanf
	pop %ebx
	pop %ebx
	pop %ebx

Citire_vc:
	xor %ecx, %ecx
	lea v, %esi
	
for_vc:
	cmp n, %ecx
	je Prel
	
	pusha
	push $el
	push $fread
	call scanf
	pop %ebx
	pop %ebx
	popa
	
	mov el, %eax
	mov %eax, (%esi, %ecx, 4)
	
	inc %ecx
	jmp for_vc
	
Prel:
	xor %ecx, %ecx
	xor %ebx, %ebx
	lea vmul, %edi
	
for_vc2:
	cmp n, %ecx
	je Afisare
	
	mov (%esi, %ecx, 4), %eax
	xor %edx, %edx
	mov %ebx, eb
	mov x, %ebx
	
	idiv %ebx
	mov eb, %ebx
	
	cmp $0, %edx
	jne next

	mov (%esi, %ecx, 4), %eax
	mov %eax, (%edi, %ebx, 4)
	inc %ebx
	
next:	
	inc %ecx
	jmp for_vc2
	
Afisare:

	mov %ebx, nmul
	xor %ecx, %ecx

for_af:
	cmp nmul, %ecx
	je Afisare_end
	
	pusha
	push (%edi, %ecx, 4)
	push $fprint
	call printf
	pop %ebx
	pop %ebx
	
	push $0
	call fflush
	pop %ebx
	popa
	
	inc %ecx
	jmp for_af

Afisare_end:	
	push $end
	call printf
	pop %ebx
	
	push $0
	call fflush
	pop %ebx
	
etexit:
	mov $1, %eax
	xor %ebx, %ebx
	int $0x80
