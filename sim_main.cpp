#include "VTestForPLI.h"
#include "verilated.h"

int main(int argc, char **argv, char **env) {
    Verilated::commandArgs(argc, argv);
    VTestForPLI* top = new VTestForPLI;

    while (!Verilated::gotFinish()) { 
        top->eval(); 
    }
	        
    delete top;
    exit(0);
}
