-- VHDL Entity ece411.Cache_Datapath.interface
--
-- Created:
--          by - wheele11.ews (gelib-057-18.ews.illinois.edu)
--          at - 23:36:24 03/07/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Cache_Datapath IS
   PORT( 
      Address         : IN     LC3b_word;
      CLK             : IN     std_logic;
      Dataout         : IN     LC3b_word;
      MREAD_L         : IN     std_logic;
      MWRITEH_L       : IN     std_logic;
      MWRITEL_L       : IN     std_logic;
      PMDATAIN        : IN     LC3B_OWORD;
      RESET_L         : IN     STD_LOGIC;
      in_idlehit      : IN     std_logic;
      in_load         : IN     std_logic;
      in_writeback    : IN     std_logic;
      DATAIN_internal : OUT    LC3b_word;
      Dirty           : OUT    std_logic;
      MRESP_H         : OUT    std_logic;
      PMADDRESS       : OUT    LC3B_WORD;
      PMDATAOUT       : OUT    LC3B_OWORD;
      miss            : OUT    std_logic
   );

-- Declarations

END Cache_Datapath ;

--
-- VHDL Architecture ece411.Cache_Datapath.struct
--
-- Created:
--          by - wheele11.ews (gelib-057-18.ews.illinois.edu)
--          at - 23:36:24 03/07/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY ece411;

