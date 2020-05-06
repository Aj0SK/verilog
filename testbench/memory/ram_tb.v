module ram_tb();  
  reg st;
  reg[1:0] ad;
  reg clk;
  reg[7:0] X;
  wire[7:0] O;
  ram #(.BUS_WIDTH(8), .ADDRESS_WIDTH(2)) r1 (ad, st, X, clk, O);

  initial begin
  $display("ad\tst\tX\tclk\tO");
  ad=2; st=1; X = 1; clk = 0; #10000;
  $display("%d\t%d\t%d\t%d\t%d", ad, st, X, clk, O);
  #10000;
  ad=2; st=1; X = 1; clk = 1; #10000;
  $display("%d\t%d\t%d\t%d\t%d", ad, st, X, clk, O);
  #10000;
  ad=2; st=1; X = 30; clk = 1; #1000;
  $display("%d\t%d\t%d\t%d\t%d", ad, st, X, clk, O);
  #1000;
  ad=2; st=1; X = 31; clk = 0; #1000;
  $display("%d\t%d\t%d\t%d\t%d", ad, st, X, clk, O);
  #1000;
  ad=2; st=1; X = 32; clk = 1; #1000;
  $display("%d\t%d\t%d\t%d\t%d", ad, st, X, clk, O);
  #1000;
  ad=2; st=1; X = 33; clk = 1; #1000;
  $display("%d\t%d\t%d\t%d\t%d", ad, st, X, clk, O);
  #1000;
  ad=2; st=0; X = 15; clk = 1; #1000;
  $display("%d\t%d\t%d\t%d\t%d", ad, st, X, clk, O);
  #1000;
  end
endmodule // test
