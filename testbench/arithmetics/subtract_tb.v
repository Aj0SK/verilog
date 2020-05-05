module subtract_tb();  
  reg[15:0] i_a, i_b;
  wire [15:0] o_c;
  subtract #(.BUS_WIDTH(16)) c1 (i_a, i_b, o_c);

  initial begin
  $display("i_a i_b o_c");
  i_a = 0; i_b = 20; #20;
  $display("%d %d %d", i_a, i_b, o_c);
  #10;
  i_a = 55; i_b = 30; #20;
  $display("%d %d %d", i_a, i_b, o_c);
  end
endmodule // test
