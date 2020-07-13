`include "modules/plumbing/selector.v"
module unary_alu
  ( 
    i_z,
    i_n,
    i_X,
    o_O
    );
   
  input i_z;
  input i_n;
  input wire[7:0] i_X;
  output wire[7:0] o_O;
  
  wire[7:0] helperWire1;
  
  selector #(.BUS_WIDTH(8)) h1(i_X, 8'b0000, i_z, helperWire1);
  selector #(.BUS_WIDTH(8)) h2(helperWire1, ~helperWire1, i_n, o_O);
endmodule
