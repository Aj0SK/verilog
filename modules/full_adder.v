`include "modules/half_adder.v"
module full_adder
  ( 
    input_a,
    input_b,
    input_carry,
    output_h,
    output_l
    );
   
  input  input_a;
  input  input_b;
  input  input_carry;
  output output_h;
  output output_l;
  
  wire helper1;
  wire helper2;
  wire helper3;

  half_adder  h1(.input_a(input_a), .input_b(input_b), .output_h(helper1), .output_l(helper2));
  half_adder  h2(.input_a(helper2), .input_b(input_carry), .output_h(helper3), .output_l(output_l));
  assign output_h = helper1 | helper3;
endmodule
