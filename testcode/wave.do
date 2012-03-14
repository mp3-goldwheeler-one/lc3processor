onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic -radix hexadecimal /cpu/pipelineddatapath/reset_l
add wave -noupdate -format Logic -radix hexadecimal /cpu/pipelineddatapath/start_h
add wave -noupdate -format Logic -radix hexadecimal /cpu/clk
add wave -noupdate -divider Fetch
add wave -noupdate -color Salmon -format Literal -itemcolor Salmon -radix hexadecimal /cpu/pipelineddatapath/fetch_instr
add wave -noupdate -color Salmon -format Literal -itemcolor Salmon -radix hexadecimal /cpu/pipelineddatapath/pc
add wave -noupdate -divider Decode
add wave -noupdate -color Aquamarine -format Literal -itemcolor Aquamarine -radix hexadecimal /cpu/pipelineddatapath/decode_pc
add wave -noupdate -color Aquamarine -format Literal -itemcolor Aquamarine -radix hexadecimal /cpu/pipelineddatapath/decode_instr
add wave -noupdate -color Aquamarine -format Literal -itemcolor Aquamarine -radix hexadecimal /cpu/pipelineddatapath/decode_opcode
add wave -noupdate -color Aquamarine -format Literal -itemcolor Aquamarine -radix hexadecimal /cpu/pipelineddatapath/decode_aluop
add wave -noupdate -color Aquamarine -format Logic -itemcolor Aquamarine -radix hexadecimal /cpu/pipelineddatapath/decode_regwrite
add wave -noupdate -color Aquamarine -format Logic -itemcolor Aquamarine -radix hexadecimal /cpu/pipelineddatapath/decode_shift_imm
add wave -noupdate -color Aquamarine -format Literal -itemcolor Aquamarine -radix hexadecimal /cpu/pipelineddatapath/decode_src_a
add wave -noupdate -color Aquamarine -format Literal -itemcolor Aquamarine -radix hexadecimal /cpu/pipelineddatapath/decode_src_b
add wave -noupdate -color Aquamarine -format Literal -itemcolor Aquamarine -radix hexadecimal /cpu/pipelineddatapath/decode_alumux_sel
add wave -noupdate -color Aquamarine -format Logic -itemcolor Aquamarine -radix hexadecimal /cpu/pipelineddatapath/decode/n
add wave -noupdate -color Aquamarine -format Logic -itemcolor Aquamarine -radix hexadecimal /cpu/pipelineddatapath/decode/z
add wave -noupdate -color Aquamarine -format Logic -itemcolor Aquamarine -radix hexadecimal /cpu/pipelineddatapath/decode/p
add wave -noupdate -divider Exec
add wave -noupdate -color Wheat -format Literal -itemcolor Wheat -radix hexadecimal /cpu/pipelineddatapath/exec_pc
add wave -noupdate -color Wheat -format Literal -itemcolor Wheat -radix hexadecimal /cpu/pipelineddatapath/exec_instr
add wave -noupdate -color Wheat -format Literal -itemcolor Wheat -radix hexadecimal /cpu/pipelineddatapath/exec_opcode
add wave -noupdate -color Wheat -format Literal -itemcolor Wheat -radix hexadecimal /cpu/pipelineddatapath/exec_aluop
add wave -noupdate -color Wheat -format Logic -itemcolor Wheat -radix hexadecimal /cpu/pipelineddatapath/exec_regwrite
add wave -noupdate -color Wheat -format Logic -itemcolor Wheat -radix hexadecimal /cpu/pipelineddatapath/exec_shift_imm
add wave -noupdate -color Wheat -format Literal -itemcolor Wheat -radix hexadecimal /cpu/pipelineddatapath/exec_src_a
add wave -noupdate -color Wheat -format Literal -itemcolor Wheat -radix hexadecimal /cpu/pipelineddatapath/exec_src_b
add wave -noupdate -color Wheat -format Literal -itemcolor Wheat -radix hexadecimal /cpu/pipelineddatapath/exec_alumux_sel
add wave -noupdate -color Wheat -format Logic -itemcolor Wheat -radix hexadecimal /cpu/pipelineddatapath/exec_load_pc
add wave -noupdate -color Wheat -format Literal -itemcolor Wheat -radix hexadecimal /cpu/pipelineddatapath/exec_target_pc
add wave -noupdate -divider Mem
add wave -noupdate -color Gold -format Literal -itemcolor Gold -radix hexadecimal /cpu/pipelineddatapath/mem_pc
add wave -noupdate -color Gold -format Literal -itemcolor Gold -radix hexadecimal /cpu/pipelineddatapath/mem_instr
add wave -noupdate -color Gold -format Literal -itemcolor Gold -radix hexadecimal /cpu/pipelineddatapath/mem_opcode
add wave -noupdate -color Gold -format Literal -itemcolor Gold -radix hexadecimal /cpu/pipelineddatapath/mem_aluout
add wave -noupdate -color Gold -format Literal -itemcolor Gold -radix hexadecimal /cpu/pipelineddatapath/mem_dr
add wave -noupdate -color Gold -format Logic -itemcolor Gold -radix hexadecimal /cpu/pipelineddatapath/mem_ready
add wave -noupdate -color Gold -format Logic -itemcolor Gold -radix hexadecimal /cpu/pipelineddatapath/mem_regwrite
add wave -noupdate -color Gold -format Logic -itemcolor Gold -radix hexadecimal /cpu/pipelineddatapath/mem_set_cc
add wave -noupdate -color Gold -format Literal -itemcolor Gold -radix hexadecimal /cpu/pipelineddatapath/mem_src_a
add wave -noupdate -color Gold -format Literal -itemcolor Gold -radix hexadecimal /cpu/pipelineddatapath/mem_src_b
add wave -noupdate -color Gold -format Literal -itemcolor Gold -radix hexadecimal /cpu/pipelineddatapath/datain
add wave -noupdate -divider Writeback
add wave -noupdate -color {Green Yellow} -format Literal -itemcolor {Green Yellow} -radix hexadecimal /cpu/pipelineddatapath/wb_pc
add wave -noupdate -color {Green Yellow} -format Literal -itemcolor {Green Yellow} -radix hexadecimal /cpu/pipelineddatapath/wb_instr
add wave -noupdate -color {Green Yellow} -format Literal -itemcolor {Green Yellow} -radix hexadecimal /cpu/pipelineddatapath/wb_opcode
add wave -noupdate -color {Green Yellow} -format Literal -itemcolor {Green Yellow} -radix hexadecimal /cpu/pipelineddatapath/wb_aluout
add wave -noupdate -color {Green Yellow} -format Literal -itemcolor {Green Yellow} -radix hexadecimal /cpu/pipelineddatapath/wb_dest
add wave -noupdate -color {Green Yellow} -format Literal -itemcolor {Green Yellow} -radix hexadecimal /cpu/pipelineddatapath/wb_din
add wave -noupdate -color {Green Yellow} -format Literal -itemcolor {Green Yellow} -radix hexadecimal /cpu/pipelineddatapath/wb_dr
add wave -noupdate -color {Green Yellow} -format Logic -itemcolor {Green Yellow} -radix hexadecimal /cpu/pipelineddatapath/wb_regwrite
add wave -noupdate -color {Green Yellow} -format Logic -itemcolor {Green Yellow} -radix hexadecimal /cpu/pipelineddatapath/wb_rw
add wave -noupdate -color {Green Yellow} -format Literal -itemcolor {Green Yellow} -radix hexadecimal /cpu/pipelineddatapath/wb_src_a
add wave -noupdate -color {Green Yellow} -format Literal -itemcolor {Green Yellow} -radix hexadecimal /cpu/pipelineddatapath/wb_src_b
add wave -noupdate -divider Regfile
add wave -noupdate -format Event -radix decimal -expand /cpu/pipelineddatapath/decode/arf/ram
add wave -noupdate -divider Caches
add wave -noupdate -format Literal -radix hexadecimal /cpu/datain
add wave -noupdate -format Literal -radix hexadecimal /cpu/dataout
add wave -noupdate -format Literal -radix hexadecimal /cpu/data_addr
add wave -noupdate -format Logic -radix hexadecimal /cpu/data_mread_l
add wave -noupdate -format Logic -radix hexadecimal /cpu/data_mwriteh_l
add wave -noupdate -format Logic -radix hexadecimal /cpu/data_mwritel_l
add wave -noupdate -format Logic -radix hexadecimal /cpu/data_resp_h
add wave -noupdate -format Literal -radix hexadecimal /cpu/instr_addr
add wave -noupdate -format Literal -radix hexadecimal /cpu/instr_in
add wave -noupdate -format Logic -radix hexadecimal /cpu/instr_mread_l
add wave -noupdate -format Logic -radix hexadecimal /cpu/instr_mwriteh_l
add wave -noupdate -format Logic -radix hexadecimal /cpu/instr_mwritel_l
add wave -noupdate -format Literal -radix hexadecimal /cpu/instr_out
add wave -noupdate -format Logic -radix hexadecimal /cpu/instr_resp_h
add wave -noupdate -format Event -radix hexadecimal -expand /cpu/dram/dcache/cache_dp1/way0/tagbits/data
add wave -noupdate -format Event -radix hexadecimal -expand /cpu/dram/dcache/cache_dp1/way0/waydata/data
add wave -noupdate -format Event -radix hexadecimal /cpu/dram/dcache/cache_dp1/way1/tagbits/data
add wave -noupdate -format Event -radix hexadecimal /cpu/dram/dcache/cache_dp1/way1/waydata/data
add wave -noupdate -format Event -radix hexadecimal -expand /cpu/dram/icache/cache_dp1/way0/tagbits/data
add wave -noupdate -format Event -radix hexadecimal -expand /cpu/dram/icache/cache_dp1/way0/waydata/data
add wave -noupdate -format Event -radix hexadecimal /cpu/dram/icache/cache_dp1/way1/tagbits/data
add wave -noupdate -format Event -radix hexadecimal /cpu/dram/icache/cache_dp1/way1/waydata/data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3156 ns} 0}
configure wave -namecolwidth 374
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
WaveRestoreZoom {2957 ns} {6113 ns}
