/* verilator lint_off UNUSED */

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
module demultiplexor
  ( 
    address,
    x,
    out
    );
  
  parameter ADDRESS_WIDTH = 2;
  
  input wire[ADDRESS_WIDTH-1:0] address;
  input wire x;
  output wire[(1<<ADDRESS_WIDTH)-1:0] out;
  
  wire[(1<<ADDRESS_WIDTH)-1:0] s;
  generate
  genvar i;
  for (i = 0; i < (1<<ADDRESS_WIDTH); i = i + 1)
    begin
      wire [ADDRESS_WIDTH-1:0] e = i;
      is_same #(.BUS_WIDTH(ADDRESS_WIDTH)) s1(e, address, s[i]);
      and(out[i], s[i], x);
    end
  endgenerate
  
endmodule
