make pt/generate_gsf #generate gsf file
make compile_sbst #cross compilation
make questa/compile #compile files
make questa/lsim/gate/shell #logic simulation
make zoix/fgen/sdd K=$1 #Generate fault list
make zoix/fsim FAULT_LIST=run/zoix_timing/cv32e40p_top_sdd_K$1.rpt #Inject faults and get coverage