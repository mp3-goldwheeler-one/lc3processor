--
-- VHDL Architecture ece411.Timer_L2.untitled
--
-- Created:
--          by - one1.ews (gelib-057-34.ews.illinois.edu)
--          at - 00:02:36 04/26/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY TimerL2_2 IS
   PORT( 
      clk          : IN     std_logic;
      lruwritegate : OUT    std_logic
   );

-- Declarations

END TimerL2_2 ;

--
ARCHITECTURE untitled OF TimerL2_2 IS
BEGIN
  --do_LRUGate : process
  --begin
  --  LRUGate <= '0';
  --  wait until mem_access = '1';
  --  wait until rising_edge(clk);
  --  wait for 65 ns;
  --  LRUGate <= '1';
  --  wait until rising_edge(clk);
  --end process;

  do_writegate : process
  begin
    lruwritegate <= '0';
    wait for HALF_CLOCK_PERIOD;
    lruwritegate <= '1';
    wait for HALF_CLOCK_PERIOD;
  end process;

  --do_missgate : process
  --begin
  -- missgate <= '0';
  -- wait until mem_access = '1';
  -- wait until rising_edge(clk);
  -- wait for 65ns;
  -- missgate <= '1';
  -- wait until rising_edge(clk);
  --end process;
END ARCHITECTURE untitled;

