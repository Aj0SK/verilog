#include "Vequal_zero.h"
#include <cstdio>
#include <cstdlib>
#include <ctime>
#include <memory>
#include <verilated.h>

constexpr int kTestCases = 30;
constexpr int kBusWidth = 8;
constexpr int kSeed = 30;

int main(int argc, char **argv, char **env) {
  Verilated::commandArgs(argc, argv);
  std::unique_ptr<Vequal_zero> top(new Vequal_zero);

  srand(kSeed);

  while (!Verilated::gotFinish()) {
    for (int i = 0; i < kTestCases; ++i) {
      if (i == 0)
        top->i_a = 0;
      else
        top->i_a = rand() % (1 << kBusWidth);
      top->eval();
      printf("a:%d equal_zero: %d", top->i_a, top->o_c);
      if ((top->o_c == 1 && top->i_a == 0) ||
          (top->o_c == 0 && top->i_a != 0)) {
        printf("\tSuccess\n");
      } else {
        printf("\tError\n");
        break;
      }
    }
    break;
  }
  top->final();
  return 0;
}
