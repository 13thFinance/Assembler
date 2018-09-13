.text
.global main
main:
	mov r1, #2 //r1 <- #2
	mov r2, #2 //r2 <- #2
	cmp r2, r2 //compare r1 - r2, 2 - 2 = 0 so zero flag will be set
	beq case_equal //branch if equal, or when the zero flag is set

case_different:
	mov r0, #2 //program returns 2 if numbers in r1 and r2 are different
	b end

case_equal:
	mov r0, #1 //program return 0 if r1 and r2 hold numbers that are equal
	b end
end:
	bx lr //to see reult remember ./PROGRAM_NAME ; echo $?
