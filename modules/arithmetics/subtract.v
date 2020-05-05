`include "modules/arithmetics/adder.v"
/* verilator lint_off UNUSED */
/* verilator lint_off DECLFILENAME */

module subtract
  ( 
    i_a,
    i_b,
    o_c
    );
  
  parameter BUS_WIDTH = 8;
  
  input wire[BUS_WIDTH-1:0] i_a;
  input wire[BUS_WIDTH-1:0] i_b;
  output wire[BUS_WIDTH-1:0] o_c;
  
  wire[BUS_WIDTH-1:0] inv_i_b;
  
  assign inv_i_b = ~i_b;
  adder #(.BUS_WIDTH(BUS_WIDTH)) f1(i_a, inv_i_b, 1'b1, o_c);
endmodule
