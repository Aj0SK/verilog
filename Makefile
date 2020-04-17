OBJDIR = ./obj
VERILOGMODULES = ./modules
CPPTESTS = ./cpptest

all: hello_world

hello_world:
	verilator -Wall --cc $(VERILOGMODULES)/hello_world.v --exe $(CPPTESTS)/hello_world.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vhello_world.mk Vhello_world
