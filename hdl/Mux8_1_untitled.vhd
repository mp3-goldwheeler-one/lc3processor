--
-- VHDL Architecture ece411.Mux2.untitled
--
-- Created:
--          by - goldste6.ews (linux3.ews.illinois.edu)
--          at - 00:07:59 02/17/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Mux8_1 IS
   PORT( 
      A   : IN     std_logic;
      B   : IN     std_logic;
      C   : IN     std_logic;
      D   : IN     std_logic;
      E   : IN     std_logic;
      F   : IN     STD_LOGIC;
      G   : IN     std_logic;
      H   : IN     std_logic;
      Sel : IN     std_logic_vector(2 downto 0);
      Y   : OUT    std_logic
   );

-- Declarations

END Mux8_1 ;

--
ARCHITECTURE untitled OF Mux8_1 IS
SIGNAL TEMP : STD_LOGIC;
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
			TEMP <= 'X';
		END CASE;
	END PROCESS;
	Y <= TEMP AFTER DELAY_MUX8;
END ARCHITECTURE untitled;

