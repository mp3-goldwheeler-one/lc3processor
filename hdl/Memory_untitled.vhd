--
-- VHDL Architecture ece411.Memory.untitled
--
-- Created:
--          by - goldste6.UNKNOWN (linux4.ews.illinois.edu)
--          at - 20:21:18 01/18/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Memory IS
   PORT( 
      CLK              : IN     std_logic;
      RESET_L          : IN     STD_LOGIC;
      data_mread_l     : IN     std_logic;
      data_mwrite_l    : IN     STD_LOGIC;
      data_pm_addr     : IN     LC3B_WORD;
      data_pm_dataout  : IN     LC3B_OWORD;
      instr_mread_l    : IN     std_logic;
      instr_mwrite_l   : IN     STD_LOGIC;
      instr_pm_addr    : IN     LC3b_word;
      instr_pm_dataout : IN     lc3b_oword;
      data_in          : OUT    LC3B_OWORD;
      data_resp_h      : OUT    std_logic;
      instr_in         : OUT    LC3B_OWORD;
      instr_resp_h     : OUT    std_logic
   );

-- Declarations

END Memory ;
