// Author: Joe Do
// Date: Feb 24, 2018
// Language chosen: C
// Write a nested for loop structure that prints out a pyramid of stars

#include <stdio.h>

int main()
{
  for(int i = 1; i <= 8; i++){

    // print spaces before the first star
    for(int j = i; j < 8; j++){
      printf(" ");
    }

    // begin printing stars
    for(int j = 1; j <= (2*i-1); j++){
      // j==1: print the first star in a row
      // j==(2*i-1): print second star in a row
      // i==8: print stars for last row
      if(i == 8 || j == 1 || j == (2*i-1))
        printf("*");
      else
        printf(" ");
    }
    printf("\n");
  }

  return 0;
}
