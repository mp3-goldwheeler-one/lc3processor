--
-- VHDL Architecture ece411.TRISTATE_H_controlword.untitled
--
-- Created:
--          by - goldste6.ews (linux6.ews.illinois.edu)
--          at - 17:47:08 04/26/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY TRISTATE_H_controlword IS
   PORT( 
      A  : IN     control_word;
      EN : IN     STD_LOGIC;
      F  : OUT    control_word
   );

-- Declarations

END TRISTATE_H_controlword ;

--
ARCHITECTURE untitled OF TRISTATE_H_controlword IS
BEGIN
  	TRISTATE: PROCESS(A, EN) -- LOW ENABLE
	  VARIABLE STATE : control_word;
	  BEGIN
		  CASE EN IS
			  WHEN '1' => STATE := A;
			  WHEN '0' => STATE := HIZ_CONTROL_WORD;
			  WHEN OTHERS => STATE := UNDEFINED_CONTROL_WORD;
		  END CASE;
		  F <= STATE AFTER DELAY_LOGIC2;
	  END PROCESS TRISTATE;
END ARCHITECTURE untitled;

