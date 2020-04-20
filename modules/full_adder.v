`include "modules/half_adder.v"
module full_adder
  ( 
    i_a,
    i_b,
    i_c,
    o_h,
    o_l
    );
   
  input  i_a;
  input  i_b;
  input  i_c;
  output o_h;
  output o_l;
  
  wire helper1;
  wire helper2;
  wire helper3;

  half_adder h1(i_a, i_b, helper1, helper2);
  half_adder h2(helper2, i_c, helper3, o_l);
  assign o_h = helper1 | helper3;
endmodule
