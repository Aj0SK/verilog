#include "Vfull_adder.h"
#include <verilated.h>
#include <cstdio>

int main(int argc, char** argv, char** env)
{
	Verilated::commandArgs(argc, argv);
	Vfull_adder* top = new Vfull_adder;
	while (!Verilated::gotFinish()) {
        top->i_a = 1;
        top->i_b = 1;
        top->i_c = 1;
        top->eval();
        printf("a:%d b:%d c:%d h:%d l:%d\n", top->i_a, top->i_b, top->i_c, top->o_h, top->o_l);
        top->i_a = 1;
        top->i_b = 0;
        top->i_c = 1;
        top->eval();
        printf("a:%d b:%d c:%d h:%d l:%d\n", top->i_a, top->i_b, top->i_c, top->o_h, top->o_l);
        break;
    }
	delete top;
	return 0;
}
