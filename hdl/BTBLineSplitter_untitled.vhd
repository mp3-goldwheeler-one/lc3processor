--
-- VHDL Architecture ece411.BTBLineSplitter.untitled
--
-- Created:
--          by - wheele11.ews (gelib-057-20.ews.illinois.edu)
--          at - 00:12:46 04/16/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY BTBLineSplitter IS
   PORT( 
      btb_data_in : IN     btb_line;
      state       : OUT    std_logic;
      target      : OUT    LC3B_WORD
   );

-- Declarations

END BTBLineSplitter ;

--
ARCHITECTURE untitled OF BTBLineSplitter IS
BEGIN
  state  <= btb_data_in.state;
  target <= btb_data_in.target;
END ARCHITECTURE untitled;

