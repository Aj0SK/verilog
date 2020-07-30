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

  generate
  genvar i;
  for (i = 0; i < (1<<ADDRESS_WIDTH); i = i + 1)
    begin
      assign o_out[i] = (i == i_address) & i_x;
    end
  endgenerate
endmodule
