-- VHDL Entity ece411.uarch_pipe.interface
--
-- Created:
--          by - goldste6.ews (linux6.ews.illinois.edu)
--          at - 17:32:55 04/26/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY uarch_pipe IS
   PORT( 
      CLK                   : IN     std_logic;
      RESET_L               : IN     STD_LOGIC;
      load_uarch_pipe       : IN     std_logic;
      uarch_control_out     : IN     control_word;
      uarch_data_out        : IN     pipe_data;
      uarch_insert_bubble   : IN     std_logic;
      uarch_sel_out         : IN     STD_LOGIC;
      uarch_stall_in_buffer : IN     std_logic;
      uarch_control_in      : OUT    control_word;
      uarch_data_in         : OUT    pipe_data;
      uarch_sel_in          : OUT    STD_LOGIC;
      uarch_stall_in        : OUT    std_logic
   );

-- Declarations

END uarch_pipe ;

--
-- VHDL Architecture ece411.uarch_pipe.struct
--
-- Created:
--          by - goldste6.ews (linux6.ews.illinois.edu)
--          at - 17:32:55 04/26/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY mp3lib;

ARCHITECTURE struct OF uarch_pipe IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL F                     : STD_LOGIC;
   SIGNAL F1                    : STD_LOGIC;
   SIGNAL F2                    : STD_LOGIC;
   SIGNAL uarch_insert_bubble_l : std_logic;

   -- Implicit buffer signal declarations
   SIGNAL uarch_stall_in_internal : std_logic;


   -- Component Declarations
   COMPONENT AND2
   PORT (
      A : IN     STD_LOGIC ;
      B : IN     STD_LOGIC ;
      F : OUT    STD_LOGIC 
   );
   END COMPONENT;
   COMPONENT NOT1
   PORT (
      A : IN     STD_LOGIC ;
      F : OUT    STD_LOGIC 
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

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : AND2 USE ENTITY mp3lib.AND2;
   FOR ALL : NOT1 USE ENTITY mp3lib.NOT1;
   FOR ALL : REG1 USE ENTITY mp3lib.REG1;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   uarch_data_in    <= uarch_data_out;
   uarch_control_in <= uarch_control_out;


   -- Instance port mappings.
   U_0 : AND2
      PORT MAP (
         A => uarch_insert_bubble_l,
         B => uarch_sel_out,
         F => F1
      );
   U_1 : AND2
      PORT MAP (
         A => uarch_insert_bubble_l,
         B => uarch_stall_in_buffer,
         F => F2
      );
   U_4 : AND2
      PORT MAP (
         A => F,
         B => uarch_stall_in_internal,
         F => uarch_sel_in
      );
   U_5 : NOT1
      PORT MAP (
         A => uarch_insert_bubble,
         F => uarch_insert_bubble_l
      );
   U_2 : REG1
      PORT MAP (
         RESET_L => RESET_L,
         A       => F1,
         EN      => load_uarch_pipe,
         CLK     => CLK,
         F       => F
      );
   U_3 : REG1
      PORT MAP (
         RESET_L => RESET_L,
         A       => F2,
         EN      => load_uarch_pipe,
         CLK     => CLK,
         F       => uarch_stall_in_internal
      );

   -- Implicit buffered output assignments
   uarch_stall_in <= uarch_stall_in_internal;

END struct;
