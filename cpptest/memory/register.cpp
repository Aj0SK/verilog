#include "Vregister.h"
#include <cstdio>
#include <memory>
#include <verilated.h>

int main(int argc, char **argv, char **env) {
  Verilated::commandArgs(argc, argv);
  std::unique_ptr<Vregister> top(new Vregister);
  while (!Verilated::gotFinish()) {
    top->i_st = 1;
    top->i_d = 20;
    top->clk = 0;
    top->eval();
    printf("st:%d X:%d clk:%d counter: %d", top->i_st, top->i_d, top->clk,
           top->o_o);
    if (top->o_o == 0) {
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
