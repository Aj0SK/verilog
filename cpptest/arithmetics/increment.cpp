#include "Vincrement.h"
#include <cstdio>
#include <memory>
#include <verilated.h>

constexpr int kTestCases = 1000;
constexpr int kBusWidth = 8;
constexpr int kSeed = 30;

int main(int argc, char **argv, char **env) {
  Verilated::commandArgs(argc, argv);
  std::unique_ptr<Vincrement> top(new Vincrement);

  srand(kSeed);

  while (!Verilated::gotFinish()) {
    for (int i = 0; i < kTestCases; ++i) {
      top->i_a = rand() % (1 << kBusWidth);
      top->eval();

      printf("a:%d increment: %d", top->i_a, top->o_c);

      int expect = (top->i_a + 1) % (1 << kBusWidth);

      if (expect == top->o_c) {
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
