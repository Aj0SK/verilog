#include "Vd_flip_flop.h"
#include <cstdio>
#include <memory>
#include <verilated.h>

int main(int argc, char **argv, char **env) {
  Verilated::commandArgs(argc, argv);
  std::unique_ptr<Vd_flip_flop> top(new Vd_flip_flop);
  while (!Verilated::gotFinish()) {
    top->d = 0;
    top->load = 0;
    top->reset = 0;
    top->clk = 0;
    top->eval();
    printf("d:%d load:%d reset: %d clk: %d q:%d\n", top->d, top->load, top->reset, top->clk, top->q);
    top->d = 1;
    top->load = 1;
    top->reset = 0;
    top->clk = 1;
    top->eval();
    printf("d:%d load:%d reset: %d clk: %d q:%d\n", top->d, top->load, top->reset, top->clk, top->q);
    top->d = 1;
    top->load = 0;
    top->reset = 1;
    top->clk = 0;
    top->eval();
    printf("d:%d load:%d reset: %d clk: %d q:%d\n", top->d, top->load, top->reset, top->clk, top->q);
    top->d = 1;
    top->load = 0;
    top->reset = 1;
    top->clk = 1;
    top->eval();
    printf("d:%d load:%d reset: %d clk: %d q:%d\n", top->d, top->load, top->reset, top->clk, top->q);
    break;
  }
  top->final();
  return 0;
}
