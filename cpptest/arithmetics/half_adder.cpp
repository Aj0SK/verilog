#include "Vhalf_adder.h"
#include <cstdio>
#include <verilated.h>

int main(int argc, char **argv, char **env) {
  Verilated::commandArgs(argc, argv);
  Vhalf_adder *top = new Vhalf_adder;
  while (!Verilated::gotFinish()) {
    top->i_a = 1;
    top->i_b = 1;
    top->eval();
    printf("a:%d b:%d h:%d l:%d\n", top->i_a, top->i_b, top->o_h, top->o_l);
    top->i_a = 1;
    top->i_b = 0;
    top->eval();
    printf("a:%d b:%d h:%d l:%d\n", top->i_a, top->i_b, top->o_h, top->o_l);
    break;
  }
  delete top;
  return 0;
}
