--
-- VHDL Architecture ece411.ImmCalc.untitled
--
-- Created:
--          by - wheele11.ews (gelib-057-07.ews.illinois.edu)
--          at - 00:51:08 03/09/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

USE ieee.std_logic_arith.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ImmCalc IS
   PORT(
     num_bits : IN  std_logic_vector(3 downto 0);
     sext     : IN  std_logic;
     shift    : IN  std_logic;
     instr    : IN  LC3b_word;
     imm      : OUT LC3b_word
   );

-- Declarations

END ImmCalc ;

--
ARCHITECTURE untitled OF ImmCalc IS
BEGIN
  PROCESS (num_bits, sext, shift, instr)
    VARIABLE state : LC3b_word;
  BEGIN
    case sext is
      when '0' =>
        state := std_logic_vector(resize(signed(instr(conv_integer(unsigned(num_bits)-1) downto 0)), 16)) sll unsigned(shift);
      when '1' =>
        state := std_logic_vector(resize(unsigned(instr(conv_integer(unsigned(num_bits)-1) downto 0)), 16)) sll unsigned(shift);
    end case;
    imm <= state after DELAY_MUX2;
  END PROCESS;
END ARCHITECTURE untitled;

