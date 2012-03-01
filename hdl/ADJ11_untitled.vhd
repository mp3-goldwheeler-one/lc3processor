--
-- VHDL Architecture ece411.ADJ11.untitled
--
-- Created:
--          by - goldste6.UNKNOWN (evrt-252-20.ews.illinois.edu)
--          at - 14:53:37 01/31/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ADJ11 IS
   PORT( 
      offset11 : IN     LC3b_offset11;
      ADJ11out : OUT    LC3b_word;
      CLK      : IN     std_logic
   );

-- Declarations

END ADJ11 ;

--
ARCHITECTURE untitled OF ADJ11 IS
BEGIN
  ADJ11out <= std_logic_vector(resize(signed(offset11 & '0'), 16)) after DELAY_MUX2;
END ARCHITECTURE untitled;

