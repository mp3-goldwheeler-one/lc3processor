--
-- VHDL Architecture ece411.AdjTrapVec.untitled
--
-- Created:
--          by - goldste6.UNKNOWN (linux2.ews.illinois.edu)
--          at - 21:30:34 01/31/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY AdjTrapVec IS
   PORT( 
      TrapAddr : OUT    LC3b_word;
      trapvec8 : IN     LC3b_trapvect8;
      clk      : IN     std_logic
   );

-- Declarations

END AdjTrapVec ;

--
ARCHITECTURE untitled OF AdjTrapVec IS
BEGIN
  TrapAddr <= std_logic_vector(resize(unsigned(trapvec8 & '0'), 16));
END ARCHITECTURE untitled;

