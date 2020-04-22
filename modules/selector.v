/* verilator lint_off UNUSED */
module selector
  ( 
    i_a,
    i_b,
    i_s,
    o_c
    );
   
  input i_a;
  input i_b;
  input i_s;
  output o_c;
  
  wire x;
  wire y;
  
  and h1(x, i_b, i_s);
  and h2(y, i_a, ~i_s);
  
  or(o_c, x, y);
  
endmodule
