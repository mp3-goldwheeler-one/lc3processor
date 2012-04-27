--
-- VHDL Architecture ece411.Splitter_L2.untitled
--
-- Created:
--          by - one1.ews (gelib-057-34.ews.illinois.edu)
--          at - 20:08:08 04/25/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Splitter_L2 IS
   PORT( 
      Address : IN     LC3b_word;
      Index   : OUT    lc3b_l2_c_index;
      Offset  : OUT    LC3b_L2_C_Offset;
      Tag     : OUT    lc3b_l2_c_tag
   );

-- Declarations

END Splitter_L2 ;

--
ARCHITECTURE untitled OF Splitter_L2 IS
BEGIN
  Tag    <= Address(15 downto 8);
  Index  <= Address(7 downto 5);
  Offset <= Address(4); 
END ARCHITECTURE untitled;

