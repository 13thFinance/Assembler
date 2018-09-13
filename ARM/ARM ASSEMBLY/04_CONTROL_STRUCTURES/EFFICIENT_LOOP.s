//add numbers 1-22

//var = 0;
//for(int i = 0; i <= 22; i++)
//{
//	var += i;
//}
//return var;


.text
.global main
main:
	mov r1, #0
	mov r2, #1
	b checkLoop //unconditional jump to end of loop

loop:
	add r1, r1, r2 // r1 <- r1 + r2
	add r2, r2, #1 // r2 <- r2 + 1
checkLoop:
	cmp r2, #22
	ble loop //jump if less than or equal to, r2 <= 22, jump to top of loop
end:
	mov r0, r1 //r0 <- r1, store result into r0
	bx lr
