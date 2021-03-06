-- VHDL Entity ece411.Cache_Datapath.symbol
--
-- Created:
--          by - goldste6.ews (gelib-057-19.ews.illinois.edu)
--          at - 02:11:55 04/16/12
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
      Address            : IN     LC3b_word;
      Dataout            : IN     LC3b_word;
      MREAD_L            : IN     std_logic;
      MWRITEH_L          : IN     std_logic;
      MWRITEL_L          : IN     std_logic;
      PMDATAIN           : IN     LC3B_OWORD;
      PMRESP_H           : IN     STD_LOGIC;
      clk                : IN     std_logic;
      in_idlehit         : IN     std_logic;
      in_load            : IN     std_logic;
      in_writeback       : IN     std_logic;
      reset_l            : IN     STD_LOGIC;
      DATAIN             : OUT    LC3b_word;
      MRESP_H            : OUT    std_logic;
      PMADDRESS          : OUT    LC3B_WORD;
      PMDATAOUT          : OUT    LC3B_OWORD;
      evict_buffer_valid : OUT    std_logic;
      miss               : OUT    std_logic
   );

-- Declarations

END Cache_Datapath ;

--
-- VHDL Architecture ece411.Cache_Datapath.struct
--
-- Created:
--          by - goldste6.ews (gelib-057-19.ews.illinois.edu)
--          at - 02:11:55 04/16/12
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

