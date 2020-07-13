#include "Valu.h"
#include <cstdio>
#include <iostream>
#include <memory>
#include <verilated.h>

constexpr int kBusWidth = 8;

int main(int argc, char **argv, char **env) {
  Verilated::commandArgs(argc, argv);
  std::unique_ptr<Valu> top(new Valu);
  while (!Verilated::gotFinish()) {
    for (int i = 0; i < 2; ++i)
      for (int j = 0; j < 2; ++j)
        for (int k = 0; k < 2; ++k)
          for (int l = 0; l < 2; ++l)
            for (int f = 0; f < 2; ++f)
              for (int x = 0; x < (1 << kBusWidth); ++x)
                for (int y = 0; y < (1 << kBusWidth); ++y) {
                  top->i_zx = i;
                  top->i_nx = j;
                  top->i_zy = k;
                  top->i_ny = l;
                  top->i_f = f;
                  top->i_X = x;
                  top->i_Y = y;
                  top->eval();
                  printf("zx:%d nx:%d zy:%d ny:%d X:%d Y:%d O:%d", top->i_zx,
                         top->i_nx, top->i_zy, top->i_ny, top->i_X, top->i_Y,
                         top->o_O);

                  unsigned int X = top->i_X, Y = top->i_Y, O;
                  if (top->i_zx == 1)
                    X = 0;
                  if (top->i_zy == 1)
                    Y = 0;
                  if (top->i_nx == 1) {
                    for (int u = 0; u < kBusWidth; ++u) {
                      X ^= (1 << u);
                    }
                  }
                  if (top->i_ny == 1) {
                    for (int u = 0; u < kBusWidth; ++u) {
                      Y ^= (1 << u);
                    }
                  }
                  if (f == 0)
                    O = X & Y;
                  else
                    O = (X + Y) % (1 << kBusWidth);

                  if (top->o_O == O) {
                    printf(" Success\n");
                  } else {
                    printf(" Error\n");
                    i = j = k = l = f = 2;
                    x = y = (1 << kBusWidth);
                    break;
                  }
                }
    break;
  }
  top->final();
  return 0;
}
