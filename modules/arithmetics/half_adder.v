module half_adder
  ( 
    i_a,
    i_b,
    o_h,
    o_l
    );
   
  input  i_a;
  input  i_b;
  output o_h;
  output o_l;
  
  assign o_h = i_a & i_b;
  assign o_l = i_a ^ i_b;
 
endmodule
