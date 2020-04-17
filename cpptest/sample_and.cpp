#include "Vsample_and.h"
#include "verilated.h"
#include <cstdio>

int main(int argc, char** argv, char** env)
{
	Verilated::commandArgs(argc, argv);
	Vsample_and* top = new Vsample_and;
	while (!Verilated::gotFinish()) {
        top->input_1 = 1;
        top->input_2 = 1;
        top->eval();
        printf("%d %d %d\n", top->input_1, top->input_2, top->and_result);
        break;
    }
	delete top;
	return 0;
}
