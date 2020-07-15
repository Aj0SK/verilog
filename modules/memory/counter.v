`include "modules/memory/regist.v"
`include "modules/arithmetics/increment.v"
module counter
  ( 
    st,
    X,
    clk,
    o
    );
   
  parameter BUS_WIDTH = 8;
   
  input st;
  input wire[BUS_WIDTH-1:0] X;
  input clk;
  output reg[BUS_WIDTH-1:0] o;
  
  reg [BUS_WIDTH-1:0] curr;
  wire [BUS_WIDTH-1:0] helper1;

  //assign helper1 = curr + 1;
  //increment inc1(curr, helper1);

  always @(posedge clk)
  begin
    o <= curr;
  end

  always @(st, X, o)
  begin
    curr = 0;
    if(st) curr = X;
    else curr = o+1;
  end
  
endmodule
