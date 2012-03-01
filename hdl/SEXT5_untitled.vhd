--
-- VHDL Architecture ece411.SEXT5.untitled
--
-- Created:
--          by - goldste6.UNKNOWN (evrt-252-13.ews.illinois.edu)
--          at - 16:23:24 01/27/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;
ENTITY SEXT5 IS
  port(
    in5   :   in   LC3b_imm5;
    output:   out  LC3b_word
  );
END ENTITY SEXT5;

--
ARCHITECTURE untitled OF SEXT5 IS
BEGIN
  output <= std_logic_vector(resize(signed(in5), 16)) after DELAY_MUX2;
END ARCHITECTURE untitled;

