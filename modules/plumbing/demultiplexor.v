/* verilator lint_off UNUSED */
/* verilator lint_off DECLFILENAME */

module demultiplexor
  ( 
    i_address,
    i_x,
    o_out
    );
  
  parameter ADDRESS_WIDTH = 2;
  
  input wire[ADDRESS_WIDTH-1:0] i_address;
  input wire i_x;
  output wire[(1<<ADDRESS_WIDTH)-1:0] o_out;
  
  wire[(1<<ADDRESS_WIDTH)-1:0] s;
  generate
  genvar i;
  for (i = 0; i < (1<<ADDRESS_WIDTH); i = i + 1)
    begin
      wire [ADDRESS_WIDTH-1:0] e = i;
      is_same #(.BUS_WIDTH(ADDRESS_WIDTH)) s1(e, i_address, s[i]);
      and(o_out[i], s[i], i_x);
    end
  endgenerate
endmodule

module is_same
  (
    x,
    y,
    out
    );

    parameter BUS_WIDTH = 4;
    input wire[BUS_WIDTH-1:0] x;
    input wire[BUS_WIDTH-1:0] y;
    output wire out;

    assign out = (x==y);
endmodule
