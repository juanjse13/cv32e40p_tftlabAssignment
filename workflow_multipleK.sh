#make clean
make pt/generate_gsf #generate gsf file
make compile_sbst #cross compilation
make questa/compile #compile files
make questa/lsim/gate/shell #logic simulation
make zoix/compile #To compile the zoix
make zoix/lsim #To verify th eVCD stimuli


seq $1 $2 $3 | \
while read currentk
do
    make zoix/fgen/sdd K=$currentk #Generate fault list
    old_filename="run/zoix_timing/cv32e40p_top_sdd_K$currentk.rpt"
    new_filename="run/zoix_timing/cv32e40p_top_sdd_K.rpt"
    mv "$old_filename" "$new_filename"
    make zoix/fsim FAULT_LIST=run/zoix_timing/cv32e40p_top_sdd_K.rpt 2>&1 | tail -n 19 > fault_coverage_rpt.txt  #Inject faults and get coverage
    echo "$currentk" >> K_values.txt

    tclsh extract.tcl

done