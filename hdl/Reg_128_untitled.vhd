--
-- VHDL Architecture ece411.Reg_128.untitled
--
-- Created:
--          by - goldste6.ews (gelib-057-04.ews.illinois.edu)
--          at - 22:39:18 03/14/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Reg_128 IS
   PORT( 
      Clk     : IN     std_logic;
      Data    : IN     LC3b_oword;
      Write   : IN     std_logic;
      DataOut : OUT    LC3b_oword
   );

-- Declarations

END Reg_128 ;

--
ARCHITECTURE untitled OF Reg_128 IS
BEGIN
  	REG128: PROCESS(CLK, Data, Write)
	  VARIABLE STATE : LC3b_oword;
	  BEGIN
		  --IF(RESET_L = '0') THEN
			--  STATE := '0';  -- DEFAULT VALUE
		  IF(CLK = '1' AND CLK'EVENT AND Write = '1') THEN -- HIGH ENABLE
			  STATE := Data;
		  ELSIF(Write /= '0' AND Write /= '1' AND CLK = '1' AND CLK'EVENT) THEN
			  STATE := "XXXXXXXXXXXXXXXX";
		  END IF;
		  DataOut <= STATE AFTER DELAY_REG;
	  END PROCESS REG128;
END ARCHITECTURE untitled;

