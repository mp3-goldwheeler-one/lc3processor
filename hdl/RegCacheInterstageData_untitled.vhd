--
-- VHDL Architecture ece411.RegCacheInterstageData.untitled
--
-- Created:
--          by - goldste6.ews (evrt-252-06.ews.illinois.edu)
--          at - 16:15:57 04/18/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY RegCacheInterstageData IS
   PORT( 
      RESET_L : IN     STD_LOGIC;
      A       : IN     LC3b_cache_interstage_data;
      EN      : IN     STD_LOGIC;
      CLK     : IN     std_logic;
      F       : OUT    LC3b_cache_interstage_data
   );

-- Declarations

END RegCacheInterstageData ;


ARCHITECTURE untitled OF RegCacheInterstageData IS
BEGIN
  REG1: PROCESS(CLK,RESET_L,A,EN)
  VARIABLE STATE : LC3b_cache_interstage_data;
  BEGIN
	  IF(RESET_L = '0') THEN
		  STATE := default_interstage_data;  -- DEFAULT VALUE
	  ELSIF(CLK = '1' AND CLK'EVENT AND EN = '1') THEN -- HIGH ENABLE
		  STATE := A;
	  ELSIF(EN /= '0' AND EN /= '1' AND CLK = '1' AND CLK'EVENT) THEN
		  STATE := default_interstage_data;
	  END IF;
	  F <= STATE AFTER DELAY_REG;
  END PROCESS REG1;
END ARCHITECTURE untitled;

