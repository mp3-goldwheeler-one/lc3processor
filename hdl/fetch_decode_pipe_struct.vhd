-- VHDL Entity ece411.fetch_decode_pipe.interface
--
-- Created:
--          by - wheele11.ews (gelib-057-27.ews.illinois.edu)
--          at - 20:17:34 04/11/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY fetch_decode_pipe IS
   PORT( 
      CLK                    : IN     std_logic;
      RESET_L                : IN     STD_LOGIC;
      fetch_data_out         : IN     pipe_data;
      fetch_ready            : IN     std_logic;
      load_fetch_decode_pipe : IN     STD_LOGIC;
      decode_data_in         : OUT    pipe_data
   );

-- Declarations

END fetch_decode_pipe ;

--
-- VHDL Architecture ece411.fetch_decode_pipe.struct
--
-- Created:
--          by - wheele11.ews (gelib-057-27.ews.illinois.edu)
--          at - 20:17:34 04/11/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY ece411;

ARCHITECTURE struct OF fetch_decode_pipe IS

   -- Architecture declarations

   -- Internal signal declarations


   -- Component Declarations
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
   FOR ALL : RegData USE ENTITY ece411.RegData;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   aRegData1 : RegData
      PORT MAP (
         RESET_L => RESET_L,
         A       => fetch_data_out,
         EN      => load_fetch_decode_pipe,
         CLK     => CLK,
         F       => decode_data_in
      );

END struct;
