# Module Name: Programming Project 2
# Author: Felix Ferreira
# Date: 12/12/17
.global _simpleAssembler

.data
register: .int 0
.set inputCodePointer, 8
.set lines, 12
.set memoryPointer, 16
.text
_simpleAssembler:
    
    # Prologue
    pushl     %ebp
    movl      %esp, %ebp

    pushl    %esi         # Have to save registers that are non-volatile
    pushl    %edi         # if they are used in the function.
    pushl    %ebx
    
    movl memoryPointer(%ebp), %edx #256 int array for our cpu (=
    movl inputCodePointer(%ebp), %esi #OUR CODE////////////////////ESI
    movl (%esi), %ebx

    #get the counter so we can read all our instructions
    #and stop when we are done
    movl lines(%ebp), %ecx
    
instructionStart:
    movl memoryPointer(%ebp), %edx #resets where we are in the array
    movb (%ebx), %al #al contains our first character
    cmpb $108, %al #l
    je load
    cmpb $97, %al #a
    je add
    cmpb $115, %al #s
    je sFilter
    jmp badEnd
load:
    #now we check if lod was spelled correctly
    movb 1(%ebx), %al
    cmpb $111, %al #check o
    jne badEnd
    movb 2(%ebx), %al
    cmpb $100, %al #check d
    jne badEnd
    #instruction is correct
    #now check for a space
    movb 3(%ebx), %al
    cmpb $32, %al #checks for space
    jne badEnd
    #now that we checked everything is okay with lod and the space
    #we can check if we want to load from memory or immediate
    #we can tell the two apart from by either a 0x or by just a number
    movb 4(%ebx), %al
    cmpb $48, %al #check for '0'
    je lodMem
    jne lodImm
    jmp badEnd

up:
    loop instructionStart
    # Epilogue
    popl     %ebx
    popl     %edi
    popl     %esi

    movl      %ebp, %esp
    popl      %ebp

    movl $0, %eax
    ret
    
lodMem:
    #if we want to load a memory location from our 256 byte memory
    #we use strtol(beggining of our string, null, 16)
    movb 5(%ebx), %al # check x
    cmpb $120, %al
    jne badEnd
    pushl %ecx #save ecx
    pushl %edx #save edx
    movl $6, %eax
    addl %eax, %ebx
    pushl $16
    pushl $0 #null
    push %ebx
    call _strtol
    addl $12, %esp
    popl %edx #restore edx
    popl %ecx #restore ecx
    #shll %eax
    #shll %eax
    addl %eax, %edx #increments our pointer to point to the offset in bytes
    movl (%edx), %eax
    movl %eax, register
    jmp getNext

up2:
    jmp up

lodImm:
    #knowing we have a number we can invoke the inbuilt atoi function
    #to convert from string to int
    addl $4, %ebx
    pushl %ecx
    push %ebx
    call _atoi #calls atoi, which converts a string into an int
    addl $4, %esp
    popl %ecx
    #eax should now hold our immediate value
    movl %eax, register #load immediate value into our one register (=
getNext: #call here for next instruction
    #loop until you get to the next instruction
    addl $1, %ebx
    movb (%ebx), %al
    cmpb $0, %al
    jne getNext
    addl $1, %ebx
    jmp up2
add:
    #check for d
    movb 1(%ebx), %al
    cmpb $100, %al
    jne badEnd
    #check for d
    movb 2(%ebx), %al
    cmpb $100, %al
    jne badEnd
    #instruction is correct
    #now check for a space
    movb 3(%ebx), %al
    cmpb $32, %al #checks for space
    jne badEnd
    #check for 0
    movb 4(%ebx), %al
    cmpb $48, %al #check for '0'
    je addMem
    jne addImm
addMem:
    #check for x
    #if we want to load a memory location from our 256 byte memory
    #we use strtol(beggining of our string, null, 16)
    movb 5(%ebx), %al # check x
    cmpb $120, %al
    jne badEnd
    pushl %ecx #save ecx
    pushl %edx #save edx
    movl $6, %eax
    addl %eax, %ebx
    pushl $16
    pushl $0 #null
    push %ebx
    call _strtol
    addl $12, %esp
    popl %edx #restore edx
    popl %ecx #restore ecx
    #shll %eax
    #shll %eax
    addl %eax, %edx #increments our pointer to point to the offset in bytes
    movl (%edx), %eax
    addl %eax, register
    jmp getNext
addImm:
    #knowing we have a number we can invoke the inbuilt atoi function
    #to convert from string to int
    addl $4, %ebx
    pushl %ecx
    push %ebx
    call _atoi #calls atoi, which converts a string into an int
    addl $4, %esp
    popl %ecx
    #eax should now hold our immediate value
    addl %eax, register #load immediate value into our one register (=
    jmp getNext

sFilter:
    movb 1(%ebx), %al
    cmpb $117, %al #compares to u
    je sub
    jne sto

getNextPtr:
    jmp getNext

sub:
    #check for b
    movb 2(%ebx), %al
    cmpb $98, %al
    jne badEnd
    #instruction is correct
    #now check for a space
    movb 3(%ebx), %al
    cmpb $32, %al #checks for space
    jne badEnd
    #check for 0
    movb 4(%ebx), %al
    cmpb $48, %al #check for '0'
    je subMem
    jne subImm
subMem:
    #check for x
    #if we want to load a memory location from our 256 byte memory
    #we use strtol(beggining of our string, null, 16)
    movb 5(%ebx), %al # check x
    cmpb $120, %al
    jne badEnd
    pushl %ecx #save ecx
    pushl %edx #save edx
    movl $6, %eax
    addl %eax, %ebx
    pushl $16
    pushl $0 #null
    push %ebx
    call _strtol
    addl $12, %esp
    popl %edx #restore edx
    popl %ecx #restore ecx
    #shll %eax
    #shll %eax
    addl %eax, %edx #increments our pointer to point to the offset in bytes
    movl (%edx), %eax
    subl %eax, register
    jmp getNext
subImm:
    #knowing we have a number we can invoke the inbuilt atoi function
    #to convert from string to int
    addl $4, %ebx
    pushl %ecx
    push %ebx
    call _atoi #calls atoi, which converts a string into an int
    addl $4, %esp
    popl %ecx
    #eax should now hold our immediate value
    subl %eax, register #sub immediate value into our one register (=
    jmp getNext
    
sto:
    #check for t
    movb 1(%ebx), %al
    cmpb $116, %al
    jne badEnd
    #check for o
    movb 2(%ebx), %al
    cmpb $111, %al
    jne badEnd
    #instruction is correct
    #now check for a space
    movb 3(%ebx), %al
    cmpb $32, %al #checks for space
    jne badEnd
    movb 4(%ebx), %al
    cmpb $48, %al #check for '0'
    movb 5(%ebx), %al
    cmpb $120, %al #check for 'x'
    jne badEnd
    pushl %ecx #save ecx
    pushl %edx #save edx
    movl $6, %eax
    addl %eax, %ebx
    pushl $16
    pushl $0 #null
    push %ebx
    call _strtol
    addl $12, %esp
    popl %edx #restore edx
    popl %ecx #restore ecx
    #shll %eax
    #shll %eax
    addl %eax, %edx #increments our pointer to point to the offset in bytes
    movl register, %eax
    movl %eax, (%edx) #move our register into memory
    jmp getNext
badEnd:
    # Epilogue
    popl     %ebx
    popl     %edi
    popl     %esi
    movl      %ebp, %esp
    popl      %ebp
    movl $-1, %eax
    ret