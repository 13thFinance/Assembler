/**  File:   convert_case_main.c
*  Author: The teacher/Felix Ferreira
*  Created on August 23, 2017, 12:39 PM
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void convertCase(char *);

#define String char*

/*
*converts capital letter to lower case using bitwise ^
*/
int main(int argc, char** argv)
{
	char aString[] = "Abc123$#@";
	printf("aString = %s\n", aString);
	convertCase(&aString);
	printf("aString now equals %s\n", aString);
	return (EXIT_SUCCESS);
}

/*
	takes in a string, loops through it and finds all 
	uppercase letters then converts it to lower case
*/
void convertCase(char* string)
{
	//loops through the string
	for (int i = 0; i < strlen(string); i++)
	{
		//filters for Capitals
		if (string[i] >= 'A' && string[i] <= 'Z')
		{
			//converts using bitwise ^
			string[i] = string[i] ^ 32;
		}
	}
}
