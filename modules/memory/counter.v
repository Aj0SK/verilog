`include "modules/memory/register.v"
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

  increment inc1(curr, helper1);

  always @(posedge clk)
  begin
    o <= curr;
  end

  always @(st, clk, X)
  begin
    if(st)
    begin
      if(!clk) curr <= X;
    end
    else
    begin
      if (!clk) curr <= helper1;
    end
  end
  
endmodule
