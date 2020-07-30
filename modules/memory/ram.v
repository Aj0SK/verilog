`include "modules/memory/regist.v"
`include "modules/plumbing/demultiplexor.v"
module ram
  ( 
    ad,
    st,
    X,
    clk,
    O
    );
   
  parameter BUS_WIDTH = 8;
  parameter ADDRESS_WIDTH = 8;
   
  input wire[ADDRESS_WIDTH-1:0] ad;
  input st;
  input wire[BUS_WIDTH-1:0] X;
  input clk;
  output wire[BUS_WIDTH-1:0] O;
  
  wire[(1<<ADDRESS_WIDTH)-1:0][BUS_WIDTH-1:0] o;
  
  demultiplexor #(.ADDRESS_WIDTH(ADDRESS_WIDTH)) de1(ad, st, instr);
  wire[(1<<ADDRESS_WIDTH)-1:0] instr;
  
  generate
  genvar i;
  for (i = 0; i < (1<<ADDRESS_WIDTH); i = i + 1)
    begin
      regist #(.BUS_WIDTH(BUS_WIDTH)) r(instr[i], X, clk, o[i]);
    end
  endgenerate
  //TODO
  assign O = o[ad];
endmodule
