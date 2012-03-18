echo "--- Executing initialization force file to test read hits ---"

echo "Resetting processor for 5 ns."
force /reset_l 0 @0
force /reset_l 1 @5

force /data_mread_l 1 @0
force /data_mwriteh_l 1 @0
force /data_mwritel_l 1 @0

force /clk 1 @0, 0 @25 -r 50

echo "Done initializing processor, loading data into Cache"

run 20

change /memory/PDRAM/VHDL_MEMORY/Mem(4000) x"12"
change /memory/PDRAM/VHDL_MEMORY/Mem(4001) x"34"
change /memory/PDRAM/VHDL_MEMORY/Mem(4002) x"56"
change /memory/PDRAM/VHDL_MEMORY/Mem(4003) x"78"
change /memory/PDRAM/VHDL_MEMORY/Mem(4004) x"90"
change /memory/PDRAM/VHDL_MEMORY/Mem(4005) x"AB"
change /memory/PDRAM/VHDL_MEMORY/Mem(4006) x"CD"
change /memory/PDRAM/VHDL_MEMORY/Mem(4007) x"EF"
change /memory/PDRAM/VHDL_MEMORY/Mem(4008) x"12"
change /memory/PDRAM/VHDL_MEMORY/Mem(4009) x"34"
change /memory/PDRAM/VHDL_MEMORY/Mem(4010) x"56"
change /memory/PDRAM/VHDL_MEMORY/Mem(4011) x"78"
change /memory/PDRAM/VHDL_MEMORY/Mem(4012) x"90"
change /memory/PDRAM/VHDL_MEMORY/Mem(4013) x"AB"
change /memory/PDRAM/VHDL_MEMORY/Mem(4014) x"CD"
change /memory/PDRAM/VHDL_MEMORY/Mem(4015) x"EF"


change /memory/PDRAM/VHDL_MEMORY/Mem(3872) x"11"
change /memory/PDRAM/VHDL_MEMORY/Mem(3873) x"22"
change /memory/PDRAM/VHDL_MEMORY/Mem(3874) x"33"
change /memory/PDRAM/VHDL_MEMORY/Mem(3875) x"44"
change /memory/PDRAM/VHDL_MEMORY/Mem(3876) x"55"
change /memory/PDRAM/VHDL_MEMORY/Mem(3877) x"66"
change /memory/PDRAM/VHDL_MEMORY/Mem(3878) x"77"
change /memory/PDRAM/VHDL_MEMORY/Mem(3879) x"88"
change /memory/PDRAM/VHDL_MEMORY/Mem(3880) x"99"
change /memory/PDRAM/VHDL_MEMORY/Mem(3881) x"00"
change /memory/PDRAM/VHDL_MEMORY/Mem(3882) x"AA"
change /memory/PDRAM/VHDL_MEMORY/Mem(3883) x"BB"
change /memory/PDRAM/VHDL_MEMORY/Mem(3884) x"CC"
change /memory/PDRAM/VHDL_MEMORY/Mem(3885) x"DD"
change /memory/PDRAM/VHDL_MEMORY/Mem(3886) x"EE"
change /memory/PDRAM/VHDL_MEMORY/Mem(3887) x"FF"

change /memory/PDRAM/VHDL_MEMORY/Mem(3616) x"AA"
change /memory/PDRAM/VHDL_MEMORY/Mem(3617) x"BB"
change /memory/PDRAM/VHDL_MEMORY/Mem(3618) x"CC"
change /memory/PDRAM/VHDL_MEMORY/Mem(3619) x"DD"
change /memory/PDRAM/VHDL_MEMORY/Mem(3620) x"EE"
change /memory/PDRAM/VHDL_MEMORY/Mem(3621) x"FF"
change /memory/PDRAM/VHDL_MEMORY/Mem(3622) x"99"
change /memory/PDRAM/VHDL_MEMORY/Mem(3623) x"88"
change /memory/PDRAM/VHDL_MEMORY/Mem(3624) x"77"
change /memory/PDRAM/VHDL_MEMORY/Mem(3625) x"66"
change /memory/PDRAM/VHDL_MEMORY/Mem(3626) x"55"
change /memory/PDRAM/VHDL_MEMORY/Mem(3627) x"44"
change /memory/PDRAM/VHDL_MEMORY/Mem(3628) x"33"
change /memory/PDRAM/VHDL_MEMORY/Mem(3629) x"22"
change /memory/PDRAM/VHDL_MEMORY/Mem(3630) x"11"
change /memory/PDRAM/VHDL_MEMORY/Mem(3631) x"00"

-- read miss at time 50ns
force /data_addr x"0FA0" @55
force /data_mread_l 0 @56

--read hit at 800
force /data_addr "XXXXXXXXXXXXXXXX" @755, x"0FA0" @805
force /data_mread_l 1 @750, 0 @806

--read hit at 850
force /data_addr x"0FA2" @855
force /data_mread_l 0 @856, 1 @900

--write hit at 950
force /data_addr x"0FA0" @ 955
force /data_mwritel_l 0 @956, 1 @1000
force /data_mwriteh_l 0 @956, 1 @1000
force /dataout x"5678" @955
force /data_addr "XXXXXXXXXXXXXXXX" @ 1000

--read hit at 1050
force /data_addr  x"0FA0" @1055
force /data_mread_l 0 @1056, 1 @1100

--read miss at 1150
force /data_addr x"0F20" @1155
force /data_mread_l 0 @1156, 1 @1850

--read miss at 1900, force writeback
force /data_addr x"0E20" @1905
force /data_mread_l 0 @1906, 1 @ 2600

--read hit during writeback
force /data_addr x"0E22" @2605
force /data_mread_l 0 @2606, 1 @2650

--read miss at 2650, force read of what we just wrote to memory.
force /data_addr x"0FA0" @2655
force /data_mread_l 0 @2656, 1 @3900

run 3880
