-- VHDL Entity ece411.Decode3to8.symbol
--
-- Created:
--          by - goldste6.ews (gelib-057-21.ews.illinois.edu)
--          at - 03:57:12 04/25/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Decode3to8 IS
   PORT( 
      input  : IN     std_logic_vector (2 DOWNTO 0);
      output : OUT    std_logic_vector (7 DOWNTO 0)
   );

-- Declarations

END Decode3to8 ;

--
-- VHDL Architecture ece411.Decode3to8.struct
--
-- Created:
--          by - goldste6.ews (gelib-057-21.ews.illinois.edu)
--          at - 03:57:12 04/25/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY mp3lib;

ARCHITECTURE struct OF Decode3to8 IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL bit0_L : STD_LOGIC;
   SIGNAL bit1_L : STD_LOGIC;
   SIGNAL bit2_L : STD_LOGIC;


   -- Component Declarations
   COMPONENT AND3
   PORT (
      A : IN     STD_LOGIC ;
      B : IN     STD_LOGIC ;
      C : IN     STD_LOGIC ;
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
   FOR ALL : AND3 USE ENTITY mp3lib.AND3;
   FOR ALL : NOT1 USE ENTITY mp3lib.NOT1;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   U_0 : AND3
      PORT MAP (
         A => bit0_L,
         B => bit1_L,
         C => input(2),
         F => output(4)
      );
   U_1 : AND3
      PORT MAP (
         A => input(0),
         B => bit1_L,
         C => input(2),
         F => output(5)
      );
   U_3 : AND3
      PORT MAP (
         A => bit0_L,
         B => input(1),
         C => input(2),
         F => output(6)
      );
   U_4 : AND3
      PORT MAP (
         A => input(0),
         B => input(1),
         C => bit2_L,
         F => output(3)
      );
   U_5 : AND3
      PORT MAP (
         A => bit0_L,
         B => input(1),
         C => bit2_L,
         F => output(2)
      );
   U_6 : AND3
      PORT MAP (
         A => input(0),
         B => input(1),
         C => input(2),
         F => output(7)
      );
   U_7 : AND3
      PORT MAP (
         A => input(0),
         B => bit1_L,
         C => bit2_L,
         F => output(1)
      );
   U_8 : AND3
      PORT MAP (
         A => bit0_L,
         B => bit1_L,
         C => bit2_L,
         F => output(0)
      );
   U_2 : NOT1
      PORT MAP (
         A => input(0),
         F => bit0_L
      );
   U_9 : NOT1
      PORT MAP (
         A => input(1),
         F => bit1_L
      );
   U_10 : NOT1
      PORT MAP (
         A => input(2),
         F => bit2_L
      );

END struct;
