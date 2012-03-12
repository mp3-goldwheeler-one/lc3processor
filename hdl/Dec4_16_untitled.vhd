--
-- VHDL ARCHITECTURE ECE411.DECODE3_8.UNTITLED
--
-- CREATED:
--          BY - HERSTAD.STDT (REMSUN2.EWS.UIUC.EDU)
--          AT - 16:55:38 02/18/03
--
-- GENERATED BY MENTOR GRAPHICS' HDL DESIGNER(TM) 2001.5 (BUILD 170)
--
-- HDS INTERFACE_START
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Dec4_16 IS
   PORT( 
      A : IN     STD_LOGIC_VECTOR(3 downto 0);
      F  : OUT    STD_LOGIC_VECTOR(15 downto 0)
   );

-- Declarations

END Dec4_16 ;

-- HDS INTERFACE_END
ARCHITECTURE UNTITLED OF DEC4_16 IS
BEGIN
	DEC4_16: PROCESS(A)
	VARIABLE STATE : LC3B_WORD;
	BEGIN
		CASE A IS
			WHEN "0000" => STATE := "0000000000000001"; 
			WHEN "0001" => STATE := "0000000000000010"; 
			WHEN "0010" => STATE := "0000000000000100"; 
			WHEN "0011" => STATE := "0000000000001000"; 
			WHEN "0100" => STATE := "0000000000010000"; 
			WHEN "0101" => STATE := "0000000000100000"; 
			WHEN "0110" => STATE := "0000000001000000"; 
			WHEN "0111" => STATE := "0000000010000000";
			WHEN "1000" => STATE := "0000000100000000"; 
			WHEN "1001" => STATE := "0000001000000000"; 
			WHEN "1010" => STATE := "0000010000000000"; 
			WHEN "1011" => STATE := "0000100000000000"; 
			WHEN "1100" => STATE := "0001000000000000"; 
			WHEN "1101" => STATE := "0010000000000000"; 
			WHEN "1110" => STATE := "0100000000000000"; 
			WHEN "1111" => STATE := "1000000000000000";
			WHEN OTHERS => STATE := (OTHERS => 'X');
		END CASE;
		F <= STATE AFTER DELAY_DECODE3;
	END PROCESS DEC4_16;
END UNTITLED;