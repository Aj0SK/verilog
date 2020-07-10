#include "Vselector.h"
#include <cstdio>
#include <memory>
#include <verilated.h>

int main(int argc, char **argv, char **env) {
  Verilated::commandArgs(argc, argv);
  std::unique_ptr<Vselector> top(new Vselector);
  while (!Verilated::gotFinish()) {

    for(int i=0; i<2; ++i)
        for(int j=0; j<2; ++j)
            for(int k=0; k<2; ++k)
            {
                top->i_a = i;
                top->i_b = j;
                top->i_s = k;
                top->eval();
                
                printf("a:%d b:%d s:%d output: %d", top->i_a, top->i_b, top->i_s,
           top->o_c);

                int o_c = (top->i_s == 0)?(top->i_a):(top->i_b);
                if (o_c != top->o_c)
                {
                    printf("\tError\n");
                    i = j = k = 3;
                    break;
                }
                else
                {
                    printf("\tSuccess\n");
                }
            }
    break;
  }
  top->final();
  return 0;
}
