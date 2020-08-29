#include <stdlib.h>

#include <stdio.h>

int main ( int argc, char** argv )

{

FILE *input;

int ch;

int fileTested[11];

int signature[] = {8B,EF,33,C0,BF,00,00,00,00,03,FD,B9};  /*hard coded virus signature*/

if ( argc != 2 )

{

fprintf( stderr, "Need to enter file to scan \n");

return( EXIT_FAILURE );

}

if ( (input = fopen( argv[1], "rb")) == NULL )    /* open file in binary mode to avoid end of line characters*/

{

perror( argv[1] );

return( EXIT_FAILURE );

}

 while ( (ch = fgetc(input)) != EOF ) /*commence loop*/

{

input = fileTested[];             /*put bytes into array to compare to virus signature array*/


if (fileTested==signature)      /*do comparison*/

printf("This file contains a virus\n");  /*tell if virus signature is present*/

else

/*if virus signature isn't found, print results*/

printf("This file doesn't contain a virus\n");

}

if ( fclose( input ) == EOF )

{

perror( argv[1] );

return( EXIT_FAILURE );

}

return( EXIT_SUCCESS );

}


