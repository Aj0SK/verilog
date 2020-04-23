module latch_tb();  
  reg st, d;
  wire o;
  latch c1 (st, d, o);

  initial begin
  $display("st d o");
  d = 0; st = 1; #20;
  $display("%d %d %d", st, d, o);
  #10;
  d = 1; st = 1; #20;
  $display("%d %d %d", st, d, o);
  #10;
  d = 0; st = 1; #20;
  $display("%d %d %d", st, d, o);
  #10;
  d = 1; st = 1; #20;
  $display("%d %d %d", st, d, o);
  d = 1; st = 0; #20;
  $display("%d %d %d", st, d, o);
  d = 0; st = 0; #20;
  $display("%d %d %d", st, d, o);
  d = 1; st = 0; #20;
  $display("%d %d %d", st, d, o);
  end
endmodule // test
