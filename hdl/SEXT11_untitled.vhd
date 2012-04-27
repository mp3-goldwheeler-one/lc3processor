--
-- VHDL Architecture ece411.SEXT11.untitled
--
-- Created:
--          by - wheele11.ews (gelib-057-06.ews.illinois.edu)
--          at - 20:48:31 03/09/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY SEXT11 IS
   PORT( 
      in11   : IN     std_logic_vector (10 DOWNTO 0);
      output : OUT    LC3b_word
   );

-- Declarations

END SEXT11 ;
