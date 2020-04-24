#include "Vswitch.h"
#include <cstdio>
#include <memory>
#include <verilated.h>

int main(int argc, char **argv, char **env) {
  Verilated::commandArgs(argc, argv);
  std::unique_ptr<Vswitch> top(new Vswitch);
  while (!Verilated::gotFinish()) {
    top->s = 0;
    top->d = 0;
    top->eval();
    printf("s:%d d:%d c1:%d c0: %d\n", top->s, top->d, top->c1, top->c0);
    top->s = 0;
    top->d = 1;
    top->eval();
    printf("s:%d d:%d c1:%d c0: %d\n", top->s, top->d, top->c1, top->c0);
    top->s = 1;
    top->d = 0;
    top->eval();
    printf("s:%d d:%d c1:%d c0: %d\n", top->s, top->d, top->c1, top->c0);
    top->s = 1;
    top->d = 1;
    top->eval();
    printf("s:%d d:%d c1:%d c0: %d\n", top->s, top->d, top->c1, top->c0);
    break;
  }
  top->final();
  return 0;
}
