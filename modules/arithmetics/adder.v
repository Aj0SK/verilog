`include "modules/arithmetics/full_adder.v"
/* verilator lint_off UNUSED */
/* verilator lint_off UNOPTFLAT */
module adder
  ( 
    i_a,
    i_b,
    i_c,
    o_c
    );

  parameter BUS_WIDTH = 8;

  input wire[BUS_WIDTH-1:0] i_a;
  input wire[BUS_WIDTH-1:0] i_b;
  input i_c;
  output wire[BUS_WIDTH-1:0] o_c;
  
  wire [BUS_WIDTH-1:0] carry;
  
  full_adder f1(i_a[0], i_b[0], i_c, carry[0], o_c[0]);
  
  generate
  genvar i;
  for (i = 1; i < BUS_WIDTH; i = i + 1)
    begin
      full_adder f(i_a[i], i_b[i], carry[i-1], carry[i], o_c[i]);
    end
  endgenerate
endmodule
