OBJDIR = obj
BUILD = build
VERILOGMODULES = modules
CPPTESTS = cpptest
TESTBENCHES = testbench

CPPFLAGS = -std=c++17 -O2 -Wall

all: prepare hello_world sample_and sample_nand half_adder full_adder adder increment subtract equal_zero less_than_zero selector switch not_ready

.PHONY: prepare clean reformat

prepare: clean
	mkdir -p $(BUILD)

clean:
	rm -r -f obj build

reformat:
	clang-format -i -style=LLVM cpptest/*.cpp

not_ready: latch d_flip_flop register
	
register:
	iverilog -o $(BUILD)/register_test $(TESTBENCHES)/memory/register_tb.v $(VERILOGMODULES)/memory/register.v
	
latch:
	iverilog -o $(BUILD)/latch_test $(TESTBENCHES)/latch_tb.v $(VERILOGMODULES)/latch.v

d_flip_flop:
	iverilog -o $(BUILD)/d_flip_flop $(TESTBENCHES)/memory/d_flip_flop_tb.v $(VERILOGMODULES)/memory/d_flip_flop.v




switch:
	verilator -CFLAGS $(CPPFLAGS) --cc $(VERILOGMODULES)/plumbing/switch.v --top-module switch --exe $(CPPTESTS)/plumbing/switch.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vswitch.mk Vswitch

selector:
	verilator -CFLAGS $(CPPFLAGS) --cc $(VERILOGMODULES)/plumbing/selector.v --top-module selector --exe $(CPPTESTS)/plumbing/selector.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vselector.mk Vselector

less_than_zero:
	verilator -CFLAGS $(CPPFLAGS) --cc $(VERILOGMODULES)/arithmetics/less_than_zero.v --top-module less_than_zero --exe $(CPPTESTS)/arithmetics/less_than_zero.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vless_than_zero.mk Vless_than_zero

equal_zero:
	verilator -CFLAGS $(CPPFLAGS) --cc $(VERILOGMODULES)/arithmetics/equal_zero.v --top-module equal_zero --exe $(CPPTESTS)/arithmetics/equal_zero.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vequal_zero.mk Vequal_zero

subtract:
	verilator -CFLAGS $(CPPFLAGS) --cc $(VERILOGMODULES)/arithmetics/subtract.v --top-module subtract --exe $(CPPTESTS)/arithmetics/subtract.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vsubtract.mk Vsubtract

increment:
	verilator -CFLAGS $(CPPFLAGS) --cc $(VERILOGMODULES)/arithmetics/increment.v --top-module increment --exe $(CPPTESTS)/arithmetics/increment.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vincrement.mk Vincrement

adder:
	verilator -CFLAGS $(CPPFLAGS) --cc $(VERILOGMODULES)/arithmetics/adder.v --top-module adder --exe $(CPPTESTS)/arithmetics/adder.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vadder.mk Vadder

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
