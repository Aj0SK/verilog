module alu_tb();  
  reg zx, zy, nx, ny, f, no;
  reg[7:0] X;
  reg[7:0] Y;
  wire[7:0] O;
  alu alu1 (zx, nx, zy, ny, f, no, X, Y, O);

  initial begin
  $display("zx nx zy ny f no X Y O");
  zx=0; nx=0; zy=0; ny=0; f=1; no=0; X=20; Y=15; #20;
  $display("%d %d %d %d %d %d %d %d %d", zx, nx, zy, ny, f, no, X, Y, O);
  #10;
  end
endmodule // test