ARCHITECTURE struct OF Cache_Datapath IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL DataOWord     : LC3b_oword;
   SIGNAL Dirty0        : std_logic;
   SIGNAL Dirty1        : std_logic;
   SIGNAL Index         : lc3b_c_index;
   SIGNAL LRUgate       : STD_LOGIC;
   SIGNAL OWordCombined : LC3b_oword;
   SIGNAL Offset        : std_logic_vector(2 DOWNTO 0);
   SIGNAL ProtoHit      : std_logic;
   SIGNAL Protomiss     : std_logic;
   SIGNAL Set_Dirty     : std_logic;
   SIGNAL Tag           : std_logic_vector(8 DOWNTO 0);
   SIGNAL WBAddrWay0    : LC3b_word;
   SIGNAL WBAddrWay1    : LC3b_word;
   SIGNAL WBAddress     : LC3b_word;
   SIGNAL Way0Dataout   : LC3b_oword;
   SIGNAL Way1Dataout   : LC3b_oword;
   SIGNAL WayDataIn     : LC3b_oword;
   SIGNAL Y             : std_logic;
   SIGNAL evict0        : std_logic;
   SIGNAL evicted       : std_logic;
   SIGNAL hit           : std_logic;
   SIGNAL load0         : std_logic;
   SIGNAL load1         : std_logic;
   SIGNAL mem_access    : std_logic;
   SIGNAL not_loading   : std_logic;
   SIGNAL present0      : std_logic;
   SIGNAL present1      : std_logic;
   SIGNAL truehit       : std_logic;
   SIGNAL write         : std_logic;
   SIGNAL write0        : std_logic;
   SIGNAL write0pg      : std_logic;
   SIGNAL write1        : std_logic;
   SIGNAL write1pg      : std_logic;
   SIGNAL writegate     : std_logic;
   SIGNAL writehit0     : std_logic;
   SIGNAL writehit1     : std_logic;

   -- Implicit buffer signal declarations
   SIGNAL MRESP_H_internal : std_logic;
   SIGNAL Dirty_internal   : std_logic;


   -- Component Declarations
   COMPONENT AND2
   PORT (
      A : IN     std_logic ;
      B : IN     std_logic ;
      Y : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT Bit_Array
   PORT (
      DataIn    : IN     std_logic;
      DataWrite : IN     std_logic;
      Index     : IN     LC3b_c_index;
      RESET_L   : IN     std_logic;
      DataOut   : OUT    std_logic
   );
   END COMPONENT;
   COMPONENT DataCombiner
   PORT (
      MWRITEH_L : IN     std_logic ;
      MWRITEL_L : IN     std_logic ;
      OWordIn   : IN     LC3b_oword ;
      Offset    : IN     std_logic_vector (2 DOWNTO 0);
      WordIn    : IN     LC3b_word ;
      OWordOut  : OUT    LC3b_oword 
   );
   END COMPONENT;
   COMPONENT Mux2
   PORT (
      A   : IN     std_logic ;
      B   : IN     std_logic ;
      Sel : IN     std_logic ;
      Y   : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT NAND2
   PORT (
      A : IN     std_logic ;
      B : IN     std_logic ;
      Y : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT NAND3
   PORT (
      A : IN     std_logic ;
      B : IN     std_logic ;
      C : IN     std_logic ;
      Y : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT NOT1
   PORT (
      A : IN     std_logic ;
      Y : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT OR2
   PORT (
      A : IN     std_logic ;
      B : IN     std_logic ;
      Y : OUT    std_logic 
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
   COMPONENT Splitter
   PORT (
      Address : IN     LC3b_word ;
      Tag     : OUT    std_logic_vector (8 DOWNTO 0);
      Index   : OUT    lc3b_c_index ;
      Offset  : OUT    std_logic_vector (2 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT Timer
   PORT (
      CLK       : IN     std_logic ;
      LRUgate   : OUT    STD_LOGIC ;
      writegate : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT Way
   PORT (
      DataIn           : IN     LC3b_oword ;
      DataWrite        : IN     std_logic ;
      Index            : IN     LC3b_c_index ;
      RESET_L          : IN     std_logic ;
      SetDirty         : IN     std_logic ;
      TagIn            : IN     std_logic_vector (8 DOWNTO 0);
      DataOut          : OUT    LC3b_oword ;
      Dirty            : OUT    std_logic ;
      Present          : OUT    std_logic ;
      WriteBackAddress : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT WordMux2
   PORT (
      A   : IN     LC3b_word ;
      B   : IN     LC3b_word ;
      Sel : IN     std_logic ;
      F   : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT WordSelector
   PORT (
      Input  : IN     LC3b_oword ;
      Index  : IN     std_logic_vector (2 DOWNTO 0);
      Output : OUT    LC3b_word 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : AND2 USE ENTITY ece411.AND2;
   FOR ALL : Bit_Array USE ENTITY ece411.Bit_Array;
   FOR ALL : DataCombiner USE ENTITY ece411.DataCombiner;
   FOR ALL : Mux2 USE ENTITY ece411.Mux2;
   FOR ALL : NAND2 USE ENTITY ece411.NAND2;
   FOR ALL : NAND3 USE ENTITY ece411.NAND3;
   FOR ALL : NOT1 USE ENTITY ece411.NOT1;
   FOR ALL : OR2 USE ENTITY ece411.OR2;
   FOR ALL : OWordMux2 USE ENTITY ece411.OWordMux2;
   FOR ALL : Splitter USE ENTITY ece411.Splitter;
   FOR ALL : Timer USE ENTITY ece411.Timer;
   FOR ALL : Way USE ENTITY ece411.Way;
   FOR ALL : WordMux2 USE ENTITY ece411.WordMux2;
   FOR ALL : WordSelector USE ENTITY ece411.WordSelector;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   U_3 : AND2
      PORT MAP (
         A => ProtoHit,
         B => mem_access,
         Y => hit
      );
   U_5 : AND2
      PORT MAP (
         A => Protomiss,
         B => mem_access,
         Y => miss
      );
   U_12 : AND2
      PORT MAP (
         A => evicted,
         B => in_load,
         Y => load1
      );
   U_13 : AND2
      PORT MAP (
         A => evict0,
         B => in_load,
         Y => load0
      );
   U_16 : AND2
      PORT MAP (
         A => write,
         B => present1,
         Y => writehit1
      );
   U_17 : AND2
      PORT MAP (
         A => write,
         B => present0,
         Y => writehit0
      );
   U_18 : AND2
      PORT MAP (
         A => hit,
         B => in_idlehit,
         Y => truehit
      );
   U_19 : AND2
      PORT MAP (
         A => not_loading,
         B => Y,
         Y => Set_Dirty
      );
   writeAND0 : AND2
      PORT MAP (
         A => writegate,
         B => write0pg,
         Y => write0
      );
   writeAND1 : AND2
      PORT MAP (
         A => writegate,
         B => write1pg,
         Y => write1
      );
   writeLRU : AND2
      PORT MAP (
         A => truehit,
         B => LRUgate,
         Y => MRESP_H_internal
      );
   LRU : Bit_Array
      PORT MAP (
         RESET_L   => RESET_L,
         DataWrite => MRESP_H_internal,
         Index     => Index,
         DataIn    => present0,
         DataOut   => evicted
      );
   aDataCombiner : DataCombiner
      PORT MAP (
         MWRITEH_L => MWRITEH_L,
         MWRITEL_L => MWRITEL_L,
         OWordIn   => DataOWord,
         Offset    => Offset,
         WordIn    => Dataout,
         OWordOut  => OWordCombined
      );
   U_7 : Mux2
      PORT MAP (
         A   => Dirty0,
         B   => Dirty1,
         Sel => evicted,
         Y   => Dirty_internal
      );
   U_9 : NAND2
      PORT MAP (
         A => MWRITEL_L,
         B => MWRITEH_L,
         Y => write
      );
   U_2 : NAND3
      PORT MAP (
         A => MREAD_L,
         B => MWRITEH_L,
         C => MWRITEL_L,
         Y => mem_access
      );
   U_4 : NOT1
      PORT MAP (
         A => ProtoHit,
         Y => Protomiss
      );
   U_14 : NOT1
      PORT MAP (
         A => evicted,
         Y => evict0
      );
   U_20 : NOT1
      PORT MAP (
         A => in_load,
         Y => not_loading
      );
   U_0 : OR2
      PORT MAP (
         A => present1,
         B => present0,
         Y => ProtoHit
      );
   U_11 : OR2
      PORT MAP (
         A => writehit1,
         B => load1,
         Y => write1pg
      );
   U_15 : OR2
      PORT MAP (
         A => writehit0,
         B => load0,
         Y => write0pg
      );
   U_21 : OR2
      PORT MAP (
         A => Dirty_internal,
         B => write,
         Y => Y
      );
   LoadDataMux : OWordMux2
      PORT MAP (
         A   => OWordCombined,
         B   => PMDATAIN,
         Sel => in_load,
         Y   => WayDataIn
      );
   PMDataMux : OWordMux2
      PORT MAP (
         A   => Way0Dataout,
         B   => Way1Dataout,
         Sel => evicted,
         Y   => PMDATAOUT
      );
   WayDataMux : OWordMux2
      PORT MAP (
         A   => Way0Dataout,
         B   => Way1Dataout,
         Sel => present1,
         Y   => DataOWord
      );
   aSplitter : Splitter
      PORT MAP (
         Address => Address,
         Tag     => Tag,
         Index   => Index,
         Offset  => Offset
      );
   aTimer : Timer
      PORT MAP (
         CLK       => CLK,
         LRUgate   => LRUgate,
         writegate => writegate
      );
   Way0 : Way
      PORT MAP (
         DataIn           => WayDataIn,
         DataWrite        => write0,
         Index            => Index,
         RESET_L          => RESET_L,
         SetDirty         => Set_Dirty,
         TagIn            => Tag,
         DataOut          => Way0Dataout,
         Dirty            => Dirty0,
         Present          => present0,
         WriteBackAddress => WBAddrWay0
      );
   Way1 : Way
      PORT MAP (
         DataIn           => WayDataIn,
         DataWrite        => write1,
         Index            => Index,
         RESET_L          => RESET_L,
         SetDirty         => Set_Dirty,
         TagIn            => Tag,
         DataOut          => Way1Dataout,
         Dirty            => Dirty1,
         Present          => present1,
         WriteBackAddress => WBAddrWay1
      );
   U_1 : WordMux2
      PORT MAP (
         A   => WBAddress,
         B   => Address,
         Sel => in_load,
         F   => PMADDRESS
      );
   U_6 : WordMux2
      PORT MAP (
         A   => WBAddrWay0,
         B   => WBAddrWay1,
         Sel => evicted,
         F   => WBAddress
      );
   WordSelect : WordSelector
      PORT MAP (
         Input  => DataOWord,
         Index  => Offset,
         Output => DATAIN_internal
      );

   -- Implicit buffered output assignments
   MRESP_H <= MRESP_H_internal;
   Dirty   <= Dirty_internal;

END struct;
