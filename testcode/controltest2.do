echo "--- Executing initialization force file for ../testcode/controltest2.asm ---"

echo "Resetting processor for 5 ns."
force /reset_l 0 @0
force /reset_l 1 @5
echo "Initializing the processor."
force /start_h 0 @0
force /start_h 1 @10

-- Test case: lowering start_h should not impact the function of the processor
force /start_h 0 @ 100

echo "Done initializing processor, loading ../testcode/controltest2.asm program code."
run 5
change /cpu/dram/phys_mem/vhdl_memory/mem(0) X"7F"
change /cpu/dram/phys_mem/vhdl_memory/mem(1) X"12"
change /cpu/dram/phys_mem/vhdl_memory/mem(2) X"02"
change /cpu/dram/phys_mem/vhdl_memory/mem(3) X"08"
change /cpu/dram/phys_mem/vhdl_memory/mem(4) X"19"
change /cpu/dram/phys_mem/vhdl_memory/mem(5) X"6E"
change /cpu/dram/phys_mem/vhdl_memory/mem(6) X"00"
change /cpu/dram/phys_mem/vhdl_memory/mem(7) X"00"
change /cpu/dram/phys_mem/vhdl_memory/mem(8) X"FD"
change /cpu/dram/phys_mem/vhdl_memory/mem(9) X"03"
change /cpu/dram/phys_mem/vhdl_memory/mem(10) X"62"
change /cpu/dram/phys_mem/vhdl_memory/mem(11) X"12"
change /cpu/dram/phys_mem/vhdl_memory/mem(12) X"03"
change /cpu/dram/phys_mem/vhdl_memory/mem(13) X"02"
change /cpu/dram/phys_mem/vhdl_memory/mem(14) X"19"
change /cpu/dram/phys_mem/vhdl_memory/mem(15) X"6E"
change /cpu/dram/phys_mem/vhdl_memory/mem(16) X"00"
change /cpu/dram/phys_mem/vhdl_memory/mem(17) X"00"
change /cpu/dram/phys_mem/vhdl_memory/mem(18) X"2A"
change /cpu/dram/phys_mem/vhdl_memory/mem(19) X"00"
change /cpu/dram/phys_mem/vhdl_memory/mem(20) X"1A"
change /cpu/dram/phys_mem/vhdl_memory/mem(21) X"66"
change /cpu/dram/phys_mem/vhdl_memory/mem(22) X"01"
change /cpu/dram/phys_mem/vhdl_memory/mem(23) X"08"
change /cpu/dram/phys_mem/vhdl_memory/mem(24) X"19"
change /cpu/dram/phys_mem/vhdl_memory/mem(25) X"6E"
change /cpu/dram/phys_mem/vhdl_memory/mem(26) X"03"
change /cpu/dram/phys_mem/vhdl_memory/mem(27) X"48"
change /cpu/dram/phys_mem/vhdl_memory/mem(28) X"A5"
change /cpu/dram/phys_mem/vhdl_memory/mem(29) X"1D"
change /cpu/dram/phys_mem/vhdl_memory/mem(30) X"09"
change /cpu/dram/phys_mem/vhdl_memory/mem(31) X"F0"
change /cpu/dram/phys_mem/vhdl_memory/mem(32) X"07"
change /cpu/dram/phys_mem/vhdl_memory/mem(33) X"0E"
change /cpu/dram/phys_mem/vhdl_memory/mem(34) X"A4"
change /cpu/dram/phys_mem/vhdl_memory/mem(35) X"1D"
change /cpu/dram/phys_mem/vhdl_memory/mem(36) X"C0"
change /cpu/dram/phys_mem/vhdl_memory/mem(37) X"C1"
change /cpu/dram/phys_mem/vhdl_memory/mem(38) X"19"
change /cpu/dram/phys_mem/vhdl_memory/mem(39) X"6E"
change /cpu/dram/phys_mem/vhdl_memory/mem(40) X"00"
change /cpu/dram/phys_mem/vhdl_memory/mem(41) X"00"
change /cpu/dram/phys_mem/vhdl_memory/mem(42) X"63"
change /cpu/dram/phys_mem/vhdl_memory/mem(43) X"1B"
change /cpu/dram/phys_mem/vhdl_memory/mem(44) X"C0"
change /cpu/dram/phys_mem/vhdl_memory/mem(45) X"C1"
change /cpu/dram/phys_mem/vhdl_memory/mem(46) X"00"
change /cpu/dram/phys_mem/vhdl_memory/mem(47) X"00"
change /cpu/dram/phys_mem/vhdl_memory/mem(48) X"FF"
change /cpu/dram/phys_mem/vhdl_memory/mem(49) X"0F"
change /cpu/dram/phys_mem/vhdl_memory/mem(50) X"AD"
change /cpu/dram/phys_mem/vhdl_memory/mem(51) X"0B"
change /cpu/dram/phys_mem/vhdl_memory/mem(52) X"FE"
change /cpu/dram/phys_mem/vhdl_memory/mem(53) X"FF"
run 5
echo "Done loading ../testcode/controltest2.asm program code."
