#make clean
make pt/generate_gsf #generate gsf file
make compile_sbst #cross compilation
make questa/compile #compile files
make questa/lsim/gate/shell #logic simulation
make zoix/compile #To compile the zoix
make zoix/lsim #To verify th eVCD stimuli

seq $1 $2 $3 | \
while read currentK
do
    seq $4 $5 $6 | \
    while read currentM
    do
        make zoix/fgen/sdd K=$currentK M=$currentM #Generate fault list
        first_part="run/zoix_timing/cv32e40p_top_sdd_K$currentK"
        second_part="_M$currentM.rpt"
        old_filename="$first_part""$second_part"
        new_filename="run/zoix_timing/cv32e40p_top_sdd_K_M.rpt"
        mv "$old_filename" "$new_filename"
        make zoix/fsim FAULT_LIST=run/zoix_timing/cv32e40p_top_sdd_K_M.rpt 2>&1 | tail -n 19 > fault_coverage_rpt.txt  #Inject faults and get coverage
        echo "$currentK $currentM" >> results/both/K_and_M.txt

        tclsh extract_MK.tcl
    done
done