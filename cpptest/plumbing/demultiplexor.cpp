#include "Vdemultiplexor.h"
#include <cstdio>
#include <memory>
#include <verilated.h>

constexpr int kAddressWidth = 2;

int main(int argc, char **argv, char **env) {
  Verilated::commandArgs(argc, argv);
  std::unique_ptr<Vdemultiplexor> top(new Vdemultiplexor);
  while (!Verilated::gotFinish()) {
    for (int i = 0; i < kAddressWidth; ++i) {
      for (int j = 0; j < 2; ++j) {

        top->address = 1 << i;
        top->x = j;
        top->eval();

        printf("address:%d x:%d out:%d", top->address, top->x, top->out);
        int out = j << (1 << i);
        if (out != top->out) {
          printf("\tError\n");
          i = kAddressWidth;
          j = 2;
          break;
        } else {
          printf("\tSuccess\n");
        }
      }
    }
    break;
  }
  top->final();
  return 0;
}
