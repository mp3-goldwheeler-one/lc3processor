-- VHDL Entity ece411.CPU.symbol
--
-- Created:
--          by - goldste6.ews (gelib-057-33.ews.illinois.edu)
--          at - 00:07:50 04/26/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY CPU IS
   PORT( 
      RESET_L : IN     STD_LOGIC;
      START_H : IN     std_logic
   );

-- Declarations

END CPU ;

--
-- VHDL Architecture ece411.CPU.struct
--
-- Created:
--          by - goldste6.ews (gelib-057-33.ews.illinois.edu)
--          at - 00:07:50 04/26/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY ece411;

ARCHITECTURE struct OF CPU IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL CLK              : std_logic;
   SIGNAL data_in          : LC3B_OWORD;
   SIGNAL data_mread_l     : std_logic;
   SIGNAL data_mwrite_l    : STD_LOGIC;
   SIGNAL data_pm_addr     : LC3B_WORD;
   SIGNAL data_pm_dataout  : LC3B_OWORD;
   SIGNAL data_resp_h      : std_logic;
   SIGNAL instr_in         : LC3B_OWORD;
   SIGNAL instr_mread_l    : std_logic;
   SIGNAL instr_mwrite_l   : STD_LOGIC;
   SIGNAL instr_pm_addr    : LC3b_word;
   SIGNAL instr_pm_dataout : lc3b_oword;
   SIGNAL instr_resp_h     : std_logic;


   -- Component Declarations
   COMPONENT CLKgen
   PORT (
      clk : INOUT  std_logic  := '1'
   );
   END COMPONENT;
   COMPONENT Datapath
   PORT (
      CLK              : IN     std_logic ;
      RESET_L          : IN     STD_LOGIC ;
      data_in          : IN     LC3B_OWORD ;
      data_resp_h      : IN     std_logic ;
      instr_in         : IN     LC3B_OWORD ;
      instr_resp_h     : IN     std_logic ;
      data_mread_l     : OUT    std_logic ;
      data_mwrite_l    : OUT    STD_LOGIC ;
      data_pm_addr     : OUT    LC3B_WORD ;
      data_pm_dataout  : OUT    LC3B_OWORD ;
      instr_mread_l    : OUT    std_logic ;
      instr_mwrite_l   : OUT    STD_LOGIC ;
      instr_pm_addr    : OUT    LC3b_word ;
      instr_pm_dataout : OUT    lc3b_oword 
   );
   END COMPONENT;
   COMPONENT Memory
   PORT (
      CLK              : IN     std_logic ;
      RESET_L          : IN     STD_LOGIC ;
      data_mread_l     : IN     std_logic ;
      data_mwrite_l    : IN     STD_LOGIC ;
      data_pm_addr     : IN     LC3B_WORD ;
      data_pm_dataout  : IN     LC3B_OWORD ;
      instr_mread_l    : IN     std_logic ;
      instr_mwrite_l   : IN     STD_LOGIC ;
      instr_pm_addr    : IN     LC3b_word ;
      instr_pm_dataout : IN     lc3b_oword ;
      data_in          : OUT    LC3B_OWORD ;
      data_resp_h      : OUT    std_logic ;
      instr_in         : OUT    LC3B_OWORD ;
      instr_resp_h     : OUT    std_logic 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : CLKgen USE ENTITY ece411.CLKgen;
   FOR ALL : Datapath USE ENTITY ece411.Datapath;
   FOR ALL : Memory USE ENTITY ece411.Memory;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   I0 : CLKgen
      PORT MAP (
         clk => CLK
      );
   pipelinedDataPath : Datapath
      PORT MAP (
         CLK              => CLK,
         RESET_L          => RESET_L,
         data_in          => data_in,
         data_resp_h      => data_resp_h,
         instr_in         => instr_in,
         instr_resp_h     => instr_resp_h,
         data_mread_l     => data_mread_l,
         data_mwrite_l    => data_mwrite_l,
         data_pm_addr     => data_pm_addr,
         data_pm_dataout  => data_pm_dataout,
         instr_mread_l    => instr_mread_l,
         instr_mwrite_l   => instr_mwrite_l,
         instr_pm_addr    => instr_pm_addr,
         instr_pm_dataout => instr_pm_dataout
      );
   DRAM : Memory
      PORT MAP (
         CLK              => CLK,
         RESET_L          => RESET_L,
         data_mread_l     => data_mread_l,
         data_mwrite_l    => data_mwrite_l,
         data_pm_addr     => data_pm_addr,
         data_pm_dataout  => data_pm_dataout,
         instr_mread_l    => instr_mread_l,
         instr_mwrite_l   => instr_mwrite_l,
         instr_pm_addr    => instr_pm_addr,
         instr_pm_dataout => instr_pm_dataout,
         data_in          => data_in,
         data_resp_h      => data_resp_h,
         instr_in         => instr_in,
         instr_resp_h     => instr_resp_h
      );

END struct;
