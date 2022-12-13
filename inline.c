#include <stdio.h>
int x;
int main()
{
	x += 10;	
	
	__asm__
	(
	"pusha;"
	
	"mov x, %eax;"
	"inc %eax;"
	"mov %eax, x;"
	
	"popa;"
	);
	
	x += 23;
	printf("%d\n", x);
	// printf("%d\n", x + 10);
	return 0;
}
