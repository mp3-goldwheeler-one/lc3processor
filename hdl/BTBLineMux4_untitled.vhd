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

ENTITY BTBLineMux4 IS
   PORT( 
      A   : IN     btb_line;
      B   : IN     btb_line;
      C   : IN     btb_line;
      D   : IN     btb_line;
      Sel : IN     LC3B_4Mux_Sel;
      Y   : OUT    btb_line
   );

-- Declarations

END BTBLineMux4;

--
ARCHITECTURE untitled OF BTBLineMux4 IS
BEGIN
  
    Update : PROCESS (A, B, C, D, Sel) is
      variable state : btb_line;
    BEGIN
      case Sel is
        when "00" =>
          state := A;
        when "01" =>
          state := B;
        when "10" =>
          state := C;
        when "11" =>
          state := D;
        when others =>
          state := default_btb_line;
      end case;
      Y <= state after delay_MUX4;
    END PROCESS;
    
END ARCHITECTURE untitled;
