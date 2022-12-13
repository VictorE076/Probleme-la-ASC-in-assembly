// Suma a doua numere prin intermediul unei proceduri(functie);
.data
	x: .long 15
	y: .long 24
	z: .space 4
.text
.globl main

suma:
	// %esp:(<adr. intoarcere>)(x)(y)
	// aplic conventiile:
	// 1 -> punem %ebp pe stiva
	// 2 -> il facem pointer in cadrul de apel
	
	pushl %ebp
	// %esp:(%ebp vechi)(<adr. intoarcere>)(x)(y)
	movl %esp, %ebp
	// %esp:%ebp:(%ebp vechi)(<adr. de intoarcere>)    (x)     (y)
	// 		0(%ebp)		4(%ebp)         8(%ebp)  12(%ebp)
	
	movl 8(%ebp), %eax
	// in momentul acesta, %eax contine valoarea lui x;
	
	movl 12(%ebp), %ecx
	//in momentul acesta, %ecx contine valoarea lui y;
	
	// trebuie sa calculez %eax = x + y = %eax + %ecx
	
	addl %ecx, %eax
	// in acest moment, %eax-ul contine rezultatul
	// trebuie sa fac o restaurare a cadrului de apel
	popl %ebp
	// %esp:(<adr. intoarcere>)(x)(y)
	
	ret
	//return %eax
	//instructiunea "ret" sare la "adr. intoarcere" si face si "pop" de pe stiva;
	//Acm. stiva e formata doar din x si y;
	
main:
	// vreau sa apelez suma(x, y);
	
	pushl y
	pushl x
	call suma
	popl %ebx
	popl %ebx
	
	// fac "pop" in %ebx sau in orice registru care nu afecteaza programul
	// in cazul curent, nu pot face "popl %eax";
	// pentru ca in %eax stochez suma celor doua numere (x + y);
	
	movl %eax, z
	
etexit:
	movl $1, %eax
	xor %ebx, %ebx
	int $0x80

