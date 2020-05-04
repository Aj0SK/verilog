`include "modules/arithmetics/less_than_zero.v"
`include "modules/arithmetics/equal_zero.v"
module condition
  (
    X,
    lt,
    eq,
    gt,
    O
    );
   
  parameter BUS_WIDTH = 8;

  input lt, eq, gt;
  input wire[BUS_WIDTH-1:0] X;
  output O;
  
  wire is_zero, is_negative, is_positive;
  
  equal_zero #(.BUS_WIDTH(BUS_WIDTH)) h1(X, is_zero);
  less_than_zero #(.BUS_WIDTH(BUS_WIDTH)) h2(X, is_negative);
  assign is_positive = ~(is_zero | is_negative);
  
  wire flags_conforming;
  wire lt_and_negative, eq_and_zero, gt_and_positive;
  
  and(lt_and_negative, lt, is_negative);
  and(eq_and_zero, eq, is_negative);
  and(gt_and_positive, gt, is_positive);
  
  or(flags_conforming, lt_and_negative, eq_and_zero, gt_and_positive);
  
  wire all_true;
  and (all_true, lt, eq, gt);
  
  or(O, all_true, flags_conforming);
endmodule
