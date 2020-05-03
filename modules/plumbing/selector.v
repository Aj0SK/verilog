/* verilator lint_off UNUSED */
/* verilator lint_off DECLFILENAME */
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
  
  or(o_c, i_b & i_s, i_a & (~i_s));
endmodule
