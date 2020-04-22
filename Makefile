OBJDIR = obj
VERILOGMODULES = modules
CPPTESTS = cpptest

CPPFLAGS = -std=c++17 -O2 -Wall

all: hello_world sample_and sample_nand half_adder full_adder adder increment

reformat:
	clang-format -i -style=LLVM cpptest/*.cpp

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
