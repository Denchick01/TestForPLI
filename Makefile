build:
		verilator -Wall --cc TestForPLI.v --exe sim_main.cpp

comp:
		make -C obj_dir -j -f VTestForPLI.mk VTestForPLI

run:
		obj_dir/VTestForPLI

