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

module selector8
  ( 
    i_a,
    i_b,
    i_s,
    o_c
    );
   
  input wire[7:0] i_a;
  input wire[7:0] i_b;
  input i_s;
  output wire[7:0] o_c;
  
  or(o_c[0], i_b[0] & i_s, i_a[0] & (~i_s));
  or(o_c[1], i_b[1] & i_s, i_a[1] & (~i_s));
  or(o_c[2], i_b[2] & i_s, i_a[2] & (~i_s));
  or(o_c[3], i_b[3] & i_s, i_a[3] & (~i_s));
  or(o_c[4], i_b[4] & i_s, i_a[4] & (~i_s));
  or(o_c[5], i_b[5] & i_s, i_a[5] & (~i_s));
  or(o_c[6], i_b[6] & i_s, i_a[6] & (~i_s));
  or(o_c[7], i_b[7] & i_s, i_a[7] & (~i_s));
endmodule
