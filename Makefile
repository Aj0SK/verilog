OBJDIR = ./obj
VERILOGMODULES = ./modules
CPPTESTS = ./cpptest

CPPFLAGS = -std=c++17 -O2 -Wall

all: hello_world sample_and sample_nand

hello_world:
	verilator -CFLAGS $(CPPFLAGS) --cc $(VERILOGMODULES)/hello_world.v --exe $(CPPTESTS)/hello_world.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vhello_world.mk Vhello_world

sample_and:
	verilator -CFLAGS $(CPPFLAGS) --cc $(VERILOGMODULES)/sample_and.v --exe $(CPPTESTS)/sample_and.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vsample_and.mk Vsample_and

sample_nand:
	verilator -CFLAGS $(CPPFLAGS) --cc $(VERILOGMODULES)/sample_nand.v --exe $(CPPTESTS)/sample_nand.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vsample_nand.mk Vsample_nand
