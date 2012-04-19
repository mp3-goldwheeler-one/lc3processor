--
-- VHDL Architecture ece411.init_fix.untitled
--
-- Created:
--          by - goldste6.ews (linux5.ews.illinois.edu)
--          at - 17:21:32 04/18/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY init_fix IS
   PORT( 
      CLK        : IN     std_logic;
      init_stall : OUT    STD_LOGIC
   );

-- Declarations

END init_fix ;

--
ARCHITECTURE untitled OF init_fix IS
BEGIN
  init_stall <= '0', '1' after 25 ns;
END ARCHITECTURE untitled;

