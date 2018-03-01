// Author: Joe Do
// Date: Feb 10, 2018
// Language chosen: C
// This program is built to create an encryption algorithm based on user input

#include <stdio.h>
#include "string.h"
#include <stdlib.h>

int main(){

  char lowercase[26] = "abcdefghijklmnopqrstuvwxyz"; // length = 26
  char uppercase[26] = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"; // length = 26

// Ask for a word and validate user input
  char word [100];
  int counter = 0;
  while(counter == 0){
    char c;
    printf("Please enter a word: ");
    fgets(word, 100, stdin);
    for(int i = 0; i < strlen(word); i++){
      if(! ( ( word[i] >= 'a' && word[i] <= 'z' ) || ( word[i] >= 'A' && word[i] <= 'Z' ) ) ){
        printf("Invalid character. Please try again.\n");
        break;
      } else{
        counter = 1;
        break;
      }
    }
  }

  // Ask for a number and validate user input
  int number = 0;
  char userInput [27];
  while(number == 0){
    printf("Please enter a number: ");
    scanf("%s", userInput);

    if(strlen(userInput) < 1 || strlen(userInput) > 3){
      printf("Invalid string length\n");
      continue;
    }

    if(sscanf(userInput, "%d", &number) != 1){
      number = 0;
      printf("Invalid input. Please enter a number again.\n");
      continue;
    }

    if(number < 1 || number > 25){
      number = 0;
      printf("Invalid range. Try another number between 1 and 25\n");
      continue;
    }
  }

  printf("Encrypted text: " );

// Encryption begin
  for(int i = 0; i < strlen(word); i++){
    if(isupper(word[i])){ // if input is uppercase, run this
      for(int j = 0; j < 26; j++){
        if(word[i] == uppercase[j]){
          word[i] = uppercase[(j + number) % 26]; // treat it as a circular array
          break;
        }
      }
    } else{ // if input is lowercase, run this
      for(int j = 0; j < 26; j++){
        if(word[i] == lowercase[j]){
          word[i] = lowercase[(j + number) % 26];
          break;
        }
      }
    }
    printf("%c", word[i]);
  }
  return 0;
}
