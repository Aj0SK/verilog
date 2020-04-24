`include "modules/arithmetics/adder.v"
/* verilator lint_off UNUSED */
/* verilator lint_off DECLFILENAME */

module subtract
  ( 
    i_a,
    i_b,
    o_c
    );
   
  input wire[7:0] i_a;
  input wire[7:0] i_b;
  output wire[7:0] o_c;
  
  wire[7:0] inv_i_b;
  
  assign inv_i_b = ~i_b;
  adder f1(i_a, inv_i_b, 1, o_c);
endmodule
