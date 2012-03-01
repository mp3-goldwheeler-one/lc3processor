--
-- VHDL Architecture ece411.ADJ9.untitled
--
-- Created:
--          by - goldste6.UNKNOWN (linux4.ews.illinois.edu)
--          at - 20:38:28 01/18/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ADJ9 IS
   PORT( 
      clk     : IN     std_logic;
      offset9 : IN     std_logic_vector (8 DOWNTO 0);
      ADJ9out : OUT    LC3b_word
   );

-- Declarations

END ADJ9 ;

--
ARCHITECTURE UNTITLED OF ADJ9 IS
BEGIN
	ADJ9OUT <= std_logic_vector(resize(signed(offset9 & '0'), 16)) AFTER DELAY_MUX2;
END UNTITLED;
