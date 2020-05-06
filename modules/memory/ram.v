`include "modules/memory/register.v"
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
  wire[(1<<ADDRESS_WIDTH)-1:0] ad_transl;
  
  demultiplexor #(.ADDRESS_WIDTH(ADDRESS_WIDTH)) de1(ad, 1'b1, ad_transl);
  wire[(1<<ADDRESS_WIDTH)-1:0] instr;
  
  generate
  genvar i;
  for (i = 0; i < (1<<ADDRESS_WIDTH); i = i + 1)
    begin
      and(instr[i], st, ad_transl[i]);
      register #(.BUS_WIDTH(BUS_WIDTH)) r(instr[i], X, clk, o[i]);
    end
  endgenerate
  //TODO
  assign O = o[ad];
endmodule
