OBJDIR=./obj
all: run_sample

run_sample:
	verilator -Wall --cc hello_world.v --exe hello_world.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vhello_world.mk Vhello_world
