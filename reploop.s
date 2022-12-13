.data
	n: .long 8
.text
.globl main
main:
	mov $0, %eax
	mov n, %ecx
	dec %ecx
	// sub $1, %ecx
	
	
	
et_for:
	add %ecx, %eax
	
	// imul %ecx
	
	loop et_for
	
	
etexit:
	mov $1, %eax
	mov $0, %ebx
	int $0x80


// for (%ecx = n - 1; %ecx >= 0; %ecx--) { %eax += %ecx; }
