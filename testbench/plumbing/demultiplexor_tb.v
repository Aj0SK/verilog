module demultiplexor_tb();
  reg[1:0] i_add;
  reg x;
  wire[3:0] o_c;
  demultiplexor #(.ADDRESS_WIDTH(2)) dem(i_add, x, o_c);

  initial begin
  $display("i_add\ti_x\to_c");
  i_add = 2'b01; x = 1; #20;
  $display("%d\t%0b\t%d", i_add, x, o_c);
  #10;
  i_add = 2'b11; x = 1; #20;
  $display("%d\t%0b\t%d", i_add, x, o_c);
  #10;
  i_add = 2'b00; x = 1; #20;
  $display("%d\t%0b\t%d", i_add, x, o_c);
  #10;
  i_add = 2'b01; x = 0; #20;
  $display("%d\t%0b\t%d", i_add, x, o_c);
  #10;
  i_add = 2'b11; x = 0; #20;
  $display("%d\t%0b\t%d", i_add, x, o_c);
  #10;
  i_add = 2'b00; x = 0; #20;
  $display("%d\t%0b\t%d", i_add, x, o_c);
  #10;
  end
endmodule // test
