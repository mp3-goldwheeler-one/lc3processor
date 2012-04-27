--
-- VHDL Architecture ece411.OWordMux2.untitled
--
-- Created:
--          by - goldste6.UNKNOWN (linux1.ews.illinois.edu)
--          at - 23:39:42 02/07/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY PWordMux2 IS
   PORT( 
      A   : IN     LC3b_pword;
      B   : IN     LC3b_pword;
      Sel : IN     std_logic;
      Y   : OUT    LC3b_pword
   );

-- Declarations

END PWordMux2 ;

--
ARCHITECTURE untitled OF PWordMux2 IS
BEGIN
  
    Update : PROCESS (A, B, Sel) is
      variable state : LC3b_pword;
    BEGIN
      case Sel is
        when '0' =>
          state := A;
        when '1' =>
          state := B;
        when others =>
          state := (OTHERS => 'X');
      end case;
      Y <= state after delay_MUX2;
    END PROCESS;
    
END ARCHITECTURE untitled;

