#include "Vregister.h"
#include <cstdio>
#include <memory>
#include <verilated.h>

int main(int argc, char **argv, char **env) {
  Verilated::commandArgs(argc, argv);
  std::unique_ptr<Vregister> top(new Vregister);
  while (!Verilated::gotFinish()) {
    top->st = 1;
    top->d = 20;
    top->clk = 0;
    top->eval();
    printf("st:%d X:%d clk:%d counter: %d", top->st, top->d, top->clk,
           top->o);
    if (top->o == 0) {
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
