-- VHDL Entity ece411.semiasynch_ff.symbol
--
-- Created:
--          by - goldste6.ews (gelib-057-19.ews.illinois.edu)
--          at - 21:10:57 04/15/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY semiasynch_ff IS
   PORT( 
      asynch_reset_l : IN     STD_LOGIC;
      asynch_set_l   : IN     STD_LOGIC;
      clk            : IN     STD_LOGIC;
      synch_set      : IN     STD_LOGIC;
      Q              : OUT    STD_LOGIC;
      Qbar           : OUT    STD_LOGIC
   );

-- Declarations

END semiasynch_ff ;

--
-- VHDL Architecture ece411.semiasynch_ff.struct
--
-- Created:
--          by - goldste6.ews (gelib-057-19.ews.illinois.edu)
--          at - 21:10:57 04/15/12
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

ARCHITECTURE struct OF semiasynch_ff IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL A  : STD_LOGIC;
   SIGNAL B  : STD_LOGIC;
   SIGNAL B2 : STD_LOGIC;
   SIGNAL F  : STD_LOGIC;
   SIGNAL F1 : STD_LOGIC;
   SIGNAL F4 : STD_LOGIC;

   -- Implicit buffer signal declarations
   SIGNAL Q_internal    : STD_LOGIC;
   SIGNAL Qbar_internal : STD_LOGIC;


   -- Component Declarations
   COMPONENT NOT1
   PORT (
      A : IN     std_logic ;
      Y : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT NAND2
   PORT (
      A : IN     STD_LOGIC ;
      B : IN     STD_LOGIC ;
      F : OUT    STD_LOGIC 
   );
   END COMPONENT;
   COMPONENT NAND3
   PORT (
      A : IN     STD_LOGIC ;
      B : IN     STD_LOGIC ;
      C : IN     STD_LOGIC ;
      F : OUT    STD_LOGIC 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : NAND2 USE ENTITY mp3lib.NAND2;
   FOR ALL : NAND3 USE ENTITY mp3lib.NAND3;
   FOR ALL : NOT1 USE ENTITY ece411.NOT1;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   U_9 : NOT1
      PORT MAP (
         A => clk,
         Y => B2
      );
   U_2 : NAND2
      PORT MAP (
         A => A,
         B => clk,
         F => F
      );
   U_3 : NAND2
      PORT MAP (
         A => clk,
         B => B,
         F => F1
      );
   U_5 : NAND2
      PORT MAP (
         A => A,
         B => asynch_reset_l,
         F => B
      );
   U_7 : NAND2
      PORT MAP (
         A => synch_set,
         B => B2,
         F => F4
      );
   U_0 : NAND3
      PORT MAP (
         A => Q_internal,
         B => F1,
         C => asynch_reset_l,
         F => Qbar_internal
      );
   U_1 : NAND3
      PORT MAP (
         A => asynch_set_l,
         B => F,
         C => Qbar_internal,
         F => Q_internal
      );
   U_4 : NAND3
      PORT MAP (
         A => asynch_set_l,
         B => F4,
         C => B,
         F => A
      );

   -- Implicit buffered output assignments
   Q    <= Q_internal;
   Qbar <= Qbar_internal;

END struct;