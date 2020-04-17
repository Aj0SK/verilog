OBJDIR = ./obj
VERILOGMODULES = ./modules
CPPTESTS = ./cpptest

all: hello_world sample_and

hello_world:
	verilator -Wall --cc $(VERILOGMODULES)/hello_world.v --exe $(CPPTESTS)/hello_world.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vhello_world.mk Vhello_world

sample_and:
	verilator -Wall --cc $(VERILOGMODULES)/sample_and.v --exe $(CPPTESTS)/sample_and.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vsample_and.mk Vsample_and
