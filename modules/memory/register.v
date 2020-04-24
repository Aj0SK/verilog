`include "modules/memory/d_flip_flop.v"
module register
  ( 
    st,
    d,
    clk,
    o
    );
   
  input st;
  input wire[7:0] d;
  input clk;
  output wire[7:0] o;
  
  d_flip_flop d0(st, d[0], clk, o[0]);
  d_flip_flop d1(st, d[1], clk, o[1]);
  d_flip_flop d2(st, d[2], clk, o[2]);
  d_flip_flop d3(st, d[3], clk, o[3]);
  d_flip_flop d4(st, d[4], clk, o[4]);
  d_flip_flop d5(st, d[5], clk, o[5]);
  d_flip_flop d6(st, d[6], clk, o[6]);
  d_flip_flop d7(st, d[7], clk, o[7]);
  
endmodule
