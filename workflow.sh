make questa/lsim/gate/shell #compile files and logic simulation
make zoix/fgen/sdd “K=0.5” #Generate fault list
make zoix/fsim FAULT_LIST=run/zoix_timing/cv32e40p_top_sdd_K1.1.rpt #Inject faults and get coverage