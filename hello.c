#include <stdio.h>
#include "string.h" //strlen(str) --> provide length of string str
#define PI 3.14159
#define SQUARE(x) x*x

main(){
  /*
  %d = represents integer
  %f = represents string
  !x NOT x
  && and
  || OR
  */

  printf("hello\n");
  double leg1 = 200.3; double leg2 = 357.4;
  printf("200.3 + 357.4 equals %f \n", leg1 + leg2);
  printf("PI = %f\n", PI);
  int i = 5;
  printf("i + 2 squared is %d\n", i = (i+2));

  for (i=0; i <= 10; i = i+1){
    printf("Argument is %d\n", i);
  }


}
