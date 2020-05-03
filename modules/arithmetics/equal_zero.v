/* verilator lint_off UNUSED */
/* verilator lint_off UNOPTFLAT */
module equal_zero
  ( 
    i_a,
    o_c
    );

  parameter BUS_WIDTH = 8;

  input wire[BUS_WIDTH-1:0] i_a;
  output o_c;
  
  wire[BUS_WIDTH-1:0] invert_a;

  assign invert_a = ~i_a;

  wire[BUS_WIDTH-2:0] helper;
  
  and (helper[0], invert_a[0], invert_a[1]);
  generate
  genvar i;
  for (i = 1; i < BUS_WIDTH-1; i = i + 1)
    begin
      and(helper[i], helper[i-1], invert_a[i+1]);
    end
  endgenerate
  assign o_c = helper[BUS_WIDTH-2];
endmodule
