if [ "$#" -ne 1 ]; then
    echo "Usage: $0 threshold"
    exit 1
fi
tclsh slack_analysis.tcl $1
