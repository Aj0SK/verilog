/* verilator lint_off MODDUP */
`include "modules/memory/ram.v"
`include "modules/alu/alu.v"
`include "modules/processor/instr_decoder.v"
`include "modules/processor/comb_mem.v"
`include "modules/alu/condition.v"
module control_unit
  (
    i_l,
    i_clk,
    o_j,
    o_A
    );

  parameter BUS_WIDTH = 16;

  input i_clk;
  input wire[BUS_WIDTH-1:0] i_l;
  output o_j;
  output wire[BUS_WIDTH-1:0] o_A;

  wire[BUS_WIDTH-1:0] dec_W;
  wire dec_ci, dec_sm, dec_zx, dec_nx, dec_zy, dec_ny, dec_f, dec_no, dec_a, dec_d, dec_p, dec_gt, dec_eq, dec_lt;

  instr_decoder #(.BUS_WIDTH(BUS_WIDTH)) decoder(i_l, dec_ci, dec_sm, dec_zx, dec_nx, dec_zy, dec_ny, dec_f, dec_no, dec_a, dec_d, dec_p, dec_gt, dec_eq, dec_lt, dec_W);

  wire[BUS_WIDTH-1:0] selOperand;

  selector #(.BUS_WIDTH(BUS_WIDTH)) selectorOperand (dec_W, alu_out, dec_ci, selOperand);

  wire[BUS_WIDTH-1:0] memout_A, memout_D, memout_P;

  comb_mem #(.BUS_WIDTH(BUS_WIDTH)) memory (dec_a, dec_d, dec_p, selOperand, i_clk, memout_A, memout_D, memout_P);

  wire[BUS_WIDTH-1:0] selAluOperand;

  selector #(.BUS_WIDTH(BUS_WIDTH)) selectorAluOperand (memout_A, memout_P, dec_sm, selAluOperand);

  wire[BUS_WIDTH-1:0] alu_out;

  alu #(.BUS_WIDTH(BUS_WIDTH)) main_alu(dec_zx, dec_nx, dec_zy, dec_ny, dec_f, dec_no, memout_D, selAluOperand, alu_out);

  condition #(.BUS_WIDTH(BUS_WIDTH)) cond (alu_out, dec_lt, dec_eq, dec_gt, o_j);

  assign o_A = memout_A;
endmodule
