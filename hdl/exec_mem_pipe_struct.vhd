-- VHDL Entity ece411.exec_mem_pipe.interface
--
-- Created:
--          by - wheele11.ews (gelib-057-06.ews.illinois.edu)
--          at - 19:53:50 03/09/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY exec_mem_pipe IS
   PORT( 
      CLK             : IN     std_logic;
      RESET_L         : IN     STD_LOGIC;
      exec_alumux_sel : IN     LC3b_4mux_sel;
      exec_aluop      : IN     LC3B_ALUOP;
      exec_aluout     : IN     LC3B_WORD;
      exec_dr         : IN     LC3B_REG;
      exec_instr      : IN     LC3b_word;
      exec_opcode     : IN     LC3b_opcode;
      exec_pc         : IN     LC3b_word;
      exec_ready      : IN     std_logic;
      exec_regwrite   : IN     STD_LOGIC;
      exec_shift_imm  : IN     STD_LOGIC;
      exec_src_a      : IN     LC3b_word;
      exec_src_b      : IN     LC3b_word;
      jump_pc         : OUT    LC3B_WORD;
      load_jump_pc    : OUT    STD_LOGIC;
      mem_aluout      : OUT    LC3B_WORD;
      mem_dr          : OUT    LC3B_REG;
      mem_instr       : OUT    LC3b_word;
      mem_opcode      : OUT    LC3b_opcode;
      mem_pc          : OUT    LC3b_word;
      mem_regwrite    : OUT    STD_LOGIC;
      mem_src_a       : OUT    LC3b_word;
      mem_src_b       : OUT    LC3b_word
   );

-- Declarations

END exec_mem_pipe ;

--
-- VHDL Architecture ece411.exec_mem_pipe.struct
--
-- Created:
--          by - wheele11.ews (gelib-057-06.ews.illinois.edu)
--          at - 19:53:50 03/09/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY mp3lib;

ARCHITECTURE struct OF exec_mem_pipe IS

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
         A       => exec_regwrite,
         EN      => exec_ready,
         CLK     => CLK,
         F       => mem_regwrite
      );
   U_0 : REG16
      PORT MAP (
         RESET_L => RESET_L,
         A       => exec_src_a,
         EN      => exec_ready,
         CLK     => CLK,
         F       => mem_src_a
      );
   U_1 : REG16
      PORT MAP (
         RESET_L => RESET_L,
         A       => exec_src_b,
         EN      => exec_ready,
         CLK     => CLK,
         F       => mem_src_b
      );
   U_2 : REG16
      PORT MAP (
         RESET_L => RESET_L,
         A       => exec_pc,
         EN      => exec_ready,
         CLK     => CLK,
         F       => mem_pc
      );
   U_3 : REG16
      PORT MAP (
         RESET_L => RESET_L,
         A       => exec_instr,
         EN      => exec_ready,
         CLK     => CLK,
         F       => mem_instr
      );
   U_10 : REG16
      PORT MAP (
         RESET_L => RESET_L,
         A       => exec_aluout,
         EN      => exec_ready,
         CLK     => CLK,
         F       => mem_aluout
      );
   U_6 : REG3
      PORT MAP (
         RESET_L => RESET_L,
         A       => exec_dr,
         EN      => exec_ready,
         CLK     => CLK,
         F       => mem_dr
      );
   U_4 : REG4
      PORT MAP (
         RESET_L => RESET_L,
         A       => exec_opcode,
         EN      => exec_ready,
         CLK     => CLK,
         F       => mem_opcode
      );

END struct;
