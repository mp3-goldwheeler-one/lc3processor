--
-- VHDL Architecture ece411.LDBHighByte.untitled
--
-- Created:
--          by - goldste6.UNKNOWN (linux3.ews.illinois.edu)
--          at - 01:22:49 02/02/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY LDBHighByte IS
   PORT( 
      MDRout    : IN     LC3b_word;
      clk       : IN     std_logic;
      ZextHByte : OUT    LC3b_word
   );

-- Declarations

END LDBHighByte ;

--
ARCHITECTURE untitled OF LDBHighByte IS
BEGIN
  ZextHByte <= x"00" & MDRout(15 downto 8);
END ARCHITECTURE untitled;

