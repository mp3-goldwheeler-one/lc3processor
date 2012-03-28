--
-- VHDL Architecture ece411.Memory.untitled
--
-- Created:
--          by - goldste6.UNKNOWN (linux4.ews.illinois.edu)
--          at - 20:21:18 01/18/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Memory IS
   PORT( 
      CLK             : IN     std_logic;
      Dataout         : IN     LC3b_word;
      RESET_L         : IN     STD_LOGIC;
      data_addr       : IN     LC3b_word;
      data_mread_l    : IN     std_logic;
      data_mwriteh_l  : IN     std_logic;
      data_mwritel_l  : IN     std_logic;
      instr_addr      : IN     LC3b_word;
      instr_mread_l   : IN     std_logic;
      instr_mwriteh_l : IN     std_logic;
      instr_mwritel_l : IN     std_logic;
      instr_out       : IN     LC3b_word;
      DATAIN          : OUT    LC3B_WORD;
      data_resp_h     : OUT    std_logic;
      instr_in        : OUT    LC3B_WORD;
      instr_resp_h    : OUT    std_logic
   );

-- Declarations

END Memory ;

--
-- VHDL Architecture ece411.Memory.struct
--
-- Created:
--          by - wheele11.ews (evrt-252-02.ews.illinois.edu)
--          at - 19:27:21 03/27/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY ece411;

