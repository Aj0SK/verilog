/* verilator lint_off UNUSED */
module switch
  ( 
    s,
    d,
    c1,
    c0
    );
   
  input s;
  input d;
  output c1;
  output c0;
  
  wire x;
  wire y;
  
  and h1(x, s, d);
  assign c1 = x;
  
  and(c0, ~x, d);
endmodule
