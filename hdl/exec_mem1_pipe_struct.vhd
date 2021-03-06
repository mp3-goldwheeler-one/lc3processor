-- VHDL Entity ece411.exec_mem1_pipe.interface
--
-- Created:
--          by - goldste6.ews (linux6.ews.illinois.edu)
--          at - 18:14:46 04/26/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY exec_mem1_pipe IS
   PORT( 
      CLK                 : IN     std_logic;
      RESET_L             : IN     STD_LOGIC;
      exec_control        : IN     control_word;
      exec_data_out       : IN     pipe_data;
      load_exec_mem1_pipe : IN     STD_LOGIC;
      mem1_insert_bubble  : IN     LC3B_TRISTATE_2MUX_SEL;
      mem1_control        : OUT    control_word;
      mem1_control_in     : OUT    mem_control_word;
      mem1_data_in        : OUT    pipe_data
   );

-- Declarations

END exec_mem1_pipe ;

--
-- VHDL Architecture ece411.exec_mem1_pipe.struct
--
-- Created:
--          by - goldste6.ews (linux6.ews.illinois.edu)
--          at - 18:14:46 04/26/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY ece411;

ARCHITECTURE struct OF exec_mem1_pipe IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL bubble_control_out    : control_word;
   SIGNAL mem1_control_selected : control_word;
   SIGNAL mem_control_buffer    : control_word;


   -- Component Declarations
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
   COMPONENT TristateMux2_controlword
   PORT (
      A   : IN     control_word ;
      B   : IN     control_word ;
      sel : IN     LC3b_TRISTATE_2MUX_SEL ;
      F   : OUT    control_word 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : RegControl USE ENTITY ece411.RegControl;
   FOR ALL : RegData USE ENTITY ece411.RegData;
   FOR ALL : TristateMux2_controlword USE ENTITY ece411.TristateMux2_controlword;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   mem1_control <= mem_control_buffer;
   mem1_control_in <= mem_control_buffer.mem;
   bubble_control_out <= default_control_word;


   -- Instance port mappings.
   U_6 : RegControl
      PORT MAP (
         RESET_L => RESET_L,
         A       => mem1_control_selected,
         EN      => load_exec_mem1_pipe,
         CLK     => CLK,
         F       => mem_control_buffer
      );
   aRegData1 : RegData
      PORT MAP (
         RESET_L => RESET_L,
         A       => exec_data_out,
         EN      => load_exec_mem1_pipe,
         CLK     => CLK,
         F       => mem1_data_in
      );
   U_0 : TristateMux2_controlword
      PORT MAP (
         A   => exec_control,
         B   => bubble_control_out,
         sel => mem1_insert_bubble,
         F   => mem1_control_selected
      );

END struct;
