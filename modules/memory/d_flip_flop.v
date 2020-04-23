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
  reg store;
  
  always @(posedge clk)
  begin
    if(st) store <= d;
    if(clk) o <= store;
  end
  
  //latch l1(st & (~cl), d, x);
  //latch l2(clk, x, o);
endmodule
