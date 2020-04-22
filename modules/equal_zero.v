/* verilator lint_off UNUSED */
module equal_zero
  ( 
    i_a,
    o
    );
   
  input wire[7:0] i_a;
  output o;
  
  wire[7:0] invert_a;
  
  wire[4:0] helper1;
  wire[2:0] helper2;
  wire[1:0] helper3;
  
  assign invert_a = ~i_a;
  
  and h1(helper1[0], invert_a[0], invert_a[1]);
  and h2(helper1[1], invert_a[2], invert_a[3]);
  and h3(helper1[2], invert_a[4], invert_a[5]);
  and h4(helper1[3], invert_a[6], invert_a[7]);
  
  and h5(helper2[0], helper1[0], helper1[1]);
  and h6(helper2[1], helper1[2], helper1[3]);
  
  and h7(helper3[0], helper2[0], helper2[1]);
  
  assign o = helper3[0];
endmodule
