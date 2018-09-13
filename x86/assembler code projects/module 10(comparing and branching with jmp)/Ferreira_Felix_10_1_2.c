/* 
 * Module Name: Module_10_main.c
 * Author: Lem Davis & Felix Ferreira
 * Date: September 25, 2017, 1:46 AM
 * Description:
 * Module 10 main function that initializes message pointers and calls assembly
 * language functions for comparing values.
 */

#include <stdio.h>
#include <stdlib.h>

void init(char *msgptr0, char *msgptr1, char *msgptr2, char*msgptr3);
char *signedCompare(int a, int b, int c);
char *unsignedCompare(unsigned int a, unsigned int b, unsigned int c);

int main(int argc, char** argv) {
    
    char *msgptr0 = "Both a and b are zero\n";
    char *msgptr1 = "Either a is greater than b or b is greater than c\n";
    char *msgptr2 = "a is less than b and b is less than c\n";
    char *msgptr3 = "Either a < b, b < c, a = 0 or b = 0.\n";
    char *msg;
    int sa, sb, sc;
    unsigned int usa, usb, usc;
    
    init(msgptr0, msgptr1, msgptr2, msgptr3);
    
    sa = -1; //1
    sb = 2; //2
    sc = 3; //3
    msg = signedCompare(sa, sb, sc);
      
    usa = -1;
    usb = 2;
    usc = 3;
    msg = unsignedCompare(usa, usb, usc);
    
    return 0;
}

