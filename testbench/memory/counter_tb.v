module counter_tb();  
  reg st, clk;
  reg [7:0] X;
  wire [7:0] o;
  counter c1 (st, X, clk, o);

  initial begin
  $display("st\tX\tclk\to");
  st = 1; X = 30; clk = 0; #1000;
  $display("%d\t%d\t%d\t%d", st, X, clk, o);
  #1000;
  st = 0; X = 30; clk = 0; #1000;
  $display("%d\t%d\t%d\t%d", st, X, clk, o);
  #1000;
  st = 0; X = 30; clk = 0; #1000;
  $display("%d\t%d\t%d\t%d", st, X, clk, o);
  #1000;
  st = 0; X = 30; clk = 1; #1000;
  $display("%d\t%d\t%d\t%d", st, X, clk, o);
  #1000;
  st = 0; X = 30; clk = 0; #1000;
  $display("%d\t%d\t%d\t%d", st, X, clk, o);
  #1000;
  st = 0; X = 30; clk = 1; #1000;
  $display("%d\t%d\t%d\t%d", st, X, clk, o);
  #1000;
  end
endmodule // test
