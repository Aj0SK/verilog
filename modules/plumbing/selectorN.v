module selectorN
  ( 
    i_a,
    i_b,
    i_s,
    o_c
    );
   
  parameter BUS_WIDTH = 8;
   
  input wire[BUS_WIDTH:0] i_a;
  input wire[BUS_WIDTH:0] i_b;
  input i_s;
  output wire[BUS_WIDTH:0] o_c;
  
  generate
  genvar i;
  for (i = 0; i < BUS_WIDTH; i = i + 1)
    begin
      or(o_c[i], i_b[i] & i_s, i_a[i] & (~i_s));
    end
  endgenerate 
endmodule
