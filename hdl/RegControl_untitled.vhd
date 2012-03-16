--
-- VHDL Architecture ece411.RegControl.untitled
--
-- Created:
--          by - wheele11.ews (gelib-057-06.ews.illinois.edu)
--          at - 21:22:49 03/15/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY RegControl IS
   PORT( 
   	   RESET_L : IN     STD_LOGIC;
	     A       : IN     control_word;
	     EN      : IN     STD_LOGIC;
	     CLK     : IN     STD_LOGIC;
	     F       : OUT    control_word
   );

-- Declarations

END RegControl;

--
ARCHITECTURE untitled OF RegControl IS
BEGIN
  REG1: PROCESS(CLK,RESET_L,A,EN)
  VARIABLE STATE : control_word;
  BEGIN
	  IF(RESET_L = '0') THEN
		  STATE := default_control_word;  -- DEFAULT VALUE
	  ELSIF(CLK = '1' AND CLK'EVENT AND EN = '1') THEN -- HIGH ENABLE
		  STATE := A;
	  ELSIF(EN /= '0' AND EN /= '1' AND CLK = '1' AND CLK'EVENT) THEN
		  STATE := default_control_word;
	  END IF;
	  F <= STATE AFTER DELAY_REG;
  END PROCESS REG1;
END ARCHITECTURE untitled;

