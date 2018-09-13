//01add.s
.global main

main:
	mov r1, #3 //move into r1 the number 3
	mov r2, #4 //movw into r2 the number 4
	add r0, r1, r2 //r0 <- r1 + r2
	bx lr
