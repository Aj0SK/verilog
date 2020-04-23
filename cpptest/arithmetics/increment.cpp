#include "Vincrement.h"
#include <cstdio>
#include <memory>
#include <verilated.h>

int main(int argc, char **argv, char **env) {
  Verilated::commandArgs(argc, argv);
  std::unique_ptr<Vincrement> top(new Vincrement);
  while (!Verilated::gotFinish()) {
    top->i_a = 12;
    top->eval();

    printf("a:%d increment: %d\n", top->i_a, top->o_c);
    top->i_a = 15;
    top->eval();
    printf("a:%d increment: %d\n", top->i_a, top->o_c);
    break;
  }
  top->final();
  return 0;
}
