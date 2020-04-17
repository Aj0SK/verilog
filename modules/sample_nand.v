`include "modules/sample_and.v"
module sample_nand
  ( 
    input_1,
    input_2,
    nand_result);
   
  input  input_1;
  input  input_2;
  output nand_result;
  
  wire helper;
    sample_and sample_and_x(
    .input_1   (input_1),
    .input_2   (input_2),
    .and_result (helper)
  );
  
  assign nand_result = ~helper;
 
endmodule
