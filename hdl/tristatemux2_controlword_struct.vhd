-- VHDL Entity ece411.TristateMux2_controlword.symbol
--
-- Created:
--          by - goldste6.ews (linux6.ews.illinois.edu)
--          at - 18:14:45 04/26/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY TristateMux2_controlword IS
   PORT( 
      A   : IN     control_word;
      B   : IN     control_word;
      sel : IN     LC3b_TRISTATE_2MUX_SEL;
      F   : OUT    control_word
   );

-- Declarations

END TristateMux2_controlword ;

--
-- VHDL Architecture ece411.TristateMux2_controlword.struct
--
-- Created:
--          by - goldste6.ews (linux6.ews.illinois.edu)
--          at - 18:14:45 04/26/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY ece411;

ARCHITECTURE struct OF TristateMux2_controlword IS

   -- Architecture declarations

   -- Internal signal declarations


   -- Component Declarations
   COMPONENT TRISTATE_H_controlword
   PORT (
      A  : IN     control_word ;
      EN : IN     STD_LOGIC ;
      F  : OUT    control_word 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : TRISTATE_H_controlword USE ENTITY ece411.TRISTATE_H_controlword;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   U_0 : TRISTATE_H_controlword
      PORT MAP (
         A  => A,
         EN => sel(0),
         F  => F
      );
   U_1 : TRISTATE_H_controlword
      PORT MAP (
         A  => B,
         EN => sel(1),
         F  => F
      );

END struct;