#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>

// Suggested values for `true` and `false` to distinguish them from pointers
#define TRUE  0x0000000000000006L
#define FALSE 0x0000000000000002L

#define BOA_MIN (- (1L << 62))
#define BOA_MAX ((1L << 62) - 1)

extern int64_t our_code_starts_here(int64_t* the_heap, int64_t input_val) asm("our_code_starts_here");
extern int64_t print(int64_t input_val) asm("print");
extern void error(int64_t val) asm("error");

int64_t * heap_alloc(int64_t val) {
  int64_t * addr = malloc(val*8);
  return addr;
}
int64_t print_m(int64_t val) {
  // FILL IN YOUR CODE FROM HERE
  
  if(val == TRUE){
  	printf("true ");
  }
  else if ((val & 7L) == 0){
    int64_t * addr_val = (int64_t *) val;
    int64_t len = *(addr_val);
    int i = len;
    int64_t val = *(addr_val+1);
    printf("( %ld ", (val-1)/2);
    for(i = 2; i < len; i++ ){
      print_m(*(addr_val+i));
    }
    print_m(*(addr_val + len));
    printf(") ");

  }
  else if(val == FALSE) {
  	printf("false ");
  }else if((val && 1)){
	  printf("%ld ", (val-1)/2);
  }

  else{
	  fprintf(stderr, "Got unrepresentable value %ld", val);
	  exit(1);
  }
  return val;
}

int64_t print(int64_t val) {
  // FILL IN YOUR CODE FROM HERE
  
  if(val == TRUE){
  	printf("true\n");
  }
  else if ((val & 7L) == 0){
    int64_t * addr_val = (int64_t *) val;
    int64_t len = *(addr_val);
    int i = len;
    int64_t val = *(addr_val+1);
    printf("( %ld ", (val-1)/2);
    for(i = 2; i < len; i++ ){
      print_m(*(addr_val+i));
    }
    print_m(*(addr_val + len));
    printf(")\n");


  }
  else if(val == FALSE) {
  	printf("false\n");
  }else if((val && 1)){
	  printf("%ld\n", (val-1)/2);
  }

  else{
	  fprintf(stderr, "Got unrepresentable value %ld", val);
	  exit(1);
  }
  return val;
}

void error(int64_t error_code) {
  // FILL IN YOUR CODE FROM HERE
  if(error_code == 0  ){
	fprintf(stderr, "expected a number");
  } else if (error_code == 1){
	  fprintf(stderr, "expected a bool");
  }
  else if (error_code == 2){
	  fprintf(stderr, "overflow error");
  }
  else {
    fprintf(stderr, "Array index out of bounds");
  }
 
  exit(1);
}
int main(int argc, char** argv) {
  int64_t input_val;
  // FILL IN YOUR CODE FROM HERE
  if(argc > 1) {
  	
	 
	          char* pEnd;
		  long long int temp = strtoll(argv[1],&pEnd,10);
	  //printf("%ld", temp);
	  	 
		 if(errno == EINVAL || (*pEnd) != '\0' ){
		 
			  fprintf(stderr, "input must be a number");
			  exit(1);
		  }
		  else if(temp > BOA_MAX){
			fprintf(stderr, "input is not a representable number");
			exit(1);
	  	} else if ( temp < BOA_MIN ){
			fprintf(stderr, "input is not a representable number");
			exit(1);
	  	}
	 
		input_val = (2*(temp)) +1;
	    
  }
  else{
	input_val = 1;
  }

  // YOUR CODE ENDS HERE
  int64_t* the_heap = calloc(10000, sizeof(int64_t));
  int64_t result = our_code_starts_here(the_heap, input_val);
  print(result);
  return 0;
}
