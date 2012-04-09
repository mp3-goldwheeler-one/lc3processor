--
-- VHDL Architecture ece411.PipeDataCombiner.untitled
--
-- Created:
--          by - wheele11.ews (evrt-252-02.ews.illinois.edu)
--          at - 20:43:01 03/27/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY PipeDataCombiner IS
   PORT( 
      pc           : IN     lc3b_word;
      incr_pc      : IN     lc3b_word;
      instr        : IN     lc3b_word;
      aluout       : IN     lc3b_word;
      dr           : IN     LC3b_reg;
      dr_val       : IN     lc3b_word;
      idx6         : IN     LC3B_INDEX6;
      imm4         : IN     LC3b_imm4;
      imm5         : IN     LC3b_imm5;
      load_jump_pc : IN     STD_LOGIC;
      mem_data_in  : IN     lc3b_word;
      off11        : IN     LC3B_OFFSET11;
      off9         : IN     LC3B_OFFSET9;
      sr1          : IN     LC3b_reg;
      sr2          : IN     LC3b_reg;
      sr1_val      : IN     lc3b_word;
      sr2_val      : IN     lc3b_word;
      data_out     : OUT    pipe_data
   );

-- Declarations

END PipeDataCombiner ;

--
ARCHITECTURE untitled OF PipeDataCombiner IS
BEGIN
  data_out.pc           <= pc;
  data_out.incr_pc      <= incr_pc;
  data_out.instr        <= instr;
	data_out.aluout       <= aluout;
	data_out.mem_data_in  <= mem_data_in;
  data_out.sr1          <= sr1;
	data_out.sr2          <= sr2;
	data_out.sr1_val      <= sr1_val;
	data_out.sr2_val      <= sr2_val;
	data_out.dr_val       <= dr_val;
	data_out.dr           <= dr;
	data_out.imm4         <= imm4;
	data_out.imm5         <= imm5;
	data_out.idx6         <= idx6;
	data_out.off9         <= off9;
	data_out.off11        <= off11;
	data_out.load_jump_pc <= load_jump_pc;
END ARCHITECTURE untitled;
