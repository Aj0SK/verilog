`include "modules/alu/unary_alu.v"
`include "modules/arithmetics/adder.v"
module alu
  ( 
    zx,
    nx,
    zy,
    ny,
    f,
    no,
    X,
    Y,
    O
    );
   
  input zx, nx, zy, ny, f, no;
  input wire[7:0] X;
  input wire[7:0] Y;
  output wire[7:0] O;
  
  wire[7:0] O1;
  wire[7:0] O2;
  
  unary_alu ualu1(zx, nx, X, O1);
  unary_alu ualu2(zy, ny, Y, O2);
  
  wire[7:0] RES1;
  wire[7:0] RES2;
  
  assign RES1 = O1 & O2;
  adder a1(O1, O2, 1'b0, RES2);
  
  wire[7:0] RES;
  selector8 s1(RES1, RES2, f, RES);
  
  selector8 s2(RES, ~RES, no, O);
  
endmodule
