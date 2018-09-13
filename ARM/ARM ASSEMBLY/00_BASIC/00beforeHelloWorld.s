/*First program*/
//this is a comment
/*this is also a comment*/
.global main //main is our entry point and MUST be global

main: /*this is main*/
	mov r0, #2 /*put the literal number two, denoted by #, inside register r0*/
	bx lr /*return from main*/
