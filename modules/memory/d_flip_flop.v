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
  
  reg stored;
  
  always @(st, d)
  begin
    if(st) stored <= d;
  end
  
  always @(posedge clk)
  begin
    if(st) o <= stored;
  end
endmodule
