module half_adder
  ( 
    input_a,
    input_b,
    output_h,
    output_l
    );
   
  input  input_a;
  input  input_b;
  output output_h;
  output output_l;
  
  assign output_h = input_a & input_b;
  assign output_l = input_a ^ input_b;
 
endmodule
