--
-- VHDL Architecture ece411.NAND3.untitled
--
-- Created:
--          by - goldste6.UNKNOWN (linux1.ews.illinois.edu)
--          at - 23:53:03 02/07/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY NAND3 IS
   PORT( 
      A : IN     std_logic;
      B : IN     std_logic;
      C : IN     std_logic;
      Y : OUT    std_logic
   );

-- Declarations

END NAND3 ;

--
ARCHITECTURE untitled OF NAND3 IS
BEGIN
  Y <= not (A and B and C) after DELAY_LOGIC3;
END ARCHITECTURE untitled;

