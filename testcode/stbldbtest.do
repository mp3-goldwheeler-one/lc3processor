echo "--- Executing initialization force file for ../testcode/stbldbtest.asm ---"

echo "Resetting processor for 5 ns."
force /reset_l 0 @0
force /reset_l 1 @5
echo "Initializing the processor."
force /start_h 0 @0
force /start_h 1 @10

-- Test case: lowering start_h should not impact the function of the processor
force /start_h 0 @ 100

echo "Done initializing processor, loading ../testcode/stbldbtest.asm program code."
run 5
change /cpu/dram/pdram/vhdl_memory/mem(0) X"A2"
change /cpu/dram/pdram/vhdl_memory/mem(1) X"14"
change /cpu/dram/pdram/vhdl_memory/mem(2) X"E3"
change /cpu/dram/pdram/vhdl_memory/mem(3) X"16"
change /cpu/dram/pdram/vhdl_memory/mem(4) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(5) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(6) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(7) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(8) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(9) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(10) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(11) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(12) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(13) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(14) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(15) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(16) X"0B"
change /cpu/dram/pdram/vhdl_memory/mem(17) X"E0"
change /cpu/dram/pdram/vhdl_memory/mem(18) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(19) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(20) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(21) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(22) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(23) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(24) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(25) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(26) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(27) X"2C"
change /cpu/dram/pdram/vhdl_memory/mem(28) X"01"
change /cpu/dram/pdram/vhdl_memory/mem(29) X"2E"
change /cpu/dram/pdram/vhdl_memory/mem(30) X"02"
change /cpu/dram/pdram/vhdl_memory/mem(31) X"3C"
change /cpu/dram/pdram/vhdl_memory/mem(32) X"03"
change /cpu/dram/pdram/vhdl_memory/mem(33) X"3E"
change /cpu/dram/pdram/vhdl_memory/mem(34) X"EE"
change /cpu/dram/pdram/vhdl_memory/mem(35) X"0F"
change /cpu/dram/pdram/vhdl_memory/mem(36) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(37) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(38) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(39) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(40) X"0D"
change /cpu/dram/pdram/vhdl_memory/mem(41) X"60"
run 5
echo "Done loading ../testcode/stbldbtest.asm program code."
