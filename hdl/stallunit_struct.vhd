-- VHDL Entity ece411.StallUnit.interface
--
-- Created:
--          by - goldste6.ews (linux5.ews.illinois.edu)
--          at - 17:22:29 04/18/12
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
      CLK                     : IN     std_logic;
      fetch_ready             : IN     std_logic;
      mem_ready               : IN     STD_LOGIC;
      stall_load_use_buffer   : IN     STD_LOGIC;
      uarch_stall_in_buffer   : IN     std_logic;
      load_decode_exec_pipe   : OUT    STD_LOGIC;
      load_exec_mem_pipe      : OUT    STD_LOGIC;
      load_fetch1_fetch2_pipe : OUT    STD_LOGIC;
      load_fetch_decode_pipe  : OUT    STD_LOGIC;
      load_fwd_pipe           : OUT    std_logic;
      load_icache_fwd_pipe    : OUT    std_logic;
      load_mem_wb_pipe        : OUT    std_logic;
      load_pc                 : OUT    std_logic;
      load_uarch_pipe         : OUT    std_logic
   );

-- Declarations

END StallUnit ;

--
-- VHDL Architecture ece411.StallUnit.struct
--
-- Created:
--          by - goldste6.ews (linux5.ews.illinois.edu)
--          at - 17:22:29 04/18/12
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

ARCHITECTURE struct OF StallUnit IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL F                : STD_LOGIC;
   SIGNAL cache_ready      : STD_LOGIC;
   SIGNAL init_stall       : STD_LOGIC;
   SIGNAL load_fd          : STD_LOGIC;
   SIGNAL stall_load_use_l : std_logic;

   -- Implicit buffer signal declarations
   SIGNAL load_uarch_pipe_internal : std_logic;


   -- Component Declarations
   COMPONENT init_fix
   PORT (
      CLK        : IN     std_logic ;
      init_stall : OUT    STD_LOGIC 
   );
   END COMPONENT;
   COMPONENT AND2
   PORT (
      A : IN     STD_LOGIC ;
      B : IN     STD_LOGIC ;
      F : OUT    STD_LOGIC 
   );
   END COMPONENT;
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
   FOR ALL : AND2 USE ENTITY mp3lib.AND2;
   FOR ALL : AND3 USE ENTITY mp3lib.AND3;
   FOR ALL : NOT1 USE ENTITY mp3lib.NOT1;
   FOR ALL : init_fix USE ENTITY ece411.init_fix;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   load_decode_exec_pipe <= cache_ready;
   load_exec_mem_pipe <= cache_ready;
   load_fetch_decode_pipe <= load_fd;
   load_fetch1_fetch2_pipe <= load_fd;
   load_icache_fwd_pipe <= load_fd;
   load_mem_wb_pipe <= cache_ready;
   load_pc <= load_fd;
   load_fwd_pipe <= cache_ready;


   -- Instance port mappings.
   U_5 : init_fix
      PORT MAP (
         CLK        => CLK,
         init_stall => init_stall
      );
   U_2 : AND2
      PORT MAP (
         A => load_uarch_pipe_internal,
         B => F,
         F => load_fd
      );
   U_4 : AND2
      PORT MAP (
         A => cache_ready,
         B => stall_load_use_l,
         F => load_uarch_pipe_internal
      );
   U_0 : AND3
      PORT MAP (
         A => fetch_ready,
         B => mem_ready,
         C => init_stall,
         F => cache_ready
      );
   U_1 : NOT1
      PORT MAP (
         A => stall_load_use_buffer,
         F => stall_load_use_l
      );
   U_3 : NOT1
      PORT MAP (
         A => uarch_stall_in_buffer,
         F => F
      );

   -- Implicit buffered output assignments
   load_uarch_pipe <= load_uarch_pipe_internal;

END struct;
