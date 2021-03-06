--
-- VHDL Architecture ece411.Timer2.untitled
--
-- Created:
--          by - goldste6.ews (siebl-0224-29.ews.illinois.edu)
--          at - 21:56:58 04/16/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Timer2 IS
   PORT( 
      CLK       : IN     std_logic;
      LRUgate   : buffer STD_LOGIC;
      writegate : buffer std_logic
   );

-- Declarations

END Timer2 ;

--
ARCHITECTURE untitled OF Timer2 IS
BEGIN
  do_timer1 : process
  begin
    Writegate <= '0';
    wait for 14ns;
    Writegate <= '1';
    wait until clk = '1';
  end process;
  
  do_timer2 : process
  begin
    LRUgate <= '0';
    wait for 16ns;
    LRUgate <= '1';
    wait until clk = '1';
  end process;  
END ARCHITECTURE untitled;

