`include "modules/latch.v"
module d_flip_flop
  ( 
    i_st,
    i_d,
    clk,
    o_o
    );
   
  input i_st;
  input i_d;
  input clk;
  output reg o_o;
  
  reg stored = 0;
  
  always @(i_st, i_d, o_o)
  begin
    stored = 0;
    if(i_st) stored = i_d;
    else stored = o_o;
  end
  
  always @(posedge clk)
  begin
    o_o <= stored;
  end
endmodule
