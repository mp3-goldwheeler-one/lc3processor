--
-- VHDL Architecture ece411.PipeDataSplitter.untitled
--
-- Created:
--          by - wheele11.ews (evrt-252-02.ews.illinois.edu)
--          at - 20:26:30 03/27/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY PipeDataSplitter IS
   PORT( 
        data_in      : IN	LC3b_opcode;
        aluout       : OUT	lc3b_word;
		mem_data_in  : OUT	lc3b_word;
		sr1_val      : OUT	lc3b_word;
		sr2_val      : OUT	lc3b_word;
		dr_val       : OUT	lc3b_word;
		dr           : OUT	lc3b_reg;
		imm4         : OUT	LC3B_IMM4;
		imm5         : OUT	LC3B_IMM5;
		idx6         : OUT	LC3B_INDEX6;
		off9         : OUT	LC3B_OFFSET9;
		off11        : OUT	LC3B_OFFSET11;
		load_jump_pc : OUT	std_logic
   );

-- Declarations

END PipeDataSplitter ;

--
ARCHITECTURE untitled OF PipeDataSplitter IS
BEGIN
	aluout       <= data_in.aluout;
	mem_data_in  <= data_in.mem_data_in;
	sr1_val      <= data_in.sr1_val;
	sr2_val      <= data_in.sr2_val;
	dr_val       <= data_in.dr_val;
	dr           <= data_in.dr;
	imm4         <= data_in.imm4;
	imm5         <= data_in.imm5;
	idx6         <= data_in.idx6;
	off9         <= data_in.off9;
	off11        <= data_in.off11;
	load_jump_pc <= data_in.load_jump_pc;
END ARCHITECTURE untitled;

