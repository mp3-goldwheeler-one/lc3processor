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
      data_in     : IN     pipe_data;
      pc          : OUT    lc3b_word;
      incr_pc     : OUT    lc3b_word;
      instr       : OUT    lc3b_word;
      aluout      : OUT    lc3b_word;
      mem_data_in : OUT    lc3b_word;
      data_addr   : OUT    lc3b_word;
      sr1         : OUT    lc3b_reg;
      sr2         : OUT    lc3b_reg;
      sr1_val     : OUT    lc3b_word;
      sr2_val     : OUT    lc3b_word;
      dr_val      : OUT    lc3b_word;
      dr          : OUT    lc3b_reg;
      imm4        : OUT    LC3B_IMM4;
      imm5        : OUT    LC3B_IMM5;
      idx6        : OUT    LC3B_INDEX6;
      off9        : OUT    LC3B_OFFSET9;
      off11       : OUT    LC3B_OFFSET11;
      trapvect8   : OUT    LC3B_TRAPVECT8;
      nzp         : OUT    LC3B_cc;
      cc          : OUT    LC3B_cc;
      target_pc   : OUT    LC3B_word;
      taken       : OUT    std_logic;
      wb_data     : OUT    LC3B_word;
      btb_data    : OUT    btb_line
   );

-- Declarations

END PipeDataSplitter ;

--
ARCHITECTURE untitled OF PipeDataSplitter IS
BEGIN
  pc           <= data_in.pc;
  incr_pc      <= data_in.incr_pc;
  instr        <= data_in.instr;
  aluout       <= data_in.aluout;
  mem_data_in  <= data_in.mem_data_in;
  data_addr    <= data_in.data_addr;
  sr1_val      <= data_in.sr1_val;
  sr2_val      <= data_in.sr2_val;
  sr1          <= data_in.sr1;
  sr2          <= data_in.sr2;
  dr_val       <= data_in.dr_val;
  dr           <= data_in.dr;
  imm4         <= data_in.imm4;
  imm5         <= data_in.imm5;
  idx6         <= data_in.idx6;
  off9         <= data_in.off9;
  off11        <= data_in.off11;
  trapvect8    <= data_in.trapvect8;
  nzp          <= data_in.nzp;
  cc           <= data_in.cc;
  target_pc    <= data_in.target_pc;
  taken        <= data_in.taken;
  btb_data     <= data_in.btb_data;
  wb_data      <= data_in.wb_data;
END ARCHITECTURE untitled;

