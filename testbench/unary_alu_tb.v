module unary_alu_tb();  
  reg z, n;
  reg[7:0] X;
  wire[7:0] O;
  unary_alu u_alu (z, n, X, O);

  initial begin
  $display("z n X O");
  z=0; n=0; X=20; #20;
  $display("%d %d %d %d", z, n, X, O);
  #10;
  z=1; n=0; X=30; #20;
  $display("%d %d %d %d", z, n, X, O);
  #10;
  z=0; n=1; X=0; #20;
  $display("%d %d %d %d", z, n, X, O);
  #10;
  end
endmodule // test
