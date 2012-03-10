-- VHDL Entity ece411.CPU.symbol
--
-- Created:
--          by - wheele11.ews (gelib-057-06.ews.illinois.edu)
--          at - 20:06:02 03/09/12
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
--          by - wheele11.ews (gelib-057-06.ews.illinois.edu)
--          at - 20:06:02 03/09/12
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
   SIGNAL CLK             : std_logic;
   SIGNAL DATAIN          : std_logic;
   SIGNAL Dataout         : LC3b_word;
   SIGNAL data_addr       : LC3b_word;
   SIGNAL data_mread_l    : std_logic;
   SIGNAL data_mwriteh_l  : std_logic;
   SIGNAL data_mwritel_l  : std_logic;
   SIGNAL data_resp_h     : std_logic;
   SIGNAL instr_addr      : LC3b_word;
   SIGNAL instr_in        : LC3B_WORD;
   SIGNAL instr_mread_l   : std_logic;
   SIGNAL instr_mwriteh_l : std_logic;
   SIGNAL instr_mwritel_l : std_logic;
   SIGNAL instr_out       : std_logic;
   SIGNAL instr_resp_h    : std_logic;


   -- Component Declarations
   COMPONENT CLKgen
   PORT (
      clk : INOUT  std_logic  := '0'
   );
   END COMPONENT;
   COMPONENT Datapath
   PORT (
      CLK             : IN     std_logic ;
      DATAIN          : IN     std_logic ;
      RESET_L         : IN     STD_LOGIC ;
      START_H         : IN     std_logic ;
      data_resp_h     : IN     std_logic ;
      instr_in        : IN     LC3B_WORD ;
      instr_resp_h    : IN     std_logic ;
      Dataout         : OUT    LC3b_word ;
      data_addr       : OUT    LC3b_word ;
      data_mread_l    : OUT    std_logic ;
      data_mwriteh_l  : OUT    std_logic ;
      data_mwritel_l  : OUT    std_logic ;
      instr_addr      : OUT    LC3b_word ;
      instr_mread_l   : OUT    std_logic ;
      instr_mwriteh_l : OUT    std_logic ;
      instr_mwritel_l : OUT    std_logic ;
      instr_out       : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT Memory
   PORT (
      CLK             : IN     std_logic ;
      Dataout         : IN     LC3b_word ;
      RESET_L         : IN     STD_LOGIC ;
      data_addr       : IN     LC3b_word ;
      data_mread_l    : IN     std_logic ;
      data_mwriteh_l  : IN     std_logic ;
      data_mwritel_l  : IN     std_logic ;
      instr_addr      : IN     LC3b_word ;
      instr_mread_l   : IN     std_logic ;
      instr_mwriteh_l : IN     std_logic ;
      instr_mwritel_l : IN     std_logic ;
      instr_out       : IN     std_logic ;
      DATAIN          : OUT    std_logic ;
      data_resp_h     : OUT    std_logic ;
      instr_in        : OUT    LC3B_WORD ;
      instr_resp_h    : OUT    std_logic 
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
         CLK             => CLK,
         DATAIN          => DATAIN,
         RESET_L         => RESET_L,
         START_H         => START_H,
         data_resp_h     => data_resp_h,
         instr_in        => instr_in,
         instr_resp_h    => instr_resp_h,
         Dataout         => Dataout,
         data_addr       => data_addr,
         data_mread_l    => data_mread_l,
         data_mwriteh_l  => data_mwriteh_l,
         data_mwritel_l  => data_mwritel_l,
         instr_addr      => instr_addr,
         instr_mread_l   => instr_mread_l,
         instr_mwriteh_l => instr_mwriteh_l,
         instr_mwritel_l => instr_mwritel_l,
         instr_out       => instr_out
      );
   DRAM : Memory
      PORT MAP (
         CLK             => CLK,
         Dataout         => Dataout,
         RESET_L         => RESET_L,
         data_addr       => data_addr,
         data_mread_l    => data_mread_l,
         data_mwriteh_l  => data_mwriteh_l,
         data_mwritel_l  => data_mwritel_l,
         instr_addr      => instr_addr,
         instr_mread_l   => instr_mread_l,
         instr_mwriteh_l => instr_mwriteh_l,
         instr_mwritel_l => instr_mwritel_l,
         instr_out       => instr_out,
         DATAIN          => DATAIN,
         data_resp_h     => data_resp_h,
         instr_in        => instr_in,
         instr_resp_h    => instr_resp_h
      );

END struct;
