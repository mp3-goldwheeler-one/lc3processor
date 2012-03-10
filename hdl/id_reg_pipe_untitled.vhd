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
      CLK                 : IN     std_logic;
      RESET_L             : IN     STD_LOGIC;
      decode_alumux_sel   : IN     STD_LOGIC_VECTOR (1 DOWNTO 0);
      decode_aluop        : IN     LC3b_aluop;
      decode_dr           : IN     LC3B_REG;
      decode_instr        : IN     LC3b_word;
      decode_load_jump_pc : IN     STD_LOGIC;
      decode_opcode       : IN     LC3b_opcode;
      decode_pc           : IN     LC3b_word;
      decode_ready        : IN     std_logic;
      decode_regwrite     : IN     std_logic;
      decode_shift_imm    : IN     STD_LOGIC;
      decode_src_a        : IN     LC3b_word;
      decode_src_b        : IN     LC3b_word;
      decode_use_offset11 : IN     STD_LOGIC;
      decode_use_pc_adder : IN     STD_LOGIC;
      exec_alumux_sel     : OUT    LC3b_4mux_sel;
      exec_aluop          : OUT    LC3B_ALUOP;
      exec_dr             : OUT    LC3B_REG;
      exec_instr          : OUT    LC3b_word;
      exec_load_jump_pc   : OUT    STD_LOGIC;
      exec_opcode         : OUT    LC3b_opcode;
      exec_pc             : OUT    LC3b_word;
      exec_regwrite       : OUT    STD_LOGIC;
      exec_shift_imm      : OUT    STD_LOGIC;
      exec_src_a          : OUT    LC3b_word;
      exec_src_b          : OUT    LC3b_word;
      exec_use_offset11   : OUT    std_logic;
      exec_use_pc_adder   : OUT    std_logic
   );

-- Declarations

END decode_exec_pipe ;
