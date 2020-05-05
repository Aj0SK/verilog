module register_tb();  
  reg st;
  reg[7:0] d;
  reg clk;
  wire[7:0] o;
  register #(.BUS_WIDTH(8)) c1 (st, d, clk, o);

  initial begin
  $display("st\td\tclk\to");
  d = 1; st = 1; clk = 0; #1000;
  $display("%d\t%d\t%d\t%d", st, d, clk, o);
  #1000;
  d = 1; st = 1; clk = 1; #1000;
  $display("%d\t%d\t%d\t%d", st, d, clk, o);
  #1000;
  d = 30; st = 1; clk = 1; #1000;
  $display("%d\t%d\t%d\t%d", st, d, clk, o);
  #1000;
  d = 31; st = 1; clk = 0; #1000;
  $display("%d\t%d\t%d\t%d", st, d, clk, o);
  d = 32; st = 0; clk = 0; #1000;
  $display("%d\t%d\t%d\t%d", st, d, clk, o);
  #1000;
  d = 33; st = 1; clk = 1; #1000;
  $display("%d\t%d\t%d\t%d", st, d, clk, o);
  #1000;
  end
endmodule // test
