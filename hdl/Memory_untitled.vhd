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
      CLK             : IN     std_logic;
      Dataout         : IN     LC3b_word;
      RESET_L         : IN     STD_LOGIC;
      data_addr       : IN     LC3b_word;
      data_mread_l    : IN     std_logic;
      data_mwriteh_l  : IN     std_logic;
      data_mwritel_l  : IN     std_logic;
      instr_addr      : IN     LC3b_word;
      instr_mread_l   : IN     std_logic;
      instr_mwriteh_l : IN     std_logic;
      instr_mwritel_l : IN     std_logic;
      instr_out       : IN     std_logic;
      DATAIN          : OUT    std_logic;
      data_resp_h     : OUT    std_logic;
      instr_in        : OUT    LC3B_WORD;
      instr_resp_h    : OUT    std_logic
   );

-- Declarations

END Memory ;
