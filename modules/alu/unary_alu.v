`include "modules/plumbing/selector.v"
module unary_alu
  ( 
    z,
    n,
    X,
    O
    );
   
  input z;
  input n;
  input wire[7:0] X;
  output wire[7:0] O;
  
  input wire[7:0] helperWire1;
  
  selector #(.BUS_WIDTH(8)) h1(X, 8'b0000, z, helperWire1);
  selector #(.BUS_WIDTH(8)) h2(helperWire1, ~helperWire1, n, O);
endmodule
