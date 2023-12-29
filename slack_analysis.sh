if [ "$#" -ne 1 ]; then
    echo "Usage: $0 threshold"
    exit 1
fi



echo "Number of netlists with slacks lower than the threshold when Th = $1" >> Blocks_slack.txt
echo " " >> Blocks_slack.txt
tclsh slack_analysis.tcl $1 >> Blocks_slack.txt

tclsh slack_block.tcl $1 load_store_unit_i >> Blocks_slack.txt
tclsh slack_block.tcl $1 id_stage_i >> Blocks_slack.txt
tclsh slack_block.tcl $1 sleep_unit_i >> Blocks_slack.txt
tclsh slack_block.tcl $1 if_stage_i >> Blocks_slack.txt
tclsh slack_block.tcl $1 cs_registers_i >> Blocks_slack.txt
tclsh slack_block.tcl $1 ex_stage_i >> Blocks_slack.txt

echo "-------------------------------------------------------------------------------------------------------" >> Blocks_slack.txt