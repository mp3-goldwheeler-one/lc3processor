onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Inputs
add wave -noupdate -format Logic -height 15 /btb_datapath/clk
add wave -noupdate -format Logic -height 15 /btb_datapath/reset_l
add wave -noupdate -format Literal -height 15 /btb_datapath/address
add wave -noupdate -format Logic -height 15 /btb_datapath/mread_l
add wave -noupdate -format Logic -height 15 /btb_datapath/mwrite_l
add wave -noupdate -divider Internals
add wave -noupdate -format Literal /btb_datapath/lru/data
add wave -noupdate -divider Outputs
add wave -noupdate -format Event -height 15 -expand /btb_datapath/way0/tagbits/data
add wave -noupdate -format Event -height 15 -expand /btb_datapath/way1/tagbits/data
add wave -noupdate -format Event -height 15 -expand /btb_datapath/way0/btbarray/data
add wave -noupdate -format Event -height 15 -expand /btb_datapath/way1/btbarray/data
add wave -noupdate -format Literal -height 15 -expand /btb_datapath/datain
add wave -noupdate -format Logic -height 15 /btb_datapath/miss
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {265 ns} 0}
configure wave -namecolwidth 285
configure wave -valuecolwidth 90
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
WaveRestoreZoom {0 ns} {546 ns}
