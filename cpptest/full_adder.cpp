#include "Vfull_adder.h"
#include <verilated.h>
#include <cstdio>

int main(int argc, char** argv, char** env)
{
	Verilated::commandArgs(argc, argv);
	Vfull_adder* top = new Vfull_adder;
	while (!Verilated::gotFinish()) {
        top->input_a = 1;
        top->input_b = 1;
        top->input_carry = 1;
        top->eval();
        printf("a:%d b:%d c:%d h:%d l:%d\n", top->input_a, top->input_b, top->input_carry, top->output_h, top->output_l);
        top->input_a = 1;
        top->input_b = 0;
        top->input_carry = 1;
        top->eval();
        printf("a:%d b:%d c:%d h:%d l:%d\n", top->input_a, top->input_b, top->input_carry, top->output_h, top->output_l);
        break;
    }
	delete top;
	return 0;
}
