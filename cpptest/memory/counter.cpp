#include "Vcounter.h"
#include <cstdio>
#include <memory>
#include <verilated.h>

int main(int argc, char **argv, char **env) {
  Verilated::commandArgs(argc, argv);
  std::unique_ptr<Vcounter> top(new Vcounter);
  while (!Verilated::gotFinish()) {
    top->st = 1;
    top->X = 20;
    top->clk = 0;
    top->eval();
    printf("st:%d X:%d clk:%d counter: %d\n", top->st, top->X, top->clk,
           top->o);

    for (int i = 0; i < 3; ++i) {
      top->st = 1;
      top->X = 20;
      top->clk = 0;
      top->eval();
      printf("st:%d X:%d clk:%d counter: %d", top->st, top->X, top->clk,
             top->o);
      if (top->o == 0)
        printf(" Success\n");
      else {
        printf(" Error\n");
        break;
      }
    }

    top->st = 1;
    top->X = 20;
    top->clk = 1;
    top->eval();
    printf("st:%d X:%d clk:%d counter: %d", top->st, top->X, top->clk, top->o);
    if (top->o == 20)
      printf(" Success\n");
    else {
      printf(" Error\n");
      break;
    }

    for (int i = 0; i < 5; ++i) {
      top->st = 0;
      top->X = i;
      top->clk = 0;
      top->eval();
      printf("st:%d X:%d clk:%d counter: %d\n", top->st, top->X, top->clk,
             top->o);
      top->st = 0;
      top->X = i;
      top->clk = 1;
      top->eval();
      printf("st:%d X:%d clk:%d counter: %d", top->st, top->X, top->clk,
             top->o);

      if (top->o == (20 + i + 1)) {
        printf(" Success\n");
      } else {
        printf(" Error\n");
        break;
      }
    }

    top->st = 1;
    top->X = 20;
    top->clk = 0;
    top->eval();
    printf("st:%d X:%d clk:%d counter: %d", top->st, top->X, top->clk, top->o);

    if (top->o == 25) {
      printf(" Success\n");
    } else {
      printf(" Error\n");
      break;
    }

    top->st = 1;
    top->X = 20;
    top->clk = 1;
    top->eval();
    printf("st:%d X:%d clk:%d counter: %d", top->st, top->X, top->clk, top->o);

    if (top->o == 20) {
      printf(" Success\n");
    } else {
      printf(" Error\n");
      break;
    }

    break;
  }
  top->final();
  return 0;
}
