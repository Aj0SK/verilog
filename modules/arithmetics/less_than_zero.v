/* verilator lint_off UNUSED */
module less_than_zero
  ( 
    i_a,
    o
    );
   
  input wire[7:0] i_a;
  output o;
  
  assign o = i_a[7];
endmodule
