`include "modules/alu/unary_alu.v"
`include "modules/arithmetics/adder.v"
module alu
  ( 
    i_zx,
    i_nx,
    i_zy,
    i_ny,
    i_f,
    i_no,
    i_X,
    i_Y,
    o_O
    );
   
  input i_zx, i_nx, i_zy, i_ny, i_f, i_no;
  input wire[7:0] i_X;
  input wire[7:0] i_Y;
  output wire[7:0] o_O;
  
  wire[7:0] O1;
  wire[7:0] O2;
  
  unary_alu ualu1(i_zx, i_nx, i_X, O1);
  unary_alu ualu2(i_zy, i_ny, i_Y, O2);
  
  wire[7:0] RES1;
  wire[7:0] RES2;
  
  assign RES1 = O1 & O2;
  adder a1(O1, O2, 1'b0, RES2);
  
  wire[7:0] RES;
  selector #(.BUS_WIDTH(8)) s1(RES1, RES2, i_f, RES);
  
  selector #(.BUS_WIDTH(8)) s2(RES, ~RES, i_no, o_O);
  
endmodule
