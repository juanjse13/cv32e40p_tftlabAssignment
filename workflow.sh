if [ "$#" -ne 1 ]; then
    echo "Missing parameter"
    echo "Usage: $0 threshold"
    exit 1
fi

#make clean
make pt/generate_gsf #generate gsf file
make compile_sbst #cross compilation
make questa/compile #compile files
make questa/lsim/gate/shell #logic simulation
make zoix/compile #To compile the zoix
make zoix/lsim #To verify th eVCD stimuli
make zoix/fgen/sdd K=$1 #Generate fault list
make zoix/fsim FAULT_LIST=run/zoix_timing/cv32e40p_top_sdd_K$1.rpt 2>&1 | tail -n 19 > fault_coverage_rpt.txt  #Inject faults and get coverage