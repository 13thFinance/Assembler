.text
.global main

main:
	mov r1, #0
	mov r2, #1

loop:
	cmp r2, #22 //compare r2 to 22, so r2 - 22, 1 - 22 = -21, zero flag is not set
	bgt end //branch if greater than, if r2 > 22
	add r1, r1, r2 // r1 <- r1 + r2
	add r2, r2, #1 // r2 <- r2 + 1 ; increment r2 by 1
	b loop

end:
	mov r0, r1 //r0 <- r1 store the result of the loop addition into r0 and return it
	bx lr
