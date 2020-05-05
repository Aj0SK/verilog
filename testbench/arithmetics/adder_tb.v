module adder_tb();  
  reg[15:0] i_a, i_b;
  reg i_c;
  wire [15:0] o_c;
  adder #(.BUS_WIDTH(16)) c1 (i_a, i_b, i_c, o_c);

  initial begin
  $display("i_a i_b i_c o_c");
  i_a = 0; i_b = 20; i_c = 1; #20;
  $display("%d %d %d %d", i_a, i_b, i_c, o_c);
  #10;
  i_a = 55; i_b = 30; i_c = 0;#20;
  $display("%d %d %d %d", i_a, i_b, i_c, o_c);
  end
endmodule // test
