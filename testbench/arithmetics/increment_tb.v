module increment_tb();  
  reg[15:0] i_a;
  wire [15:0] o_c;
  increment #(.BUS_WIDTH(16)) c1 (i_a, o_c);

  initial begin
  $display("i_a o_c");
  i_a = 20; #20;
  $display("%d %d", i_a, o_c);
  #10;
  i_a = 20; #20;
  $display("%d %d", i_a, o_c);
  end
endmodule // test
