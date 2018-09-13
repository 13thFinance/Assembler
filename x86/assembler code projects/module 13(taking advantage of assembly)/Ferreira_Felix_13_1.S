# Module Name: Module 13: Binary Multiplication
# Author: Felix Ferreira
# Date: 11/15/17
# Description:

#Write a program that multiplies any unsigned 32-bit integer by 
#EAX, using only shifting and addition. We will assume that the 
#product is never larger than 32 bits. One possible approach is 
#to use a loop to shift the multiplier to the right, keeping track of the number
# of shifts that occur before the Carry flag is set. The resulting shift count 
#can then be applied to the SHL instruction, using the multiplicand as the 
#destination operand. Then, the same process must be repeated until you find the
# last 1 bit in the multiplier. Allow the user to input the values for both the 
#multiplier and the multiplicand.

.global _main

.data
    multiplier: .int 0
    multiplicant: .int 0
    product: .int 0
    shifts: .int 0
    
    prompt1: .asciz "Input multiplicant: "
    prompt2: .asciz "input multiplier: "
    input: .asciz "%d"
    output: .asciz "%d x %d = %d"

_main:
    #get user multiplicant
    pushl $prompt1 #push the string format
    call _printf
    addl $4, %esp

    pushl $multiplicant
    pushl $input
    call _scanf
    addl $8, %esp
    
    #get user multiplier
    pushl $prompt2 #push the string format
    call _printf
    addl $4, %esp

    pushl $multiplier
    pushl $input
    call _scanf
    addl $8, %esp

    #moves the multiplier into eax
    movl multiplier, %eax
    #moves the multiplicant into ebx
    movl multiplicant, %ebx

    #this will be our counter for our loop, 32 for 32 bit integer
    movl $32, %ecx 

begin:
    #checks if the last bit is 1
    addl $1, shifts
    shrl $1, %eax
    jc continue #checks if the carry out bit was 1
    
    loop begin #does no computation if carried out bit is 0, decrements outer loop count
    jmp end #once outer loop breaks, go to end

continue:
    movl %ecx, %edx #save outside loop counter
    movl shifts, %ecx #set inside loop counter
    
    #we subtract 1 here from shift to account for the initial shift
    #since we cant check the carry flag before we shift, this is the 
    #workaround
    subl $1, %ecx 
    jz skip #ecx cant be zero at the start of a loop, which will happen at the start

shiftLoop:
    shll $1, %ebx
    loop shiftLoop
    
skip:
    #restore outside loop counter
    movl %edx, %ecx
    #update product
    addl %ebx, product
    #reset multiplicant
    movl multiplicant, %ebx
    loop begin

end:
    #print the result
    pushl product
    pushl multiplier
    pushl multiplicant
    pushl $output
    call _printf
    addl $16, %esp
    
    #return 0
    movl $0, %eax
    ret
