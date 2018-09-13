/*
in c this code would look like:

int a[100];
struct my_stuct
{
 char f0
 int f1
} b;

*/


.data //where variables and arrays are declared under

.balign 4 //makes sure 4 bytes are assigned per memory location
a: .skip 400 //int a[100], makes room for 400 bytes, or 100 32 bit integers
//.skip directives makes sure that data is contigious(in reality skips over 400 bytes b4 next data assignment)

.balign 4
b: .skip 8 //assign 8 bytes, or 2 integers worth of memory, since char + int = 8 + 32 bits and we need to round up
	//in terms of memory needed. So although the struct takes 5 bytes, we allocated 8. This is called padding
	//dont do this, but for learning purposes it's okay


//now lets look at implementing this c code
//without indexing modes(naive way)
/*
for(i = 0; i < 100; i++)
{
 a[i] = i
}
*/

.text
.global main

addr_of_a: .word a //address of a[100]

main:
	ldr r1, addr_of_a //r1 <- &a[100]
	mov r2, #0 //will be used as our counter(ie. i = 0)
loop:
	cmp r2, #100 //have we reached 100 yet?
	beq end //branch if equal to, if r2 == 100, jump to end
	add r3, r1, r2, LSL #2 //r3 <- r1 + (r2 * 4), r1 is the address of a[], and since  r2 is holding the 
				//counter and we are moving in increments of 4 bytes, this is equivalent to 
				//r3 holding the address in next a[] element
	str r2, [r3] //r2 -> *r3 //this is moving the counter value into the next element in the array
	add r2, r2, #1 //increment r2 by 1
	b loop //continue to do this until r2 reaches 100
end:
	bx lr
