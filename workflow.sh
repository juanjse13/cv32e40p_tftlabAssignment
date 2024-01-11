
if [ "$#" -eq 1 ]; then
    make pt/generate_gsf #generate gsf file
    make compile_sbst #cross compilation
    make questa/compile #compile files
    make questa/lsim/gate/shell | tail -n 3 > fault_coverage_rpt.txt #logic simulation
    make zoix/compile #To compile the zoix
    make zoix/lsim #To verify th eVCD stimuli
    make zoix/fgen/sdd K=$1 #Generate fault list
    make zoix/fsim FAULT_LIST=run/zoix_timing/cv32e40p_top_sdd_K$1.rpt 2>&1 | tail -n 19 >> fault_coverage_rpt.txt  #Inject faults and get coverage
fi

if [ "$#" -eq 2 ]; then
    make pt/generate_gsf #generate gsf file
    make compile_sbst #cross compilation
    make questa/compile #compile files
    make questa/lsim/gate/shell | tail -n 3 > fault_coverage_rpt.txt #logic simulation
    make zoix/compile #To compile the zoix
    make zoix/lsim #To verify th eVCD stimuli
    make zoix/fgen/sdd K=$1 M=$2 #Generate fault list
    make zoix/fsim FAULT_LIST=run/zoix_timing/cv32e40p_top_sdd_K$1_M$2.rpt 2>&1 | tail -n 19 > fault_coverage_rpt.txt  #Inject faults and get coverage
else
    echo "Wrong number of parameters, can be 1 (K only) or 2 (K and M)."
    exit 1
fi



