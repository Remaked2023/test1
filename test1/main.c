#include <stdio.h>
#include "add.h"

int main(){
	int x = 2, y = 14;

	printf("x = %d, y = %d, x + y = %d\n", x, y, add(x, y));
	return 0;
}

