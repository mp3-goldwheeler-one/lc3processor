--
-- VHDL Architecture ece411.Timer1.untitled
--
-- Created:
--          by - wheele11.ews (linux5.ews.illinois.edu)
--          at - 01:40:26 04/14/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY BTB_Timer IS
   PORT( 
      clk       : IN     std_logic;
      writegate : OUT    std_logic
   );

-- Declarations

END BTB_Timer ;

--
ARCHITECTURE untitled OF BTB_Timer IS
BEGIN
  Writegate <= (clk'delayed(46ns)) and clk'delayed(24ns);
END ARCHITECTURE untitled;

