`include "modules/latch.v"
module d_flip_flop
  ( 
    st,
    d,
    clk,
    o
    );
   
  input st;
  input d;
  input clk;
  output reg o;
  
  always @(posedge clk)
  begin
    if(st) o <= d;
  end
endmodule
