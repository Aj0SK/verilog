module condition_tb();  
  reg lt, eq, gt;
  reg[7:0] X;
  wire O;
  condition #(.BUS_WIDTH(8)) cond1 (X, lt, eq, gt, O);

  initial begin
  //$display("X\tlt\teq\tgt\tO");
  X = 20; lt = 0; eq = 0; gt = 1; #20;
  $display("X:%d\tlt:%d\teq:%d\tgt:%d\tO:%d", X, lt, eq, gt, O);
  #10;
  X = 0; lt = 0; eq = 1; gt = 0; #20;
  $display("X:%d\tlt:%d\teq:%d\tgt:%d\tO:%d", X, lt, eq, gt, O);
  #10;
  X = 130; lt = 1; eq = 0; gt = 0; #20;
  $display("X:%d\tlt:%d\teq:%d\tgt:%d\tO:%d", X, lt, eq, gt, O);
  #10;
  end
endmodule // test
