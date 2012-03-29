onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Literal -height 15 -radix hexadecimal /memory/dcache/address
add wave -noupdate -format Logic -height 15 -radix hexadecimal /memory/dcache/clk
add wave -noupdate -format Literal -height 15 -radix hexadecimal /memory/dcache/dataout
add wave -noupdate -format Logic -height 15 -radix hexadecimal /memory/dcache/mread_l
add wave -noupdate -format Logic -height 15 -radix hexadecimal /memory/dcache/mwriteh_l
add wave -noupdate -format Logic -height 15 -radix hexadecimal /memory/dcache/mwritel_l
add wave -noupdate -format Literal -height 15 -radix hexadecimal /memory/dcache/pmdatain
add wave -noupdate -format Logic -height 15 -radix hexadecimal /memory/dcache/pmresp_h
add wave -noupdate -format Logic -height 15 -radix hexadecimal /memory/dcache/reset_l
add wave -noupdate -format Literal -height 15 -radix hexadecimal /memory/dcache/datain
add wave -noupdate -format Logic -height 15 -radix hexadecimal /memory/dcache/mresp_h
add wave -noupdate -format Literal -height 15 -radix hexadecimal /memory/dcache/pmaddress
add wave -noupdate -format Literal -height 15 -radix hexadecimal /memory/dcache/pmdataout
add wave -noupdate -format Logic -height 15 -radix hexadecimal /memory/dcache/pmread_l
add wave -noupdate -format Logic -height 15 -radix hexadecimal /memory/dcache/pmwrite_l
add wave -noupdate -format Logic -height 15 -radix hexadecimal /memory/dcache/evict_buffer_valid
add wave -noupdate -format Logic -height 15 -radix hexadecimal /memory/dcache/in_idlehit
add wave -noupdate -format Logic -height 15 -radix hexadecimal /memory/dcache/in_load
add wave -noupdate -format Logic -height 15 -radix hexadecimal /memory/dcache/in_writeback
add wave -noupdate -format Logic -height 15 -radix hexadecimal /memory/dcache/miss
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {221 ns} 0}
configure wave -namecolwidth 211
configure wave -valuecolwidth 50
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
WaveRestoreZoom {0 ns} {977 ns}
