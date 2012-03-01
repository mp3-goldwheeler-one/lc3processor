--
-- VHDL Architecture ece411.OWordSplitter.untitled
--
-- Created:
--          by - goldste6.UNKNOWN (evrt-252-04.ews.illinois.edu)
--          at - 14:42:51 02/08/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY OWordSplitter IS
   PORT( 
      OWordIn : IN     LC3b_oword;
      word0   : OUT    LC3b_word;
      word1   : OUT    LC3b_word;
      word2   : OUT    LC3b_word;
      word3   : OUT    LC3b_word;
      word4   : OUT    LC3b_word;
      word5   : OUT    LC3b_word;
      word6   : OUT    LC3b_word;
      word7   : OUT    LC3b_word
   );

-- Declarations

END OWordSplitter ;

--
ARCHITECTURE untitled OF OWordSplitter IS
BEGIN
  word0 <= OWordIn(15 downto 0);
  word1 <= OWordIn(31 downto 16);
  word2 <= OWordIn(47 downto 32);
  word3 <= OWordIn(63 downto 48);
  word4 <= OWordIn(79 downto 64);
  word5 <= OWordIn(95 downto 80);
  word6 <= OWordIn(111 downto 96);
  word7 <= OWordIn(127 downto 112);
END ARCHITECTURE untitled;

