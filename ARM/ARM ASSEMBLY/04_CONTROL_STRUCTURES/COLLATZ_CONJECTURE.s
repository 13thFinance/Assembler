//3n+1
//Let’s make another example a bit more complicated. This is the famous 
//3n + 1 problem also known as the Collatz conjecture. 
//Given a number n we will divide it by 2 if it is even and multiply it by 3 and add one if it is odd.

//Collatz conjecture states that, for any number n, 
//repeatedly applying this procedure will eventually give us the number 1

.text
.global main

main:
	mov r1, #123
	mov r2, #0

loop:
	cmp r1, #1
	beq end	//does r1 == 1? If it does, jump to end

	and r3, r1, #1 //r3 <- r1 & 1, if r1 is odd r3 will be 1, if r1 is even r3 will be 0. Think of the binary data
	cmp r3, #0 //setting flags for even, r3 - 0 = 0 if even, r3 - 0 != 0 if odd
	bne odd //if r3 != 0, jump to odd
even:// divide by 2
	mov r1, r1, ASR #1 //r1 <- (r1 >> 1), shift r1 to the right by one bit(divide by two basically)
	b endLoop
odd: // multiply by 3 and add 1
	add r1, r1, r1, LSL #1 //r1 <- r1 + (r1 << 1), into r1 add r1 that has been shifted once to the left. so r1 + r1 * 2, which is r1 <- r1 * 3
	add r1, r1 , #1 // r1 <- r1 + 1
endLoop:
	add r2, r2, #1 // increment counter(program is using r2 as a counter storing the amount of loops its run)
	b loop //jump back up to loop label
end:
	mov r0, r2 //move the counter into the r0
	bx lr//r0 should be 46
