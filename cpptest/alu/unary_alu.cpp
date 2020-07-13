#include "Vunary_alu.h"
#include <cstdio>
#include <iostream>
#include <memory>
#include <verilated.h>

constexpr int kBusWidth = 8;

int main(int argc, char **argv, char **env) {
  Verilated::commandArgs(argc, argv);
  std::unique_ptr<Vunary_alu> top(new Vunary_alu);
  while (!Verilated::gotFinish()) {
    for (int i = 0; i < 2; ++i)
      for (int j = 0; j < 2; ++j)
        for (int x = 0; x < (1 << kBusWidth); ++x) {
          top->i_z = i;
          top->i_n = j;
          top->i_X = x;
          top->eval();
          printf("z:%d n:%d X:%d O:%d", top->i_z, top->i_n, top->i_X, top->o_O);

          unsigned int O = top->i_X;
          if (top->i_z == 1)
            O = 0;
          if (top->i_n == 1) {
            for (int k = 0; k < kBusWidth; ++k) {
              O ^= (1 << k);
            }
          }

          if (top->o_O == O) {
            printf(" Success\n");
          } else {
            printf(" Error\n");
            i = 2;
            j = 2;
            x = (1 << kBusWidth);
            break;
          }
        }

    break;
  }
  top->final();
  return 0;
}
