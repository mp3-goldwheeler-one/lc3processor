-- VHDL Entity ece411.Cache_Arbiter.interface
--
-- Created:
--          by - goldste6.ews (gelib-057-33.ews.illinois.edu)
--          at - 21:05:44 04/25/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Cache_Arbiter IS
   PORT( 
      CLK            : IN     std_logic;
      D_PMADDRESS    : IN     LC3B_WORD;
      D_PMDATAOUT    : IN     LC3B_OWORD;
      D_PMREAD_L     : IN     std_logic;
      D_PMWRITE_L    : IN     std_logic;
      FIXED_PMRESP_H : IN     STD_LOGIC;
      I_PMADDRESS    : IN     LC3B_WORD;
      I_PMDATAOUT    : IN     LC3B_OWORD;
      I_PMREAD_L     : IN     std_logic;
      I_PMWRITE_L    : IN     std_logic;
      RESET_L        : IN     STD_LOGIC;
      D_PMRESP_H     : OUT    std_logic;
      I_PMRESP_H     : OUT    STD_LOGIC;
      PMADDRESS      : OUT    LC3B_WORD;
      PMDATAOUT      : OUT    LC3B_OWORD;
      PMREAD_L       : OUT    STD_LOGIC;
      PMWRITE_L      : OUT    STD_LOGIC
   );

-- Declarations

END Cache_Arbiter ;

--
-- VHDL Architecture ece411.Cache_Arbiter.struct
--
-- Created:
--          by - goldste6.ews (gelib-057-33.ews.illinois.edu)
--          at - 21:05:44 04/25/12
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

ARCHITECTURE struct OF Cache_Arbiter IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL ArbiterSel       : STD_LOGIC;
   SIGNAL D_ACCESS         : STD_LOGIC;
   SIGNAL D_READ_L         : STD_LOGIC;
   SIGNAL D_WRITE_L        : STD_LOGIC;
   SIGNAL I_ACCESS         : STD_LOGIC;
   SIGNAL I_READ_L         : STD_LOGIC;
   SIGNAL I_WRITE_L        : STD_LOGIC;
   SIGNAL in_data_access_H : STD_LOGIC;
   SIGNAL in_data_access_l : std_logic;
   SIGNAL in_inst_access_H : STD_LOGIC;
   SIGNAL in_inst_access_l : std_logic;


   -- Component Declarations
   COMPONENT ArbController
   PORT (
      D_ACCESS         : IN     STD_LOGIC ;
      FIXED_PMRESP_H   : IN     STD_LOGIC ;
      I_ACCESS         : IN     STD_LOGIC ;
      RESET_L          : IN     STD_LOGIC ;
      ArbiterSel       : OUT    STD_LOGIC ;
      in_data_access_l : BUFFER std_logic ;
      in_inst_access_l : BUFFER std_logic 
   );
   END COMPONENT;
   COMPONENT OWordMux2
   PORT (
      A   : IN     LC3b_oword ;
      B   : IN     LC3b_oword ;
      Sel : IN     std_logic ;
      Y   : OUT    LC3b_oword 
   );
   END COMPONENT;
   COMPONENT AND2
   PORT (
      A : IN     STD_LOGIC ;
      B : IN     STD_LOGIC ;
      F : OUT    STD_LOGIC 
   );
   END COMPONENT;
   COMPONENT MUX2_16
   PORT (
      A   : IN     LC3B_WORD ;
      B   : IN     LC3B_WORD ;
      SEL : IN     STD_LOGIC ;
      F   : OUT    LC3B_WORD 
   );
   END COMPONENT;
   COMPONENT NAND2
   PORT (
      A : IN     STD_LOGIC ;
      B : IN     STD_LOGIC ;
      F : OUT    STD_LOGIC 
   );
   END COMPONENT;
   COMPONENT NOT1
   PORT (
      A : IN     STD_LOGIC ;
      F : OUT    STD_LOGIC 
   );
   END COMPONENT;
   COMPONENT OR2
   PORT (
      A : IN     STD_LOGIC ;
      B : IN     STD_LOGIC ;
      F : OUT    STD_LOGIC 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : AND2 USE ENTITY mp3lib.AND2;
   FOR ALL : ArbController USE ENTITY ece411.ArbController;
   FOR ALL : MUX2_16 USE ENTITY mp3lib.MUX2_16;
   FOR ALL : NAND2 USE ENTITY mp3lib.NAND2;
   FOR ALL : NOT1 USE ENTITY mp3lib.NOT1;
   FOR ALL : OR2 USE ENTITY mp3lib.OR2;
   FOR ALL : OWordMux2 USE ENTITY ece411.OWordMux2;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   Arbitrator : ArbController
      PORT MAP (
         D_ACCESS         => D_ACCESS,
         FIXED_PMRESP_H   => FIXED_PMRESP_H,
         I_ACCESS         => I_ACCESS,
         RESET_L          => RESET_L,
         ArbiterSel       => ArbiterSel,
         in_data_access_l => in_data_access_l,
         in_inst_access_l => in_inst_access_l
      );
   DataMux : OWordMux2
      PORT MAP (
         A   => D_PMDATAOUT,
         B   => I_PMDATAOUT,
         Sel => ArbiterSel,
         Y   => PMDATAOUT
      );
   U_6 : AND2
      PORT MAP (
         A => D_READ_L,
         B => I_READ_L,
         F => PMREAD_L
      );
   U_9 : AND2
      PORT MAP (
         A => D_WRITE_L,
         B => I_WRITE_L,
         F => PMWRITE_L
      );
   U_10 : AND2
      PORT MAP (
         A => FIXED_PMRESP_H,
         B => in_data_access_H,
         F => D_PMRESP_H
      );
   U_13 : AND2
      PORT MAP (
         A => FIXED_PMRESP_H,
         B => in_inst_access_H,
         F => I_PMRESP_H
      );
   AddrMux : MUX2_16
      PORT MAP (
         A   => D_PMADDRESS,
         B   => I_PMADDRESS,
         SEL => ArbiterSel,
         F   => PMADDRESS
      );
   D_ACCESS_GATE : NAND2
      PORT MAP (
         A => D_PMREAD_L,
         B => D_PMWRITE_L,
         F => D_ACCESS
      );
   I_ACCESS_GATE : NAND2
      PORT MAP (
         A => I_PMREAD_L,
         B => I_PMWRITE_L,
         F => I_ACCESS
      );
   daccess_inv : NOT1
      PORT MAP (
         A => in_data_access_l,
         F => in_data_access_H
      );
   iaccess_inv : NOT1
      PORT MAP (
         A => in_inst_access_l,
         F => in_inst_access_H
      );
   U_3 : OR2
      PORT MAP (
         A => D_PMREAD_L,
         B => in_data_access_l,
         F => D_READ_L
      );
   U_4 : OR2
      PORT MAP (
         A => I_PMREAD_L,
         B => in_inst_access_l,
         F => I_READ_L
      );
   U_7 : OR2
      PORT MAP (
         A => D_PMWRITE_L,
         B => in_data_access_l,
         F => D_WRITE_L
      );
   U_8 : OR2
      PORT MAP (
         A => I_PMWRITE_L,
         B => in_inst_access_l,
         F => I_WRITE_L
      );

END struct;
