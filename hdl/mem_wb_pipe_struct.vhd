-- VHDL Entity ece411.mem_wb_pipe.interface
--
-- Created:
--          by - wheele11.ews (gelib-057-06.ews.illinois.edu)
--          at - 02:38:12 03/16/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY mem_wb_pipe IS
   PORT( 
      CLK              : IN     std_logic;
      RESET_L          : IN     STD_LOGIC;
      load_mem_wb_pipe : IN     std_logic;
      mem_control      : IN     control_word;
      mem_data_out     : IN     pipe_data;
      mem_instr        : IN     LC3b_word;
      mem_opcode       : IN     LC3b_opcode;
      mem_pc           : IN     LC3b_word;
      mem_read         : IN     std_logic;
      mem_ready        : IN     STD_LOGIC;
      mem_regwrite     : IN     STD_LOGIC;
      mem_set_cc       : IN     std_logic;
      mem_write_byte   : IN     std_logic;
      mem_write_word   : IN     std_logic;
      wb_control       : OUT    control_word;
      wb_control_in    : OUT    wb_control_word;
      wb_data_in       : OUT    pipe_data;
      wb_instr         : OUT    LC3b_word;
      wb_mread         : OUT    std_logic;
      wb_opcode        : OUT    LC3b_opcode;
      wb_pc            : OUT    LC3b_word;
      wb_regwrite      : OUT    STD_LOGIC;
      wb_set_cc        : OUT    std_logic
   );

-- Declarations

END mem_wb_pipe ;

--
-- VHDL Architecture ece411.mem_wb_pipe.struct
--
-- Created:
--          by - wheele11.ews (gelib-057-06.ews.illinois.edu)
--          at - 02:38:13 03/16/12
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

ARCHITECTURE struct OF mem_wb_pipe IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL wb_control_buffer : control_word;
   SIGNAL zero              : STD_LOGIC;


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
   COMPONENT REG1
   PORT (
      RESET_L : IN     STD_LOGIC ;
      A       : IN     STD_LOGIC ;
      EN      : IN     STD_LOGIC ;
      CLK     : IN     STD_LOGIC ;
      F       : OUT    STD_LOGIC 
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
   COMPONENT REG4
   PORT (
      RESET_L : IN     STD_LOGIC ;
      A       : IN     STD_LOGIC_VECTOR (3 DOWNTO 0);
      EN      : IN     STD_LOGIC ;
      CLK     : IN     STD_LOGIC ;
      F       : OUT    STD_LOGIC_VECTOR (3 DOWNTO 0)
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : DataBuffer USE ENTITY ece411.DataBuffer;
   FOR ALL : REG1 USE ENTITY mp3lib.REG1;
   FOR ALL : REG16 USE ENTITY mp3lib.REG16;
   FOR ALL : REG4 USE ENTITY mp3lib.REG4;
   FOR ALL : RegControl USE ENTITY ece411.RegControl;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   wb_control <= wb_control_buffer;
   wb_control_in <= wb_control_buffer.wb;

   -- HDL Embedded Text Block 3 eb3
   zero <= '0';


   -- Instance port mappings.
   aRegData : DataBuffer
      PORT MAP (
         CLK                   => CLK,
         RESET_L               => RESET_L,
         data                  => mem_data_out,
         drive_aluout          => zero,
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
         load_decode_exec_pipe => load_mem_wb_pipe,
         F                     => wb_data_in
      );
   U_6 : RegControl
      PORT MAP (
         RESET_L => RESET_L,
         A       => mem_control,
         EN      => load_mem_wb_pipe,
         CLK     => CLK,
         F       => wb_control_buffer
      );
   U_5 : REG1
      PORT MAP (
         RESET_L => RESET_L,
         A       => mem_regwrite,
         EN      => load_mem_wb_pipe,
         CLK     => CLK,
         F       => wb_regwrite
      );
   U_7 : REG1
      PORT MAP (
         RESET_L => RESET_L,
         A       => mem_set_cc,
         EN      => load_mem_wb_pipe,
         CLK     => CLK,
         F       => wb_set_cc
      );
   U_8 : REG1
      PORT MAP (
         RESET_L => RESET_L,
         A       => mem_read,
         EN      => load_mem_wb_pipe,
         CLK     => CLK,
         F       => wb_mread
      );
   U_2 : REG16
      PORT MAP (
         RESET_L => RESET_L,
         A       => mem_pc,
         EN      => load_mem_wb_pipe,
         CLK     => CLK,
         F       => wb_pc
      );
   U_3 : REG16
      PORT MAP (
         RESET_L => RESET_L,
         A       => mem_instr,
         EN      => load_mem_wb_pipe,
         CLK     => CLK,
         F       => wb_instr
      );
   U_4 : REG4
      PORT MAP (
         RESET_L => RESET_L,
         A       => mem_opcode,
         EN      => load_mem_wb_pipe,
         CLK     => CLK,
         F       => wb_opcode
      );

END struct;
