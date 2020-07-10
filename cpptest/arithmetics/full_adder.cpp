#include "Vfull_adder.h"
#include <cstdio>
#include <verilated.h>

int main(int argc, char **argv, char **env) {
  Verilated::commandArgs(argc, argv);
  Vfull_adder *top = new Vfull_adder;
  while (!Verilated::gotFinish()) {

    for (int i = 0; i < 2; ++i)
      for (int j = 0; j < 2; ++j)
        for (int k = 0; k < 2; ++k) {
          int sum = i + j + k;
          top->i_a = i;
          top->i_b = j;
          top->i_c = k;
          top->eval();

          printf("a:%d b:%d c:%d h:%d l:%d", top->i_a, top->i_b, top->i_c,
                 top->o_h, top->o_l);

          int o_l = sum % 2;
          int o_h = (sum / 2) % 2;
          if (o_h != top->o_h || o_l != top->o_l) {
            printf("\tError\n");
            i = j = k = 3;
            break;
          } else {
            printf("\tSuccess\n");
          }
        }
    break;
  }
  delete top;
  return 0;
}
