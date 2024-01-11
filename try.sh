    make questa/lsim/gate/shell | tail -n 3 > fault_coverage_rpt.txt #logic simulation
    make zoix/compile #To compile the zoix
    make zoix/lsim #To verify th eVCD stimuli
    make zoix/fgen/sdd K=1.1 #Generate fault list
    make zoix/fsim FAULT_LIST=run/zoix_timing/cv32e40p_top_sdd_K1.1.rpt 2>&1 | tail -n 19 >> fault_coverage_rpt.txt  #Inject faults and get coverage
