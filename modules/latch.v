`include "modules/selector.v"
module latch
  ( 
    st,
    d,
    o
    );
   
  input st;
  input d;
  output reg o;
  
  always @(st or d)
  begin
    if (st) begin
    o <= d;
    end
  end
  
endmodule
