--
-- VHDL Architecture ece411.BTBLineCombiner.untitled
--
-- Created:
--          by - wheele11.ews (gelib-057-20.ews.illinois.edu)
--          at - 00:09:59 04/16/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY BTBLineCombiner IS
   PORT( 
      state        : IN     std_logic;
      target       : IN     LC3B_WORD;
      btb_data_out : OUT    btb_line
   );

-- Declarations

END BTBLineCombiner ;

--
ARCHITECTURE untitled OF BTBLineCombiner IS
BEGIN
  btb_data_out.state  <= state;
  btb_data_out.target <= target;
END ARCHITECTURE untitled;

