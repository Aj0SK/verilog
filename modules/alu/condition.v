`include "modules/arithmetics/less_than_zero.v"
`include "modules/arithmetics/equal_zero.v"
module condition
  (
    i_X,
    i_lt,
    i_eq,
    i_gt,
    o_o
    );
   
  parameter BUS_WIDTH = 8;

  input i_lt, i_eq, i_gt;
  input wire[BUS_WIDTH-1:0] i_X;
  output o_o;
  
  wire is_zero, is_negative, is_positive;
  
  equal_zero #(.BUS_WIDTH(BUS_WIDTH)) h1(i_X, is_zero);
  less_than_zero #(.BUS_WIDTH(BUS_WIDTH)) h2(i_X, is_negative);
  assign is_positive = ~(is_zero | is_negative);
  
  wire flags_conforming;
  wire lt_and_negative, eq_and_zero, gt_and_positive;
  
  and(lt_and_negative, i_lt, is_negative);
  and(eq_and_zero, i_eq, is_zero);
  and(gt_and_positive, i_gt, is_positive);
  
  or(flags_conforming, lt_and_negative, eq_and_zero, gt_and_positive);
  
  wire all_true;
  and (all_true, i_lt, i_eq, i_gt);
  
  or(o_o, all_true, flags_conforming);
endmodule
