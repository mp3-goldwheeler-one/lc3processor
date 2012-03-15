-- VHDL Entity ece411.StallUnit.interface
--
-- Created:
--          by - wheele11.ews (gelib-057-03.ews.illinois.edu)
--          at - 20:44:02 03/14/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY StallUnit IS
   PORT( 
      CLK                    : IN     std_logic;
      fetch_ready            : IN     std_logic;
      mem_ready              : IN     STD_LOGIC;
      load_decode_exec_pipe  : OUT    STD_LOGIC;
      load_exec_mem_pipe     : OUT    STD_LOGIC;
      load_fetch_decode_pipe : OUT    STD_LOGIC;
      load_mem_wb_pipe       : OUT    std_logic;
      load_pc                : OUT    std_logic
   );

-- Declarations

END StallUnit ;

--
-- VHDL Architecture ece411.StallUnit.struct
--
-- Created:
--          by - wheele11.ews (gelib-057-03.ews.illinois.edu)
--          at - 20:44:02 03/14/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY mp3lib;

ARCHITECTURE struct OF StallUnit IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL load_all : STD_LOGIC;


   -- Component Declarations
   COMPONENT AND2
   PORT (
      A : IN     STD_LOGIC ;
      B : IN     STD_LOGIC ;
      F : OUT    STD_LOGIC 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : AND2 USE ENTITY mp3lib.AND2;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   load_decode_exec_pipe <= load_all;
   load_exec_mem_pipe <= load_all;
   load_fetch_decode_pipe <= load_all;
   load_mem_wb_pipe <= load_all;
   load_pc <= load_all;                                


   -- Instance port mappings.
   U_0 : AND2
      PORT MAP (
         A => fetch_ready,
         B => mem_ready,
         F => load_all
      );

END struct;
