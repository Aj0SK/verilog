OBJDIR = obj
VERILOGMODULES = modules
CPPTESTS = cpptest

CPPFLAGS = -std=c++17 -O2 -Wall

all: hello_world sample_and sample_nand half_adder full_adder adder increment subtract equal_zero less_than_zero selector switch d_flip_flop

reformat:
	clang-format -i -style=LLVM cpptest/*.cpp

d_flip_flop:
	verilator -CFLAGS $(CPPFLAGS) --cc $(VERILOGMODULES)/d_flip_flop.v --top-module d_flip_flop --exe $(CPPTESTS)/d_flip_flop.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vd_flip_flop.mk Vd_flip_flop

switch:
	verilator -CFLAGS $(CPPFLAGS) --cc $(VERILOGMODULES)/switch.v --top-module switch --exe $(CPPTESTS)/switch.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vswitch.mk Vswitch

selector:
	verilator -CFLAGS $(CPPFLAGS) --cc $(VERILOGMODULES)/selector.v --top-module selector --exe $(CPPTESTS)/selector.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vselector.mk Vselector

less_than_zero:
	verilator -CFLAGS $(CPPFLAGS) --cc $(VERILOGMODULES)/less_than_zero.v --top-module less_than_zero --exe $(CPPTESTS)/less_than_zero.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vless_than_zero.mk Vless_than_zero

equal_zero:
	verilator -CFLAGS $(CPPFLAGS) --cc $(VERILOGMODULES)/equal_zero.v --top-module equal_zero --exe $(CPPTESTS)/equal_zero.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vequal_zero.mk Vequal_zero

subtract:
	verilator -CFLAGS $(CPPFLAGS) --cc $(VERILOGMODULES)/subtract.v --top-module subtract --exe $(CPPTESTS)/subtract.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vsubtract.mk Vsubtract

increment:
	verilator -CFLAGS $(CPPFLAGS) --cc $(VERILOGMODULES)/increment.v --top-module increment --exe $(CPPTESTS)/increment.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vincrement.mk Vincrement

adder:
	verilator -CFLAGS $(CPPFLAGS) --cc $(VERILOGMODULES)/adder.v --top-module adder --exe $(CPPTESTS)/adder.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vadder.mk Vadder

full_adder:
	verilator -CFLAGS $(CPPFLAGS) --cc $(VERILOGMODULES)/full_adder.v -top-module full_adder --exe $(CPPTESTS)/full_adder.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vfull_adder.mk Vfull_adder

half_adder:
	verilator -CFLAGS $(CPPFLAGS) --cc $(VERILOGMODULES)/half_adder.v --exe $(CPPTESTS)/half_adder.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vhalf_adder.mk Vhalf_adder

hello_world:
	verilator -CFLAGS $(CPPFLAGS) --cc $(VERILOGMODULES)/hello_world.v --exe $(CPPTESTS)/hello_world.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vhello_world.mk Vhello_world

sample_and:
	verilator -CFLAGS $(CPPFLAGS) --cc $(VERILOGMODULES)/sample_and.v --exe $(CPPTESTS)/sample_and.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vsample_and.mk Vsample_and

sample_nand:
	verilator -CFLAGS $(CPPFLAGS) --cc $(VERILOGMODULES)/sample_nand.v --exe $(CPPTESTS)/sample_nand.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vsample_nand.mk Vsample_nand
