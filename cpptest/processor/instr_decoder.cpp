#include "Vinstr_decoder.h"
#include <cstdio>
#include <memory>
#include <vector>
#include <verilated.h>

using std::vector;

constexpr int kBusWidth = 16;
constexpr int kMaxNumber = 1 << kBusWidth;

int main(int argc, char **argv, char **env) {
  Verilated::commandArgs(argc, argv);
  std::unique_ptr<Vinstr_decoder> top(new Vinstr_decoder);

  while (!Verilated::gotFinish()) {

    for (int instr = 0; instr < kMaxNumber; ++instr) {
      vector<int> bits;

      for (int i = 0; i < kBusWidth; ++i)
        bits.push_back((instr & (1 << i)) >> i);

      top->i_X = instr;
      top->eval();

      if (bits[15] == 0) {
        if (top->o_W != instr) {
          printf(" Error\n");
          break;
        }
        if (top->o_a != 1) {
          printf(" Error\n");
          break;
        }

        // TODO: refactor later
        if (top->o_sm == 1 || top->o_zx == 1 || top->o_nx == 1 ||
            top->o_zy == 1 || top->o_ny == 1 || top->o_f == 1 ||
            top->o_no == 1 || top->o_d == 1 || top->o_p == 1 ||
            top->o_gt == 1 || top->o_eq == 1 || top->o_lt == 1) {
          printf(" Error\n");
          break;
        }
      } else {
        if (top->o_ci != 1 || top->o_W != 0) {
          printf(" Error\n");
          break;
        }
        if (top->o_sm != bits[12] || top->o_zx != bits[11] ||
            top->o_nx != bits[10] || top->o_zy != bits[9] ||
            top->o_ny != bits[8] || top->o_f != bits[7] ||
            top->o_no != bits[6] || top->o_d != bits[4] ||
            top->o_p != bits[3] || top->o_gt != bits[2] ||
            top->o_eq != bits[1] || top->o_lt != bits[0]) {
          printf(" Error\n");
          break;
        }
      }
    }
    break;
  }
  top->final();
  return 0;
}
