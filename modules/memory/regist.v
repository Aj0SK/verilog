`include "modules/memory/d_flip_flop.v"
module regist
  ( 
    i_st,
    i_d,
    clk,
    o_o
    );
   
  parameter BUS_WIDTH = 8;
   
  input i_st;
  input wire[BUS_WIDTH-1:0] i_d;
  input clk;
  output wire[BUS_WIDTH-1:0] o_o;
  
  generate
  genvar i;
  for (i = 0; i < BUS_WIDTH; i = i + 1)
    begin
      d_flip_flop e(i_st, i_d[i], clk, o_o[i]);
    end
  endgenerate
endmodule