ARCHITECTURE struct OF Memory IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL D_PMADDRESS : LC3B_WORD;
   SIGNAL D_PMDATAOUT : LC3B_OWORD;
   SIGNAL D_PMREAD_L  : std_logic;
   SIGNAL D_PMRESP_H  : std_logic;
   SIGNAL D_PMWRITE_L : std_logic;
   SIGNAL I_PMADDRESS : LC3B_WORD;
   SIGNAL I_PMDATAOUT : LC3B_OWORD;
   SIGNAL I_PMREAD_L  : std_logic;
   SIGNAL I_PMRESP_H  : STD_LOGIC;
   SIGNAL I_PMWRITE_L : std_logic;
   SIGNAL PMADDRESS   : LC3B_WORD;
   SIGNAL PMDATAIN    : LC3B_OWORD;
   SIGNAL PMDATAOUT   : LC3B_OWORD;
   SIGNAL PMREAD_L    : STD_LOGIC;
   SIGNAL PMRESP_H    : std_logic;
   SIGNAL PMWRITE_L   : STD_LOGIC;


   -- Component Declarations
   COMPONENT Cache_Arbiter
   PORT (
      D_PMADDRESS : IN     LC3B_WORD ;
      D_PMDATAOUT : IN     LC3B_OWORD ;
      D_PMREAD_L  : IN     std_logic ;
      D_PMWRITE_L : IN     std_logic ;
      I_PMADDRESS : IN     LC3B_WORD ;
      I_PMDATAOUT : IN     LC3B_OWORD ;
      I_PMREAD_L  : IN     std_logic ;
      I_PMWRITE_L : IN     std_logic ;
      PMRESP_H    : IN     std_logic ;
      clk         : IN     std_logic ;
      reset_l     : IN     std_logic ;
      D_PMRESP_H  : OUT    std_logic ;
      I_PMRESP_H  : OUT    STD_LOGIC ;
      PMADDRESS   : OUT    LC3B_WORD ;
      PMDATAOUT   : OUT    LC3B_OWORD ;
      PMREAD_L    : OUT    STD_LOGIC ;
      PMWRITE_L   : OUT    STD_LOGIC 
   );
   END COMPONENT;
   COMPONENT L1Cache
   PORT (
      ADDRESS   : IN     LC3B_WORD ;
      CLK       : IN     std_logic ;
      Dataout   : IN     LC3B_WORD ;
      MREAD_L   : IN     std_logic ;
      MWRITEH_L : IN     std_logic ;
      MWRITEL_L : IN     std_logic ;
      PMDATAIN  : IN     LC3B_OWORD ;
      PMRESP_H  : IN     std_logic ;
      RESET_L   : IN     std_logic ;
      DATAIN    : OUT    LC3B_WORD ;
      MRESP_H   : OUT    std_logic ;
      PMADDRESS : OUT    LC3B_WORD ;
      PMDATAOUT : OUT    LC3B_OWORD ;
      PMREAD_L  : OUT    std_logic ;
      PMWRITE_L : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT Physical_Memory
   PORT (
      PMADDRESS : IN     LC3B_WORD ;
      PMDATAOUT : IN     LC3B_OWORD ;
      PMREAD_L  : IN     STD_LOGIC ;
      PMWRITE_L : IN     STD_LOGIC ;
      PMDATAIN  : OUT    LC3B_OWORD ;
      PMRESP_H  : OUT    std_logic ;
      RESET_L   : IN     STD_LOGIC ;
      CLK       : IN     std_logic 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : Cache_Arbiter USE ENTITY ece411.Cache_Arbiter;
   FOR ALL : L1Cache USE ENTITY ece411.L1Cache;
   FOR ALL : Physical_Memory USE ENTITY ece411.Physical_Memory;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   arbiter : Cache_Arbiter
      PORT MAP (
         CLK         => CLK,
         D_PMADDRESS => D_PMADDRESS,
         D_PMDATAOUT => D_PMDATAOUT,
         D_PMREAD_L  => D_PMREAD_L,
         D_PMWRITE_L => D_PMWRITE_L,
         I_PMADDRESS => I_PMADDRESS,
         I_PMDATAOUT => I_PMDATAOUT,
         I_PMREAD_L  => I_PMREAD_L,
         I_PMWRITE_L => I_PMWRITE_L,
         PMRESP_H    => PMRESP_H,
         RESET_L     => RESET_L,
         D_PMRESP_H  => D_PMRESP_H,
         I_PMRESP_H  => I_PMRESP_H,
         PMADDRESS   => PMADDRESS,
         PMDATAOUT   => PMDATAOUT,
         PMREAD_L    => PMREAD_L,
         PMWRITE_L   => PMWRITE_L
      );
   DCache : L1Cache
      PORT MAP (
         ADDRESS   => data_addr,
         CLK       => CLK,
         Dataout   => Dataout,
         MREAD_L   => data_mread_l,
         MWRITEH_L => data_mwriteh_l,
         MWRITEL_L => data_mwritel_l,
         PMDATAIN  => PMDATAIN,
         PMRESP_H  => D_PMRESP_H,
         RESET_L   => RESET_L,
         DATAIN    => DATAIN,
         MRESP_H   => data_resp_h,
         PMADDRESS => D_PMADDRESS,
         PMDATAOUT => D_PMDATAOUT,
         PMREAD_L  => D_PMREAD_L,
         PMWRITE_L => D_PMWRITE_L
      );
   ICache : L1Cache
      PORT MAP (
         ADDRESS   => instr_addr,
         CLK       => CLK,
         Dataout   => instr_out,
         MREAD_L   => instr_mread_l,
         MWRITEH_L => instr_mwriteh_l,
         MWRITEL_L => instr_mwritel_l,
         PMDATAIN  => PMDATAIN,
         PMRESP_H  => I_PMRESP_H,
         RESET_L   => RESET_L,
         DATAIN    => instr_in,
         MRESP_H   => instr_resp_h,
         PMADDRESS => I_PMADDRESS,
         PMDATAOUT => I_PMDATAOUT,
         PMREAD_L  => I_PMREAD_L,
         PMWRITE_L => I_PMWRITE_L
      );
   PDRAM : Physical_Memory
      PORT MAP (
         PMADDRESS => PMADDRESS,
         PMDATAOUT => PMDATAOUT,
         PMREAD_L  => PMREAD_L,
         PMWRITE_L => PMWRITE_L,
         PMDATAIN  => PMDATAIN,
         PMRESP_H  => PMRESP_H,
         RESET_L   => RESET_L,
         CLK       => CLK
      );

END struct;
