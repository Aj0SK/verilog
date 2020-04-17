#include "Vsample_nand.h"
#include <verilated.h>
#include <cstdio>

int main(int argc, char** argv, char** env)
{
	Verilated::commandArgs(argc, argv);
	Vsample_nand* top = new Vsample_nand;
	while (!Verilated::gotFinish()) {
        top->input_1 = 1;
        top->input_2 = 1;
        top->eval();
        printf("%d %d %d\n", top->input_1, top->input_2, top->nand_result);
        break;
    }
	delete top;
	return 0;
}
