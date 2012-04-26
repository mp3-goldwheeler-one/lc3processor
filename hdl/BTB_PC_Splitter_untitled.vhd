--
-- VHDL Architecture ece411.BTB_PC_Splitter.untitled
--
-- Created:
--          by - wheele11.ews (linux5.ews.illinois.edu)
--          at - 01:37:19 04/14/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY BTB_PC_Splitter IS
   PORT( 
      Address : IN     LC3b_word;
      Tag     : OUT    std_logic_vector (11 DOWNTO 0);
      Index   : OUT    std_logic_vector (2 DOWNTO 0)
   );

-- Declarations

END BTB_PC_Splitter ;

--
ARCHITECTURE untitled OF BTB_PC_Splitter IS
BEGIN
  Tag <= Address(15 downto 4);
  Index <= Address(3 downto 1);
END ARCHITECTURE untitled;

