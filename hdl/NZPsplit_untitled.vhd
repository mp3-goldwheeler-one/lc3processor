--
-- VHDL Architecture ece411.NZPsplit.untitled
--
-- Created:
--          by - goldste6.UNKNOWN (linux4.ews.illinois.edu)
--          at - 20:32:24 01/18/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY NZPsplit IS
   PORT( 
      clk    : IN     std_logic;
      CheckN : OUT    std_logic;
      CheckP : OUT    std_logic;
      CheckZ : OUT    std_logic;
      dest   : IN    std_logic_vector (2 DOWNTO 0)
   );

-- Declarations

END NZPsplit ;

--
ARCHITECTURE UNTITLED OF NZPSPLIT IS
BEGIN
	CHECKN <= DEST(2);
	CHECKZ <= DEST(1);
	CHECKP <= DEST(0);
END UNTITLED;
