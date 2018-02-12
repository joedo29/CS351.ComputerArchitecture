// Author: Joe Do
// Date: Feb 10, 2018
// Language chosen: C
// This program shall read an input file and list all contacts whose age is
// in between 18 and 25
// An entry should follow this format: FIRST LAST dd-mm-yyyy

#include <stdio.h>
#include "string.h"
#include <time.h>
#include <stdlib.h>

// This function will calculate current age
int calculateAge(int current_date, int current_month, int current_year, int birth_date, int birth_month, int birth_year){
    // days of every month
    int month[] = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
    // if birth date is greater then current date don't count this month
    if (birth_date > current_date) {
        current_month -= 1;
    }
    // if birth month is greater than current month then don't count this year
    if (birth_month > current_month) {
        current_year -= 1;;
    }
    int calculated_year = current_year - birth_year;
    return calculated_year;
}

int main(){
  // Get current time
  time_t t = time(NULL);
  struct tm tm = *localtime(&t);
  const int current_year = tm.tm_year + 1900;
  const int current_month = tm.tm_mon + 1;
  const int current_date = tm.tm_mday;

  char fname[15];
  char lname[15];
  char dob[15];

  // Read input file
  FILE *file = fopen("contacts.txt", "rt");
  if(file==0){
    printf("Cannot open input file\n");
  }
  while(fscanf(file, "%s %s %s\n", fname, lname, dob)>1){

    // Convert date of birth to integer for use in calculateAge function
    int bDay = (dob[0] - '0')*10 + dob[1] - '0';
    int bMonth = (dob[3] - '0')*10 + dob[4] - '0';
    int bYear = (dob[6] - '0')*1000 + (dob[7] - '0')*100 + (dob[8] - '0')*10 + (dob[9] - '0');

    int counter = calculateAge(current_date, current_month, current_year, bDay, bMonth, bYear);
    if(counter >= 18 && counter <= 25){ // list contact whose age between 18 & 25
        printf("%c.%s, %d\n", fname[0], lname, counter);
    }
  }
  if(!feof(file)){
    printf("ERROR\n");
  }
  fclose(file);
  return 0;
}
