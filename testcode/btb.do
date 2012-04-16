echo "--- Executing initialization force file to test read hits ---"

echo "Resetting processor for 5 ns."
force /reset_l 0 @0
force /reset_l 1 @5

force /mread_l 1 @0
force /mwrite_l 1 @0

force /clk 1 @0, 0 @25 -r 50

echo "Done initializing processor, loading data into Cache"

run 20

force /address x"1234" @55
force /mread_l 0 @ 65, 1 @115

force /dataout.target x"89AB" @135
force /dataout.state  0 @135

force /mwrite_l 0 @140, 1 @185

force /address x"5674" @215
force /dataout.target x"4567" @215
force /dataout.state  1 @215

force /mread_l 0 @240, 1 @285
force /mwrite_l 0 @290, 1 @335

run 500
