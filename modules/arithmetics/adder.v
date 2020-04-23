`include "modules/arithmetics/full_adder.v"
/* verilator lint_off UNUSED */
module adder
  ( 
    i_a,
    i_b,
    i_c,
    o_c
    );
   
  input wire[7:0] i_a;
  input wire[7:0] i_b;
  input i_c;
  output wire[7:0] o_c;
  
  wire carry0, carry1, carry2, carry3;
  wire carry4, carry5, carry6, carry7;
  full_adder f1(i_a[0], i_b[0], i_c, carry0, o_c[0]);
  full_adder f2(i_a[1], i_b[1], carry0, carry1, o_c[1]);
  full_adder f3(i_a[2], i_b[2], carry1, carry2, o_c[2]);
  full_adder f4(i_a[3], i_b[3], carry2, carry3, o_c[3]);
  full_adder f5(i_a[4], i_b[4], carry3, carry4, o_c[4]);
  full_adder f6(i_a[5], i_b[5], carry4, carry5, o_c[5]);
  full_adder f7(i_a[6], i_b[6], carry5, carry6, o_c[6]);
  full_adder f8(i_a[7], i_b[7], carry6, carry7, o_c[7]);
endmodule
