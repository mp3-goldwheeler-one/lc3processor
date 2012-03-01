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
      ADDRESS   : IN     LC3b_word;
      CLK       : IN     std_logic;
      DATAOUT   : IN     LC3b_word;
      MREAD_L   : IN     std_logic;
      MWRITEH_L : IN     std_logic;
      MWRITEL_L : IN     std_logic;
      RESET_L   : IN     std_logic;
      DATAIN    : OUT    LC3b_word;
      MRESP_H   : OUT    std_logic
   );

-- Declarations

END Memory ;
