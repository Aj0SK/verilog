#include "Vsubtract.h"
#include <cstdio>
#include <memory>
#include <verilated.h>
#include <cstdlib>
#include <ctime>
#include <algorithm>

using std::swap;

constexpr int kTestCases = 1000;
constexpr int kBusWidth = 8;
constexpr int kSeed = 30;

int main(int argc, char **argv, char **env) {
  Verilated::commandArgs(argc, argv);
  std::unique_ptr<Vsubtract> top(new Vsubtract);

  srand(kSeed);

  while (!Verilated::gotFinish()) {

    for (int i=0; i<kTestCases; ++i)
    {
        int i_a = rand()%(1<<(kBusWidth-1));
        int i_b = rand()%(1<<(kBusWidth-1));

        if(i_a < i_b) swap(i_a, i_b);

        top->i_a = i_a;
        top->i_b = i_b;
        top->eval();
        printf("a:%d b:%d subtract: %d", top->i_a, top->i_b, top->o_c);

        int sub = top->i_a - top->i_b;
        if (sub == top->o_c)
        {
            printf("\tSuccess\n");
        }
        else
        {
            printf("\tError\n");
            break;
        }
    }
    break;
  }
  top->final();
  return 0;
}
