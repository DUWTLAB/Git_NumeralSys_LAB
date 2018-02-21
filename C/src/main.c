#include <stdio.h>

#define FL  7 // fraction length 
#define SCALE_FL     (1<<7)
#define SCALE_FL_2   (1<<(FL*2))
mult_test(){

  float a_f, a_q; char  a_i;
  float b_f, b_q; char  b_i;
  float c_f, c_q; short c_i;

  a_f =  -0.999 ;
  b_f =   0.999 ;
  a_i = a_f * SCALE_FL ;    // fixed point value, S1I0F7
  b_i = b_f * SCALE_FL ;
  a_q = a_i *1.0/ SCALE_FL ;    // quant value
  b_q = b_i *1.0/ SCALE_FL ;

  c_i = a_i * b_i;
  c_q = c_i*1.0 / SCALE_FL_2;
  c_f = a_f * b_f;


  printf("# Mult Test\n");
  printf("# Data Quant Fraction length is %d bit\n", FL);
  printf("# a_f =  %-10f, a_i = %-8d 0x%-8x , a_q = %f\n", a_f, a_i, a_i, a_q);
  printf("# b_f =  %-10f, b_i = %-8d 0x%-8x , b_q = %f\n", b_f, b_i, b_i, b_q);
  printf("# c_f =  %-10f, c_i = %-8d 0x%-8x , c_q = %f\n", c_f, c_i, c_i, c_q);
  printf("#\n");

}
add_test(){

  float a_f, a_q; char  a_i;
  float b_f, b_q; char  b_i;
  float c_f, c_q; short c_i;

  a_f =  -0.999 ;
  b_f =  -0.999 ;
  a_i = a_f * SCALE_FL;    // fixed point value, S1I0F7
  b_i = b_f * SCALE_FL;
  a_q = a_i *1.0/ SCALE_FL;    // quant value
  b_q = b_i *1.0/ SCALE_FL;

  c_i = a_i + b_i;
  c_q = c_i*1.0 / SCALE_FL;
  c_f = a_f + b_f;


  printf("# ADD Test\n");
  printf("# Data Quant Fraction length is %d bit\n", FL);
  printf("# a_f =  %-10f, a_i = %-8d 0x%-8x , a_q = %f\n", a_f, a_i, a_i, a_q);
  printf("# b_f =  %-10f, b_i = %-8d 0x%-8x , b_q = %f\n", b_f, b_i, b_i, b_q);
  printf("# c_f =  %-10f, c_i = %-8d 0x%-8x , c_q = %f\n", c_f, c_i, c_i, c_q);
  printf("#\n");

}

float_check(){


  float v_f = 1.125;
  void   *p = NULL;
  unsigned int v_f_i = 0;
  unsigned int S, E, M;
  
  printf("# Float Check\n");
  p = &v_f;
  v_f_i = *((unsigned int *) p);
  printf("# v_f = %f, hex val v_f_i = 0x%x \n", v_f, v_f_i );
  S = v_f_i >> 31; E = (v_f_i >> 23)&((1 << 8) - 1); M = v_f_i & (( 1 << 23)-1);
  printf("# S = %d, E = %d, M = 0x%x \n", S, E, M);
  printf("#\n");


}
main(){

  printf("# Fixed point Demo LAB\n\n");
  mult_test();
  add_test();
  float_check();
 

  printf("# \n");
  printf("# Done, press Enter key to quit\n");
  getch();
}
