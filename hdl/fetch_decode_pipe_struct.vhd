-- VHDL Entity ece411.fetch_decode_pipe.interface
--
-- Created:
--          by - one1.ews (gelib-057-06.ews.illinois.edu)
--          at - 14:25:30 03/29/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY fetch_decode_pipe IS
   PORT( 
      CLK                    : IN     std_logic;
      RESET_L                : IN     STD_LOGIC;
      fetch_data_out         : IN     pipe_data;
      fetch_instr            : IN     LC3b_word;
      fetch_ready            : IN     std_logic;
      load_fetch_decode_pipe : IN     STD_LOGIC;
      pc                     : IN     LC3b_word;
      decode_data_in         : OUT    pipe_data;
      decode_instr           : OUT    STD_LOGIC_VECTOR (15 DOWNTO 0);
      decode_pc              : OUT    LC3b_word
   );

-- Declarations

END fetch_decode_pipe ;

--
-- VHDL Architecture ece411.fetch_decode_pipe.struct
--
-- Created:
--          by - one1.ews (gelib-057-06.ews.illinois.edu)
--          at - 14:25:30 03/29/12
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

ARCHITECTURE struct OF fetch_decode_pipe IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL load_exec_mem_pipe : STD_LOGIC;
   SIGNAL one                : STD_LOGIC;
   SIGNAL zero               : STD_LOGIC;


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
      drive_sr1             : IN     STD_LOGIC ;
      drive_sr1_val         : IN     STD_LOGIC ;
      drive_sr2             : IN     STD_LOGIC ;
      drive_sr2_val         : IN     STD_LOGIC ;
      load_decode_exec_pipe : IN     STD_LOGIC ;
      F                     : OUT    pipe_data 
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
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 3 eb3
   -- constant control word
   zero <= '0';
   one  <= '1';


   -- Instance port mappings.
   aRegData : DataBuffer
      PORT MAP (
         CLK                   => CLK,
         RESET_L               => RESET_L,
         data                  => fetch_data_out,
         drive_aluout          => zero,
         drive_dr              => one,
         drive_dr_val          => one,
         drive_idx6            => one,
         drive_imm4            => one,
         drive_imm5            => one,
         drive_load_jump_pc    => one,
         drive_mem_data_in     => zero,
         drive_off11           => one,
         drive_off9            => one,
         drive_sr1             => one,
         drive_sr1_val         => one,
         drive_sr2             => one,
         drive_sr2_val         => one,
         load_decode_exec_pipe => load_exec_mem_pipe,
         F                     => decode_data_in
      );
   U_0 : REG16
      PORT MAP (
         RESET_L => RESET_L,
         A       => pc,
         EN      => load_fetch_decode_pipe,
         CLK     => CLK,
         F       => decode_pc
      );
   U_1 : REG16
      PORT MAP (
         RESET_L => RESET_L,
         A       => fetch_instr,
         EN      => load_fetch_decode_pipe,
         CLK     => CLK,
         F       => decode_instr
      );

END struct;
