`include "modules/adder.v"
/* verilator lint_off UNUSED */
module increment
  ( 
    i_a,
    o_c
    );
   
  input wire[7:0] i_a;
  output wire[7:0] o_c;
  
  adder f1(i_a, 0, 1, o_c);
endmodule
