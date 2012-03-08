echo "--- Executing initialization force file for ../testcode/mp1test.asm ---"

echo "Resetting processor for 5 ns."
force /reset_l 0 @0
force /reset_l 1 @5
echo "Initializing the processor."
force /start_h 0 @0
force /start_h 1 @10

-- Test case: lowering start_h should not impact the function of the processor
force /start_h 0 @ 100

echo "Done initializing processor, loading ../testcode/mp1test.asm program code."
run 5
change /cpu/dram/pdram/vhdl_memory/mem(0) X"11"
change /cpu/dram/pdram/vhdl_memory/mem(1) X"62"
change /cpu/dram/pdram/vhdl_memory/mem(2) X"12"
change /cpu/dram/pdram/vhdl_memory/mem(3) X"64"
change /cpu/dram/pdram/vhdl_memory/mem(4) X"13"
change /cpu/dram/pdram/vhdl_memory/mem(5) X"66"
change /cpu/dram/pdram/vhdl_memory/mem(6) X"C2"
change /cpu/dram/pdram/vhdl_memory/mem(7) X"18"
change /cpu/dram/pdram/vhdl_memory/mem(8) X"C3"
change /cpu/dram/pdram/vhdl_memory/mem(9) X"16"
change /cpu/dram/pdram/vhdl_memory/mem(10) X"BF"
change /cpu/dram/pdram/vhdl_memory/mem(11) X"9A"
change /cpu/dram/pdram/vhdl_memory/mem(12) X"41"
change /cpu/dram/pdram/vhdl_memory/mem(13) X"1B"
change /cpu/dram/pdram/vhdl_memory/mem(14) X"05"
change /cpu/dram/pdram/vhdl_memory/mem(15) X"19"
change /cpu/dram/pdram/vhdl_memory/mem(16) X"FB"
change /cpu/dram/pdram/vhdl_memory/mem(17) X"07"
change /cpu/dram/pdram/vhdl_memory/mem(18) X"C4"
change /cpu/dram/pdram/vhdl_memory/mem(19) X"5E"
change /cpu/dram/pdram/vhdl_memory/mem(20) X"14"
change /cpu/dram/pdram/vhdl_memory/mem(21) X"7E"
change /cpu/dram/pdram/vhdl_memory/mem(22) X"14"
change /cpu/dram/pdram/vhdl_memory/mem(23) X"62"
change /cpu/dram/pdram/vhdl_memory/mem(24) X"FF"
change /cpu/dram/pdram/vhdl_memory/mem(25) X"91"
change /cpu/dram/pdram/vhdl_memory/mem(26) X"40"
change /cpu/dram/pdram/vhdl_memory/mem(27) X"50"
change /cpu/dram/pdram/vhdl_memory/mem(28) X"14"
change /cpu/dram/pdram/vhdl_memory/mem(29) X"70"
change /cpu/dram/pdram/vhdl_memory/mem(30) X"15"
change /cpu/dram/pdram/vhdl_memory/mem(31) X"62"
change /cpu/dram/pdram/vhdl_memory/mem(32) X"FF"
change /cpu/dram/pdram/vhdl_memory/mem(33) X"0F"
change /cpu/dram/pdram/vhdl_memory/mem(34) X"01"
change /cpu/dram/pdram/vhdl_memory/mem(35) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(36) X"02"
change /cpu/dram/pdram/vhdl_memory/mem(37) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(38) X"08"
change /cpu/dram/pdram/vhdl_memory/mem(39) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(40) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(41) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(42) X"0D"
change /cpu/dram/pdram/vhdl_memory/mem(43) X"60"
run 5
echo "Done loading ../testcode/mp1test.asm program code."
