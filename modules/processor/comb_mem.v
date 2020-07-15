`include "modules/memory/ram.v"
module comb_mem
  ( 
    i_a,
    i_d,
    i_p,
    i_X,
    i_clk,
    o_A,
    o_D,
    o_P
    );
  
  parameter BUS_WIDTH = 8;
  
  input i_a, i_d, i_p, i_clk;
  input wire[BUS_WIDTH-1:0] i_X;
  output wire[BUS_WIDTH-1:0] o_A, o_D, o_P;
  
  wire[BUS_WIDTH-1:0] outputA;
  
  regist #(.BUS_WIDTH(BUS_WIDTH)) r_a(i_a, i_X, i_clk, outputA);
  regist #(.BUS_WIDTH(BUS_WIDTH)) r_d(i_d, i_X, i_clk, o_D);
  
  assign o_A = outputA;
  
  ram #(.BUS_WIDTH(BUS_WIDTH), .ADDRESS_WIDTH(BUS_WIDTH)) ram_a (outputA, i_p, i_X, i_clk, o_P);
  
endmodule
