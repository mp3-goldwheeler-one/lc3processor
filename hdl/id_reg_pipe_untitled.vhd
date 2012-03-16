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
      CLK                   : IN     std_logic;
      RESET_L               : IN     STD_LOGIC;
      decode_aluop          : IN     LC3b_aluop;
      decode_control_out    : IN     control_word;
      decode_data_out       : IN     pipe_data;
      decode_instr          : IN     STD_LOGIC_VECTOR (15 DOWNTO 0);
      decode_opcode         : IN     LC3b_opcode;
      decode_pc             : IN     LC3b_word;
      decode_read           : IN     std_logic;
      decode_regwrite       : IN     std_logic;
      decode_set_cc         : IN     std_logic;
      decode_shift_imm      : IN     STD_LOGIC;
      decode_use_offset11   : IN     STD_LOGIC;
      decode_use_pc_adder   : IN     STD_LOGIC;
      decode_write_byte     : IN     std_logic;
      decode_write_word     : IN     std_logic;
      load_decode_exec_pipe : IN     STD_LOGIC;
      exec_aluop            : OUT    LC3B_ALUOP;
      exec_control          : OUT    control_word;
      exec_control_in       : OUT    exec_control_word;
      exec_data_in          : OUT    pipe_data;
      exec_instr            : OUT    LC3b_word;
      exec_opcode           : OUT    LC3b_opcode;
      exec_pc               : OUT    LC3b_word;
      exec_read             : OUT    std_logic;
      exec_regwrite         : OUT    STD_LOGIC;
      exec_set_cc           : OUT    std_logic;
      exec_shift_imm        : OUT    STD_LOGIC;
      exec_use_offset11     : OUT    std_logic;
      exec_use_pc_adder     : OUT    std_logic;
      exec_write_byte       : OUT    std_logic;
      exec_write_word       : OUT    std_logic
   );

-- Declarations

END decode_exec_pipe ;
