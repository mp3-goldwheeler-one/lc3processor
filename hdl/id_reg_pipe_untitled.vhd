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

ENTITY decode_exec_pipe IS
   PORT( 
      CLK               : IN     std_logic;
      RESET_L           : IN     STD_LOGIC;
      decode_alumux_sel : IN     STD_LOGIC_VECTOR (1 DOWNTO 0);
      decode_aluop      : IN     LC3b_aluop;
      decode_instr      : IN     LC3b_word;
      decode_num_bits   : IN     std_logic_vector (3 DOWNTO 0);
      decode_opcode     : IN     LC3b_opcode;
      decode_pc         : IN     LC3b_word;
      decode_ready      : IN     std_logic;
      decode_regwrite   : IN     std_logic;
      decode_sext_imm   : IN     std_logic;
      decode_shift_imm  : IN     STD_LOGIC;
      decode_src_a      : IN     LC3b_word;
      decode_src_b      : IN     LC3b_word;
      exec_alumux_sel   : OUT    LC3b_4mux_sel;
      exec_aluop        : OUT    LC3B_ALUOP;
      exec_instr        : OUT    LC3b_word;
      exec_num_bits     : OUT    std_logic_vector (3 DOWNTO 0);
      exec_opcode       : OUT    LC3b_opcode;
      exec_pc           : OUT    LC3b_word;
      exec_regwrite     : OUT    STD_LOGIC;
      exec_sext_imm     : OUT    std_logic;
      exec_shift_imm    : OUT    STD_LOGIC;
      exec_src_a        : OUT    LC3b_word;
      exec_src_b        : OUT    LC3b_word;
      exec_uses_imm     : OUT    STD_LOGIC
   );

-- Declarations

END decode_exec_pipe ;
