/* verilator lint_off UNUSED */
module switch
  ( 
    i_s,
    i_d,
    o_c1,
    o_c0
    );
   
  input i_s;
  input i_d;
  output o_c1;
  output o_c0;
  
  wire x;
  wire y;
  
  and h1(x, i_s, i_d);
  assign o_c1 = x;
  
  and(o_c0, ~x, i_d);
endmodule
