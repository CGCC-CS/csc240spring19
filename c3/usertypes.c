#include<stdio.h>
#include<string.h>

typedef unsigned int num;
typedef enum {false, true} boolean;  /* enumeration type */

/* structs */
typedef struct {
  int n;
  boolean success;
  char s[16];
} my_struct_t;

/* union */
typedef union {
  int n;
  boolean success;
  char s[16];
} my_union_t;

int main() {
  num x = 10; 
  boolean is_it_true = false;
  my_struct_t myStruct = {10, true, "Hello!"};
  my_struct_t * ptr = &myStruct;
  my_union_t myUnion;

  printf("x=%d [%p]\n", x, (void *) &x);

  printf("is_it_true=%d [%p]\n", is_it_true, (void *) &is_it_true);
  is_it_true = true;
  printf("is_it_true=%d [%p]\n", is_it_true, (void *) &is_it_true);

  printf("myStruct: %d, %d, %s\n", myStruct.n, myStruct.success, myStruct.s);
  printf("ptr: %d, %d, %s\n", ptr->n, ptr->success, ptr->s);

  myStruct.n = 30, 
  myStruct.success = false;
  strncpy(myStruct.s, "World!", 10);
  printf("\nAfter changing myStruct (using variable)\n");
  printf("myStruct: %d, %d, %s\n", myStruct.n, myStruct.success, myStruct.s);
  printf("ptr: %d, %d, %s\n", ptr->n, ptr->success, ptr->s);

  ptr->n = 50, 
  ptr->success = true;
  strncpy(ptr->s, "Goodbye!", 10);
  printf("\nAfter changing myStruct (using ptr)\n");
  printf("myStruct: %d, %d, %s\n", myStruct.n, myStruct.success, myStruct.s);
  printf("ptr: %d, %d, %s\n", ptr->n, ptr->success, ptr->s);

  printf("\nUnion example:\n");
  myUnion.n=0x44434241;
  printf("myUnion: %x, %s\n", myUnion.n, myUnion.s);
  strncpy(myUnion.s, "X44434241", 10);
  printf("myUnion: %x, %s\n", myUnion.n, myUnion.s);

  printf("\nSizes:\n");
  printf("x (num): %ld\n", sizeof(x));
  printf("is_it_true (boolean): %ld\n", sizeof(is_it_true));
  printf("myStruct (my_struct_t): %ld\n", sizeof(myStruct));
  printf("ptr (my_struct_t *): %ld\n", sizeof(ptr));
  printf("myUnion (my_union_t): %ld\n", sizeof(myUnion));
  return 0;

}
