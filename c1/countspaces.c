#include <stdio.h>

/* Symbolic constant */ 
#define LEN 100
 
int count_spaces(char[], int);

int main() {
  char str[LEN];
 
  printf("Enter a string: ");
  fgets(str, LEN, stdin);     /* Get a string from input, store it in str */
 
  printf("Your string is: %s", str);
  printf("Your string has %d spaces\n", count_spaces(str, LEN));
  return 0;
}

int count_spaces(char str[], int len) {
  int ii = 0;
  int count = 0;

  while ( (ii < len) && (str[ii] != '\0') ) {
    if (str[ii] == ' ') {
      count++;
    }
    ii++;
  }

  return count;
}
