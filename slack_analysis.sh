if [ "$#" -ne 3 ]; then
    echo "Usage: $0 threshold_start step threshold_end"
    exit 1
fi


seq $1 $2 $3 | \
while read Th
do
    echo "Number of netlists with slacks lower than the threshold when Th = $Th" >> Blocks_slack.txt
    echo " " >> Blocks_slack.txt
    tclsh slack_analysis.tcl $Th >> Blocks_slack.txt

    tclsh slack_block.tcl $Th load_store_unit_i >> Blocks_slack.txt
    tclsh slack_block.tcl $Th id_stage_i >> Blocks_slack.txt
    tclsh slack_block.tcl $Th sleep_unit_i >> Blocks_slack.txt
    tclsh slack_block.tcl $Th if_stage_i >> Blocks_slack.txt
    tclsh slack_block.tcl $Th cs_registers_i >> Blocks_slack.txt
    tclsh slack_block.tcl $Th ex_stage_i >> Blocks_slack.txt

    echo "-------------------------------------------------------------------------------------------------------" >> Blocks_slack.txt
done