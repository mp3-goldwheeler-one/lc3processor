--
-- VHDL Architecture ece411.WordSelector.untitled
--
-- Created:
--          by - goldste6.UNKNOWN (linux3.ews.illinois.edu)
--          at - 20:14:43 02/07/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY WordSelector IS
   PORT( 
      Input  : IN     LC3b_oword;
      Index  : IN     std_logic_vector(2 downto 0);
      Output : OUT    LC3b_word
   );

-- Declarations

END WordSelector ;
