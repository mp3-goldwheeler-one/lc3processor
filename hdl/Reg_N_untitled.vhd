--
-- VHDL Architecture ece411.Reg_N.untitled
--
-- Created:
--          by - goldste6.ews (siebl-0224-29.ews.illinois.edu)
--          at - 21:13:58 04/16/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Reg_N IS
   GENERIC( 
      N : Integer
   );
   PORT( 
      RESET_L : IN     STD_LOGIC;
      A       : IN     std_logic_vector (n-1 DOWNTO 0);
      EN      : IN     STD_LOGIC;
      CLK     : IN     STD_LOGIC;
      F       : OUT    std_logic_vector (n-1 DOWNTO 0)
   );

-- Declarations

END Reg_N ;

-- HDS INTERFACE_END
ARCHITECTURE UNTITLED OF Reg_N IS
BEGIN
	reg: PROCESS(CLK,RESET_L,A,EN)
	VARIABLE STATE : std_logic_vector(n-1 downto 0);
	BEGIN
		IF(RESET_L = '0') THEN
			STATE := std_logic_vector(TO_UNSIGNED(0, n));  -- DEFAULT VALUE
		ELSIF(CLK = '1' AND CLK'EVENT AND EN = '1') THEN -- HIGH ENABLE
			STATE := A;
		ELSIF(EN /= '0' AND EN /= '1' AND CLK = '1' AND CLK'EVENT) THEN
			STATE := (others => 'X');
		END IF;
		F <= STATE AFTER DELAY_REG;
	END PROCESS reg;
END UNTITLED;
