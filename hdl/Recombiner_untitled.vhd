--
-- VHDL Architecture ece411.Recombiner.untitled
--
-- Created:
--          by - goldste6.UNKNOWN (evrt-252-04.ews.illinois.edu)
--          at - 14:45:40 02/08/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Recombiner IS
   PORT( 
      Word0Out : IN     LC3b_word;
      Word1Out : IN     LC3b_word;
      Word2Out : IN     LC3b_word;
      Word3Out : IN     LC3b_word;
      Word4Out : IN     LC3b_word;
      Word5Out : IN     LC3b_word;
      Word6Out : IN     LC3b_word;
      word7out : IN     LC3b_word;
      OWordOut : OUT    LC3b_oword
   );

-- Declarations

END Recombiner ;

--
ARCHITECTURE untitled OF Recombiner IS
BEGIN
  OWordOut <= word7out & word6out & word5out & word4out &
              word3out & word2out & word1out & word0out;
END ARCHITECTURE untitled;

