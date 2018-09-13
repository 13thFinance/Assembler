# Module Name: Programming Project 1
# Author: Felix Ferreira
# Date: 11/6/17
# Description:
#compute the largest factorial that
#can fit within a user defined sign/unsigned 8/16/32 bit number

.global _max_factorial

.data
    #user defined variables
    #signedChoice == 1 if user want to check signed
    #signedChoice == 0 if user want to check unsigned
    signedChoice: .int 0
    bits: .int 32

    #variables used for computations
    num: .int 1

    #numeric constants (we havent been shown how to properly do these)
    byte: .byte 8
    short: .short 16
    int: .int 32
    
#code follows this structure
#
#unsigned functions
#function start
#function end
#signed functions
#
#done this way to account for the maximum jmp offset limit

unsigned: #for unsigned check the carry sign
    #send the code down the right path depending on it's number of bits
    movl bits, %eax #moves the user defined bit into eax for comparison
    cmpb byte, %al #checks if the user want to check 8 bits
    je unsigned8bit
    cmpw short, %ax #checks if the user wants to check 16 bits
    je unsigned16bit
    cmpl int, %eax #checks if the user wants to check 32 bits
    je unsigned32bit
    jmp end #if improper input, exit

unsigned8bit: #calculates the largest factorial that can fit in 8 bits unsigned
    movl num, %eax #moves 1 into eax at the start

unsigned8bitloop:
    mulb num #since we're checking 8 bits unsigned we have to do an unsigned 8 bit multiplication: mulb
    jc end #since were checking unsigned we have to stop when the carry flag gets triggered
    addl $1, num #if the carry flag isn't triggered, increment num to calculate the next factorial
    jmp unsigned8bitloop #keep looping until the carry flag is set

unsigned16bit: #calculates the largest factorial that can fit in 16 bits unsigned
    movl num, %eax
    
unsigned16bitloop:
    mulw num #since we're checking 16 bits unsigned we have to do an unsigned 16 bit multiplication: mulw
    jc end
    addl $1, num
    jmp unsigned16bitloop

unsigned32bit: #calculates the largest factorial that can fit in 32 bits unsigned
    movl num, %eax

unsigned32bitloop:
    mull num #since we're checking 32 bits unsigned we have to do an unsigned 32 bit multiplication: mull
    jc end
    addl $1, num
    jmp unsigned32bitloop

#by having our function being in the middle we can have jmp instructions
#which save program space and maximize the whole point of us ever using assembly
_max_factorial: 
    #prologue
    pushl %ebp
    movl %esp, %ebp

    #reads in the user constraints
    movl 8(%ebp), %eax #if they want signed/unsigned
    movl %eax, signedChoice
    movl 12(%ebp), %eax #and the number of bits they want to check
    movl %eax, bits

    #reset eax
    movl $0, %eax

    #does our first check in order to
    #branch the program path depending if the calculations
    #checks for signed or unsigned
    cmpl $0, signedChoice
    je unsigned
    jne signed

#have end function be in the middle to keep relatative
#offset from signed and unsigned instructions closer
end:
    #reset function code
    movl num, %eax
    subl $1, %eax
    movl $1, num

    #epilogue
    movl %ebp, %esp
    popl %ebp
    ret

signed: #for signed check overflow flag
    #send the code down the right path depending on it's number of bits
    movl bits, %eax
    cmpb byte, %al
    je signed8bit
    cmpw short, %ax
    je signed16bit
    cmpl int, %eax
    je signed32bit
    jmp end

signed8bit: #calculates the largest factorial in an 8 bit signed 
    movl num, %eax

signed8bitloop:
    imulb num #since we're checking 8 bit signed we have to do a signed 8 bit multiplication: imulb
    jo end #since were checking signed we check the overflow flag in order to stop our loop
    addl $1, num
    jmp signed8bitloop

signed16bit: #calculates the largest factorial in an 16 bit signed 
    movl num, %eax

signed16bitloop:
    imulw num #since we're cheking 16 bit signed we have to do a signed 16 bit multiplication: imulw
    jo end
    addl $1, num
    jmp signed16bitloop

signed32bit: #calculates the largest factorial in an 32 bit signed 
    movl num, %eax

signed32bitloop:
    imull num #since we're cheking 32 bit signed we have to do a signed 32 bit multiplication: imull
    jo end
    addl $1, num
    jmp signed32bitloop