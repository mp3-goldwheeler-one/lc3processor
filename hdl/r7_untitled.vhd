--
-- VHDL Architecture ece411.r7.untitled
--
-- Created:
--          by - goldste6.UNKNOWN (evrt-252-20.ews.illinois.edu)
--          at - 15:10:12 01/31/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY r7 IS
   PORT( 
      clk  : IN     std_logic;
      s111 : OUT    std_logic_vector (2 DOWNTO 0)
   );

-- Declarations

END r7 ;

--
ARCHITECTURE untitled OF r7 IS
BEGIN
  s111 <= "111";
END ARCHITECTURE untitled;

