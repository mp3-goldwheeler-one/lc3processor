--
-- VHDL Architecture ece411.DelayedOne.untitled
--
-- Created:
--          by - goldste6.ews (linux6.ews.illinois.edu)
--          at - 22:06:42 04/13/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY DelayedOne IS
-- Declarations
  Port (
    output : out std_logic
  );
END DelayedOne ;

--
ARCHITECTURE untitled OF DelayedOne IS
BEGIN
  output <= '0', '1' after DELAY_256B_MEM;
END ARCHITECTURE untitled;

