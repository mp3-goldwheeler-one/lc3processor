--
-- VHDL Architecture ece411.SEXT9.untitled
--
-- Created:
--          by - wheele11.ews (gelib-057-06.ews.illinois.edu)
--          at - 20:44:12 03/09/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY SEXT9 IS
   PORT( 
      in9    : IN     std_logic_vector (8 DOWNTO 0);
      output : OUT    std_logic_vector (15 DOWNTO 0)
   );

-- Declarations

END SEXT9 ;
