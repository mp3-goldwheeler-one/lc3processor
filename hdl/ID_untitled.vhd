--
-- VHDL Architecture ece411.IR.untitled
--
-- Created:
--          by - goldste6.UNKNOWN (linux4.ews.illinois.edu)
--          at - 20:25:39 01/18/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ID IS
   PORT( 
      decode_instr : IN     LC3b_word;
      Opcode       : OUT    LC3b_opcode;
      SrcA         : OUT    LC3b_reg;
      SrcB         : OUT    LC3b_reg;
      dest         : OUT    LC3b_reg;
      index6       : OUT    LC3b_index6;
      imm5         : OUT    LC3b_imm5;
      bit5         : OUT    std_logic;
      bit4         : OUT    std_logic;
      offset9      : OUT    LC3b_offset9;
      trapvec8     : OUT    LC3b_trapvect8;
      offset11     : OUT    LC3b_offset11;
      bit11        : OUT    std_logic;
      imm4         : OUT    LC3b_imm4;
      direction    : OUT    std_logic;
      nzp          : OUT    LC3b_cc
   );

-- Declarations

END ID ;

--
ARCHITECTURE UNTITLED OF ID IS
SIGNAL VAL_IR : LC3B_WORD;
BEGIN
	OPCODE    <= decode_instr(15 DOWNTO 12);
	SRCA      <= '0' & decode_instr(8 DOWNTO 6);
	SRCB      <= '0' & decode_instr(2 DOWNTO 0);
	DEST      <= '0' & decode_instr(11 DOWNTO 9);
	OFFSET9   <= decode_instr(8 DOWNTO 0);
	INDEX6    <= decode_instr(5 DOWNTO 0);
	imm5      <= decode_instr(4 downto 0);
	imm4      <= decode_instr(3 downto 0);
	offset11  <= decode_instr(10 downto 0);
	trapvec8  <= decode_instr(7 downto 0); --must ignore the high bit of the trap vector
	bit5      <= decode_instr(5);
	bit4      <= decode_instr(4);
	direction <= decode_instr(4);
	bit11     <= decode_instr(11);
	nzp       <= decode_instr(11 downto 9);
END UNTITLED;
