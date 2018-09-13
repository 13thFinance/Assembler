# Module Name: Module_11_3
# Author: Felix Ferreira
# Date: 10/23/17
# Description:
#compute the largest factorial that
#can fit within a 16-bit unsigned integer

.global _main
.data
    output: .asciz "largest factorial in a 16-bit number: %hu\n"
    n: .int 1
    counter: .int 2

_main:
    #8! is our largest value, so I go above by one so that 
    #we can check that our code is working properly
    movl $9, %ecx 

    movl n, %eax #n holds our n! value

    #our multiplier, will be incremented so
    #that our calculations look like this:
    #n! = 1 * 2 * 3 * ... * n
    #instead of:
    #n! = n * ... * 3 * 2 * 1
    movl counter, %ebx 

Loop1:
    mov %eax, n #moves eax into n to save the largest factorial value
    mull %ebx #multiplies by our counter, such that n! = 1 * 2 * ... * n
    addl $1, %ebx #increments our counter by one in preparation for the next factorial
    cmpl $65535, %eax #compares our factorial to the largest 16bit values
    jae end #will end if the number is greater or equal ro
    loop Loop1 #if our factorial is not greater than or equal to it'll will loop again

end:
    #epilogue
    pushl n #push the saved value
    pushl $output #push the string format
    call _printf
    addl $8, %esp
    
    #return 0
    mov $0, %eax
    ret

