--
-- VHDL Architecture ece411.Splitter.untitled
--
-- Created:
--          by - goldste6.UNKNOWN (linux1.ews.illinois.edu)
--          at - 00:26:49 02/08/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Splitter IS
   PORT( 
      Address : IN     LC3b_word;
      Tag     : OUT    std_logic_vector (8 DOWNTO 0);
      Index   : OUT    lc3b_c_index;
      Offset  : OUT    std_logic_vector (2 DOWNTO 0)
   );

-- Declarations

END Splitter ;

--
ARCHITECTURE untitled OF Splitter IS
BEGIN
  Tag <= Address(15 downto 7);
  Index <= Address(6 downto 4);
  Offset <= Address(3 downto 1);
END ARCHITECTURE untitled;

