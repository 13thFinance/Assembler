//ldr and variable example
//.data is a place for variables
//variables must be aligned(ensures we get enough bytes)
//variables must be given an address using labels
//variables must be given a variable size

.data
.balign 4 //ensures variable is 4 bytes
myvar1://label that holds data
	.word 3 //word is int, so all this is in c: int myvar1 = 3;
myvar2:
	.word 4

//.text section is the code section
.text
//used to link .text and .data memory
myvar1Address: .word myvar1
myvar2Address: .word myvar2

.balign 4 //makes sure program is using 4 bytes
.global main

main:
	//load a value from memory into a register, note: [] is the dereferencing
	//operators
	ldr r1, myvar1Address // r1 <- &myvar1
	ldr r1, [r1] // r1 = *r1    ie. r1 = myvar1

	ldr r2, myvar2Address
	ldr r2, [r2]

	add r0, r1, r2 // r0 <- r1 + r2
	bx lr
