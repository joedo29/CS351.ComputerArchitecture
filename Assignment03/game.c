// Author: Joe Do
// Date: Feb 24, 2018
// Language chosen: C
// Write a C program to get the user to guess the number that the program has randomly picked

#include <time.h>
#include <stdlib.h>
#include <stdio.h>

int main(){
  srand(time(NULL));   // should only be called once
  int r = rand() % 10; // generate a random number from 0 to 9

  int correct = 0;
  int counter = 0;
  int userInput;
  printf("Guess a number from 0 to 9: ");
  while(correct == 0){
    scanf("%d", &userInput); // ask user to enter a number
    counter += 1;
    if(userInput < r){
      printf("Too low. Guess again: " );
      continue;
    }
    if(userInput > r){
      printf("Too hight. Guess again: ");
      continue;
    }
    printf("You guess correctly in %d tries!\n", counter);
    correct = 1;
  }

  return 0;
}
