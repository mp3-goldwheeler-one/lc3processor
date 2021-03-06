-- VHDL Entity ece411.TristateMux4_N.symbol
--
-- Created:
--          at - 03:39:57 04/25/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY TristateMux4_N IS
   GENERIC( 
      n : integer := 16
   );
   PORT( 
      A   : IN     std_logic_vector (n-1 DOWNTO 0);
      B   : IN     std_logic_vector ( n-1 DOWNTO 0 );
      C   : IN     std_logic_vector ( n-1 DOWNTO 0 );
      D   : IN     std_logic_vector ( n-1 DOWNTO 0 );
      Sel : IN     std_logic_vector ( 3  DOWNTO  0 );
      F   : OUT    std_logic_vector (n-1 DOWNTO 0)
   );

-- Declarations

END TristateMux4_N ;

--
-- VHDL Architecture ece411.TristateMux4_N.struct
--
-- Created:
--          by - goldste6.ews (gelib-057-21.ews.illinois.edu)
--          at - 03:39:58 04/25/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY mp3lib;

ARCHITECTURE struct OF TristateMux4_N IS

   -- Architecture declarations

   -- Internal signal declarations


   -- Component Declarations
   COMPONENT TRISTATE1_H
   PORT (
      A  : IN     STD_LOGIC ;
      EN : IN     STD_LOGIC ;
      F  : OUT    STD_LOGIC 
   );
   END COMPONENT;


BEGIN

   -- Instance port mappings.

   g0: FOR i IN 0 TO n-1 GENERATE
   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR U_3 : TRISTATE1_H USE ENTITY mp3lib.TRISTATE1_H;
   -- pragma synthesis_on

   BEGIN
      U_3 : TRISTATE1_H
         PORT MAP (
            A  => A(i),
            EN => Sel(0),
            F  => F(i)
         );
   END GENERATE g0;

   g1: FOR i IN 0 TO n-1 GENERATE
   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR U_4 : TRISTATE1_H USE ENTITY mp3lib.TRISTATE1_H;
   -- pragma synthesis_on

   BEGIN
      U_4 : TRISTATE1_H
         PORT MAP (
            A  => B(i),
            EN => Sel(1),
            F  => F(i)
         );
   END GENERATE g1;

   g2: FOR i IN 0 TO n-1 GENERATE
   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR U_5 : TRISTATE1_H USE ENTITY mp3lib.TRISTATE1_H;
   -- pragma synthesis_on

   BEGIN
      U_5 : TRISTATE1_H
         PORT MAP (
            A  => C(i),
            EN => Sel(2),
            F  => F(i)
         );
   END GENERATE g2;

   g3: FOR i IN 0 TO n-1 GENERATE
   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR U_6 : TRISTATE1_H USE ENTITY mp3lib.TRISTATE1_H;
   -- pragma synthesis_on

   BEGIN
      U_6 : TRISTATE1_H
         PORT MAP (
            A  => D(i),
            EN => Sel(3),
            F  => F(i)
         );
   END GENERATE g3;

END struct;
