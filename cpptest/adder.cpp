#include "Vadder.h"
#include <verilated.h>
#include <cstdio>

int main(int argc, char** argv, char** env)
{
	Verilated::commandArgs(argc, argv);
	Vadder* top = new Vadder;
	while (!Verilated::gotFinish()) {
        top->i_a = 12;
        top->i_b = 5;
        top->i_c = 0;
        top->eval();
        printf("a:%d b:%d c:%d sum:%d\n", top->i_a, top->i_b, top->i_c, top->o_c);
        top->i_a = 15;
        top->i_b = 10;
        top->i_c = 1;
        top->eval();
        printf("a:%d b:%d c:%d sum:%d\n", top->i_a, top->i_b, top->i_c, top->o_c);
        break;
    }
	delete top;
	return 0;
}
