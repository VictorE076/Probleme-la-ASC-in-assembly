.data
	x: .long 15
	y: .long 5
	sum: .space 4
.text
.globl main
main:
	mov x, %eax
	mov y, %ebx
	add %ebx, %eax
	add $31, %eax
	mov %eax, sum
	//add $100, sum  		incorrect - must have at least a register
	sub %ebx, %eax
	sub %eax, sum
	sub $70, %eax
	//sub $2, sum			incorrect - must have at least a register
// definesc o eticheta data de mine, putand astfel sa execut toate instr de sus si sa 
// pun un breakpoint b in eticheta de mai jos.
etexit:
	mov $1, %eax
	mov $0, %ebx
	int $0x80

