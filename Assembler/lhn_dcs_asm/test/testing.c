#include <stdio.h>
#include <stdlib.h>


void func(char c , int x, char *s, long y, double z){
	printf("%lu\n,", __builtin_frame_address(1));
	puts("Done.");
	printf("%lu\n",sizeof(c));
	printf("%lu\n",sizeof(x));
	printf("%lu\n",sizeof(s));
	printf("%lu\n",sizeof(y));
	printf("%lu\n", sizeof(z));
	printf("%lu\n", sizeof(puts("Done.")));
	printf("%lu\n", sizeof("Done."));
	printf("%lu\n,", __builtin_frame_address(1));
}

int main(){
	char c;
	int x; 
	char *s;
	long y;
	double z;
	c = "D";
	x = 2;
	s = "a";
	y = 1.2;
	z = 1.4;
	printf("%lu\n,", __builtin_frame_address(1));
	func(c , x, s, y, z);
	printf("%lu\n,", __builtin_frame_address(1));
	printf("%lu\n",sizeof(func(c , x, s, y, z)) );
}
