module d_flip_flop_tb();  
  reg st, d, clk;
  wire o;
  d_flip_flop c1 (st, d, clk, o);

  initial begin
  $display("st\td\tclk\to");
  d = 1; st = 1; clk = 0; #1000;
  $display("%d\t%d\t%d\t%d", st, d, clk, o);
  #1000;
  d = 1; st = 1; clk = 1; #1000;
  $display("%d\t%d\t%d\t%d", st, d, clk, o);
  #1000;
  d = 0; st = 0; clk = 0; #1000;
  $display("%d\t%d\t%d\t%d", st, d, clk, o);
  #1000;
  d = 0; st = 1; clk = 0; #1000;
  $display("%d\t%d\t%d\t%d", st, d, clk, o);
  d = 0; st = 1; clk = 1; #1000;
  $display("%d\t%d\t%d\t%d", st, d, clk, o);
  #1000;
  d = 0; st = 1; clk = 0; #1000;
  $display("%d\t%d\t%d\t%d", st, d, clk, o);
  #1000;
  d = 1; st = 1; clk = 0; #1000;
  $display("%d\t%d\t%d\t%d", st, d, clk, o);
  #1000;
  d = 1; st = 1; clk = 1; #1000;
  $display("%d\t%d\t%d\t%d", st, d, clk, o);
  #1000;
  end
endmodule // test
