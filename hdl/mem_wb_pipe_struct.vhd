-- VHDL Entity ece411.mem_wb_pipe.interface
--
-- Created:
--          by - goldste6.ews (gelib-057-26.ews.illinois.edu)
--          at - 19:48:28 03/13/12
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
      mem_aluout       : IN     LC3B_WORD;
      mem_data_in      : IN     LC3B_WORD;
      mem_dr           : IN     LC3B_REG;
      mem_instr        : IN     LC3b_word;
      mem_opcode       : IN     LC3b_opcode;
      mem_pc           : IN     LC3b_word;
      mem_read         : IN     std_logic;
      mem_ready        : IN     STD_LOGIC;
      mem_regwrite     : IN     STD_LOGIC;
      mem_set_cc       : IN     std_logic;
      mem_src_a        : IN     LC3b_word;
      mem_src_b        : IN     LC3b_word;
      mem_write_byte   : IN     std_logic;
      mem_write_word   : IN     std_logic;
      wb_aluout        : OUT    LC3b_word;
      wb_data_in       : OUT    LC3b_word;
      wb_dr            : OUT    LC3B_REG;
      wb_instr         : OUT    LC3b_word;
      wb_mread         : OUT    std_logic;
      wb_opcode        : OUT    LC3b_opcode;
      wb_pc            : OUT    LC3b_word;
      wb_regwrite      : OUT    STD_LOGIC;
      wb_set_cc        : OUT    std_logic;
      wb_src_a         : OUT    LC3b_word;
      wb_src_b         : OUT    LC3b_word
   );

-- Declarations

END mem_wb_pipe ;

--
-- VHDL Architecture ece411.mem_wb_pipe.struct
--
-- Created:
--          by - goldste6.ews (gelib-057-26.ews.illinois.edu)
--          at - 19:48:28 03/13/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY mp3lib;

ARCHITECTURE struct OF mem_wb_pipe IS

   -- Architecture declarations

   -- Internal signal declarations


   -- Component Declarations
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
   COMPONENT REG3
   PORT (
      RESET_L : IN     STD_LOGIC ;
      A       : IN     STD_LOGIC_VECTOR (2 DOWNTO 0);
      EN      : IN     STD_LOGIC ;
      CLK     : IN     STD_LOGIC ;
      F       : OUT    STD_LOGIC_VECTOR (2 DOWNTO 0)
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
   FOR ALL : REG1 USE ENTITY mp3lib.REG1;
   FOR ALL : REG16 USE ENTITY mp3lib.REG16;
   FOR ALL : REG3 USE ENTITY mp3lib.REG3;
   FOR ALL : REG4 USE ENTITY mp3lib.REG4;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
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
   U_0 : REG16
      PORT MAP (
         RESET_L => RESET_L,
         A       => mem_src_a,
         EN      => load_mem_wb_pipe,
         CLK     => CLK,
         F       => wb_src_a
      );
   U_1 : REG16
      PORT MAP (
         RESET_L => RESET_L,
         A       => mem_src_b,
         EN      => load_mem_wb_pipe,
         CLK     => CLK,
         F       => wb_src_b
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
   U_9 : REG16
      PORT MAP (
         RESET_L => RESET_L,
         A       => mem_data_in,
         EN      => load_mem_wb_pipe,
         CLK     => CLK,
         F       => wb_data_in
      );
   U_10 : REG16
      PORT MAP (
         RESET_L => RESET_L,
         A       => mem_aluout,
         EN      => load_mem_wb_pipe,
         CLK     => CLK,
         F       => wb_aluout
      );
   U_6 : REG3
      PORT MAP (
         RESET_L => RESET_L,
         A       => mem_dr,
         EN      => load_mem_wb_pipe,
         CLK     => CLK,
         F       => wb_dr
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
