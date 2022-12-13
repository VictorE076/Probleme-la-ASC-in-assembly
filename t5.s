.data
	x: .long 19
	r1: .long 1
	r2: .long 1
.text
.globl main
main:
vr1:   

/*
	mov $0, %ebx
	mov x, %ecx
	sub $1, %ecx
	cmp $0, %ecx
	je npr
	
et_for_1:
	mov x, %eax
	mov $0, %edx
	
	idiv %ecx
	
	cmp $0, %edx
	je ett
	jmp ett_2

ett:
	inc %ebx	
ett_2:
	
	loop et_for_1
	
	cmp $1, %ebx
	je pr
	jmp npr

pr:
	jmp etexit
npr:
	mov r1, %eax
	dec %eax
	mov %eax, r1
	jmp etexit
*/

vr2:
	mov $0, %ebx
	mov x, %ecx
	sub $1, %ecx
	cmp $0, %ecx
	je npr2
	
et_for_2:
	cmp $0, %ecx
	je ef
	
	mov x, %eax
	mov $0, %edx
	
	idiv %ecx
	
	cmp $0, %edx
	je ett2
	jmp ett_22

ett2:
	inc %ebx	
ett_22:
	dec %ecx
	jmp et_for_2
	
ef:
	
	cmp $1, %ebx
	je pr2
	jmp npr2

pr2:
	jmp etexit
npr2:
	mov r2, %eax
	dec %eax
	mov %eax, r2
	jmp etexit
	

etexit:
	mov $1, %eax
	mov $0, %ebx
	int $0x80
