#include "Vadder.h"
#include <cstdio>
#include <verilated.h>
#include <cstdlib>
#include <ctime>

constexpr int kTestCases = 1000;
constexpr int kBusWidth = 8;
constexpr int kSeed = 30;

int main(int argc, char **argv, char **env) {
  Verilated::commandArgs(argc, argv);
  Vadder *top = new Vadder;

  srand(kSeed);

  while (!Verilated::gotFinish()) {
    for (int i=0; i<kTestCases; ++i)
    {
        top->i_a = rand()%(1<<kBusWidth);
        top->i_b = rand()%(1<<kBusWidth);
        top->i_c = rand()%2;
        top->eval();
        printf("a:%d b:%d c:%d sum:%d", top->i_a, top->i_b, top->i_c, top->o_c);

        int sum = top->i_a + top->i_b + top->i_c;
        sum %= (1<<kBusWidth);
        if (sum == top->o_c)
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
  delete top;
  return 0;
}
