--
-- VHDL ARCHITECTURE ECE411.MUX4_1.UNTITLED
--
-- CREATED:
--          BY - HERSTAD.STDT (EESN25.EWS.UIUC.EDU)
--          AT - 14:52:00 03/12/03
--
-- GENERATED BY MENTOR GRAPHICS' HDL DESIGNER(TM) 2001.5 (BUILD 170)
--
-- HDS INTERFACE_START
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY PWordMux8 IS
   PORT( 
      A      : IN     LC3B_PWORD;
      B      : IN     LC3B_PWORD;
      C      : IN     LC3B_PWORD;
      D      : IN     LC3B_PWORD;
      E      : IN     LC3B_PWORD;
      F      : IN     LC3B_PWORD;
      G      : IN     LC3B_PWORD;
      H      : IN     LC3B_PWORD;
      SEL    : IN     STD_LOGIC_VECTOR (2 DOWNTO 0);
      Output : OUT    LC3B_PWORD
   );

-- Declarations

END PWordMux8 ;

-- HDS INTERFACE_END
ARCHITECTURE UNTITLED OF PWordMux8 IS
SIGNAL TEMP : LC3B_PWORD;
BEGIN
	PROCESS (A, B, C, D, E, F, G, H, SEL)
	BEGIN  -- PROCESS
		CASE SEL IS
		WHEN "000" =>
			TEMP <= A;
		WHEN "001" => 
			TEMP <= B;
		WHEN "010" => 
			TEMP <= C;
		WHEN "011" => 
			TEMP <= D;
		WHEN "100" =>
	    TEMP <= E;
    WHEN "101" => 
	    TEMP <= F;
    WHEN "110" => 
	    TEMP <= G;
    WHEN "111" => 
	    TEMP <= H;
		WHEN OTHERS =>
			TEMP <= (OTHERS => 'X');
		END CASE;
	END PROCESS;
	Output <= TEMP AFTER DELAY_MUX8;
END UNTITLED;
