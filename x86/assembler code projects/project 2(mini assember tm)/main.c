// Module Name : project_2_main.c
// Description: Main module, tests simpleAssembler function
// Date: 12/12/17
// Author: Lem Davis & Felix Ferreira

#include <stdio.h>
#include <string.h>

/*
lod imm32 ; Load a 32-bit immediate value
lod mem32 ; Load a 32-bit value from memory
add imm32 ; Add a 32-bit immediate
add mem32 ; Add a 32-bit value from memory
sub imm32 ; Subtract a 32-bit immediate
sub mem32 ; Subtract a 32-bit value from memory
sto mem32 ; Stores the result into a single memory location
*/
// Prototype
int simpleAssembler(char** linesOfCode, int lineCount, int* memory);

//-------------------------------------------------
int main()
{
	int memory[256];
	// Immediate values are hex numbers without a 0x in front.
	// Memory address are hex numbers with the 0x in front.
	char *linesOfCode[] = {
		"lod 1",			// mem32 0x
		"sto 0x0",			// imm32
		"add 1",			// imm32
		"add 0x0",			// mem32
		"sub 1"	,                       // imm32
                "sub 0x0"                       // mem32
                "lod 0x1"                       // mem32 0x
	};

	// Clear memory to all zeros
	memset(memory, 0, 256 * sizeof(int));

	int ret = simpleAssembler(linesOfCode, 5, memory);
        
	if (ret != 0)
		printf("simpleAssembler error\n");

	return 0;
}