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
      decode_control_out    : IN     control_word;
      decode_data_out       : IN     pipe_data;
      decode_instr          : IN     STD_LOGIC_VECTOR (15 DOWNTO 0);
      decode_pc             : IN     LC3b_word;
      exec_insert_bubble    : IN     std_logic;
      load_decode_exec_pipe : IN     STD_LOGIC;
      exec_control          : OUT    control_word;
      exec_control_in       : OUT    exec_control_word;
      exec_data_in          : OUT    pipe_data;
      exec_instr            : OUT    LC3b_word;
      exec_pc               : OUT    LC3b_word
   );

-- Declarations

END decode_exec_pipe ;