ARCHITECTURE struct OF Cache_Datapath IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL CacheDataOut           : LC3b_oword;
   SIGNAL DataOWord              : LC3b_oword;
   SIGNAL Dirty0                 : std_logic;
   SIGNAL Dirty1                 : std_logic;
   SIGNAL Index                  : lc3b_c_index;
   SIGNAL LRU_data_in            : STD_LOGIC;
   SIGNAL LRUgate                : STD_LOGIC;
   SIGNAL OWordCombined          : LC3b_oword;
   SIGNAL Offset                 : std_logic_vector(2 DOWNTO 0);
   SIGNAL ProtoHit               : std_logic;
   SIGNAL Protomiss              : std_logic;
   SIGNAL Set_Dirty              : std_logic;
   SIGNAL Tag                    : std_logic_vector(8 DOWNTO 0);
   SIGNAL WBAddrWay0             : LC3b_word;
   SIGNAL WBAddrWay1             : LC3b_word;
   SIGNAL WBAddress              : LC3b_word;
   SIGNAL Way0Dataout            : LC3b_oword;
   SIGNAL Way1Dataout            : LC3b_oword;
   SIGNAL WayDataIn              : LC3b_oword;
   SIGNAL Y                      : std_logic;
   SIGNAL buffer_occupied_l      : std_logic;
   SIGNAL cacheline_out          : LC3B_OWORD;
   SIGNAL dirty                  : std_logic;
   SIGNAL evict0                 : std_logic;
   SIGNAL evicted                : std_logic;
   SIGNAL evicted_address        : LC3b_word;
   SIGNAL evicted_l              : std_logic;
   SIGNAL hit                    : std_logic;
   SIGNAL load0                  : std_logic;
   SIGNAL load1                  : std_logic;
   SIGNAL load_evict_buffer      : std_logic;
   SIGNAL load_resp              : std_logic;
   SIGNAL mem_access             : std_logic;
   SIGNAL not_loading            : std_logic;
   SIGNAL pre_mresp_h            : STD_LOGIC;
   SIGNAL present0               : std_logic;
   SIGNAL present1               : std_logic;
   SIGNAL set_evict_buffer_valid : std_logic;
   SIGNAL truehit                : std_logic;
   SIGNAL write                  : std_logic;
   SIGNAL write0                 : std_logic;
   SIGNAL write0pg               : std_logic;
   SIGNAL write1                 : std_logic;
   SIGNAL write1pg               : std_logic;
   SIGNAL writegate              : std_logic;
   SIGNAL writehit0              : std_logic;
   SIGNAL writehit1              : std_logic;

   -- Implicit buffer signal declarations
   SIGNAL MRESP_H_internal            : std_logic;
   SIGNAL miss_internal               : std_logic;
   SIGNAL evict_buffer_valid_internal : std_logic;


   -- Component Declarations
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
   COMPONENT EvictionBuffer
   PORT (
      CacheDataOut           : IN     LC3b_oword ;
      WBAddress              : IN     LC3b_word ;
      clk                    : IN     std_logic ;
      load_evict_buffer      : IN     std_logic ;
      reset_l                : IN     STD_LOGIC ;
      set_evict_buffer_valid : IN     std_logic ;
      PMDATAOUT              : OUT    LC3B_OWORD ;
      evict_buffer_valid     : OUT    std_logic ;
      evicted_address        : OUT    LC3b_word 
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
      clk       : IN     std_logic ;
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
   COMPONENT AND3
   PORT (
      A : IN     STD_LOGIC ;
      B : IN     STD_LOGIC ;
      C : IN     STD_LOGIC ;
      F : OUT    STD_LOGIC 
   );
   END COMPONENT;
   COMPONENT MUX2_1
   PORT (
      A   : IN     STD_LOGIC ;
      B   : IN     STD_LOGIC ;
      SEL : IN     STD_LOGIC ;
      F   : OUT    STD_LOGIC 
   );
   END COMPONENT;
   COMPONENT NOR2
   PORT (
      A : IN     STD_LOGIC ;
      B : IN     STD_LOGIC ;
      F : OUT    STD_LOGIC 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : AND3 USE ENTITY mp3lib.AND3;
   FOR ALL : Bit_Array USE ENTITY ece411.Bit_Array;
   FOR ALL : DataCombiner USE ENTITY ece411.DataCombiner;
   FOR ALL : EvictionBuffer USE ENTITY ece411.EvictionBuffer;
   FOR ALL : MUX2_1 USE ENTITY mp3lib.MUX2_1;
   FOR ALL : Mux2 USE ENTITY ece411.Mux2;
   FOR ALL : NAND2 USE ENTITY ece411.NAND2;
   FOR ALL : NAND3 USE ENTITY ece411.NAND3;
   FOR ALL : NOR2 USE ENTITY mp3lib.NOR2;
   FOR ALL : OWordMux2 USE ENTITY ece411.OWordMux2;
   FOR ALL : Splitter USE ENTITY ece411.Splitter;
   FOR ALL : Timer USE ENTITY ece411.Timer;
   FOR ALL : Way USE ENTITY ece411.Way;
   FOR ALL : WordMux2 USE ENTITY ece411.WordMux2;
   FOR ALL : WordSelector USE ENTITY ece411.WordSelector;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   U_3 : ENTITY ece411.AND2
      PORT MAP (
         A => ProtoHit,
         B => mem_access,
         Y => hit
      );
   U_5 : ENTITY ece411.AND2
      PORT MAP (
         A => Protomiss,
         B => mem_access,
         Y => miss_internal
      );
   U_12 : ENTITY ece411.AND2
      PORT MAP (
         A => evicted,
         B => in_load,
         Y => load1
      );
   U_13 : ENTITY ece411.AND2
      PORT MAP (
         A => evict0,
         B => in_load,
         Y => load0
      );
   U_16 : ENTITY ece411.AND2
      PORT MAP (
         A => write,
         B => present1,
         Y => writehit1
      );
   U_17 : ENTITY ece411.AND2
      PORT MAP (
         A => write,
         B => present0,
         Y => writehit0
      );
   U_18 : ENTITY ece411.AND2
      PORT MAP (
         A => hit,
         B => not_loading,
         Y => truehit
      );
   U_19 : ENTITY ece411.AND2
      PORT MAP (
         A => not_loading,
         B => Y,
         Y => Set_Dirty
      );
   writeAND0 : ENTITY ece411.AND2
      PORT MAP (
         A => writegate,
         B => write0pg,
         Y => write0
      );
   writeAND1 : ENTITY ece411.AND2
      PORT MAP (
         A => writegate,
         B => write1pg,
         Y => write1
      );
   writeLRU : ENTITY ece411.AND2
      PORT MAP (
         A => pre_mresp_h,
         B => LRUgate,
         Y => MRESP_H_internal
      );
   LRU : Bit_Array
      PORT MAP (
         RESET_L   => reset_l,
         DataWrite => MRESP_H_internal,
         Index     => Index,
         DataIn    => LRU_data_in,
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
   aEvictionBuffer : EvictionBuffer
      PORT MAP (
         CacheDataOut           => CacheDataOut,
         WBAddress              => WBAddress,
         clk                    => clk,
         load_evict_buffer      => load_evict_buffer,
         reset_l                => reset_l,
         set_evict_buffer_valid => set_evict_buffer_valid,
         PMDATAOUT              => PMDATAOUT,
         evict_buffer_valid     => evict_buffer_valid_internal,
         evicted_address        => evicted_address
      );
   U_7 : Mux2
      PORT MAP (
         A   => Dirty0,
         B   => Dirty1,
         Sel => evicted,
         Y   => dirty
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
   U_4 : ENTITY ece411.NOT1
      PORT MAP (
         A => ProtoHit,
         Y => Protomiss
      );
   U_14 : ENTITY ece411.NOT1
      PORT MAP (
         A => evicted,
         Y => evict0
      );
   U_20 : ENTITY ece411.NOT1
      PORT MAP (
         A => in_load,
         Y => not_loading
      );
   U_0 : ENTITY ece411.OR2
      PORT MAP (
         A => present1,
         B => present0,
         Y => ProtoHit
      );
   U_11 : ENTITY ece411.OR2
      PORT MAP (
         A => writehit1,
         B => load1,
         Y => write1pg
      );
   U_15 : ENTITY ece411.OR2
      PORT MAP (
         A => writehit0,
         B => load0,
         Y => write0pg
      );
   U_21 : ENTITY ece411.OR2
      PORT MAP (
         A => dirty,
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
         Y   => CacheDataOut
      );
   WayDataMux : OWordMux2
      PORT MAP (
         A   => Way0Dataout,
         B   => Way1Dataout,
         Sel => present1,
         Y   => DataOWord
      );
   WayDataMux1 : OWordMux2
      PORT MAP (
         A   => DataOWord,
         B   => PMDATAIN,
         Sel => in_load,
         Y   => cacheline_out
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
         clk       => clk,
         LRUgate   => LRUgate,
         writegate => writegate
      );
   Way0 : Way
      PORT MAP (
         DataIn           => WayDataIn,
         DataWrite        => write0,
         Index            => Index,
         RESET_L          => reset_l,
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
         RESET_L          => reset_l,
         SetDirty         => Set_Dirty,
         TagIn            => Tag,
         DataOut          => Way1Dataout,
         Dirty            => Dirty1,
         Present          => present1,
         WriteBackAddress => WBAddrWay1
      );
   U_1 : WordMux2
      PORT MAP (
         A   => evicted_address,
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
         Input  => cacheline_out,
         Index  => Offset,
         Output => DATAIN
      );
   U_25 : ENTITY mp3lib.AND2
      PORT MAP (
         A => in_load,
         B => PMRESP_H,
         F => load_resp
      );
   U_8 : AND3
      PORT MAP (
         A => in_idlehit,
         B => miss_internal,
         C => dirty,
         F => load_evict_buffer
      );
   U_26 : MUX2_1
      PORT MAP (
         A   => present0,
         B   => evicted_l,
         SEL => in_load,
         F   => LRU_data_in
      );
   U_10 : NOR2
      PORT MAP (
         A => buffer_occupied_l,
         B => in_writeback,
         F => set_evict_buffer_valid
      );
   U_22 : NOR2
      PORT MAP (
         A => evict_buffer_valid_internal,
         B => load_evict_buffer,
         F => buffer_occupied_l
      );
   U_27 : ENTITY mp3lib.NOT1
      PORT MAP (
         A => evicted,
         F => evicted_l
      );
   U_24 : ENTITY mp3lib.OR2
      PORT MAP (
         A => truehit,
         B => load_resp,
         F => pre_mresp_h
      );

   -- Implicit buffered output assignments
   MRESP_H            <= MRESP_H_internal;
   miss               <= miss_internal;
   evict_buffer_valid <= evict_buffer_valid_internal;

END struct;
