--
-- VHDL Architecture ece411.DelayRead.untitled
--
-- Created:
--          by - goldste6.ews (gelib-057-04.ews.illinois.edu)
--          at - 00:00:02 05/03/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY DelayRead IS
   PORT( 
      do_load_l : IN     STD_LOGIC;
      PMREAD_L  : OUT    STD_LOGIC
   );

-- Declarations

END DelayRead ;

--
ARCHITECTURE untitled OF DelayRead IS
BEGIN
  PMREAD_L <= do_load_l after 3ns;
END ARCHITECTURE untitled;

