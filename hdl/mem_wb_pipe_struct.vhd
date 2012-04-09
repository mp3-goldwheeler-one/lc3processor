-- VHDL Entity ece411.mem_wb_pipe.interface
--
-- Created:
--          by - wheele11.ews (gelib-057-28.ews.illinois.edu)
--          at - 22:15:28 04/08/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY mem_wb_pipe IS
   PORT( 
      CLK              : IN     std_logic;
      RESET_L          : IN     STD_LOGIC;
      load_mem_wb_pipe : IN     std_logic;
      mem_control      : IN     control_word;
      mem_data_out     : IN     pipe_data;
      mem_ready        : IN     STD_LOGIC;
      wb_data_in       : OUT    pipe_data
   );

-- Declarations

END mem_wb_pipe ;

--
-- VHDL Architecture ece411.mem_wb_pipe.struct
--
-- Created:
--          by - wheele11.ews (gelib-057-28.ews.illinois.edu)
--          at - 22:15:28 04/08/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY ece411;

ARCHITECTURE struct OF mem_wb_pipe IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL wb_control_buffer : control_word;


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

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : RegControl USE ENTITY ece411.RegControl;
   FOR ALL : RegData USE ENTITY ece411.RegData;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   U_6 : RegControl
      PORT MAP (
         RESET_L => RESET_L,
         A       => mem_control,
         EN      => load_mem_wb_pipe,
         CLK     => CLK,
         F       => wb_control_buffer
      );
   aRegData1 : RegData
      PORT MAP (
         RESET_L => RESET_L,
         A       => mem_data_out,
         EN      => load_mem_wb_pipe,
         CLK     => CLK,
         F       => wb_data_in
      );

END struct;
