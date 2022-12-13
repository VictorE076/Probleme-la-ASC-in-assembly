.data
	n: .long 5
.text
.globl main
main:
	mov $0, %eax
	// %eax pentru SUMA
	mov $0, %ecx
	// %ecx pentru "i"-ul curent din "for"
	
et_for:
	cmp %ecx, n
	je et_exit
	
	add %ecx, %eax
	add $1, %ecx 
	// inc %ecx
	
	jmp et_for
	
et_exit:
	mov $1, %eax
	mov $0, %ebx
	int $0x80
	
