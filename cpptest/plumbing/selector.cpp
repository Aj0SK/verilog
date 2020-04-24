#include "Vselector.h"
#include <cstdio>
#include <memory>
#include <verilated.h>

int main(int argc, char **argv, char **env) {
  Verilated::commandArgs(argc, argv);
  std::unique_ptr<Vselector> top(new Vselector);
  while (!Verilated::gotFinish()) {
    top->i_a = 1;
    top->i_b = 1;
    top->i_s = 1;
    top->eval();
    printf("a:%d b:%d s:%d output: %d\n", top->i_a, top->i_b, top->i_s,
           top->o_c);
    top->i_a = 0;
    top->i_b = 1;
    top->i_s = 0;
    top->eval();
    printf("a:%d b:%d s:%d output: %d\n", top->i_a, top->i_b, top->i_s,
           top->o_c);
    top->i_a = 1;
    top->i_b = 0;
    top->i_s = 1;
    top->eval();
    printf("a:%d b:%d s:%d output: %d\n", top->i_a, top->i_b, top->i_s,
           top->o_c);
    top->i_a = 0;
    top->i_b = 1;
    top->i_s = 1;
    top->eval();
    printf("a:%d b:%d s:%d output: %d\n", top->i_a, top->i_b, top->i_s,
           top->o_c);
    top->i_a = 1;
    top->i_b = 0;
    top->i_s = 0;
    top->eval();
    printf("a:%d b:%d s:%d output: %d\n", top->i_a, top->i_b, top->i_s,
           top->o_c);
    break;
  }
  top->final();
  return 0;
}
