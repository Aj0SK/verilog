#include "Vless_than_zero.h"
#include <cstdio>
#include <memory>
#include <verilated.h>

int main(int argc, char **argv, char **env) {
  Verilated::commandArgs(argc, argv);
  std::unique_ptr<Vless_than_zero> top(new Vless_than_zero);
  while (!Verilated::gotFinish()) {
    top->i_a = 12;
    top->eval();
    printf("a:%d less_than_zero: %d\n", top->i_a, top->o);
    top->i_a = 0;
    top->eval();
    printf("a:%d less_than_zero: %d\n", top->i_a, top->o);
    top->i_a = 1;
    top->eval();
    printf("a:%d less_than_zero: %d\n", top->i_a, top->o);
    top->i_a = 1 << 7;
    top->eval();
    printf("a:%d less_than_zero: %d\n", top->i_a, top->o);
    break;
  }
  top->final();
  return 0;
}
