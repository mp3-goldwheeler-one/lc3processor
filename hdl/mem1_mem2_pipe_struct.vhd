-- VHDL Entity ece411.mem1_mem2_pipe.interface
--
-- Created:
--          by - goldste6.ews (gelib-057-18.ews.illinois.edu)
--          at - 02:03:29 04/24/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY mem1_mem2_pipe IS
   PORT( 
      CLK                        : IN     std_logic;
      RESET_L                    : IN     STD_LOGIC;
      dcache_interstage_data_in  : IN     LC3b_cache_interstage_data;
      load_mem1_mem2_pipe        : IN     std_logic;
      mem1_control               : IN     control_word;
      mem1_data_out              : IN     pipe_data;
      mem2_insert_bubble         : IN     std_logic;
      dcache_interstage_data_out : OUT    LC3b_cache_interstage_data;
      mem2_control               : OUT    control_word;
      mem2_control_in            : OUT    mem_control_word;
      mem2_data_in               : OUT    pipe_data;
      wb_control_in              : OUT    wb_control_word
   );

-- Declarations

END mem1_mem2_pipe ;

--
-- VHDL Architecture ece411.mem1_mem2_pipe.struct
--
-- Created:
--          by - goldste6.ews (gelib-057-18.ews.illinois.edu)
--          at - 02:03:30 04/24/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY ece411;

ARCHITECTURE struct OF mem1_mem2_pipe IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL bubble_control_out  : control_word;
   SIGNAL mem2_control_buffer : control_word;
   SIGNAL selected_control    : control_word;


   -- Component Declarations
   COMPONENT MUX2_ControlWord
   PORT (
      A   : IN     control_word ;
      B   : IN     control_word ;
      SEL : IN     STD_LOGIC ;
      F   : OUT    control_word 
   );
   END COMPONENT;
   COMPONENT RegCacheInterstageData
   PORT (
      RESET_L : IN     STD_LOGIC ;
      A       : IN     LC3b_cache_interstage_data ;
      EN      : IN     STD_LOGIC ;
      CLK     : IN     std_logic ;
      F       : OUT    LC3b_cache_interstage_data 
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
   COMPONENT RegData
   PORT (
      RESET_L : IN     STD_LOGIC ;
      A       : IN     pipe_data ;
      EN      : IN     STD_LOGIC ;
      CLK     : IN     std_logic ;
      F       : OUT    pipe_data 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : MUX2_ControlWord USE ENTITY ece411.MUX2_ControlWord;
   FOR ALL : RegCacheInterstageData USE ENTITY ece411.RegCacheInterstageData;
   FOR ALL : RegControl USE ENTITY ece411.RegControl;
   FOR ALL : RegData USE ENTITY ece411.RegData;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   mem2_control    <= mem2_control_buffer;
   mem2_control_in <= mem2_control_buffer.mem;
   wb_control_in    <= mem2_control_buffer.wb;
   
   bubble_control_out <= default_control_word;


   -- Instance port mappings.
   U_3 : MUX2_ControlWord
      PORT MAP (
         A   => mem1_control,
         B   => bubble_control_out,
         SEL => mem2_insert_bubble,
         F   => selected_control
      );
   U_0 : RegCacheInterstageData
      PORT MAP (
         RESET_L => RESET_L,
         A       => dcache_interstage_data_in,
         EN      => load_mem1_mem2_pipe,
         CLK     => CLK,
         F       => dcache_interstage_data_out
      );
   U_1 : RegControl
      PORT MAP (
         RESET_L => RESET_L,
         A       => selected_control,
         EN      => load_mem1_mem2_pipe,
         CLK     => CLK,
         F       => mem2_control_buffer
      );
   U_2 : RegData
      PORT MAP (
         RESET_L => RESET_L,
         A       => mem1_data_out,
         EN      => load_mem1_mem2_pipe,
         CLK     => CLK,
         F       => mem2_data_in
      );

END struct;
