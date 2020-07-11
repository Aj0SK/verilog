#include "Vd_flip_flop.h"
#include <cstdio>
#include <memory>
#include <verilated.h>

int main(int argc, char **argv, char **env) {
  Verilated::commandArgs(argc, argv);
  std::unique_ptr<Vd_flip_flop> top(new Vd_flip_flop);
  while (!Verilated::gotFinish()) {
    top->i_st = 1;
    top->i_d = 1;
    top->clk = 0;
    top->eval();
    printf("st:%d d:%d clk:%d o:%d", top->i_st, top->i_d, top->clk, top->o_o);
    if (top->o_o == 0) {
      printf(" Success\n");
    } else {
      printf(" Error\n");
      break;
    }

    top->i_st = 1;
    top->i_d = 1;
    top->clk = 1;
    top->eval();
    printf("st:%d d:%d clk:%d o:%d", top->i_st, top->i_d, top->clk, top->o_o);
    if (top->o_o == 1) {
      printf(" Success\n");
    } else {
      printf(" Error\n");
      break;
    }

    top->i_st = 0;
    top->i_d = 1;
    top->clk = 0;
    top->eval();
    printf("st:%d d:%d clk:%d o:%d", top->i_st, top->i_d, top->clk, top->o_o);
    if (top->o_o == 1) {
      printf(" Success\n");
    } else {
      printf(" Error\n");
      break;
    }

    break;
  }
  top->final();
  return 0;
}
