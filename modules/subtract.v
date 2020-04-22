`include "modules/adder.v"
/* verilator lint_off UNUSED */
/* verilator lint_off DECLFILENAME */
module inverter
  ( 
    i_a,
    o_b
    );
   
  input wire[7:0] i_a;
  output wire[7:0] o_b;
  //assign o_b = ~i_a;
  assign o_b[0] = ~i_a[0];
  assign o_b[1] = ~i_a[1];
  assign o_b[2] = ~i_a[2];
  assign o_b[3] = ~i_a[3];
  assign o_b[4] = ~i_a[4];
  assign o_b[5] = ~i_a[5];
  assign o_b[6] = ~i_a[6];
  assign o_b[7] = ~i_a[7];
endmodule

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
  inverter inv_helper(i_b, inv_i_b);
  adder f1(i_a, inv_i_b, 1, o_c);
endmodule
