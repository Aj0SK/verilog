module equal_zero_tb();  
  reg[15:0] i_a;
  wire o_c;
  equal_zero #(.BUS_WIDTH(16)) c1 (i_a, o_c);

  initial begin
  $display("i_a o_c");
  i_a = 0; #20;
  $display("%b %b", i_a, o_c);
  #10;
  i_a = 55; #20;
  $display("%b %b", i_a, o_c);
  end
endmodule // test
