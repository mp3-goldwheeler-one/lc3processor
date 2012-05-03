-- VHDL Entity ece411.PDataCombiner.symbol
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY PDataCombiner IS
   PORT( 
      MWRITE_L : IN     std_logic;
      OWordIn  : IN     LC3b_oword;
      Offset   : IN     LC3b_L2_C_Offset;
      PWordIn  : IN     LC3b_pword;
      PWordOut : OUT    LC3b_pword
   );

-- Declarations

END PDataCombiner ;

--
-- VHDL Architecture ece411.PDataCombiner.struct
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY ece411;

ARCHITECTURE struct OF PDataCombiner IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL MWRITE_H : std_logic;
   SIGNAL oword0   : LC3b_oword;
   SIGNAL oword1   : LC3b_oword;


   -- Component Declarations
   COMPONENT NOT1
   PORT (
      A : IN     std_logic ;
      Y : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT OWordCombiner
   PORT (
      MWRITE_H : IN     std_logic ;
      OWordIn  : IN     LC3b_oword ;
      Offset   : IN     LC3b_L2_C_Offset ;
      oword0   : IN     LC3b_oword ;
      oword1   : IN     LC3b_oword ;
      PWordOut : OUT    LC3b_pword 
   );
   END COMPONENT;
   COMPONENT PWordSplitter
   PORT (
      PWordIn : IN     LC3b_pword ;
      oword0  : OUT    LC3b_oword ;
      oword1  : OUT    LC3b_oword 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : NOT1 USE ENTITY ece411.NOT1;
   FOR ALL : OWordCombiner USE ENTITY ece411.OWordCombiner;
   FOR ALL : PWordSplitter USE ENTITY ece411.PWordSplitter;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   U_1 : NOT1
      PORT MAP (
         A => MWRITE_L,
         Y => MWRITE_H
      );
   U_0 : OWordCombiner
      PORT MAP (
         MWRITE_H => MWRITE_H,
         OWordIn  => OWordIn,
         Offset   => Offset,
         oword0   => oword0,
         oword1   => oword1,
         PWordOut => PWordOut
      );
   aSplitter : PWordSplitter
      PORT MAP (
         PWordIn => PWordIn,
         oword0  => oword0,
         oword1  => oword1
      );

END struct;