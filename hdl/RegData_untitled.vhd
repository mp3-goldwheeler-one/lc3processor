--
-- VHDL Architecture ece411.RegData.untitled
--
-- Created:
--          by - wheele11.ews (gelib-057-06.ews.illinois.edu)
--          at - 21:35:50 03/15/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY RegData IS
   PORT( 
   	   RESET_L : IN     STD_LOGIC;
	     A       : IN     pipe_data;
	     EN      : IN     STD_LOGIC;
	     CLK     : IN     STD_LOGIC;
	     F       : OUT    pipe_data
   );

-- Declarations

END RegData;

--
ARCHITECTURE untitled OF RegData IS
BEGIN
  REG1: PROCESS(CLK,RESET_L,A,EN)
  VARIABLE STATE : pipe_data;
  BEGIN
	  IF(RESET_L = '0') THEN
		  STATE := default_pipe_data;  -- DEFAULT VALUE
	  ELSIF(CLK = '1' AND CLK'EVENT AND EN = '1') THEN -- HIGH ENABLE
		  STATE := A;
	  ELSIF(EN /= '0' AND EN /= '1' AND CLK = '1' AND CLK'EVENT) THEN
		  STATE := default_pipe_data;
	  END IF;
	  F <= STATE AFTER DELAY_REG;
  END PROCESS REG1;
END ARCHITECTURE untitled;



