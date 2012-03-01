--
-- VHDL Architecture ece411.BRadd.untitled
--
-- Created:
--          by - goldste6.UNKNOWN (linux4.ews.illinois.edu)
--          at - 21:02:09 01/18/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY adder IS
   PORT( 
      A        : IN     LC3b_word;
      B        : IN     LC3b_word;
      S        : OUT    LC3b_word
   );

-- Declarations

END adder ;

--
ARCHITECTURE untitled OF adder IS
BEGIN
  S <= std_logic_vector(signed(B) + signed(A)) after DELAY_ADDER;
END ARCHITECTURE untitled;

