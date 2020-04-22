#include "Vsubtract.h"
#include <cstdio>
#include <memory>
#include <verilated.h>

int main(int argc, char **argv, char **env) {
  Verilated::commandArgs(argc, argv);
  std::unique_ptr<Vsubtract> top(new Vsubtract);
  while (!Verilated::gotFinish()) {
    top->i_a = 1 << 4;
    top->i_b = 1 << 3;
    top->eval();

    printf("a:%d b:%d subtract: %d\n", top->i_a, top->i_b, top->o_c);
    break;
  }
  top->final();
  return 0;
}
