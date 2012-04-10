echo "--- Executing initialization force file for ../testcode/jsrtest.asm ---"

echo "Resetting processor for 5 ns."
force /reset_l 0 @0
force /reset_l 1 @5
echo "Initializing the processor."
force /start_h 0 @0
force /start_h 1 @10

-- Test case: lowering start_h should not impact the function of the processor
force /start_h 0 @ 100

echo "Done initializing processor, loading ../testcode/jsrtest.asm program code."
run 5
change /cpu/dram/pdram/vhdl_memory/mem(0) X"2C"
change /cpu/dram/pdram/vhdl_memory/mem(1) X"19"
change /cpu/dram/pdram/vhdl_memory/mem(2) X"11"
change /cpu/dram/pdram/vhdl_memory/mem(3) X"0E"
change /cpu/dram/pdram/vhdl_memory/mem(4) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(5) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(6) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(7) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(8) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(9) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(10) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(11) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(12) X"E3"
change /cpu/dram/pdram/vhdl_memory/mem(13) X"16"
change /cpu/dram/pdram/vhdl_memory/mem(14) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(15) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(16) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(17) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(18) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(19) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(20) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(21) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(22) X"C0"
change /cpu/dram/pdram/vhdl_memory/mem(23) X"C1"
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
change /cpu/dram/pdram/vhdl_memory/mem(34) X"A1"
change /cpu/dram/pdram/vhdl_memory/mem(35) X"1D"
change /cpu/dram/pdram/vhdl_memory/mem(36) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(37) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(38) X"62"
change /cpu/dram/pdram/vhdl_memory/mem(39) X"12"
change /cpu/dram/pdram/vhdl_memory/mem(40) X"BD"
change /cpu/dram/pdram/vhdl_memory/mem(41) X"14"
change /cpu/dram/pdram/vhdl_memory/mem(42) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(43) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(44) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(45) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(46) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(47) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(48) X"ED"
change /cpu/dram/pdram/vhdl_memory/mem(49) X"EB"
change /cpu/dram/pdram/vhdl_memory/mem(50) X"40"
change /cpu/dram/pdram/vhdl_memory/mem(51) X"41"
change /cpu/dram/pdram/vhdl_memory/mem(52) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(53) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(54) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(55) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(56) X"F6"
change /cpu/dram/pdram/vhdl_memory/mem(57) X"0F"
change /cpu/dram/pdram/vhdl_memory/mem(58) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(59) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(60) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(61) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(62) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(63) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(64) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(65) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(66) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(67) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(68) X"46"
change /cpu/dram/pdram/vhdl_memory/mem(69) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(70) X"0D"
change /cpu/dram/pdram/vhdl_memory/mem(71) X"60"
change /cpu/dram/pdram/vhdl_memory/mem(72) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(73) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(74) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(75) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(76) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(77) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(78) X"00"
change /cpu/dram/pdram/vhdl_memory/mem(79) X"00"
run 5
echo "Done loading ../testcode/jsrtest.asm program code."
