/* verilator lint_off UNUSED */
module d_flip_flop
  ( 
    d,
    reset,
    load,
    clk,
    q
    );
   
  input d;
  input reset;
  input load;
  input clk;
  output reg q;
  
  always @(posedge clk)
  begin
    if (load)
    begin
        q <= d;
    end else if (reset)
    begin
        q <= 0;
    end
  end
endmodule
