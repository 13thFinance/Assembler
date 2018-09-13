/*******************************************************************************
* Module name: module_9_main.c
* Developer name: L. Davis & Felix Ferreira
* Date: 9/18/2017
* Description: Calls assembly functions that perform integer math
*              and prints results.
*******************************************************************************/

#include <stdio.h>
#include <stdlib.h>

// Function prototypes.
// addition, subtraction, multiplication and division.
short add(short num1, short num2);
short subtract(short num1, short num2);

int multiplySigned(short num1, short num2);
int multiplyUnsigned(unsigned short num1, unsigned short num2);

short divideSigned(short num1, short num2);
short divideUnsigned(unsigned short num1, unsigned short num2);


int main(int argc, char** argv) 
{
    //176, -101, 0
    short num1 = 176, num2 = -101, result = 0;
    //176, 65435
    unsigned short usnum1 = 0xb0, usnum2 = 0xff9b, unsignedResult;
    //since multiplication returns a larger bit value we need to make
    //some 32bit variable to hold the value of a 16x16-bit multiplication
    int result32, remainder;
    
    ///////////////////////////////ADD//////////////////////////////////////////
    //adds signed numbers
    result = add(num1, num2);
    printf("%hd + %hd = %hd\r\n", num1, num2, result);
    
    //adds unsigned numbers
    unsignedResult = add(usnum1, usnum2);
    printf("%hu + %hu = %hu\r\n", usnum1, usnum2, unsignedResult);
    ////////////////////////////////////////////////////////////////////////////
    
    /////////////////////////////SUBTRACT///////////////////////////////////////
    //subtracts signed numbers
    result = subtract(num1, num2);
    printf("%hd - %hd = %hd\r\n", num1, num2, result);
    
    //subtracts unsigned numbers
    unsignedResult = subtract(usnum1, usnum2);
    printf("%hu - %hu = %hu\r\n", usnum1, usnum2, unsignedResult);
    ////////////////////////////////////////////////////////////////////////////
    
    /////////////////////////////MULTIPLY///////////////////////////////////////
    //multiply signed numbers
    result32 = multiplySigned(num1, num2);
    printf("%hd * %hd = %d\r\n", num1, num2, result32);
    
    //multiplies unsigned numbers
    result32 = multiplyUnsigned(usnum1, usnum2);
    printf("%hu * %hu = %d\r\n", usnum1, usnum2, result32);
    ////////////////////////////////////////////////////////////////////////////
     
    /////////////////////////////DIVIDE/////////////////////////////////////////
    //divide signed numbers
    //query
    printf("\r\n---------Signed Division-------\r\n");
    printf("Input 16-bit Dividend: ");
    scanf("%hd", &num1);
    
    printf("Input 8-bit Divisor: ");
    scanf("%hd", &num2);//reads in a byte
    
    //divide signed numbers
    result = divideSigned(num1, num2);
    remainder = num1 % num2;
    //cast result to truncate the upper 16bit values that we dont need
    printf("%hd / %hd = %d Remainder: %d\r\n", num1, num2, result, remainder);
    
    
    //divide unsigned numbers
    //query
    printf("\r\n--------Unsigned Division------\r\n");
    printf("Input 16-bit Dividend: ");
    scanf("%hu", &usnum1);
    printf("Input 8-bit Divisor: ");
    scanf("%hu", &usnum2);
    //divide unsigned numbers
    unsignedResult = divideUnsigned(usnum1, usnum2);
    remainder = usnum1 % usnum2;
    printf("%hu / %hu = %hu Remainder: %d\r\n", usnum1, usnum2, unsignedResult, remainder);
    ////////////////////////////////////////////////////////////////////////////*/
     
    return 0;
}

