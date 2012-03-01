--
-- VHDL Architecture ece411.LDBZextByte.untitled
--
-- Created:
--          by - goldste6.UNKNOWN (evrt-252-16.ews.illinois.edu)
--          at - 15:33:59 02/01/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY LDBLowByte IS
   PORT( 
      MDRout    : IN     LC3b_word;
      clk       : IN     std_logic;
      ZextLByte : OUT    LC3b_word
   );

-- Declarations

END LDBLowByte ;

--
ARCHITECTURE untitled OF LDBLowByte IS
BEGIN
  ZextLByte <= x"00" & MDRout(7 downto 0);
END ARCHITECTURE untitled;

