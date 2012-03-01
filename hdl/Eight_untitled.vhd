--
-- VHDL Architecture ece411.Eight.untitled
--
-- Created:
--          by - goldste6.UNKNOWN (linux3.ews.illinois.edu)
--          at - 02:29:09 02/02/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Eight IS
   PORT( 
      clk   : IN     std_logic;
      s1000 : OUT    LC3b_word
   );

-- Declarations

END Eight ;

--
ARCHITECTURE untitled OF Eight IS
BEGIN
  s1000 <= x"0008";
END ARCHITECTURE untitled;

