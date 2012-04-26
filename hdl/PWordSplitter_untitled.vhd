--
-- VHDL Architecture ece411.PWordSplitter.untitled
--
-- Created:
--          by - one1.ews (gelib-057-34.ews.illinois.edu)
--          at - 19:53:45 04/25/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY PWordSplitter IS
   PORT( 
      PWordIn : IN     LC3b_oword;
      oword0  : OUT    LC3b_oword;
      oword1  : OUT    LC3b_oword
   );

-- Declarations

END PWordSplitter ;

--
ARCHITECTURE untitled OF PWordSplitter IS
BEGIN
  oword0 <= PWordIn(255 downto 128);
  oword1 <= PWordIn(127 downto 0);
END ARCHITECTURE untitled;

