--
-- VHDL Architecture ece411.Recombiner1.untitled
--
-- Created:
--          by - one1.ews (gelib-057-34.ews.illinois.edu)
--          at - 20:16:05 04/25/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ORecombiner IS
   PORT( 
      OWord0Out : IN     LC3b_word;
      OWord1Out : IN     LC3b_word;
      PWordOut  : OUT    LC3b_pword
   );

-- Declarations

END ORecombiner ;

--
ARCHITECTURE untitled OF ORecombiner IS
BEGIN
  PWordOut <= OWord1Out & OWord0Out;
END ARCHITECTURE untitled;

