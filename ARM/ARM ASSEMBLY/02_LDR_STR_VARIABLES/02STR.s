//store example

//data section(variables)
.data
.balign 4
myvar1:
	.word 0
.balign 4
myvar2: 
	.word 0

//code section
.text
.balign 4

myvar1Address: .word myvar1
myvar2Address: .word myvar2

.global main

main:
	//myvar1 = 3
	ldr r1, myvar1Address // r1 <- &myvar1
	mov r3, #3 // r3 <- 3
	str r3, [r1] // IMPORTANT: *r1 <- r3

	ldr r2, myvar2Address // r2 <- &myvar2
	mov r3, #4 //r3 <- 4
	str r3, [r2]// *r2 <- r3
	
	//same as above
	ldr r1, myvar1Address // r1 <- &myvar1(which holds 3 now)
	ldr r1, [r1] // r1 <- *r1     //r1 = 3 right here
	ldr r2, myvar2Address // r2 <- &myvar2(which holds 4 now)
	ldr r2, [r2] // r2 <- *r2     //r2 = 4

	add r0, r1, r2 //r0 <- r1 + r2
	bx lr
