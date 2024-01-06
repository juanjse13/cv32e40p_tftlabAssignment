#!/usr/bin/env tclsh

set name "fault_coverage_rpt.txt"
set infile [open $name r]  ;#Create a file pointer and point it to the file to be read
set file_data [read $infile] ;#Assign file_data with contents of infile
close $infile ;# Detach the file pointer from file to be read
set lines [split $file_data “\n”]   

set fileHandle [open "CPU_time.txt" a]
foreach element $lines { 
    #puts $element
    set pattern {CPU Time: ([0-9]+\.[0-9]+)}
    
    if {[regexp $pattern $element match match2]} {
        puts $fileHandle "$match2"
    }  
}
close $fileHandle


set name "run/zoix_timing/cv32e40p_top_sdd_K.rpt.hier"
set infile [open $name r]  ;#Create a file pointer and point it to the file to be read
set file_data [read $infile] ;#Assign file_data with contents of infile
close $infile ;# Detach the file pointer from file to be read
set lines [split $file_data “\n”]   

set fileHandle [open "Coverage.txt" a]
foreach element $lines { 
    #puts $element
    set pattern {Fault Coverage\s+([0-9]*\.[0-9]+)}
    
    if {[regexp $pattern $element match match2]} {
        puts $fileHandle "$match2"
    }  
}
close $fileHandle