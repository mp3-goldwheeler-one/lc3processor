--
-- VHDL Architecture ece411.Mux2_N.untitled
--
-- Created:
--          by - goldste6.ews (gelib-057-19.ews.illinois.edu)
--          at - 23:53:15 04/15/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Mux2_N IS
   GENERIC(N : integer);
   PORT( 
      A   : IN     std_logic_vector ( N-1 DOWNTO 0 );
      B   : IN     std_logic_vector ( N-1 DOWNTO 0 );
      Sel : IN     std_logic;
      Y   : OUT    std_logic_vector ( N-1 DOWNTO 0 )
   );

-- Declarations

END Mux2_N ;

--
ARCHITECTURE untitled OF Mux2_N IS
BEGIN
    Update : PROCESS (A, B, Sel) is
      variable state : std_logic_vector(N-1 downto 0);
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

