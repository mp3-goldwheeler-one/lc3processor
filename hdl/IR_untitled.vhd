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

ENTITY IR IS
   PORT( 
      LoadIR    : IN     std_logic;
      MDRout    : IN     LC3b_word;
      clk       : IN     std_logic;
      Opcode    : OUT    LC3b_opcode;
      SrcA      : OUT    LC3b_reg;
      SrcB      : OUT    std_logic_vector (2 DOWNTO 0);
      dest      : OUT    std_logic_vector (2 DOWNTO 0);
      index6    : OUT    LC3b_index6;
      imm5      : OUT    LC3b_imm5;
      bit5      : OUT    std_logic;
      offset9   : OUT    LC3b_offset9;
      trapvec8  : OUT    LC3b_trapvect8;
      offset11  : OUT    LC3b_offset11;
      bit11     : OUT    std_logic;
      imm4      : OUT    LC3b_imm4;
      direction : OUT    std_logic
   );

-- Declarations

END IR ;

--
ARCHITECTURE UNTITLED OF IR IS
SIGNAL VAL_IR : LC3B_WORD;
BEGIN
	------------------------------
	VHDL_REG_IR : PROCESS (CLK, LOADIR, MDROUT)
	------------------------------
	BEGIN
		IF (CLK'EVENT AND (CLK = '1') AND (CLK'LAST_VALUE = '0')) THEN
			IF (LOADIR = '1') THEN
				VAL_IR <= MDROUT AFTER DELAY_REG;
			END IF;
		END IF;
	END PROCESS VHDL_REG_IR;
	OPCODE <= VAL_IR(15 DOWNTO 12);
	SRCA <= VAL_IR(8 DOWNTO 6);
	SRCB <= VAL_IR(2 DOWNTO 0);
	DEST <= VAL_IR(11 DOWNTO 9);
	OFFSET9 <= VAL_IR(8 DOWNTO 0);
	INDEX6 <= VAL_IR(5 DOWNTO 0);
	imm5 <= VAL_IR(4 downto 0);
	imm4 <= VAL_IR(3 downto 0);
	offset11 <= VAL_IR(10 downto 0);
	trapvec8 <= VAL_IR(7 downto 0);
	bit5 <= VAL_IR(5);
	direction <= VAL_IR(4);
	bit11 <= VAL_IR(11);
END UNTITLED;

