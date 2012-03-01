--
-- VHDL Architecture ece411.SEXT6.untitled
--
-- Created:
--          by - goldste6.UNKNOWN (linux3.ews.illinois.edu)
--          at - 00:39:44 02/02/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY SEXT6 IS
   PORT( 
      clk      : IN     std_logic;
      index6   : IN     LC3b_index6;
      sextimm6 : OUT    LC3b_word
   );

-- Declarations

END SEXT6 ;

--
ARCHITECTURE untitled OF SEXT6 IS
BEGIN
  sextimm6 <= std_logic_vector(resize(signed(index6), 16)) after Delay_Mux2;
END ARCHITECTURE untitled;

