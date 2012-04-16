--
-- VHDL Architecture ece411.BTBLineMux2.untitled
--
-- Created:
--          by - wheele11.ews (linux5.ews.illinois.edu)
--          at - 02:39:02 04/14/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY BTBLineMux2 IS
   PORT( 
      A   : IN     btb_line;
      B   : IN     btb_line;
      Sel : IN     std_logic;
      Y   : OUT    btb_line
   );

-- Declarations

END BTBLineMux2 ;

--
ARCHITECTURE untitled OF BTBLineMux2 IS
BEGIN
  
    Update : PROCESS (A, B, Sel) is
      variable state : btb_line;
    BEGIN
      case Sel is
        when '0' =>
          state := A;
        when '1' =>
          state := B;
        when others =>
          state := default_btb_line;
      end case;
      Y <= state after delay_MUX2;
    END PROCESS;
    
END ARCHITECTURE untitled;
