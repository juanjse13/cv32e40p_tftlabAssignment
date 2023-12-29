#!/usr/bin/tclsh
set threshold [lindex $argv 0]
set match_block [lindex $argv 1]
set name "syn/out/cv32e40p_top.gsf"
set infile [open $name r]  ;#Create a file pointer and point it to the file to be read
set file_data [read $infile] ;#Assign file_data with contents of infile
close $infile ;# Detach the file pointer from file to be read
set lines [split $file_data “\n”]   
set match "core_i"
set components_list [list ]
set nb_slacks_list [list ] ;#Number of slacks of each component that violates the threshold
# Split the file contents by lines and assign each line to an element of list
foreach element $lines {  
    if {[string first $match_block $element] != -1} { ;# Check if the row contains the second input parameter
        
        set pattern ".+core_i/$match_block/((a-zA-Z_)*)"
        set pattern [string map {"(a-zA-Z_)" "[a-zA-Z_]"} $pattern]
        regexp $pattern $element match2 component ;#find the component corresponding to the input component

       
        set component_index [lsearch -exact $components_list $component]
       
        if {$component_index < 0} { ;#if component doesn`t exist in the list
            lappend components_list $component ;#add component to list
            lappend nb_slacks_list 0 ;#initialize the counter corresponding to this component
        }
        
        set pattern {\s*(-?\d+(\.\d+)?)\s+(-?\d+(\.\d+)?)}
        set component_index [lsearch -exact $components_list $component]
        # Use regexp to extract the first two numbers
        if {[regexp $pattern $element match2 max_rise rest1 max_fall rest2]} {
            if {$max_rise <= $threshold} {
                lset nb_slacks_list $component_index [expr [lindex $nb_slacks_list $component_index] + 1]
            }
            if {$max_fall <= $threshold} {
                lset nb_slacks_list $component_index [expr [lindex $nb_slacks_list $component_index] + 1]
            }
        }
        
    }   
}
puts "Block = $match_block"
puts $components_list
puts $nb_slacks_list
puts " "