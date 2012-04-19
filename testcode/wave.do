onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /cpu/reset_l
add wave -noupdate -format Logic -height 15 -radix hexadecimal /cpu/clk
add wave -noupdate -divider Prediction
add wave -noupdate -divider Fetch1
add wave -noupdate -format Logic /cpu/pipelineddatapath/fetch1/load_pc
add wave -noupdate -format Literal /cpu/pipelineddatapath/fetch1/next_pc
add wave -noupdate -format Literal /cpu/pipelineddatapath/fetch1/instr_addr
add wave -noupdate -format Literal /cpu/pipelineddatapath/fetch1/icache_feedback
add wave -noupdate -format Literal /cpu/pipelineddatapath/fetch1/target_pc_mux_sel
add wave -noupdate -format Literal -expand /cpu/pipelineddatapath/fetch1/u_3/way0/waydata/data
add wave -noupdate -format Literal -expand /cpu/pipelineddatapath/fetch1/u_3/way0/tagbits/data
add wave -noupdate -format Literal /cpu/pipelineddatapath/fetch1/u_3/way0/validbits/data
add wave -noupdate -format Literal /cpu/pipelineddatapath/fetch1/u_3/way0/dirtybits/data
add wave -noupdate -format Literal /cpu/pipelineddatapath/fetch1/u_3/lru/data
add wave -noupdate -format Literal -expand /cpu/pipelineddatapath/fetch1/u_3/way1/waydata/data
add wave -noupdate -format Literal -expand /cpu/pipelineddatapath/fetch1/u_3/way1/tagbits/data
add wave -noupdate -format Literal /cpu/pipelineddatapath/fetch1/u_3/way1/validbits/data
add wave -noupdate -format Literal /cpu/pipelineddatapath/fetch1/u_3/way1/dirtybits/data
add wave -noupdate -divider Fetch2
add wave -noupdate -format Logic /cpu/pipelineddatapath/fetch2/fetch_ready
add wave -noupdate -format Literal /cpu/pipelineddatapath/fetch2/fetch_instr
add wave -noupdate -format Literal /cpu/pipelineddatapath/fetch2/instr
add wave -noupdate -format Logic /cpu/pipelineddatapath/fetch2/f
add wave -noupdate -format Literal /cpu/pipelineddatapath/fetch2/fetch2_data_in
add wave -noupdate -format Logic /cpu/pipelineddatapath/fetch2/instr_resp_h
add wave -noupdate -format Logic /cpu/pipelineddatapath/fetch2/mresp_h
add wave -noupdate -format Logic /cpu/pipelineddatapath/fetch2/icache_stage2/miss
add wave -noupdate -format Logic /cpu/pipelineddatapath/fetch2/read_instr_l
add wave -noupdate -format Logic /cpu/pipelineddatapath/fetch2/icache_stage2/in_load
add wave -noupdate -format Logic /cpu/pipelineddatapath/fetch2/icache_stage2/pmresp_h
add wave -noupdate -format Logic /cpu/pipelineddatapath/fetch2/icache_stage2/acachelogic/hit
add wave -noupdate -format Literal /cpu/pipelineddatapath/fetch2/icache_stage2/l1cachecontroller/current_state
add wave -noupdate -format Logic /cpu/pipelineddatapath/fetch2/icache_stage2/evict_buffer_valid
add wave -noupdate -format Logic /cpu/pipelineddatapath/fetch2/icache_stage2/acachelogic/evict_buffer_valid_internal
add wave -noupdate -format Logic /cpu/pipelineddatapath/fetch2/icache_stage2/acachelogic/u_27/evict_buffer_valid
add wave -noupdate -format Logic /cpu/pipelineddatapath/fetch2/icache_stage2/acachelogic/u_27/set_evict_buffer_valid
add wave -noupdate -format Logic /cpu/pipelineddatapath/fetch2/icache_stage2/acachelogic/u_27/reset_l
add wave -noupdate -format Logic /cpu/pipelineddatapath/fetch2/icache_stage2/acachelogic/present0
add wave -noupdate -format Logic /cpu/pipelineddatapath/fetch2/icache_stage2/acachelogic/present1
add wave -noupdate -format Literal /cpu/pipelineddatapath/fetch2/icache_stage2/acachelogic/tag
add wave -noupdate -format Literal /cpu/pipelineddatapath/fetch2/icache_stage2/acachelogic/tag0
add wave -noupdate -format Literal /cpu/pipelineddatapath/fetch2/icache_stage2/acachelogic/tag1
add wave -noupdate -format Literal /cpu/pipelineddatapath/fetch2/icache_stage2/acachelogic/tag0_fw
add wave -noupdate -format Literal /cpu/pipelineddatapath/fetch2/icache_stage2/acachelogic/tag1_fw
add wave -noupdate -format Literal /cpu/pipelineddatapath/fetch2/icache_stage2/acachelogic/last_writetag
add wave -noupdate -format Logic /cpu/pipelineddatapath/fetch2/icache_stage2/acachelogic/valid0_fw
add wave -noupdate -format Logic /cpu/pipelineddatapath/fetch2/icache_stage2/acachelogic/valid1_fw
add wave -noupdate -format Logic /cpu/pipelineddatapath/fetch2/icache_stage2/acachelogic/valid0
add wave -noupdate -format Logic /cpu/pipelineddatapath/fetch2/icache_stage2/acachelogic/valid1
add wave -noupdate -format Logic /cpu/pipelineddatapath/fetch2/icache_stage2/acachelogic/last_write0
add wave -noupdate -format Logic /cpu/pipelineddatapath/fetch2/icache_stage2/acachelogic/last_write1
add wave -noupdate -format Logic /cpu/pipelineddatapath/fetch2/icache_stage2/acachelogic/write0
add wave -noupdate -format Logic /cpu/pipelineddatapath/fetch2/icache_stage2/acachelogic/write1
add wave -noupdate -format Logic /cpu/pipelineddatapath/fetch2/icache_stage2/load_cache_fwd_pipe
add wave -noupdate -divider Decode
add wave -noupdate -color Aquamarine -format Event -height 15 -itemcolor Aquamarine /cpu/pipelineddatapath/decode/decode_data_in
add wave -noupdate -color Aquamarine -format Event -height 15 -itemcolor Aquamarine /cpu/pipelineddatapath/decode/decode_data_out
add wave -noupdate -color Aquamarine -format Event -height 15 -itemcolor Aquamarine /cpu/pipelineddatapath/decode/decode_control_out
add wave -noupdate -color Aquamarine -format Literal -height 15 -itemcolor Aquamarine /cpu/pipelineddatapath/uarch_data_in
add wave -noupdate -color Aquamarine -format Literal -height 15 -itemcolor Aquamarine /cpu/pipelineddatapath/uarch_control_in
add wave -noupdate -color Aquamarine -format Logic -itemcolor Aquamarine /cpu/pipelineddatapath/decode/srcbmuxsel
add wave -noupdate -color Aquamarine -format Literal -itemcolor Aquamarine /cpu/pipelineddatapath/decode/srcbmuxout
add wave -noupdate -color Aquamarine -format Literal -height 15 -itemcolor Aquamarine -expand /cpu/pipelineddatapath/decode_uop_data_out
add wave -noupdate -color Aquamarine -format Literal -height 15 -itemcolor Aquamarine -expand /cpu/pipelineddatapath/decode_uop_control_out
add wave -noupdate -divider Exec
add wave -noupdate -color Wheat -format Logic -height 15 -itemcolor Wheat /cpu/pipelineddatapath/pipe2_de/load_decode_exec_pipe
add wave -noupdate -color Wheat -format Literal -height 15 -itemcolor Wheat -radix hexadecimal /cpu/pipelineddatapath/exec_target_pc
add wave -noupdate -color Wheat -format Event -height 15 -itemcolor Wheat -expand /cpu/pipelineddatapath/exec/exec_data_in
add wave -noupdate -color Wheat -format Event -height 15 -itemcolor Wheat -expand /cpu/pipelineddatapath/exec/exec_data_out
add wave -noupdate -color Wheat -format Literal -height 15 -itemcolor Wheat -expand /cpu/pipelineddatapath/exec_control
add wave -noupdate -color Wheat -format Event -height 15 -itemcolor Wheat /cpu/pipelineddatapath/exec/exec_control_in
add wave -noupdate -divider Mem
add wave -noupdate -color Gold -format Logic -height 15 -itemcolor Gold -radix hexadecimal /cpu/pipelineddatapath/mem_ready
add wave -noupdate -color Gold -format Literal -height 15 -itemcolor Gold -radix hexadecimal /cpu/pipelineddatapath/datain
add wave -noupdate -color Gold -format Literal -height 15 -itemcolor Gold /cpu/pipelineddatapath/mem_control
add wave -noupdate -color Gold -format Literal -height 15 -itemcolor Gold -expand /cpu/pipelineddatapath/mem_data_out
add wave -noupdate -divider Forwarding
add wave -noupdate -color Thistle -format Literal -height 15 -itemcolor Thistle /cpu/pipelineddatapath/aforwardpipe/exec_forward_srca_sel
add wave -noupdate -color Thistle -format Literal -height 15 -itemcolor Thistle /cpu/pipelineddatapath/aforwardpipe/exec_forward_srcb_sel
add wave -noupdate -color Thistle -format Literal -height 15 -itemcolor Thistle /cpu/pipelineddatapath/aforwardpipe/mem_foward_sel
add wave -noupdate -color Thistle -format Logic -height 15 -itemcolor Thistle /cpu/pipelineddatapath/aforwardingunit/sr1_stall_load_use
add wave -noupdate -color Thistle -format Logic -height 15 -itemcolor Thistle /cpu/pipelineddatapath/aforwardingunit/sr2_stall_load_use
add wave -noupdate -color Thistle -format Logic -height 15 -itemcolor Thistle /cpu/pipelineddatapath/aforwardingunit/stall_load_use_buffer
add wave -noupdate -divider Stall
add wave -noupdate -color Coral -format Logic -height 15 -itemcolor Coral /cpu/pipelineddatapath/astall/cache_ready
add wave -noupdate -color Coral -format Logic -height 15 -itemcolor Coral /cpu/pipelineddatapath/astall/stall_load_use_buffer
add wave -noupdate -color Coral -format Logic -height 15 -itemcolor Coral /cpu/pipelineddatapath/astall/load_fd
add wave -noupdate -color Coral -format Logic -height 15 -itemcolor Coral /cpu/pipelineddatapath/astall/load_pc
add wave -noupdate -color Coral -format Logic -height 15 -itemcolor Coral /cpu/pipelineddatapath/astall/load_fetch_decode_pipe
add wave -noupdate -color Coral -format Logic -height 15 -itemcolor Coral /cpu/pipelineddatapath/astall/load_decode_exec_pipe
add wave -noupdate -color Coral -format Logic -height 15 -itemcolor Coral /cpu/pipelineddatapath/astall/load_exec_mem_pipe
add wave -noupdate -color Coral -format Logic -height 15 -itemcolor Coral /cpu/pipelineddatapath/astall/load_mem_wb_pipe
add wave -noupdate -color Coral -format Logic -height 15 -itemcolor Coral /cpu/pipelineddatapath/astall/load_fwd_pipe
add wave -noupdate -color Coral -format Logic -height 15 -itemcolor Coral /cpu/pipelineddatapath/astall/load_uarch_pipe
add wave -noupdate -format Logic /cpu/pipelineddatapath/uarch_stall_in
add wave -noupdate -format Logic /cpu/pipelineddatapath/uarch_stall_in_buffer
add wave -noupdate -format Logic /cpu/pipelineddatapath/auarchpipe/uarch_sel_in
add wave -noupdate -divider Writeback
add wave -noupdate -color {Green Yellow} -format Literal -height 15 -itemcolor {Green Yellow} -radix hexadecimal /cpu/pipelineddatapath/wb_dest
add wave -noupdate -color {Green Yellow} -format Literal -height 15 -itemcolor {Green Yellow} -radix hexadecimal /cpu/pipelineddatapath/wb_din
add wave -noupdate -color {Green Yellow} -format Logic -height 15 -itemcolor {Green Yellow} -radix hexadecimal /cpu/pipelineddatapath/wb_rw
add wave -noupdate -divider Regfile
add wave -noupdate -color {Sky Blue} -format Event -height 15 -itemcolor {Sky Blue} -radix hexadecimal /cpu/pipelineddatapath/decode/arf/ram
add wave -noupdate -divider Caches
add wave -noupdate -format Literal -height 15 -radix hexadecimal /cpu/datain
add wave -noupdate -format Literal -height 15 -radix hexadecimal /cpu/dataout
add wave -noupdate -format Literal -height 15 -radix hexadecimal /cpu/data_addr
add wave -noupdate -format Logic -height 15 -radix hexadecimal /cpu/data_mread_l
add wave -noupdate -format Logic -height 15 -radix hexadecimal /cpu/data_mwriteh_l
add wave -noupdate -format Logic -height 15 -radix hexadecimal /cpu/data_mwritel_l
add wave -noupdate -format Logic -height 15 -radix hexadecimal /cpu/data_resp_h
add wave -noupdate -format Literal -height 15 -radix hexadecimal /cpu/instr_in
add wave -noupdate -format Logic -height 15 -radix hexadecimal /cpu/instr_mread_l
add wave -noupdate -format Logic -height 15 -radix hexadecimal /cpu/instr_resp_h
add wave -noupdate -format Event -height 15 -radix hexadecimal -expand /cpu/dram/dcache/cache_dp1/way0/tagbits/data
add wave -noupdate -format Event -height 15 -radix hexadecimal -expand /cpu/dram/dcache/cache_dp1/way0/waydata/data
add wave -noupdate -format Event -height 15 -radix hexadecimal /cpu/dram/dcache/cache_dp1/way1/tagbits/data
add wave -noupdate -format Event -height 15 -radix hexadecimal /cpu/dram/dcache/cache_dp1/way1/waydata/data
TreeUpdate [SetDefaultTree]
quietly WaveActivateNextPane
add wave -noupdate -format Literal /cpu/pipelineddatapath/fetch1/instr_addr
add wave -noupdate -format Literal /cpu/pipelineddatapath/fetch2/instr_addr
add wave -noupdate -format Literal /cpu/pipelineddatapath/decode/decode_pc
add wave -noupdate -format Literal /cpu/pipelineddatapath/exec/exec_pc
add wave -noupdate -format Literal /cpu/pipelineddatapath/mem/mem_pc
add wave -noupdate -format Literal /cpu/pipelineddatapath/pipe4_mw/wb_data_in.pc
add wave -noupdate -color Aquamarine -format Literal -itemcolor Aquamarine /cpu/pipelineddatapath/decode_uop_data_out.instr
add wave -noupdate -color Wheat -format Literal -itemcolor Wheat /cpu/pipelineddatapath/exec_data_in.instr
add wave -noupdate -color Gold -format Literal -itemcolor Gold /cpu/pipelineddatapath/mem_data_in.instr
add wave -noupdate -color {Green Yellow} -format Literal -itemcolor {Green Yellow} /cpu/pipelineddatapath/wb_data_in.instr
add wave -noupdate -color {Sky Blue} -format Event -height 15 -itemcolor {Sky Blue} -expand /cpu/pipelineddatapath/decode/arf/ram
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {29499 ns} 0}
configure wave -namecolwidth 564
configure wave -valuecolwidth 255
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
WaveRestoreZoom {29310 ns} {29533 ns}
