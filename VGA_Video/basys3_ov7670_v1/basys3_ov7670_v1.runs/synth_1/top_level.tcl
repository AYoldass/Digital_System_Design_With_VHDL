# 
# Synthesis run script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
create_project -in_memory -part xc7a35tcpg236-3

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir C:/Users/mcanb/OneDrive/Desktop/fg/basys3_ov7670_v1/basys3_ov7670_v1.cache/wt [current_project]
set_property parent.project_path C:/Users/mcanb/OneDrive/Desktop/fg/basys3_ov7670_v1/basys3_ov7670_v1.xpr [current_project]
set_property XPM_LIBRARIES XPM_MEMORY [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo c:/Users/mcanb/OneDrive/Desktop/fg/basys3_ov7670_v1/basys3_ov7670_v1.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  C:/Users/mcanb/OneDrive/Desktop/fg/basys3_ov7670_v1/basys3_ov7670_v1.srcs/sources_1/imports/ov7670_fr/RGB.vhd
  C:/Users/mcanb/OneDrive/Desktop/fg/basys3_ov7670_v1/basys3_ov7670_v1.srcs/sources_1/imports/ov7670_fr/address_Generator.vhd
  C:/Users/mcanb/OneDrive/Desktop/fg/basys3_ov7670_v1/basys3_ov7670_v1.srcs/sources_1/imports/basys3_ov7670/clocking.vhd
  C:/Users/mcanb/OneDrive/Desktop/fg/basys3_ov7670_v1/basys3_ov7670_v1.srcs/sources_1/imports/ov7670_fr/debounce.vhd
  C:/Users/mcanb/OneDrive/Desktop/fg/basys3_ov7670_v1/basys3_ov7670_v1.srcs/sources_1/imports/basys3_ov7670/i2c_sender.vhd
  C:/Users/mcanb/OneDrive/Desktop/fg/basys3_ov7670_v1/basys3_ov7670_v1.srcs/sources_1/imports/ov7670_fr/ov7670_capture.vhd
  C:/Users/mcanb/OneDrive/Desktop/fg/basys3_ov7670_v1/basys3_ov7670_v1.srcs/sources_1/imports/ov7670_fr/ov7670_controller.vhd
  C:/Users/mcanb/OneDrive/Desktop/fg/basys3_ov7670_v1/basys3_ov7670_v1.srcs/sources_1/imports/basys3_ov7670/ov7670_registers.vhd
  C:/Users/mcanb/OneDrive/Desktop/fg/basys3_ov7670_v1/basys3_ov7670_v1.srcs/sources_1/imports/ov7670_fr/vga.vhd
  C:/Users/mcanb/OneDrive/Desktop/fg/basys3_ov7670_v1/basys3_ov7670_v1.srcs/sources_1/imports/ov7670_fr/top_level.vhd
}
read_ip -quiet C:/Users/mcanb/OneDrive/Desktop/fg/basys3_ov7670_v1/basys3_ov7670_v1.srcs/sources_1/ip/frame_buffer/frame_buffer.xci
set_property used_in_implementation false [get_files -all c:/Users/mcanb/OneDrive/Desktop/fg/basys3_ov7670_v1/basys3_ov7670_v1.srcs/sources_1/ip/frame_buffer/frame_buffer_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/mcanb/OneDrive/Desktop/fg/basys3_ov7670_v1/basys3_ov7670_v1.srcs/constrs_1/imports/new/basys3_xdc.xdc
set_property used_in_implementation false [get_files C:/Users/mcanb/OneDrive/Desktop/fg/basys3_ov7670_v1/basys3_ov7670_v1.srcs/constrs_1/imports/new/basys3_xdc.xdc]

set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top top_level -part xc7a35tcpg236-3


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef top_level.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file top_level_utilization_synth.rpt -pb top_level_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
