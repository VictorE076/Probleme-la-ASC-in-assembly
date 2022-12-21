//Citim matricea din terminal;
// 20 * 20 * 4 = 1600;
.data
	matrix: .space 1600
	n: .space 4
	
	i: .space 4
	j: .space 4
	
	nrMuchii: .space 4
	
	index: .space 4
	left: .space 4
	right: .space 4
	
	fscan: .asciz "%d"
	fpr: .asciz "%d "
	fend: .asciz "\n"
.text
.globl main
main:
	pushl $n
	pushl $fscan
	call scanf
	addl $8, %esp
	
	
	pushl $nrMuchii
	pushl $fscan
	call scanf
	addl $8, %esp
	
	
// for (int index = 0; index < nrMuchii; index++)
// {
// 	scanf("%d", &left);
//	scanf("%d", &right);
//	matrix[left][right] = 1;
// }
	
	movl $0, index
	
et_for:
	movl index, %ecx
	cmp nrMuchii, %ecx
	je pf_matrix
	
	pushl $left
	pushl $fscan
	call scanf
	addl $8, %esp
	
	
	pushl $right
	pushl $fscan
	call scanf
	addl $8, %esp
	
	
// trebuie sa completez acum matrix[left][right] = 1;
// left * n + right
	
	movl left, %eax
	xor %edx, %edx
	mull n
	addl right, %eax
	
	// %eax = left * n + rightcl
	
	lea matrix, %edi
	movl $1,  (%edi, %eax, 4)
	// matrix[left][right] = 1;
	
	incl index
	jmp et_for
	
	
pf_matrix:
	movl $0, i
	movl $0, j
	
for_lines:
	movl i, %ecx
	cmp n, %ecx
	je etexit

	movl $0, j
	for_columns:
		movl j, %ecx
		cmp n, %ecx
		je cont
		
		// i * n + j; 
		
		
		movl i, %eax
		xor %edx, %edx
		mull n
		addl j, %eax
		
		lea matrix, %edi
		movl (%edi, %eax, 4), %ebx
		
		// afisez matrix[i][j];
		
		pushl %ebx
		pushl $fpr
		call printf
		addl $8, %esp
		
		pushl $0
		call fflush
		addl $4, %esp
		
		
		incl j
		jmp for_columns
		
cont:

	pushl $fend
	call printf
	addl $4, %esp
	
	pushl $0
	call fflush
	addl $4, %esp
	

	incl i
	jmp for_lines
		
	
etexit:
	movl $1, %eax
	xor %ebx, %ebx
	int $0x80
