#include "Vcondition.h"
#include <cstdio>
#include <iostream>
#include <memory>
#include <verilated.h>

constexpr int kBusWidth = 8;

int main(int argc, char **argv, char **env) {
  Verilated::commandArgs(argc, argv);
  std::unique_ptr<Vcondition> top(new Vcondition);
  while (!Verilated::gotFinish()) {
    for (int i = 0; i < 2; ++i)
      for (int j = 0; j < 2; ++j)
        for (int k = 0; k < 2; ++k)
          for (int x = 0; x < (1 << kBusWidth); ++x) {
            if (i == 0 && j == 0 && k == 0)
              continue;
            top->i_lt = i;
            top->i_eq = j;
            top->i_gt = k;
            top->i_X = x % (1 << kBusWidth);
            top->eval();
            printf("i_lt:%d i_eq:%d i_gt:%d i_X:%d o_o:%d", top->i_lt,
                   top->i_eq, top->i_gt, top->i_X, top->o_o);

            bool negative = (top->i_X & (1 << (kBusWidth - 1))) != 0;
            bool o = true;
            if (top->i_lt == 0 && negative)
              o = false;
            if (top->i_eq == 0 && top->i_X == 0)
              o = false;
            if (top->i_gt == 0 && (!negative && top->i_X != 0))
              o = false;

            if (top->o_o == o) {
              printf(" Success\n");
            } else {
              printf(" Error\n");
              i = j = k = 2;
              x = (1 << kBusWidth);
              break;
            }
          }
    break;
  }
  top->final();
  return 0;
}
