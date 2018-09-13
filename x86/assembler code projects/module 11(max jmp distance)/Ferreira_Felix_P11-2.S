# Module Name: Module_11
# Author: Felix Ferreira
# Date: 10/23/17
# Description:
#makes a loop until it breaks
#once loop is broken and does not work properly
#evaluate why it does not function properly 
#then work around the problem without using loop instructions


.global _main
.data
.text

_main:
    movl $5, %ecx
    movl $0, %eax

LoopTester:
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax
    addl %ecx, %eax #last successful instruction
    addl %ecx, %eax #breaks the loop instruction (relative offset of 129)
    jmp LoopTester
    #way to get around the loop instruction
    #subl $1, %ecx
    #cmpl $0, %ecx
    #jne LoopTester

    movl $0, %eax
    ret


