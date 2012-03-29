--
-- VHDL Architecture ece411.NZP.untitled
--
-- Created:
--          by - goldste6.UNKNOWN (linux4.ews.illinois.edu)
--          at - 20:33:53 01/18/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY NZP IS
   PORT( 
      clk      : IN     std_logic;
      wb_cc    : IN     LC3b_cc;
      load_nzp : IN     std_logic;
      RESET_L  : IN     std_logic;
      n        : OUT    std_logic;
      p        : OUT    std_logic;
      z        : OUT    std_logic
   );

-- Declarations

END NZP ;

--
ARCHITECTURE UNTITLED OF NZP IS
  SIGNAL PRE_NZP : LC3b_cc;
BEGIN
	------------------------------
	VHDL_NZP : PROCESS (CLK, wb_cc, RESET_L)
	------------------------------
	BEGIN
	  IF (RESET_L = '0') THEN
	    PRE_NZP <= "010";
	  ELSIF (CLK'EVENT AND (CLK = '1') AND (CLK'LAST_VALUE = '0')) THEN
			IF (load_nzp = '1') THEN
				PRE_NZP <= wb_cc;
			END IF;
		END IF;
	END PROCESS VHDL_NZP;
	N <= PRE_NZP(2) AFTER DELAY_REG;
	Z <= PRE_NZP(1) AFTER DELAY_REG;
	P <= PRE_NZP(0) AFTER DELAY_REG;
END UNTITLED;
