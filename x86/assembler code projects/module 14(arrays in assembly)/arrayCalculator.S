/*---------------------------------------------------------------------------
* Module Name: arrayCalculator.s
* Description: Short description of what the code in this module does
* Date: Today's date
* Developer: Your name
---------------------------------------------------------------------------*/

# C calling conventions: 
#  EBP, EBX, ESI, EDI should not be modified in a function call (non-volatile)
#  EAX, ECX, EDX can be modified (volatile)

#---------------------
.data
# Put your statically defined data here
sum: .int 0

#----------------------

# You can use the following symbolic constants to make
# accessing parameters easier
.set arrayA,8
.set arrayB, 12
.set elementSize, 16
.set count, 20

.text

.global _multiplyArrays1 
.global _multiplyArrays2
/*-----------------------------------------------------
* Description: What does your procedure do?
* Receives: What does it receive?
* Returns: What does it return?
*-----------------------------------------------------*/
_multiplyArrays1:
    # Prologue
    pushl     %ebp
    movl      %esp, %ebp
    #subl     $4,%esp      # Allocate 4 bytes for one 32-bit local variable
    pushl    %esi         # Have to save registers that are non-volatile
    pushl    %edi         # if they are used in the function.
    pushl    %ebx
    
    movl arrayA(%ebp), %esi #array adresses
    movl arrayB(%ebp), %edi
    movl count(%ebp), %ecx #counter for loop
    
    #decides which code to run according to the element size
    movl elementSize(%ebp), %eax
    cmpl $1, %eax #1 byte = byte
    je byteIndirect
    cmpl $2, %eax #2 byte = word
    je wordIndirect    
    cmpl $4, %eax #4 byte = dword = int
    je intIndirect
    movl $-1, %eax #return -1 if invalid size
    jmp end

byteIndirect:
    movl $0, %eax #clear eax
    movl $0, %edx #clear edx
    movb (%esi), %al
    movb (%edi), %dl
    mull %edx
    addl %eax, sum
    
    addl $1, %esi
    addl $1, %edi
    loop byteIndirect
    jmp end

wordIndirect:
    movl $0, %eax #clear eax
    movl $0, %edx #clear edx
    movw (%esi), %ax
    movw (%edi), %dx
    mull %edx
    addl %eax, sum
    
    addl $2, %esi
    addl $2, %edi
    loop wordIndirect
    jmp end

intIndirect:
    movl (%esi), %eax
    movl (%edi), %edx
    mull %edx
    addl %eax, sum
    
    addl $4, %esi
    addl $4, %edi
    loop intIndirect
    jmp end

#end is at the middle to minimize jmp distance
end:
    # Epilog
    popl     %ebx
    popl     %edi
    popl     %esi
    movl      %ebp, %esp
    popl      %ebp

    movl sum, %eax #makes sure we return the proper value
    movl $0, sum #reset sum for future function calls
    ret

_multiplyArrays2:
    # Prologue
    pushl     %ebp
    movl      %esp, %ebp
    #subl     $4,%esp      # Allocate 4 bytes for one 32-bit local variable
    pushl    %esi         # Have to save registers that are non-volatile
    pushl    %edi         # if they are used in the function.
    pushl    %ebx

    movl arrayA(%ebp), %esi #array adresses
    movl arrayB(%ebp), %edi
    movl count(%ebp), %ecx #counter for loop
    
    #decides which code to run according to the element size
    movl elementSize(%ebp), %eax
    cmpl $1, %eax #1 byte = byte
    je byteIndexed
    cmpl $2, %eax #2 byte = word
    je wordIndexed    
    cmpl $4, %eax #4 byte = dword = int
    je intIndexed
    movl $-1, %eax #return -1 if invalid size
    jmp end

byteIndexed:
    movl $0, %eax
    movl $0, %ebx

    movl %ecx, %edx #edx is index, should be esi
    #im doing the computation backwards, so im using the index - 1, to account for arrays starting at 0
    decl %edx 
    movb (%esi, %edx, 1), %al #but esi is storing the address... and Im lazy
    movb (%edi, %edx, 1), %bl
    mull %ebx
    addl %eax, sum

    loop byteIndexed
    jmp end

wordIndexed:
    movl $0, %eax
    movl $0, %ebx

    movl %ecx, %edx #edx is index, should be esi
    #im doing the computation backwards, so im using the index - 1, to account for arrays starting at 0
    decl %edx
    movw (%esi, %edx, 2), %ax #but esi is storing the address... and Im lazy
    movw (%edi, %edx, 2), %bx
    mull %ebx
    addl %eax, sum

    loop wordIndexed
    jmp end

intIndexed:
    #no movl 0 into eax because im using all the bits
    movl %ecx, %edx #edx is index, should be esi
    #im doing the computation backwards, so im using the index - 1, to account for arrays starting at 0
    decl %edx
    movl (%esi, %edx, 4), %eax #but esi is storing the address... and Im lazy
    movl (%edi, %edx, 4), %ebx
    mull %ebx
    addl %eax, sum

    loop intIndexed
    jmp end
