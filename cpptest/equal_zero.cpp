#include "Vequal_zero.h"
#include <cstdio>
#include <memory>
#include <verilated.h>

int main(int argc, char **argv, char **env) {
  Verilated::commandArgs(argc, argv);
  std::unique_ptr<Vequal_zero> top(new Vequal_zero);
  while (!Verilated::gotFinish()) {
    top->i_a = 12;
    top->eval();
    printf("a:%d equal_zero: %d\n", top->i_a, top->o);
    top->i_a = 0;
    top->eval();
    printf("a:%d equal_zero: %d\n", top->i_a, top->o);
    break;
  }
  top->final();
  return 0;
}
