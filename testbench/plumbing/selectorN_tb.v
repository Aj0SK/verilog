module selectorN_tb();  
  reg[5:0] i_a;
  reg[5:0] i_b;
  reg i_s;
  wire[5:0] o_c;
  selectorN #(.BUS_WIDTH(5)) sel(i_a, i_b, i_s, o_c);

  initial begin
  $display("i_a i_b i_s o_c");
  i_a = 14; i_b = 4; i_s = 0;#20;
  $display("%0b %0b %0d %0b", i_a, i_b, i_s, o_c);
  #10;
  i_a = 14; i_b = 4; i_s = 1;#20;
  $display("%0b %0b %0d %0b", i_a, i_b, i_s, o_c);
  #10;
  end
endmodule // test
