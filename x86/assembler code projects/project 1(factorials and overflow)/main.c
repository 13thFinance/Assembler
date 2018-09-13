/* 
 * File:   programming_project_1.c
 * Author: Lem Davis and Felix Ferreira
 *
 * Created on Nov 6, 2017
 * Description: C module for Programming Project 1:
 * This code calls your assembly function
 * with all of the possible parameter values.
 */

#include <stdio.h>
#include <stdlib.h>

// Prototype for assembly function
int max_factorial(int signed_flag, int num_bits);

/****************************************/
int main(int argc, char** argv) {

    int retVal;
    
    // 8-bits unsigned
    retVal = max_factorial(0, 8);
    printf("The largest integer whose factorial can be computed using unsigned 8-bit math is %d\n", retVal);
    
    // 8-bits signed
    retVal = max_factorial(1, 8);
    printf("The largest integer whose factorial can be computed using signed 8-bit math is %d\n", retVal);
    
    // 16-bits unsigned
    retVal = max_factorial(0, 16);
    printf("The largest integer whose factorial can be computed using unsigned 16-bit math is %d\n", retVal);
    
    // 16-bits signed
    retVal = max_factorial(1, 16);
    printf("The largest integer whose factorial can be computed using signed 16-bit math is %d\n", retVal);
    
    // 32-bits unsigned
    retVal = max_factorial(0, 32);
    printf("The largest integer whose factorial can be computed using unsigned 32-bit math is %d\n", retVal);
    
    // 32-bits signed
    retVal = max_factorial(1, 32);
    printf("The largest integer whose factorial can be computed using signed 32-bit math is %d\n", retVal);
            
    return (EXIT_SUCCESS);
}

