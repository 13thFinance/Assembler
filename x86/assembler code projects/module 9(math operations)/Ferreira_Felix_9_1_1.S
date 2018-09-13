.text
.global _add
.global _subtract
.global _multiplySigned
.global _multiplyUnsigned
.global _divideSigned
.global _divideUnsigned

_add:
    #prologue
    pushl %ebp
    movl %esp, %ebp
    
    #space for our two variables
    movw 8(%ebp), %ax
    addw 12(%ebp),%ax
    
    //epilogue
    movl %ebp, %esp
    popl %ebp
    ret

_subtract:
    #prologue
    pushl %ebp
    movl %esp, %ebp
    
    #space for our two variables
    movw 8(%ebp), %ax
    subw 12(%ebp),%ax
    
    //epilogue
    movl %ebp, %esp
    popl %ebp
    ret

#multiplies signed numbers
_multiplySigned:
    #prologue
    pushl %ebp
    movl %esp, %ebp
    
    #multiply our two variables that were passed in
    movw 8(%ebp), %ax
    imulw 12(%ebp) #uses imulx since it's signed

    #handles the DX:AX conversion to eax
    movw %ax, %bx #saves ax into a different register
    movw %dx, %ax #moves our significant bits into eax's lower bits
    shl $16, %eax #shifts eax register 16 bits to the left, making them the most significant
    movw %bx, %ax #brings back the ax bits into the least significant bits of eax, compleating our number

    #epilogue
    movl %ebp, %esp
    popl %ebp
    ret

_multiplyUnsigned:
    #prologue
    pushl %ebp
    movl %esp, %ebp
    
    #multiply two unsigned 16 bit numbers
    mov 8(%ebp), %ax
    mulw 12(%ebp)
    
    #handles the DX:AX conversion into eax
    movw %ax, %bx #saves ax into a different register
    movw %dx, %ax #moves our significant bits into eax's lower bits
    shl $16, %eax #shifts eax register 16 bits to the left, making them the most significant
    movw %bx, %ax #brings back the ax bits into the least significant bits of eax, compleating our number

    #epilogue
    movl %ebp, %esp
    popl %ebp
    ret

_divideSigned:
    #prologue
    pushl %ebp
    movl %esp, %ebp
    
    #couldnt get the idivw working properly
    #resorting to 32 bit numbers instead
    #by pushing 16 bit value into the eax register
    #we preserve signs
    #sign extension instructions copies only the most significant bit
    #of the source into the top bits of the destination
    #so it's not always leading ones, only if it negative will 
    #it do that, meaning it'll work properly with signed and unsigned
    movswl 8(%esp),%eax
    movswl 12(%esp),%ecx
    #sign extend eax into the edx:eax register pair
    cltd   
    #finally divide
    idiv   %ecx
    
    #since the function prototype is expecting a short, itll only return 
    #a short
    #epilogue
    movl %ebp, %esp
    popl %ebp
    ret

_divideUnsigned:
    #prologue
    pushl %ebp
    movl %esp, %ebp

    #divides two numbers
    movw $0, %dx #clears dx, can also use xor %dx, %dx
    movw 8(%ebp), %ax
    movw 12(%ebp), %bx
    divw %bx

    #epilogue
    movl %ebp, %esp
    popl %ebp
    ret