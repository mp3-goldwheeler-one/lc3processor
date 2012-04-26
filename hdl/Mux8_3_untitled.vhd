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
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
LIBRARY ECE411;
USE ECE411.LC3B_TYPES.ALL;

ENTITY MUX8_3 IS
PORT( 
	A   : IN     STD_LOGIC_VECTOR (2 DOWNTO 0);
	B   : IN     STD_LOGIC_VECTOR (2 DOWNTO 0);
	C   : IN     STD_LOGIC_VECTOR (2 DOWNTO 0);
	D   : IN     STD_LOGIC_VECTOR (2 DOWNTO 0);
	E   : IN     STD_LOGIC_VECTOR (2 DOWNTO 0);
  F   : IN     STD_LOGIC_VECTOR (2 DOWNTO 0);
  G   : IN     STD_LOGIC_VECTOR (2 DOWNTO 0);
  H   : IN     STD_LOGIC_VECTOR (2 DOWNTO 0);
	SEL : IN     STD_LOGIC_VECTOR (2 DOWNTO 0);
	Output   : OUT    STD_LOGIC_VECTOR (2 DOWNTO 0)
);
-- DECLARATIONS
END MUX8_3 ;

-- HDS INTERFACE_END
ARCHITECTURE UNTITLED OF MUX8_3 IS
SIGNAL TEMP : STD_LOGIC_VECTOR(2 DOWNTO 0);
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
	    TEMP <= H;
    WHEN "111" => 
	    TEMP <= G;
		WHEN OTHERS =>
			TEMP <= (OTHERS => 'X');
		END CASE;
	END PROCESS;
	Output <= TEMP AFTER DELAY_MUX8;
END UNTITLED;
