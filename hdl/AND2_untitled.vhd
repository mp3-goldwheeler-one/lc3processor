--
-- VHDL Architecture ece411.AND2.untitled
--
-- Created:
--          by - goldste6.UNKNOWN (linux1.ews.illinois.edu)
--          at - 00:15:52 02/08/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY AND2 IS
   PORT( 
      A : IN     std_logic;
      B : IN     std_logic;
      Y : OUT    std_logic
   );

-- Declarations

END AND2 ;

--
ARCHITECTURE untitled OF AND2 IS
BEGIN
  Y <= A and B after DELAY_LOGIC2;
END ARCHITECTURE untitled;

