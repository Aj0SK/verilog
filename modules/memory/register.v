`include "modules/memory/d_flip_flop.v"
module register
  ( 
    st,
    d,
    clk,
    o
    );
   
  parameter BUS_WIDTH = 8;
   
  input st;
  input wire[BUS_WIDTH-1:0] d;
  input clk;
  output wire[BUS_WIDTH-1:0] o;
  
  generate
  genvar i;
  for (i = 0; i < BUS_WIDTH; i = i + 1)
    begin
      d_flip_flop e(st, d[i], clk, o[i]);
    end
  endgenerate
endmodule
