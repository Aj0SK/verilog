`include "modules/selector.v"
module latch
  ( 
    st,
    d,
    o
    );
   
  input st;
  input d;
  output o;
  
  selector s1(o, d, st, o);
endmodule
