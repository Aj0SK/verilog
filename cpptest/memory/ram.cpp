#include "Vram.h"

#include <algorithm>
#include <cstdio>
#include <cstdlib>
#include <ctime>
#include <memory>
#include <vector>

#include <verilated.h>

using std::min;
using std::vector;

constexpr int kBusWidth = 8;
constexpr int kAddressWidth = 8;
constexpr int kTestScenarios = 5;
constexpr int kMaxModified = 1'00'000;

constexpr int kMaxNumber = 1 << kBusWidth;
constexpr int kRamSize = 1 << kAddressWidth;

int main(int argc, char **argv, char **env) {
  Verilated::commandArgs(argc, argv);
  std::unique_ptr<Vram> top(new Vram);

  srand(21);

  while (!Verilated::gotFinish()) {

    for (int t = 0; t < kTestScenarios; ++t) {
      vector<int> mem(kRamSize, 0);
      int curr_modified = rand() % kMaxModified;
      for (int m = 0; m < curr_modified; ++m) {
        int number = rand() % kMaxNumber;
        int address = rand() % kRamSize;
        mem[address] = number;
        top->ad = address;
        top->st = 1;
        top->X = number;
        top->clk = 0;
        top->eval();
        top->clk = 1;
        top->eval();
      }

      printf("Made %d writes\n", curr_modified);
      printf("Memory dump:");
      for (int i = 0; i < min(10, kRamSize); ++i)
        printf(" %d", mem[i]);
      printf("\n");

      for (int i = 0; i < kRamSize; ++i) {
        top->ad = i;
        top->st = 0;
        top->X = rand() % kMaxNumber;
        top->clk = 0;
        top->eval();
        top->clk = 1;
        top->eval();

        if (top->O != mem[i]) {
          printf(" Error\n");
          break;
        }
      }
    }
    break;
  }
  top->final();
  return 0;
}
