all: run_sample

run_sample:
	verilator -Wall --cc our.v --exe sim_main.cpp
	make -j -C obj_dir -f Vour.mk Vour
