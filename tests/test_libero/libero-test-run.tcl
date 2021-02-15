# This file is generated by Edalize.
# Microsemi Tcl Script
# Libero

source {libero-test-project.tcl}

run_tool -name {SYNTHESIZE}
run_tool -name {PLACEROUTE}
run_tool -name {GENERATEPROGRAMMINGDATA}

puts "To program the FPGA and SPI-Flash, run the 'Run PROGRAM Action' and 'Run PROGRAM_SPI_IMAGE Action' tools in the Design Flow menu."
puts "If required, adjust the memory allocation and initialization before generating the bitstream and programming."
puts "----------------- Finished building project -----------------------------"
