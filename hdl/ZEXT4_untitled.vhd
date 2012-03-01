--
-- VHDL Architecture ece411.ZEXT4.untitled
--
-- Created:
--          by - goldste6.UNKNOWN (linux2.ews.illinois.edu)
--          at - 00:18:17 02/01/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ZEXT4 IS
   PORT( 
      clk      : IN     std_logic;
      imm4     : IN     LC3b_imm4;
      zextimm4 : OUT    LC3b_word
   );

-- Declarations

END ZEXT4 ;

--
ARCHITECTURE untitled OF ZEXT4 IS
BEGIN
  zextimm4 <= std_logic_vector(resize(unsigned(imm4), 16));
END ARCHITECTURE untitled;

