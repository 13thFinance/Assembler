# Module Name: Module_10_main.c
# Author: Lem Davis & Felix Ferreira
# Date: September 25, 2017, 1:46 AM
# Description:
# Module 10 main function that initializes message pointers and calls assembly
# language functions for comparing values.

.text

.global _init
.global _signedCompare
.global _unsignedCompare

.data
    messageOne: .int 65
    messageTwo: .int 65
    messageThree: .int 65
    messageFour: .int 65

    message: .asciz "%s\n"

_init:
    #prologue
    pushl %ebp
    movl %esp, %ebp
    
    #move the first pointer
    movl 8(%ebp), %eax #moves the numeric pointer value into eax
    movl %eax, messageOne #moves the numeric pointer value into our variable int

    #move the second pointer
    movl 12(%ebp), %eax
    movl %eax, messageTwo
    
    #move the third pointer
    movl 16(%ebp), %eax
    movl %eax, messageThree
    
    #move the fourth pointer
    movl 20(%ebp), %eax
    movl %eax, messageFour
    
    //epilogue
    movl %ebp, %esp
    popl %ebp
    ret

#implements the following comparisons for signed and
#unsigned 32-bit integers
#if ((a == 0) && (b == 0))
#   return msgptr0;
#else if ((a > b) || (b > c))
#   return msgptr1;
#else if ((a < b) && (b < c))
#   return msgptr2;
#else
#   return msgptr3;

_signedCompare:
    #prologue
    pushl %ebp
    movl %esp, %ebp
    
    #clean eflags
    subb %al, %al
    movb $0, %ah
    sahf
    
    movl 8(%ebp), %eax
    cmpl $0, %eax
    je ptr1
    jmp ptr2

ptr1:
    movl 12(%ebp), %eax
    cmpl $0, %eax
    je message1
    jmp ptr2

ptr2:
    movl 8(%ebp), %eax #a
    movl 12(%ebp), %edx #b
    cmpl %edx, %eax #a > b 
    jg message2
    movl 12(%ebp), %eax
    movl 16(%ebp), %edx
    cmpl %edx, %eax
    jg message2
    jmp ptr3

ptr3:
    movl 8(%ebp), %eax #a
    movl 12(%ebp), %edx #b
    cmpl %edx, %eax #a < b
    jl ptr3_2
    jmp message4

ptr3_2:
    
    movl 12(%ebp), %eax
    movl 16(%ebp), %edx
    cmpl %edx, %eax #b < c
    jl message3
    jmp message4
    

_unsignedCompare:
    #prologue
    pushl %ebp
    movl %esp, %ebp

    #clean eflags
    subb %al, %al
    movb $0, %ah
    sahf
    
    movl 8(%ebp), %eax
    cmpl $0, %eax
    je uptr1
    jmp uptr2
    
    
uptr1:
    movl 12(%ebp), %eax
    cmpl $0, %eax
    je message1
    jmp uptr2

uptr2:
    movl 8(%ebp), %eax #a
    movl 12(%ebp), %edx #b
    cmpl %edx, %eax #a > b 
    ja message2
    movl 12(%ebp), %eax
    movl 16(%ebp), %edx
    cmpl %edx, %eax
    ja message2
    jmp uptr3

uptr3:
    movl 8(%ebp), %eax #a
    movl 12(%ebp), %edx #b
    cmpl %edx, %eax #a < b
    jb uptr3_2
    jmp message4

uptr3_2:
    
    movl 12(%ebp), %eax
    movl 16(%ebp), %edx
    cmpl %edx, %eax #b < c
    jb message3
    jmp message4

message1:
    #$ passes the value while no $ passes the address/pointer
    pushl messageOne
    pushl $message
    call _printf
    addl $8, %esp
    jmp end

message2:
    #$ passes the value while no $ passes the address/pointer
    pushl messageTwo
    pushl $message
    call _printf
    addl $8, %esp
    jmp end

message3:
    #$ passes the value while no $ passes the address/pointer
    pushl messageThree
    pushl $message
    call _printf
    addl $8, %esp
    jmp end

message4:
    #$ passes the value while no $ passes the address/pointer
    pushl messageFour
    pushl $message
    call _printf
    addl $8, %esp
    jmp end

end:
    //epilogue
    movl %ebp, %esp
    popl %ebp
    ret