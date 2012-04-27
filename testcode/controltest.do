echo "--- Executing initialization force file for ../testcode/controltest.asm ---"

echo "Resetting processor for 5 ns."
force /reset_l 0 @0
force /reset_l 1 @5
echo "Initializing the processor."
force /start_h 0 @0
force /start_h 1 @10

-- Test case: lowering start_h should not impact the function of the processor
force /start_h 0 @ 100

echo "Done initializing processor, loading ../testcode/controltest.asm program code."
run 5
change /cpu/dram/phys_mem/vhdl_memory/mem(0) X"61"
change /cpu/dram/phys_mem/vhdl_memory/mem(1) X"12"
change /cpu/dram/phys_mem/vhdl_memory/mem(2) X"FE"
change /cpu/dram/phys_mem/vhdl_memory/mem(3) X"0F"
change /cpu/dram/phys_mem/vhdl_memory/mem(4) X"BF"
change /cpu/dram/phys_mem/vhdl_memory/mem(5) X"14"
change /cpu/dram/phys_mem/vhdl_memory/mem(6) X"FE"
change /cpu/dram/phys_mem/vhdl_memory/mem(7) X"16"
change /cpu/dram/phys_mem/vhdl_memory/mem(8) X"00"
change /cpu/dram/phys_mem/vhdl_memory/mem(9) X"00"
change /cpu/dram/phys_mem/vhdl_memory/mem(10) X"00"
change /cpu/dram/phys_mem/vhdl_memory/mem(11) X"00"
change /cpu/dram/phys_mem/vhdl_memory/mem(12) X"00"
change /cpu/dram/phys_mem/vhdl_memory/mem(13) X"00"
change /cpu/dram/phys_mem/vhdl_memory/mem(14) X"00"
change /cpu/dram/phys_mem/vhdl_memory/mem(15) X"00"
run 5
echo "Done loading ../testcode/controltest.asm program code."
