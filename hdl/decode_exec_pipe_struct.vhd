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
      load_decode_exec_pipe : IN     STD_LOGIC;
      exec_control          : OUT    control_word;
      exec_control_in       : OUT    exec_control_word;
      exec_data_in          : OUT    pipe_data;
      exec_instr            : OUT    LC3b_word;
      exec_pc               : OUT    LC3b_word
   );

-- Declarations

END decode_exec_pipe ;

--
-- VHDL Architecture ece411.decode_exec_pipe.struct
--
-- Created:
--          by - goldste6.ews (evrt-252-03.ews.illinois.edu)
--          at - 20:25:24 03/27/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY ece411;
LIBRARY mp3lib;

ARCHITECTURE struct OF decode_exec_pipe IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL exec_control_buffer : control_word;
   SIGNAL one                 : STD_LOGIC;
   SIGNAL zero                : STD_LOGIC;


   -- Component Declarations
   COMPONENT DataBuffer
   PORT (
      CLK                   : IN     std_logic ;
      RESET_L               : IN     STD_LOGIC ;
      data                  : IN     pipe_data ;
      drive_aluout          : IN     STD_LOGIC ;
      drive_dr              : IN     STD_LOGIC ;
      drive_dr_val          : IN     STD_LOGIC ;
      drive_idx6            : IN     STD_LOGIC ;
      drive_imm4            : IN     STD_LOGIC ;
      drive_imm5            : IN     STD_LOGIC ;
      drive_load_jump_pc    : IN     STD_LOGIC ;
      drive_mem_data_in     : IN     STD_LOGIC ;
      drive_off11           : IN     STD_LOGIC ;
      drive_off9            : IN     STD_LOGIC ;
      drive_sr1_val         : IN     STD_LOGIC ;
      drive_sr2_val         : IN     STD_LOGIC ;
      load_decode_exec_pipe : IN     STD_LOGIC ;
      F                     : OUT    pipe_data 
   );
   END COMPONENT;
   COMPONENT RegControl
   PORT (
      RESET_L : IN     STD_LOGIC ;
      A       : IN     control_word ;
      EN      : IN     STD_LOGIC ;
      CLK     : IN     std_logic ;
      F       : OUT    control_word 
   );
   END COMPONENT;
   COMPONENT REG16
   PORT (
      RESET_L : IN     STD_LOGIC ;
      A       : IN     STD_LOGIC_VECTOR (15 DOWNTO 0);
      EN      : IN     STD_LOGIC ;
      CLK     : IN     STD_LOGIC ;
      F       : OUT    STD_LOGIC_VECTOR (15 DOWNTO 0)
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : DataBuffer USE ENTITY ece411.DataBuffer;
   FOR ALL : REG16 USE ENTITY mp3lib.REG16;
   FOR ALL : RegControl USE ENTITY ece411.RegControl;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   -- constant control word
   zero <= '0';
   one  <= '1';

   -- HDL Embedded Text Block 2 eb2
   exec_control <= exec_control_buffer;
   exec_control_in <= exec_control_buffer.exec;


   -- Instance port mappings.
   aRegData : DataBuffer
      PORT MAP (
         CLK                   => CLK,
         RESET_L               => RESET_L,
         data                  => decode_data_out,
         drive_aluout          => one,
         drive_dr              => zero,
         drive_dr_val          => zero,
         drive_idx6            => zero,
         drive_imm4            => zero,
         drive_imm5            => zero,
         drive_load_jump_pc    => zero,
         drive_mem_data_in     => zero,
         drive_off11           => zero,
         drive_off9            => zero,
         drive_sr1_val         => zero,
         drive_sr2_val         => zero,
         load_decode_exec_pipe => load_decode_exec_pipe,
         F                     => exec_data_in
      );
   U_6 : RegControl
      PORT MAP (
         RESET_L => RESET_L,
         A       => decode_control_out,
         EN      => load_decode_exec_pipe,
         CLK     => CLK,
         F       => exec_control_buffer
      );
   U_2 : REG16
      PORT MAP (
         RESET_L => RESET_L,
         A       => decode_pc,
         EN      => load_decode_exec_pipe,
         CLK     => CLK,
         F       => exec_pc
      );
   U_3 : REG16
      PORT MAP (
         RESET_L => RESET_L,
         A       => decode_instr,
         EN      => load_decode_exec_pipe,
         CLK     => CLK,
         F       => exec_instr
      );

END struct;
