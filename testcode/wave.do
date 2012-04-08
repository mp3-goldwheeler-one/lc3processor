onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic -height 15 -radix hexadecimal /cpu/pipelineddatapath/reset_l
add wave -noupdate -format Logic -height 15 -radix hexadecimal /cpu/pipelineddatapath/start_h
add wave -noupdate -format Logic -height 15 -radix hexadecimal /cpu/clk
add wave -noupdate -divider Fetch
add wave -noupdate -color Salmon -format Literal -height 15 -itemcolor Salmon -radix hexadecimal /cpu/pipelineddatapath/fetch_instr
add wave -noupdate -color Salmon -format Literal -height 15 -itemcolor Salmon -radix hexadecimal /cpu/pipelineddatapath/pc
add wave -noupdate -color Salmon -format Event -height 15 -itemcolor Salmon /cpu/pipelineddatapath/fetch/fetch_data_out
add wave -noupdate -color Salmon -format Literal -height 15 -itemcolor Salmon /cpu/pipelineddatapath/fetch/instr_addr
add wave -noupdate -divider Decode
add wave -noupdate -color Aquamarine -format Literal -height 15 -itemcolor Aquamarine -radix hexadecimal /cpu/pipelineddatapath/decode_pc
add wave -noupdate -color Aquamarine -format Literal -height 15 -itemcolor Aquamarine -radix hexadecimal /cpu/pipelineddatapath/decode_instr
add wave -noupdate -color Aquamarine -format Logic -height 15 -itemcolor Aquamarine -radix hexadecimal /cpu/pipelineddatapath/decode/n
add wave -noupdate -color Aquamarine -format Logic -height 15 -itemcolor Aquamarine -radix hexadecimal /cpu/pipelineddatapath/decode/z
add wave -noupdate -color Aquamarine -format Logic -height 15 -itemcolor Aquamarine -radix hexadecimal /cpu/pipelineddatapath/decode/p
add wave -noupdate -color Aquamarine -format Event -height 15 -itemcolor Aquamarine /cpu/pipelineddatapath/decode/decode_data_in
add wave -noupdate -color Aquamarine -format Event -height 15 -itemcolor Aquamarine /cpu/pipelineddatapath/decode/decode_data_out
add wave -noupdate -color Aquamarine -format Event -height 15 -itemcolor Aquamarine /cpu/pipelineddatapath/decode/decode_control_out
add wave -noupdate -format Literal -height 15 /cpu/pipelineddatapath/uarch_data_in
add wave -noupdate -format Literal -height 15 /cpu/pipelineddatapath/uarch_control_in
add wave -noupdate -format Literal -height 15 /cpu/pipelineddatapath/decode_uop_data_out
add wave -noupdate -format Literal -height 15 -expand /cpu/pipelineddatapath/decode_uop_control_out
add wave -noupdate -divider Exec
add wave -noupdate -format Logic -height 15 /cpu/pipelineddatapath/pipe2_de/load_decode_exec_pipe
add wave -noupdate -color Wheat -format Literal -height 15 -itemcolor Wheat -radix hexadecimal /cpu/pipelineddatapath/exec_pc
add wave -noupdate -color Wheat -format Literal -height 15 -itemcolor Wheat -radix hexadecimal /cpu/pipelineddatapath/exec_instr
add wave -noupdate -color Wheat -format Literal -height 15 -itemcolor Wheat -radix hexadecimal /cpu/pipelineddatapath/exec_target_pc
add wave -noupdate -color Wheat -format Event -height 15 -itemcolor Wheat /cpu/pipelineddatapath/exec/exec_data_in
add wave -noupdate -color Wheat -format Event -height 15 -itemcolor Wheat /cpu/pipelineddatapath/exec/exec_data_out
add wave -noupdate -format Literal -height 15 /cpu/pipelineddatapath/exec_control
add wave -noupdate -color Wheat -format Event -height 15 -itemcolor Wheat -expand /cpu/pipelineddatapath/exec/exec_control_in
add wave -noupdate -divider Mem
add wave -noupdate -color Gold -format Literal -height 15 -itemcolor Gold -radix hexadecimal /cpu/pipelineddatapath/mem_pc
add wave -noupdate -color Gold -format Literal -height 15 -itemcolor Gold -radix hexadecimal /cpu/pipelineddatapath/mem_instr
add wave -noupdate -color Gold -format Logic -height 15 -itemcolor Gold -radix hexadecimal /cpu/pipelineddatapath/mem_ready
add wave -noupdate -color Gold -format Literal -height 15 -itemcolor Gold -radix hexadecimal /cpu/pipelineddatapath/datain
add wave -noupdate -format Literal -height 15 /cpu/pipelineddatapath/mem_control
add wave -noupdate -format Literal -height 15 -expand /cpu/pipelineddatapath/mem_data_out
add wave -noupdate -divider Forwarding
add wave -noupdate -format Literal -height 15 /cpu/pipelineddatapath/aforwardpipe/exec_forward_srca_sel
add wave -noupdate -format Literal -height 15 /cpu/pipelineddatapath/aforwardpipe/exec_forward_srcb_sel
add wave -noupdate -format Literal -height 15 /cpu/pipelineddatapath/aforwardpipe/mem_foward_sel
add wave -noupdate -format Logic -height 15 /cpu/pipelineddatapath/aforwardingunit/sr1_stall_load_use
add wave -noupdate -format Logic -height 15 /cpu/pipelineddatapath/aforwardingunit/sr2_stall_load_use
add wave -noupdate -format Logic -height 15 /cpu/pipelineddatapath/aforwardingunit/stall_load_use_buffer
add wave -noupdate -divider Stall
add wave -noupdate -format Logic -height 15 /cpu/pipelineddatapath/astall/cache_ready
add wave -noupdate -format Logic -height 15 /cpu/pipelineddatapath/astall/stall_load_use_buffer
add wave -noupdate -format Logic -height 15 /cpu/pipelineddatapath/astall/uarch_stall_in_buffer
add wave -noupdate -format Logic -height 15 /cpu/pipelineddatapath/astall/load_fd
add wave -noupdate -format Logic -height 15 /cpu/pipelineddatapath/astall/load_pc
add wave -noupdate -format Logic -height 15 /cpu/pipelineddatapath/astall/load_fetch_decode_pipe
add wave -noupdate -format Logic -height 15 /cpu/pipelineddatapath/astall/load_decode_exec_pipe
add wave -noupdate -format Logic -height 15 /cpu/pipelineddatapath/astall/load_exec_mem_pipe
add wave -noupdate -format Logic -height 15 /cpu/pipelineddatapath/astall/load_mem_wb_pipe
add wave -noupdate -format Logic -height 15 /cpu/pipelineddatapath/astall/load_fwd_pipe
add wave -noupdate -format Logic -height 15 /cpu/pipelineddatapath/astall/load_uarch_pipe
add wave -noupdate -divider Writeback
add wave -noupdate -color {Green Yellow} -format Literal -height 15 -itemcolor {Green Yellow} -radix hexadecimal /cpu/pipelineddatapath/wb_pc
add wave -noupdate -color {Green Yellow} -format Literal -height 15 -itemcolor {Green Yellow} -radix hexadecimal /cpu/pipelineddatapath/wb_instr
add wave -noupdate -color {Green Yellow} -format Literal -height 15 -itemcolor {Green Yellow} -radix hexadecimal /cpu/pipelineddatapath/wb_dest
add wave -noupdate -color {Green Yellow} -format Literal -height 15 -itemcolor {Green Yellow} -radix hexadecimal /cpu/pipelineddatapath/wb_din
add wave -noupdate -color {Green Yellow} -format Logic -height 15 -itemcolor {Green Yellow} -radix hexadecimal /cpu/pipelineddatapath/wb_rw
add wave -noupdate -format Literal -height 15 /cpu/pipelineddatapath/wb/wb_control
add wave -noupdate -color {Green Yellow} -format Event -height 15 -itemcolor {Green Yellow} /cpu/pipelineddatapath/wb/wb_data_in
add wave -noupdate -color {Green Yellow} -format Event -height 15 -itemcolor {Green Yellow} -expand /cpu/pipelineddatapath/wb/wb_control_in
add wave -noupdate -divider Regfile
add wave -noupdate -color {Sky Blue} -format Event -height 15 -itemcolor {Sky Blue} -radix hexadecimal /cpu/pipelineddatapath/decode/arf/ram
add wave -noupdate -divider Caches
add wave -noupdate -format Literal -height 15 /cpu/dram/arbiter/acontroller/current_state
add wave -noupdate -format Literal -height 15 -radix hexadecimal /cpu/datain
add wave -noupdate -format Literal -height 15 -radix hexadecimal /cpu/dataout
add wave -noupdate -format Literal -height 15 -radix hexadecimal /cpu/data_addr
add wave -noupdate -format Logic -height 15 -radix hexadecimal /cpu/data_mread_l
add wave -noupdate -format Logic -height 15 -radix hexadecimal /cpu/data_mwriteh_l
add wave -noupdate -format Logic -height 15 -radix hexadecimal /cpu/data_mwritel_l
add wave -noupdate -format Logic -height 15 -radix hexadecimal /cpu/data_resp_h
add wave -noupdate -format Literal -height 15 -radix hexadecimal /cpu/instr_addr
add wave -noupdate -format Literal -height 15 -radix hexadecimal /cpu/instr_in
add wave -noupdate -format Logic -height 15 -radix hexadecimal /cpu/instr_mread_l
add wave -noupdate -format Logic -height 15 -radix hexadecimal /cpu/instr_mwriteh_l
add wave -noupdate -format Logic -height 15 -radix hexadecimal /cpu/instr_mwritel_l
add wave -noupdate -format Literal -height 15 -radix hexadecimal /cpu/instr_out
add wave -noupdate -format Logic -height 15 -radix hexadecimal /cpu/instr_resp_h
add wave -noupdate -format Event -height 15 -radix hexadecimal -expand /cpu/dram/dcache/cache_dp1/way0/tagbits/data
add wave -noupdate -format Event -height 15 -radix hexadecimal -expand /cpu/dram/dcache/cache_dp1/way0/waydata/data
add wave -noupdate -format Event -height 15 -radix hexadecimal /cpu/dram/dcache/cache_dp1/way1/tagbits/data
add wave -noupdate -format Event -height 15 -radix hexadecimal /cpu/dram/dcache/cache_dp1/way1/waydata/data
add wave -noupdate -format Event -height 15 -radix hexadecimal -expand /cpu/dram/icache/cache_dp1/way0/tagbits/data
add wave -noupdate -format Event -height 15 -radix hexadecimal -expand /cpu/dram/icache/cache_dp1/way0/waydata/data
add wave -noupdate -format Event -height 15 -radix hexadecimal /cpu/dram/icache/cache_dp1/way1/tagbits/data
add wave -noupdate -format Event -height 15 -radix hexadecimal /cpu/dram/icache/cache_dp1/way1/waydata/data
TreeUpdate [SetDefaultTree]
quietly WaveActivateNextPane
add wave -noupdate -format Logic -height 15 /cpu/pipelineddatapath/load_fetch_decode_pipe
add wave -noupdate -format Literal -height 15 /cpu/pipelineddatapath/decode_uop_control_out.op
add wave -noupdate -format Logic -height 15 /cpu/pipelineddatapath/load_decode_exec_pipe
add wave -noupdate -format Literal -height 15 /cpu/pipelineddatapath/exec_control.op
add wave -noupdate -format Logic -height 15 /cpu/pipelineddatapath/load_exec_mem_pipe
add wave -noupdate -format Literal -height 15 /cpu/pipelineddatapath/mem_control.op
add wave -noupdate -format Logic -height 15 /cpu/pipelineddatapath/load_mem_wb_pipe
add wave -noupdate -format Literal -height 15 /cpu/pipelineddatapath/wb_control.op
add wave -noupdate -color {Sky Blue} -format Event -height 15 -itemcolor {Sky Blue} -expand /cpu/pipelineddatapath/decode/arf/ram
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1341 ns} 0}
configure wave -namecolwidth 461
configure wave -valuecolwidth 171
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
update
WaveRestoreZoom {1152 ns} {1488 ns}
