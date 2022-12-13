// Matrice problema 1 - Afisarea unei matrice;
.data
	lines: .long 3
	columns: .long 4
	lineIndex: .space 4
	columnIndex: .space 4
	
	matrix: .long 10, 20, 30, 40
		.long 50, 60, 70, 80
		.long 90, 100, 110, 120
	
	formatInt: .asciz "%d "
	newLine: .asciz "\n"
.text
.globl main
main:
	lea matrix, %edi
	movl $0, lineIndex
	
for_lines:
	movl lineIndex, %ecx
	cmp %ecx, lines
	je etexit
	
	// incepe al doilea for
	
	movl $0, columnIndex
	
	for_columns:
		movl columnIndex, %ecx
		cmp %ecx, columns
		je cont_for_lines
		
		// prelucrare
		// elementul curent este la: lineIndex * columns + columnIndex
		// relativ la adresa de inceput a matricei, adk relativ la %edi;
		// toate elementele sunt de tip .long = 4 bytes;
		
		movl lineIndex, %eax
		mull columns
		// %eax = %eax * columns
		addl columnIndex, %eax
		
		movl (%edi, %eax, 4), %ebx
		// %ebx este elem. curetn din matrice de la pozitia (lineIndex, columnIndex)
		// vreau sa afisez %ebx
Afisare:	
		pusha	
		push %ebx
		push $formatInt
		call printf
		pop %ebx
		pop %ebx
		
		pushl $0
		call fflush
		pop %ebx
		popa		
		
Next:
		addl $1, columnIndex
		jmp for_columns
		
		
		
	
cont_for_lines:	
	
	push $newLine
	call printf
	pop %ebx
	
	pushl $0
	call fflush
	pop %ebx
	
	
	addl $1, lineIndex
	jmp for_lines
	
	
etexit:
	mov $1, %eax
	xor %ebx, %ebx
	int $0x80


// for(int lineIndex = 0; lineIndex < lines; lineIndex++)
// 	for(int columnIndex = 0; columnIndex < columns; columnIndex++)
//		...
