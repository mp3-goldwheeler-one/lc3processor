--
-- VHDL Architecture ece411.Timer.untitled
--
-- Created:
--          by - goldste6.ews (linux1.ews.illinois.edu)
--          at - 16:42:33 02/16/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Timer IS
   PORT( 
      CLK       : IN     std_logic;
      LRUgate   : OUT    STD_LOGIC;
      writegate : OUT    std_logic
   );

-- Declarations

END Timer ;

--
ARCHITECTURE untitled OF Timer IS
BEGIN
  Writegate <= (clk'delayed(44ns)) and clk'delayed(24ns);
  LRUgate <= (clk'delayed(33ns)) and clk'delayed(24ns);
END ARCHITECTURE untitled;

