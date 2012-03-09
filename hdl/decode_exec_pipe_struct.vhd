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
      CLK             : IN     std_logic;
      RESET_L         : IN     STD_LOGIC;
      decode_instr    : IN     LC3b_word;
      decode_opcode   : IN     LC3b_opcode;
      decode_pc       : IN     LC3b_word;
      decode_ready    : IN     std_logic;
      decode_regwrite : IN     std_logic;
      decode_src_a    : IN     LC3b_word;
      decode_src_b    : IN     LC3b_word;
      exec_instr      : OUT    LC3b_word;
      exec_opcode     : OUT    LC3b_opcode;
      exec_pc         : OUT    LC3b_word;
      exec_regwrite   : OUT    STD_LOGIC;
      exec_src_a      : OUT    LC3b_word;
      exec_src_b      : OUT    LC3b_word
   );

-- Declarations

END decode_exec_pipe ;

--
-- VHDL Architecture ece411.decode_exec_pipe.struct
--
-- Created:
--          by - wheele11.ews (gelib-057-07.ews.illinois.edu)
--          at - 19:08:54 03/08/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY mp3lib;

ARCHITECTURE struct OF decode_exec_pipe IS

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
   FOR ALL : REG4 USE ENTITY mp3lib.REG4;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   U_5 : REG1
      PORT MAP (
         RESET_L => RESET_L,
         A       => decode_regwrite,
         EN      => decode_ready,
         CLK     => CLK,
         F       => exec_regwrite
      );
   U_0 : REG16
      PORT MAP (
         RESET_L => RESET_L,
         A       => decode_src_a,
         EN      => decode_ready,
         CLK     => CLK,
         F       => exec_src_a
      );
   U_1 : REG16
      PORT MAP (
         RESET_L => RESET_L,
         A       => decode_src_b,
         EN      => decode_ready,
         CLK     => CLK,
         F       => exec_src_b
      );
   U_2 : REG16
      PORT MAP (
         RESET_L => RESET_L,
         A       => decode_pc,
         EN      => decode_ready,
         CLK     => CLK,
         F       => exec_pc
      );
   U_3 : REG16
      PORT MAP (
         RESET_L => RESET_L,
         A       => decode_instr,
         EN      => decode_ready,
         CLK     => CLK,
         F       => exec_instr
      );
   U_4 : REG4
      PORT MAP (
         RESET_L => RESET_L,
         A       => decode_opcode,
         EN      => decode_ready,
         CLK     => CLK,
         F       => exec_opcode
      );

END struct;
