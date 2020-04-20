#include "Vhalf_adder.h"
#include <verilated.h>
#include <cstdio>

int main(int argc, char** argv, char** env)
{
	Verilated::commandArgs(argc, argv);
	Vhalf_adder* top = new Vhalf_adder;
	while (!Verilated::gotFinish()) {
        top->input_a = 1;
        top->input_b = 1;
        top->eval();
        printf("%d %d %d %d\n", top->input_a, top->input_b, top->output_h, top->output_l);
        top->input_a = 1;
        top->input_b = 0;
        top->eval();
        printf("%d %d %d %d\n", top->input_a, top->input_b, top->output_h, top->output_l);
        break;
    }
	delete top;
	return 0;
}
