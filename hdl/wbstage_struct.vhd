-- VHDL Entity ece411.wbStage.interface
--
-- Created:
--          by - wheele11.ews (gelib-057-06.ews.illinois.edu)
--          at - 00:51:01 03/16/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY wbStage IS
   PORT( 
      CLK         : IN     std_logic;
      wb_aluout   : IN     LC3b_word;
      wb_data_in  : IN     LC3b_word;
      wb_data_in1 : IN     pipe_data;
      wb_dr       : IN     LC3B_REG;
      wb_instr    : IN     LC3b_word;
      wb_mread    : IN     std_logic;
      wb_opcode   : IN     LC3b_opcode;
      wb_pc       : IN     LC3b_word;
      wb_regwrite : IN     STD_LOGIC;
      wb_set_cc   : IN     std_logic;
      wb_cc       : OUT    LC3b_cc;
      wb_dest     : OUT    LC3B_REG;
      wb_din      : OUT    LC3B_WORD;
      wb_load_cc  : OUT    std_logic;
      wb_rw       : OUT    STD_LOGIC
   );

-- Declarations

END wbStage ;

--
-- VHDL Architecture ece411.wbStage.struct
--
-- Created:
--          by - wheele11.ews (gelib-057-06.ews.illinois.edu)
--          at - 00:51:01 03/16/12
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

ARCHITECTURE struct OF wbStage IS

   -- Architecture declarations

   -- Internal signal declarations

   -- Implicit buffer signal declarations
   SIGNAL wb_din_internal : LC3B_WORD;


   -- Component Declarations
   COMPONENT GenCC
   PORT (
      Input  : IN     LC3b_word ;
      Output : OUT    LC3b_cc 
   );
   END COMPONENT;
   COMPONENT MUX2_16
   PORT (
      A   : IN     LC3B_WORD ;
      B   : IN     LC3B_WORD ;
      SEL : IN     STD_LOGIC ;
      F   : OUT    LC3B_WORD 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : GenCC USE ENTITY ece411.GenCC;
   FOR ALL : MUX2_16 USE ENTITY mp3lib.MUX2_16;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   wb_dest    <= wb_dr;
   wb_rw      <= wb_regwrite;
   wb_load_cc <= wb_set_cc;


   -- Instance port mappings.
   theGenCC : GenCC
      PORT MAP (
         Input  => wb_din_internal,
         Output => wb_cc
      );
   U_0 : MUX2_16
      PORT MAP (
         A   => wb_aluout,
         B   => wb_data_in,
         SEL => wb_mread,
         F   => wb_din_internal
      );

   -- Implicit buffered output assignments
   wb_din <= wb_din_internal;

END struct;
