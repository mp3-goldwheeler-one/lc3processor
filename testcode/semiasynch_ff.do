
force /semiasynch_ff/clk 0 @0, 1 @25 -r 50

force /semiasynch_ff/asynch_set_l 0 @0, 1 @5
force /semiasynch_ff/synch_set 0 @0
force /semiasynch_ff/asynch_reset_l 1 @0


force /semiasynch_ff/synch_set 1 @30, 0 @80
force /semiasynch_ff/asynch_reset_l 0 @85, 1 @90

force /semiasynch_ff/synch_set 1 @95, 0 @130
force /semiasynch_ff/asynch_reset_l 0 @160, 1 @165

force /semiasynch_ff/asynch_set_l 0 @170, 1 @175