echo "--- Executing initialization force file for ../testcode/basictest.asm ---"

echo "Resetting processor for 5 ns."
force /reset_l 0 @0
force /reset_l 1 @5
echo "Initializing the processor."
force /start_h 0 @0
force /start_h 1 @10

-- Test case: lowering start_h should not impact the function of the processor
force /start_h 0 @ 100

echo "Done initializing processor, loading ../testcode/basictest.asm program code."
run 5
change /cpu/dram/pdram/vhdl_memory/mem(0) X"01"
change /cpu/dram/pdram/vhdl_memory/mem(1) X"10"
change /cpu/dram/pdram/vhdl_memory/mem(2) X"A5"
change /cpu/dram/pdram/vhdl_memory/mem(3) X"52"
change /cpu/dram/pdram/vhdl_memory/mem(4) X"05"
change /cpu/dram/pdram/vhdl_memory/mem(5) X"2C"
change /cpu/dram/pdram/vhdl_memory/mem(6) X"47"
change /cpu/dram/pdram/vhdl_memory/mem(7) X"58"
change /cpu/dram/pdram/vhdl_memory/mem(8) X"66"
change /cpu/dram/pdram/vhdl_memory/mem(9) X"10"
change /cpu/dram/pdram/vhdl_memory/mem(10) X"73"
change /cpu/dram/pdram/vhdl_memory/mem(11) X"D0"
change /cpu/dram/pdram/vhdl_memory/mem(12) X"05"
change /cpu/dram/pdram/vhdl_memory/mem(13) X"6C"
change /cpu/dram/pdram/vhdl_memory/mem(14) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(15) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(16) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(17) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(18) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(19) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(20) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(21) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(22) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(23) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(24) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(25) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(26) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(27) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(28) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(29) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(30) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(31) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(32) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(33) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(34) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(35) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(36) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(37) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(38) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(39) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(40) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(41) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(42) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(43) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(44) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(45) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(46) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(47) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(48) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(49) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(50) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(51) X"00"
run 5
echo "Done loading ../testcode/basictest.asm program code."
