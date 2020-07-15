`include "modules/plumbing/selector.v"
module instr_decoder
  (
    i_X,
    o_ci,
    o_sm,
    o_zx,
    o_nx,
    o_zy,
    o_ny,
    o_f,
    o_no,
    o_a,
    o_d,
    o_p,
    o_gt,
    o_eq,
    o_lt,
    o_W
    );

  parameter BUS_WIDTH = 16;

  input wire[BUS_WIDTH-1:0] i_X;
  output wire o_ci, o_sm, o_zx, o_nx, o_zy, o_ny, o_f, o_no, o_a, o_d, o_p, o_gt, o_eq, o_lt;
  output wire[BUS_WIDTH-1:0] o_W;

  assign o_ci = i_X[15];

  assign o_sm = i_X[12] & i_X[15];
  assign o_zx = i_X[11] & i_X[15];
  assign o_nx = i_X[10] & i_X[15];
  assign o_zy = i_X[9] & i_X[15];
  assign o_ny = i_X[8] & i_X[15];
  assign o_f = i_X[7] & i_X[15];
  assign o_no = i_X[6] & i_X[15];
  assign o_d = i_X[4] & i_X[15];
  assign o_p = i_X[3] & i_X[15];
  assign o_gt = i_X[2] & i_X[15];
  assign o_eq = i_X[1] & i_X[15];
  assign o_lt = i_X[0] & i_X[15];

  assign o_a = ~(i_X[15] & (~i_X[5]));

  wire[BUS_WIDTH-1:0] zero = 0;

  selector #(.BUS_WIDTH(BUS_WIDTH)) s(i_X, zero, i_X[15], o_W);

endmodule
