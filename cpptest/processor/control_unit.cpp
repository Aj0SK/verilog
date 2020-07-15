#include "Vcontrol_unit.h"
#include <cstdio>
#include <cstdlib>
#include <ctime>
#include <memory>
#include <vector>
#include <verilated.h>

using std::min;
using std::vector;

constexpr int kBusWidth = 8;
constexpr int kTestScenarios = 5;

constexpr int kMaxNumber = 1 << kBusWidth;

int main(int argc, char **argv, char **env) {
  Verilated::commandArgs(argc, argv);
  std::unique_ptr<Vcontrol_unit> top(new Vcontrol_unit);

  srand(21);

  while (!Verilated::gotFinish()) {
    for (int t = 0; t < kTestScenarios; ++t) {
      continue;
    }
    break;
  }
  top->final();
  return 0;
}
