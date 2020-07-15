`include "modules/plumbing/selector.v"
module unary_alu
  ( 
    i_z,
    i_n,
    i_X,
    o_O
    );

  parameter BUS_WIDTH = 8;

  input i_z;
  input i_n;
  input wire[BUS_WIDTH-1:0] i_X;
  output wire[BUS_WIDTH-1:0] o_O;

  wire[BUS_WIDTH-1:0] helperWire1;

  wire[BUS_WIDTH-1:0] zero = 0;

  selector #(.BUS_WIDTH(BUS_WIDTH)) h1(i_X, zero, i_z, helperWire1);
  selector #(.BUS_WIDTH(BUS_WIDTH)) h2(helperWire1, ~helperWire1, i_n, o_O);
endmodule
