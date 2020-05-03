module less_than_zero
  ( 
    i_a,
    o
    );
  parameter BUS_WIDTH = 8;

  input wire[BUS_WIDTH-1:0] i_a;
  output o;
  
  assign o = i_a[BUS_WIDTH-1];
endmodule
