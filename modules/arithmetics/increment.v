`include "modules/arithmetics/adder.v"
/* verilator lint_off UNUSED */
module increment
  ( 
    i_a,
    o_c
    );

  parameter BUS_WIDTH = 8;
  wire [BUS_WIDTH-1:0] k_const = 0; 

  input wire[BUS_WIDTH-1:0] i_a;
  output wire[BUS_WIDTH-1:0] o_c;
  
  adder #(.BUS_WIDTH(BUS_WIDTH)) f1(i_a, k_const, 1'b1, o_c);
endmodule
