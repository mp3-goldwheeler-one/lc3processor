--
-- VHDL Architecture ece411.NOT1.untitled
--
-- Created:
--          by - goldste6.UNKNOWN (linux1.ews.illinois.edu)
--          at - 00:12:37 02/08/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY NOT1 IS
   PORT( 
      A : IN     std_logic;
      Y : OUT    std_logic
   );

-- Declarations

END NOT1 ;

--
ARCHITECTURE untitled OF NOT1 IS
BEGIN
  Y <= not A after DELAY_LOGIC2;
END ARCHITECTURE untitled;

