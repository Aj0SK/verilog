OBJDIR = ./obj
VERILOGMODULES = ./modules
CPPTESTS = ./cpptest

all: hello_world sample_and sample_nand

hello_world:
	verilator -I$(RTLSRC) -Wall --cc $(VERILOGMODULES)/hello_world.v --exe $(CPPTESTS)/hello_world.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vhello_world.mk Vhello_world

sample_and:
	verilator -I$(RTLSRC) -Wall --cc $(VERILOGMODULES)/sample_and.v --exe $(CPPTESTS)/sample_and.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vsample_and.mk Vsample_and

sample_nand:
	verilator -I$(RTLSRC) -Wall --cc $(VERILOGMODULES)/sample_nand.v --exe $(CPPTESTS)/sample_nand.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vsample_nand.mk Vsample_nand
