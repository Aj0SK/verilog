OBJDIR = obj
BUILD = build
VERILOGMODULES = modules
CPPTESTS = cpptest

CPPFLAGS = -std=c++17 -O2 -Wall
VERILATORFLAGS = --unroll-count 65536

all: prepare sample comb seq

.PHONY: prepare clean reformat

prepare: clean
	mkdir -p $(BUILD)

clean:
	rm -r -f obj build

reformat:
	clang-format -i -style=LLVM cpptest/**/*.cpp

seq: d_flip_flop regist unary_alu alu condition counter ram comb_mem instr_decoder control_unit #latch

sample: hello_world sample_and sample_nand

comb: half_adder full_adder adder increment subtract equal_zero less_than_zero selector switch demultiplexor

control_unit:
	verilator -CFLAGS $(CPPFLAGS) --cc $(VERILOGMODULES)/processor/control_unit.v $(VERILATORFLAGS) --top-module control_unit --exe $(CPPTESTS)/processor/control_unit.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vcontrol_unit.mk Vcontrol_unit

instr_decoder:
	verilator -CFLAGS $(CPPFLAGS) --cc $(VERILOGMODULES)/processor/instr_decoder.v --top-module instr_decoder --exe $(CPPTESTS)/processor/instr_decoder.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vinstr_decoder.mk Vinstr_decoder

comb_mem:
	verilator -CFLAGS $(CPPFLAGS) --cc $(VERILOGMODULES)/processor/comb_mem.v --top-module comb_mem --exe $(CPPTESTS)/processor/comb_mem.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vcomb_mem.mk Vcomb_mem

ram:
	verilator -CFLAGS $(CPPFLAGS) --cc $(VERILOGMODULES)/memory/ram.v $(VERILATORFLAGS) --top-module ram --exe $(CPPTESTS)/memory/ram.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vram.mk Vram

demultiplexor:
	verilator -CFLAGS $(CPPFLAGS) --cc $(VERILOGMODULES)/plumbing/demultiplexor.v --top-module demultiplexor --exe $(CPPTESTS)/plumbing/demultiplexor.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vdemultiplexor.mk Vdemultiplexor

counter:
	verilator -CFLAGS $(CPPFLAGS) --cc $(VERILOGMODULES)/memory/counter.v --top-module counter --exe $(CPPTESTS)/memory/counter.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vcounter.mk Vcounter

condition:
	verilator -CFLAGS $(CPPFLAGS) --cc $(VERILOGMODULES)/alu/condition.v --top-module condition --exe $(CPPTESTS)/alu/condition.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vcondition.mk Vcondition

regist:
	verilator -CFLAGS $(CPPFLAGS) --cc $(VERILOGMODULES)/memory/regist.v --top-module regist --exe $(CPPTESTS)/memory/regist.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vregist.mk Vregist

d_flip_flop:
	verilator -CFLAGS $(CPPFLAGS) --cc $(VERILOGMODULES)/memory/d_flip_flop.v --top-module d_flip_flop --exe $(CPPTESTS)/memory/d_flip_flop.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vd_flip_flop.mk Vd_flip_flop

unary_alu:
	verilator -CFLAGS $(CPPFLAGS) --cc $(VERILOGMODULES)/alu/unary_alu.v --top-module unary_alu --exe $(CPPTESTS)/alu/unary_alu.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Vunary_alu.mk Vunary_alu

alu:
	verilator -CFLAGS $(CPPFLAGS) --cc $(VERILOGMODULES)/alu/alu.v --top-module alu --exe $(CPPTESTS)/alu/alu.cpp -Mdir $(OBJDIR)
	make -j -C $(OBJDIR) -f Valu.mk Valu

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
