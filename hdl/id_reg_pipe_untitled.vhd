--
-- VHDL Architecture ece411.id_reg_pipe.untitled
--
-- Created:
--          by - wheele11.ews (gelib-057-17.ews.illinois.edu)
--          at - 22:42:41 02/29/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY decode_reg_pipe IS
   PORT( 
      CLK             : IN     std_logic;
      RESET_L         : IN     std_logic;
      control_word    : IN     LC3b_word;
      decode_pc       : IN     LC3b_word;
      opcode          : IN     LC3b_opcode;
      reg_controlword : OUT    LC3b_word;
      reg_opcode      : OUT    LC3b_word;
      reg_pc          : OUT    LC3b_word
   );

-- Declarations

END decode_reg_pipe ;

--
ARCHITECTURE untitled OF decode_reg_pipe IS
BEGIN
END ARCHITECTURE untitled;

