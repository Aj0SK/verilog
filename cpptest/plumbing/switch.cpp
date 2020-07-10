#include "Vswitch.h"
#include <cstdio>
#include <memory>
#include <verilated.h>

int main(int argc, char **argv, char **env) {
  Verilated::commandArgs(argc, argv);
  std::unique_ptr<Vswitch> top(new Vswitch);
  while (!Verilated::gotFinish()) {
    for (int i = 0; i < 2; ++i)
      for (int j = 0; j < 2; ++j) {
        top->i_s = i;
        top->i_d = j;
        top->eval();

        printf("i_s:%d i_d:%d o_c1:%d o_c0: %d", top->i_s, top->i_d, top->o_c1,
               top->o_c0);

        int o_c1 = 0, o_c0 = 0;

        if (top->i_s == 0)
          o_c0 = top->i_d;
        else
          o_c1 = top->i_d;

        if (o_c0 != top->o_c0 || o_c1 != top->o_c1) {
          printf("\tError\n");
          i = j = 3;
          break;
        } else {
          printf("\tSuccess\n");
        }
      }
    break;
  }
  top->final();
  return 0;
}
