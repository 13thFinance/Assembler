#include <stdio.h>
#include <stdlib.h>

// C prototypes for the functions written in assembly language
// The first should use indirect addressing
int multiplyArrays1(void* arrayA, void* arrayB, int elementSize, int count);
// The second should use indexed addressing
int multiplyArrays2(void* arrayA, void* arrayB, int elementSize, int count);

// Main -------------------------------------------------------------------
int main()
{
	// 8-bit arrays
	char array8_1[] = { 1, 2, 3, 4, 5 };
	char array8_2[] = { 5, 4, 3, 2, 1 };
	char sum8 = 0;
	// 16-bit arrays
	short array16_1[] = { 1, 2, 3, 4, 5 };
	short array16_2[] = { 20, 21, 32, 43, 54 };
	short sum16 = 0;
	// 32-bit arrays
	int array32_1[] = { 1, 2, 3, 4, 5 };
	int array32_2[] = { 18, 28, 38, 48, 58 };
	int sum32 = 0;

	// 8-bit test------------------------
	// Compute 8-bit result in C first
	for (int i = 0; i < 5; i++) {
		sum8 += (array8_1[i] * array8_2[i]);
	}
	printf("The C result for char arrays = %d\n", sum8);
	// Now try the assembly functions
	sum8 = multiplyArrays1(array8_1, array8_2, 1, 5);
	printf("The first assembly result for char arrays = %d\n", sum8);
	sum8 = multiplyArrays2(array8_1, array8_2, 1, 5);
	printf("The second assembly result for char arrays = %d\n", sum8);
	printf("\n");

	// 16-bit test------------------------
	// Compute 16-bit result in C first
	for (int i = 0; i < 5; i++) {
		sum16 += (array16_1[i] * array16_2[i]);
	}
	printf("The C result for short arrays = %d\n", sum16);
	// Now try the assembly functions
	sum16 = multiplyArrays1(array16_1, array16_2, 2, 5);
	printf("The first assembly result for short arrays = %d\n", sum16);
	sum16 = multiplyArrays2(array16_1, array16_2, 2, 5);
	printf("The second assembly result for short arrays = %d\n", sum16);
	printf("\n");

	// 32-bit test------------------------
	// Compute 32-bit result in C first
	for (int i = 0; i < 5; i++) {
		sum32 += (array32_1[i] * array32_2[i]);
	}
	printf("The C result for int arrays = %d\n", sum32);
	// Now try the assembly functions
	sum32 = multiplyArrays1(array32_1, array32_2, 4, 5);
	printf("The first assembly result for int arrays = %d\n", sum32);
	sum32 = multiplyArrays2(array32_1, array32_2, 4, 5);
	printf("The second assembly result for int arrays = %d\n", sum32);

	return 0;
}
