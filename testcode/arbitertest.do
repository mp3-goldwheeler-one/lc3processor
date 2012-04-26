
force /Cache_Arbiter/clk 1 @0, 0 @25 -r 50
force /Cache_Arbiter/reset_l 0 @0, 1 @15

force /Cache_Arbiter/d_pmread_l 1 @0
force /Cache_Arbiter/d_pmwrite_l 1 @0
force /Cache_Arbiter/i_pmread_l 1 @0
force /Cache_Arbiter/i_pmwrite_l 1 @0
force /Cache_Arbiter/fixed_pmresp_h 0 @0

force /Cache_Arbiter/d_pmread_l 0 @50, 1 @600
force /Cache_Arbiter/fixed_pmresp_h 1 @550, 0 @600, 1 @1150, 0 @1200

force /Cache_Arbiter/d_pmread_l 0 @650, 1 @1200
force /Cache_Arbiter/i_pmread_l 0 @650

