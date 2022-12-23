// Suma cifrelor unui numar folosing procedura;
// Procedura returneaza prin %eax suma_cif;
.data
	x: .long 1062363947
	f_pr: .asciz "%d\n"
.text

// Registri de restaurat: %ebx, %ebp, %esp, %esi, %edi;
// Registri care nu sunt restaurati: %eax, %ecx, %edx;

suma_cif:
	// %esp:(<adr. de intoarcere>)(x)
		pushl %ebp
	// %esp:(%ebp vechi)(<adr. intoarcere>)(x)
		movl %esp, %ebp
	// %esp:%ebp:(%ebp vechi)(<adr. intoarcere>)(x)
	
	movl 8(%ebp), %eax
	// while(x != 0)
	// {
	// 	sum += x % 10;
	// 	x/=10;
	// }
	
	movl $10, %ecx
		pushl %ebx
	// %esp:(%ebx vechi)%ebp:(%ebp vechi)(<adr. intoarcere>)(x)
	
	xor %ebx, %ebx
	
et_while:
	cmp $0, %eax
	je et_exit_suma_cif
	
	// div op -> (%edx, %eax) = (%edx, %eax) / op;
	// unde %edx este restul, iar %eax devine catul impartirii;
		
	xor %edx, %edx
	divl %ecx
	// %edx = %eax % 10 - cifra curenta;
	// %eax = %eax / 10;
	addl %edx, %ebx
	
	jmp et_while	
	
et_exit_suma_cif:
	movl %ebx, %eax
		popl %ebx
	
		popl %ebp
		ret
.globl main

main:
	pushl x
	call suma_cif
	addl $4, %esp
	// avem acum rezultatul in %eax;
	
	pushl %eax
	pushl $f_pr
	call printf
	addl $8, %esp
	
	pushl $0
	call fflush
	addl $4, %esp
etexit:
	movl $1, %eax
	xor %ebx, %ebx
	int $0x80
