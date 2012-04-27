--
-- VHDL Architecture ece411.WordSelector.untitled
--
-- Created:
--          by - goldste6.UNKNOWN (linux3.ews.illinois.edu)
--          at - 20:14:43 02/07/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY OWordSelector IS
   PORT( 
      Input   : IN     LC3b_pword;
      Offset  : IN     LC3b_L2_C_Offset;
      Output  : OUT    LC3b_oword
   );

-- Declarations

END OWordSelector ;

--
ARCHITECTURE untitled OF OWordSelector IS
BEGIN
  Update : PROCESS (Input, Offset) is
    variable state : LC3b_oword;
  BEGIN
    case Offset is
      when '0' =>
        state := Input(127 downto 0);
      when '1' =>
        state := Input(255 downto 128);
      when others =>
        state := (OTHERS => 'X');
    end case;
    Output <= state after delay_MUX2;
  END PROCESS;
END ARCHITECTURE untitled;

