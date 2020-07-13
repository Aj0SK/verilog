OBJDIR = obj
BUILD = build
VERILOGMODULES = modules
CPPTESTS = cpptest
TESTBENCHES = testbench

CPPFLAGS = -std=c++17 -O2 -Wall

all: prepare sample comb seq

.PHONY: prepare clean reformat

prepare: clean
	mkdir -p $(BUILD)

clean:
	rm -r -f obj build

reformat:
	clang-format -i -style=LLVM cpptest/**/*.cpp

seq: latch d_flip_flop register unary_alu alu condition counter ram

sample: hello_world sample_and sample_nand

comb: half_adder full_adder adder increment subtract equal_zero less_than_zero selector switch demultiplexor

ram:
	iverilog -o $(BUILD)/ram_test $(TESTBENCHES)/memory/ram_tb.v $(VERILOGMODULES)/memory/ram.v

demultiplexor:
	verilator -CFLAGS $(CPPFLAGS) --cc $(VERILOGMODULES)/plumbing/demultiplexor.v --top-module demultiplexor --exe $(CPPTESTS)/plumbing/demultiplexor.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vdemultiplexor.mk Vdemultiplexor
	iverilog -o $(BUILD)/demultiplexor_test $(TESTBENCHES)/plumbing/demultiplexor_tb.v $(VERILOGMODULES)/plumbing/demultiplexor.v

counter:
	verilator -CFLAGS $(CPPFLAGS) --cc $(VERILOGMODULES)/memory/counter.v --top-module counter --exe $(CPPTESTS)/memory/counter.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vcounter.mk Vcounter
	iverilog -o $(BUILD)/counter_test $(TESTBENCHES)/memory/counter_tb.v $(VERILOGMODULES)/memory/counter.v

condition:
	iverilog -o $(BUILD)/condition_test $(TESTBENCHES)/alu/condition_tb.v $(VERILOGMODULES)/alu/condition.v

register:
	verilator -CFLAGS $(CPPFLAGS) --cc $(VERILOGMODULES)/memory/register.v --top-module register --exe $(CPPTESTS)/memory/register.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vregister.mk Vregister
	iverilog -o $(BUILD)/register_test $(TESTBENCHES)/memory/register_tb.v $(VERILOGMODULES)/memory/register.v
	
latch:
	iverilog -o $(BUILD)/latch_test $(TESTBENCHES)/latch_tb.v $(VERILOGMODULES)/latch.v

d_flip_flop:
	verilator -CFLAGS $(CPPFLAGS) --cc $(VERILOGMODULES)/memory/d_flip_flop.v --top-module d_flip_flop --exe $(CPPTESTS)/memory/d_flip_flop.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vd_flip_flop.mk Vd_flip_flop
	iverilog -o $(BUILD)/d_flip_flop $(TESTBENCHES)/memory/d_flip_flop_tb.v $(VERILOGMODULES)/memory/d_flip_flop.v

unary_alu:
	verilator -CFLAGS $(CPPFLAGS) --cc $(VERILOGMODULES)/alu/unary_alu.v --top-module unary_alu --exe $(CPPTESTS)/alu/unary_alu.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vunary_alu.mk Vunary_alu
	iverilog -o $(BUILD)/unary_alu $(TESTBENCHES)/alu/unary_alu_tb.v $(VERILOGMODULES)/alu/unary_alu.v

alu:
	iverilog -o $(BUILD)/alu $(TESTBENCHES)/alu/alu_tb.v $(VERILOGMODULES)/alu/alu.v

switch:
	verilator -CFLAGS $(CPPFLAGS) --cc $(VERILOGMODULES)/plumbing/switch.v --top-module switch --exe $(CPPTESTS)/plumbing/switch.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vswitch.mk Vswitch

selector:
	verilator -CFLAGS $(CPPFLAGS) --cc $(VERILOGMODULES)/plumbing/selector.v --top-module selector --exe $(CPPTESTS)/plumbing/selector.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vselector.mk Vselector
	iverilog -o $(BUILD)/selector $(TESTBENCHES)/plumbing/selector_tb.v $(VERILOGMODULES)/plumbing/selector.v

less_than_zero:
	verilator -CFLAGS $(CPPFLAGS) --cc $(VERILOGMODULES)/arithmetics/less_than_zero.v --top-module less_than_zero --exe $(CPPTESTS)/arithmetics/less_than_zero.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vless_than_zero.mk Vless_than_zero

equal_zero:
	verilator -CFLAGS $(CPPFLAGS) --cc $(VERILOGMODULES)/arithmetics/equal_zero.v --top-module equal_zero --exe $(CPPTESTS)/arithmetics/equal_zero.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vequal_zero.mk Vequal_zero
	iverilog -o $(BUILD)/equal_zero $(TESTBENCHES)/arithmetics/equal_zero_tb.v $(VERILOGMODULES)/arithmetics/equal_zero.v

subtract:
	verilator -CFLAGS $(CPPFLAGS) --cc $(VERILOGMODULES)/arithmetics/subtract.v --top-module subtract --exe $(CPPTESTS)/arithmetics/subtract.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vsubtract.mk Vsubtract
	iverilog -o $(BUILD)/subtract_test $(TESTBENCHES)/arithmetics/subtract_tb.v $(VERILOGMODULES)/arithmetics/subtract.v

increment:
	verilator -CFLAGS $(CPPFLAGS) --cc $(VERILOGMODULES)/arithmetics/increment.v --top-module increment --exe $(CPPTESTS)/arithmetics/increment.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vincrement.mk Vincrement
	iverilog -o $(BUILD)/increment_test $(TESTBENCHES)/arithmetics/increment_tb.v $(VERILOGMODULES)/arithmetics/increment.v

adder:
	verilator -CFLAGS $(CPPFLAGS) --cc $(VERILOGMODULES)/arithmetics/adder.v --top-module adder --exe $(CPPTESTS)/arithmetics/adder.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vadder.mk Vadder
	iverilog -o $(BUILD)/adder_test $(TESTBENCHES)/arithmetics/adder_tb.v $(VERILOGMODULES)/arithmetics/adder.v

full_adder:
	verilator -CFLAGS $(CPPFLAGS) --cc $(VERILOGMODULES)/arithmetics/full_adder.v -top-module full_adder --exe $(CPPTESTS)/arithmetics/full_adder.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vfull_adder.mk Vfull_adder

half_adder:
	verilator -CFLAGS $(CPPFLAGS) --cc $(VERILOGMODULES)/arithmetics/half_adder.v --exe $(CPPTESTS)/arithmetics/half_adder.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vhalf_adder.mk Vhalf_adder

hello_world:
	verilator -CFLAGS $(CPPFLAGS) --cc $(VERILOGMODULES)/sample/hello_world.v --exe $(CPPTESTS)/sample/hello_world.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vhello_world.mk Vhello_world

sample_and:
	verilator -CFLAGS $(CPPFLAGS) --cc $(VERILOGMODULES)/sample/sample_and.v --exe $(CPPTESTS)/sample/sample_and.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vsample_and.mk Vsample_and

sample_nand:
	verilator -CFLAGS $(CPPFLAGS) --cc $(VERILOGMODULES)/sample/sample_nand.v --exe $(CPPTESTS)/sample/sample_nand.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vsample_nand.mk Vsample_nand
