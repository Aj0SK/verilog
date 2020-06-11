# Simple CPU design implementation in Verilog

This is a CPU design based on the http://nandgame.com/ that I very highly recommend to anyone who wants to play with the low level design of the CPU in a very comprehensive way. After finishing this game, I decided to rewrite my code into the Hardware Description Language Verilog. The structure of modules very closely maps the levels of the nand game as I played it during the April of 2020.

## Tests

The tests in this repository are realy basic and does not show if the individual modules work under any circumstances. I will look at the tests once I have time to closely look at the advance testing of modules in Verilog.

## Dependencies

All you need to have are two Verilog compilers: Verilator and Ikarus Verilog. The Verilator is considered faster but I have several problems with it during my work. It returns error because of cyclic dependencies as the Verilator does not distinguish between the single wire of some wire array and whole wire array.

## Future work

I want to transfer this design into the DE10-Nano FPGA. This is quite problematic as it requires deeper understanding of the underlying communication between the on-board ARM chip and FPGA.
