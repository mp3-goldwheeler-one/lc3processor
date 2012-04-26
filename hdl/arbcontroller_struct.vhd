-- VHDL Entity ece411.ArbController.interface
--
-- Created:
--          by - one1.ews (gelib-057-16.ews.illinois.edu)
--          at - 18:26:21 04/26/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ArbController IS
   PORT( 
      D_ACCESS         : IN     STD_LOGIC;
      I_ACCESS         : IN     STD_LOGIC;
      MRESP_H          : IN     STD_LOGIC;
      RESET_L          : IN     STD_LOGIC;
      ArbiterSel       : OUT    STD_LOGIC;
      in_data_access_l : BUFFER std_logic;
      in_inst_access_l : BUFFER std_logic
   );

-- Declarations

END ArbController ;

--
-- VHDL Architecture ece411.ArbController.struct
--
-- Created:
--          by - one1.ews (gelib-057-16.ews.illinois.edu)
--          at - 18:26:21 04/26/12
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

ARCHITECTURE struct OF ArbController IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL F1 : STD_LOGIC;
   SIGNAL F2 : STD_LOGIC;
   SIGNAL F3 : STD_LOGIC;
   SIGNAL F4 : STD_LOGIC;
   SIGNAL F5 : STD_LOGIC;
   SIGNAL F6 : STD_LOGIC;


   -- Component Declarations
   COMPONENT semiasynch_ff
   PORT (
      asynch_reset_l        : IN     STD_LOGIC ;
      asynch_set_l          : IN     STD_LOGIC ;
      sync_falling_edge_set : IN     STD_LOGIC ;
      Q                     : OUT    STD_LOGIC ;
      Qbar                  : OUT    STD_LOGIC 
   );
   END COMPONENT;
   COMPONENT AND2
   PORT (
      A : IN     STD_LOGIC ;
      B : IN     STD_LOGIC ;
      F : OUT    STD_LOGIC 
   );
   END COMPONENT;
   COMPONENT NAND2
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

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : AND2 USE ENTITY mp3lib.AND2;
   FOR ALL : NAND2 USE ENTITY mp3lib.NAND2;
   FOR ALL : NOT1 USE ENTITY mp3lib.NOT1;
   FOR ALL : semiasynch_ff USE ENTITY ece411.semiasynch_ff;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   ArbiterSel <= in_data_access_l;


   -- Instance port mappings.
   U_2 : semiasynch_ff
      PORT MAP (
         asynch_reset_l        => F2,
         asynch_set_l          => RESET_L,
         sync_falling_edge_set => MRESP_H,
         Q                     => in_data_access_l,
         Qbar                  => OPEN
      );
   U_3 : semiasynch_ff
      PORT MAP (
         asynch_reset_l        => F5,
         asynch_set_l          => RESET_L,
         sync_falling_edge_set => MRESP_H,
         Q                     => in_inst_access_l,
         Qbar                  => OPEN
      );
   U_4 : AND2
      PORT MAP (
         A => in_inst_access_l,
         B => D_ACCESS,
         F => F1
      );
   U_7 : AND2
      PORT MAP (
         A => F6,
         B => I_ACCESS,
         F => F4
      );
   U_8 : AND2
      PORT MAP (
         A => in_data_access_l,
         B => in_inst_access_l,
         F => F3
      );
   U_5 : NAND2
      PORT MAP (
         A => in_data_access_l,
         B => F1,
         F => F2
      );
   U_9 : NAND2
      PORT MAP (
         A => F4,
         B => F3,
         F => F5
      );
   U_0 : NOT1
      PORT MAP (
         A => D_ACCESS,
         F => F6
      );

END struct;
