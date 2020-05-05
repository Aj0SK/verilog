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
  
  reg [BUS_WIDTH-1:0] helper1;
  wire [BUS_WIDTH-1:0] helper2;

  increment inc1(helper1, helper2);

  always @(posedge clk)
  begin
    o <= helper2;
  end

  always @(st)
  begin
    if(st)
      if(!clk)
        helper1 <= X;
  end
  
endmodule
