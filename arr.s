.data
	v: 	.long 15, 27, 4, 132, 2, 12, 3
	n: 	.long 7
	sum: 	.space 4
.text
.globl main
main:
	lea v, %edi
	// %edi retine adresa de inceput a array - ului
	mov $0, %eax
	mov $0, %ecx


et_for:
	cmp %ecx, n
	je etexit
	
	// mov (%edi, %ecx, 4), %ebx
	
	// v[%ecx] = %ebx
	
	add (%edi, %ecx, 4), %eax
	
	
	//  imul %ebx
	
	
	inc %ecx
	jmp et_for
		
	
etexit:

	mov %eax, sum
	
	mov $1, %eax
	xor %ebx, %ebx
	
	// mov $0, %ebx
	
	int $0x80


// Calculam suma din array-ul v

// for(%ecx = 0; %ecx < n; %ecx++) { %eax+=v[%ecx]; }
