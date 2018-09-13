/*
#-----------------------------------------------------------------------------------
Module: 8
Name: Felix Ferreira
Date: 9/11/17
Description:
    Write an assembly language program that prompts the user for four signed 16-bit 
    integers, computes the following equation, and displays the result.

    Result = A - B + C - D

Receives: 4 16bit signed integers
Returns: The result of the desired formula
#-----------------------------------------------------------------------------------  
*/


.data
#variables for our calculations
A: .short 0x0000
B: .short 0x0000
C: .short 0x0000
D: .short 0x0000
Result: .short 0x0000

QueryA: .asciz "Input A: \n"
QueryB: .asciz "Input B: \n"
QueryC: .asciz "Input C: \n"
QueryD: .asciz "Input D: \n"

Scan16bitSigned: .asciz "%hd"
Output: .asciz "Result is equal to %d\n"

.text
.global _main     

_main:

    ############################grabs values###################################
    #prints out a query for a 16bit signed integer
    push $QueryA
    call _printf
    addl $4, %esp
    #gets the A value
    push $A
    push $Scan16bitSigned
    call _scanf
    addl $8, %esp

    #prints out a query for a 16bit signed integer
    push $QueryB
    call _printf
    addl $4, %esp
    #gets the B value
    push $B
    push $Scan16bitSigned
    call _scanf
    addl $8, %esp

    #prints out a query for a 16bit signed integer
    push $QueryC
    call _printf
    addl $4, %esp
    #gets the C value
    push $C
    push $Scan16bitSigned
    call _scanf
    addl $8, %esp

    #prints out a query for a 16bit signed integer
    push $QueryD
    call _printf
    addl $4, %esp
    #gets the D value
    push $D
    push $Scan16bitSigned
    call _scanf
    addl $8, %esp
################################################################################
    
    #does the math: Result = A - B + C - D
    movw A, %ax
    subw B, %ax
    addw C, %ax
    subw D, %ax
    movw %ax, Result
    
    
    #prints the Result value in decimal
    movsxw Result, %eax
    push %eax
    push $Output 
    call _printf   
    addl $8, %esp
    
    #return 0
    mov $0, %eax       
    ret


