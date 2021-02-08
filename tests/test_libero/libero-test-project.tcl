# This file is generated by Edalize.
# Microsemi Tcl Script
# Libero

# Create a new project with device parameters
new_project -location {./prj} -name libero-test -project_description {} -block_mode 0 -standalone_peripheral_initialization 0 -instantiate_in_smartdesign 1 -ondemand_build_dh 1 -hdl {VERILOG} -family {PolarFire} -die {MPF300TS_ES} -package {FCG1152} -part_range {IND} -adv_options {RESTRICTPROBEPINS:1} -adv_options {RESTRICTSPIPINS:0} -adv_options {SYSTEM_CONTROLLER_SUSPEND_MODE:0} -adv_options {TEMPR:IND} -adv_options {VCCI_1.2_VOLTR:EXT} -adv_options {VCCI_1.5_VOLTR:EXT} -adv_options {VCCI_1.8_VOLTR:EXT} -adv_options {VCCI_2.5_VOLTR:EXT} -adv_options {VCCI_3.3_VOLTR:EXT} -adv_options {VOLTR:IND}

# Import HDL sources and constraints
import_files \
        -convert_EDN_to_HDL 0 \
        -sdc {sdc_file} \
        -hdl_source {sv_file.sv} \
        -hdl_source {vlog_file.v} \
        -hdl_source {vlog05_file.v} \
        -hdl_source {vhdl_file.vhd} \
        -hdl_source {vhdl_lfile} \
        -hdl_source {vhdl2008_file} \
        -hdl_source {another_sv_file.sv} \
        -io_pdc {pdc_constraint_file.pdc} \

# Build design hierarchy and set the top module
build_design_hierarchy
puts "Setting top level module to: {top_module::work}"
set_root -module {top_module::work}

# Configure Synthesize tool to use the generated Synplify TCL script and user parameters

configure_tool -name {SYNTHESIZE} \
        -params {SYNPLIFY_TCL_FILE:../../libero-test-syn-user.tcl}

puts "Configured Synthesize tool to use script: libero-test-syn-user.tcl"
puts "Configured Synthesize tool to include dirs:"
puts "- ../../."


puts "----------------------- Synthesize Constraints ---------------------------"
puts "File: ./prj/constraint/sdc_file"
# Configure Synthesize tool to use the project constraints
organize_tool_files -tool {SYNTHESIZE} \
        -file {./prj/constraint/sdc_file} \
        -module {top_module::work} -input_type {constraint}

# Configure Place and Route tool to use the project constraints
puts "----------------------- Place and Route Constraints ----------------------"
puts "File: ./prj/constraint/sdc_file"
puts "File: ./prj/constraint/io/pdc_constraint_file.pdc"

organize_tool_files -tool {PLACEROUTE} \
        -file {./prj/constraint/sdc_file} \
        -file {./prj/constraint/io/pdc_constraint_file.pdc} \
        -module {top_module::work} -input_type {constraint}

# Configure Verify Timing tool to use the project constraints
puts "----------------------- Verify Timings Constraints -----------------------"
puts "File: ./prj/constraint/sdc_file"
organize_tool_files -tool {VERIFYTIMING} \
        -file {./prj/constraint/sdc_file} \
        -module {top_module::work} -input_type {constraint}

save_project

puts "----------------------- Finished -----------------------------------------"