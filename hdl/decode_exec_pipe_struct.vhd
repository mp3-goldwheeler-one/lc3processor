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
      CLK                    : IN     std_logic;
      RESET_L                : IN     STD_LOGIC;
      decode_uop_control_out : IN     control_word;
      decode_uop_data_out    : IN     pipe_data;
      exec_insert_bubble     : IN     STD_LOGIC;
      load_decode_exec_pipe  : IN     STD_LOGIC;
      exec_control           : OUT    control_word;
      exec_control_in        : OUT    exec_control_word;
      exec_data_in           : OUT    pipe_data
   );

-- Declarations

END decode_exec_pipe ;

--
-- VHDL Architecture ece411.decode_exec_pipe.struct
--
-- Created:
--          by - goldste6.ews (evrt-252-06.ews.illinois.edu)
--          at - 16:41:41 04/18/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY ece411;

ARCHITECTURE struct OF decode_exec_pipe IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL decode_control_selected : control_word;
   SIGNAL exec_control_buffer     : control_word;
   SIGNAL stall_control_out       : control_word;


   -- Component Declarations
   COMPONENT MUX2_ControlWord
   PORT (
      A   : IN     control_word ;
      B   : IN     control_word ;
      SEL : IN     STD_LOGIC ;
      F   : OUT    control_word 
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
   FOR ALL : RegControl USE ENTITY ece411.RegControl;
   FOR ALL : RegData USE ENTITY ece411.RegData;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 2 eb2
   exec_control <= exec_control_buffer;
   exec_control_in <= exec_control_buffer.exec;
   
   stall_control_out <= default_control_word;


   -- Instance port mappings.
   U_11 : MUX2_ControlWord
      PORT MAP (
         A   => decode_uop_control_out,
         B   => stall_control_out,
         SEL => exec_insert_bubble,
         F   => decode_control_selected
      );
   U_6 : RegControl
      PORT MAP (
         RESET_L => RESET_L,
         A       => decode_control_selected,
         EN      => load_decode_exec_pipe,
         CLK     => CLK,
         F       => exec_control_buffer
      );
   aRegData1 : RegData
      PORT MAP (
         RESET_L => RESET_L,
         A       => decode_uop_data_out,
         EN      => load_decode_exec_pipe,
         CLK     => CLK,
         F       => exec_data_in
      );

END struct;
