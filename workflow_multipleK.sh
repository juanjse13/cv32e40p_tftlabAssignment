read -p "Select the first k: " initialK
echo "First K: $initialK"
read -p "Select the step: " step
echo "First K: $initialK"
read -p "Select the last k " lastK
echo "Last L: $lastK"

#make clean
make pt/generate_gsf #generate gsf file
make compile_sbst #cross compilation
make questa/compile #compile files
make questa/lsim/gate/shell #logic simulation
make zoix/compile #To compile the zoix
make zoix/lsim #To verify th eVCD stimuli



startk=$initialK
endk=$lastK
stepk=$stepK

# Using seq to generate a sequence of floating-point values
for currentk in $(seq $startk $stepk $endk); do
    # Your code here, using $currentk as the non-integer value
    echo "Current value of K: $currentk"
    make zoix/fgen/sdd K=$currentk
    make zoix/fsim FAULT_LIST=run/zoix_timing/cv32e40p_top_sdd_K$currentk.rpt 2>&1 | tail -n 19 > fault_coverage_rpt$currentk.txt
done
