--
-- VHDL Architecture ece411.GenCC.untitled
--
-- Created:
--          by - goldste6.UNKNOWN (linux4.ews.illinois.edu)
--          at - 20:35:10 01/18/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY GenCC IS
   PORT( 
      Input  : IN     LC3b_word;
      Output : OUT    LC3b_cc
   );

-- Declarations

END GenCC ;

--
ARCHITECTURE UNTITLED OF GENCC IS
BEGIN
	VHDL_GENCC : PROCESS (Input)
	BEGIN    
		IF (Input = "0000000000000000") THEN
			Output <= "010" AFTER DELAY_GENCC;
		ELSIF (Input(15) = '1') THEN
			Output <= "100" AFTER DELAY_GENCC;
		ELSE
			Output <= "001" AFTER DELAY_GENCC;
		END IF;
	END PROCESS VHDL_GENCC;
END UNTITLED;

