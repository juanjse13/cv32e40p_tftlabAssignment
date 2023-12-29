#!/usr/bin/tclsh
set threshold [lindex $argv 0]
set name "syn/out/cv32e40p_top.gsf"
set infile [open $name r]  ;#Create a file pointer and point it to the file to be read
set file_data [read $infile] ;#Assign file_data with contents of infile
close $infile ;# Detach the file pointer from file to be read
set lines [split $file_data “\n”]   
set match "core_i"
set blocks_list [list ]
set nb_slacks_list [list ] ;#Number of slacks of each component that violates the threshold
# Split the file contents by lines and assign each line to an element of list
foreach element $lines {  
    if {[string first $match $element] != -1} { ;# Check if the row contains "core_i"
   
        set first_slash [string first "/" $element]

        # Find the index of the second slash, starting the search after the first slash
        set second_slash [string first "/" $element [expr {$first_slash + 1}]]
        # Check if the second slash is found
        set block [string range $element [expr {$first_slash + 1}] [expr {$second_slash - 1}]]

        set U_pattern {U[0-9]+} ;#pattern is U...
        set block_index [lsearch -exact $blocks_list $block]
        if {!([regexp $U_pattern $block])} { ;#block is different than U...
            if {$block_index < 0} { ;#if block doesn`t exist in the list
                lappend blocks_list $block ;#add block to list
                lappend nb_slacks_list 0 ;#initialize the counter corresponding to this block
            }
            
            set pattern {\s*(-?\d+(\.\d+)?)\s+(-?\d+(\.\d+)?)}
            set block_index [lsearch -exact $blocks_list $block]
            # Use regexp to extract the first two numbers
            if {[regexp $pattern $element match2 max_rise rest1 max_fall rest2]} {
                if {$max_rise <= $threshold} {
                    lset nb_slacks_list $block_index [expr [lindex $nb_slacks_list $block_index] + 1]
                }
                if {$max_fall <= $threshold} {
                    lset nb_slacks_list $block_index [expr [lindex $nb_slacks_list $block_index] + 1]
                }
            }
        }
    }   
}
puts $blocks_list
puts $nb_slacks_list
