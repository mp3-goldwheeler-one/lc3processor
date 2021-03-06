-- VHDL Entity ece411.Stage2CacheLogic.interface
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Stage2CacheLogic IS
   PORT( 
      CLK                : IN     std_logic;
      Dataout            : IN     LC3b_word;
      Index              : IN     LC3b_C_INDEX;
      MREAD_L            : IN     std_logic;
      MWRITEH_L          : IN     std_logic;
      MWRITEL_L          : IN     std_logic;
      Offset             : IN     std_logic_vector (2 DOWNTO 0);
      PMDATAIN           : IN     LC3B_OWORD;
      PMRESP_H           : IN     STD_LOGIC;
      Tag                : IN     LC3b_C_TAG;
      Way0Dataout        : IN     LC3B_OWORD;
      Way1Dataout        : IN     LC3B_OWORD;
      dirty0             : IN     std_logic;
      dirty1             : IN     std_logic;
      evicted            : IN     std_logic;
      in_idlehit         : IN     std_logic;
      in_load            : IN     std_logic;
      in_writeback       : IN     std_logic;
      index_match        : IN     STD_LOGIC;
      last_Set_Dirty     : IN     std_logic;
      last_WayDataIn     : IN     LC3b_OWORD;
      last_WriteTag      : IN     LC3b_c_tag;
      last_lru_data_in   : IN     std_logic;
      last_write0        : IN     std_logic;
      last_write1        : IN     STD_LOGIC;
      replace_way0       : IN     std_logic;
      replace_way1       : IN     std_logic;
      reset_l            : IN     STD_LOGIC;
      tag0               : IN     LC3b_C_TAG;
      tag1               : IN     LC3b_C_TAG;
      valid0             : IN     std_logic;
      valid1             : IN     std_logic;
      DATAIN             : OUT    LC3b_word;
      MRESP_H            : OUT    std_logic;
      PMADDRESS          : OUT    LC3B_WORD;
      PMDATAOUT          : OUT    LC3B_OWORD;
      WayDataIn          : OUT    LC3b_OWORD;
      WriteIndex         : OUT    LC3b_C_INDEX;
      WriteTag           : OUT    LC3b_C_TAG;
      evict_buffer_valid : OUT    std_logic;
      lru_data_in        : OUT    STD_LOGIC;
      set_dirty          : OUT    std_logic;
      write0             : OUT    std_logic;
      write1             : OUT    std_logic;
      miss               : BUFFER std_logic
   );

-- Declarations

END Stage2CacheLogic ;

--
-- VHDL Architecture ece411.Stage2CacheLogic.struct
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

ARCHITECTURE struct OF Stage2CacheLogic IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL Address                : LC3b_word;
   SIGNAL CacheDataOut           : LC3b_oword;
   SIGNAL CompVal0               : std_logic;
   SIGNAL CompVal1               : std_logic;
   SIGNAL DataOWord              : LC3b_oword;
   SIGNAL DecodeOffset           : LC3B_TRISTATE_8MUX_SEL;
   SIGNAL LRUgate                : STD_LOGIC;
   SIGNAL ProtoHit               : std_logic;
   SIGNAL Protomiss              : std_logic;
   SIGNAL WBAddrWay0             : LC3b_word;
   SIGNAL WBAddrWay1             : LC3b_word;
   SIGNAL WBAddress              : LC3b_word;
   SIGNAL Way0Dataout_fw         : LC3B_OWORD;
   SIGNAL Way1Dataout_fw         : LC3B_OWORD;
   SIGNAL Y                      : std_logic;
   SIGNAL buffer_occupied_l      : std_logic;
   SIGNAL cacheline_out          : LC3B_OWORD;
   SIGNAL cacheline_out_sel      : LC3b_TRISTATE_2MUX_SEL;
   SIGNAL dirty                  : std_logic;
   SIGNAL dirty0_fw              : std_logic;
   SIGNAL dirty1_fw              : std_logic;
   SIGNAL evict0                 : std_logic;
   SIGNAL evicted_address        : LC3b_word;
   SIGNAL evicted_fw             : std_logic;
   SIGNAL hit                    : std_logic;
   SIGNAL load0                  : std_logic;
   SIGNAL load1                  : std_logic;
   SIGNAL load_evict_buffer      : std_logic;
   SIGNAL load_resp              : std_logic;
   SIGNAL mem_access             : std_logic;
   SIGNAL not_loading            : std_logic;
   SIGNAL one                    : STD_LOGIC;
   SIGNAL pre_mresp_h            : STD_LOGIC;
   SIGNAL present0               : std_logic;
   SIGNAL present1               : std_logic;
   SIGNAL set_evict_buffer_valid : std_logic;
   SIGNAL tag0_fw                : LC3b_C_TAG;
   SIGNAL tag1_fw                : LC3b_C_TAG;
   SIGNAL truehit                : std_logic;
   SIGNAL valid0_fw              : std_logic;
   SIGNAL valid1_fw              : std_logic;
   SIGNAL way_data_sel           : LC3B_TRISTATE_2MUX_SEL;
   SIGNAL word0                  : LC3b_word;
   SIGNAL word1                  : LC3b_word;
   SIGNAL word2                  : LC3b_word;
   SIGNAL word3                  : LC3b_word;
   SIGNAL word4                  : LC3b_word;
   SIGNAL word5                  : LC3B_WORD;
   SIGNAL word6                  : LC3b_word;
   SIGNAL word7                  : LC3b_word;
   SIGNAL write                  : std_logic;
   SIGNAL write0pg               : std_logic;
   SIGNAL write1pg               : std_logic;
   SIGNAL writegate              : std_logic;
   SIGNAL writehit0              : std_logic;
   SIGNAL writehit1              : std_logic;

   -- Implicit buffer signal declarations
   SIGNAL evict_buffer_valid_internal : std_logic;


   -- Component Declarations
   COMPONENT Comparator
   GENERIC (
      N     : Integer;
      Delay : time
   );
   PORT (
      A : IN     std_logic_vector (N-1 DOWNTO 0);
      B : IN     std_logic_vector (N-1 DOWNTO 0);
      Y : OUT    std_logic
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
   COMPONENT Decode3to8
   PORT (
      input  : IN     std_logic_vector (2 DOWNTO 0);
      output : OUT    std_logic_vector (7 DOWNTO 0)
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
   COMPONENT Mux2_N
   GENERIC (
      N : integer
   );
   PORT (
      A   : IN     std_logic_vector ( N-1 DOWNTO 0 );
      B   : IN     std_logic_vector ( N-1 DOWNTO 0 );
      Sel : IN     std_logic ;
      Y   : OUT    std_logic_vector ( N-1 DOWNTO 0 )
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
   COMPONENT OWordMux2
   PORT (
      A   : IN     LC3b_oword ;
      B   : IN     LC3b_oword ;
      Sel : IN     std_logic ;
      Y   : OUT    LC3b_oword 
   );
   END COMPONENT;
   COMPONENT OWordSplitter
   PORT (
      OWordIn : IN     LC3b_oword ;
      word0   : OUT    LC3b_word ;
      word1   : OUT    LC3b_word ;
      word2   : OUT    LC3b_word ;
      word3   : OUT    LC3b_word ;
      word4   : OUT    LC3b_word ;
      word5   : OUT    LC3b_word ;
      word6   : OUT    LC3b_word ;
      word7   : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT Timer2
   PORT (
      CLK       : IN     std_logic ;
      LRUgate   : BUFFER STD_LOGIC ;
      writegate : BUFFER std_logic 
   );
   END COMPONENT;
   COMPONENT TristateMux2_N
   GENERIC (
      n : integer
   );
   PORT (
      A   : IN     std_logic_vector (n-1 DOWNTO 0);
      B   : IN     std_logic_vector (n-1 DOWNTO 0);
      sel : IN     LC3b_TRISTATE_2MUX_SEL ;
      F   : OUT    std_logic_vector (n-1 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT TristateMux8_N
   GENERIC (
      n : integer
   );
   PORT (
      A    : IN     std_logic_vector (n-1 DOWNTO 0);
      B    : IN     std_logic_vector ( n-1 DOWNTO 0 );
      C    : IN     std_logic_vector ( n-1 DOWNTO 0 );
      D    : IN     std_logic_vector (n-1 DOWNTO 0);
      E    : IN     std_logic_vector (n-1 DOWNTO 0);
      F    : IN     std_logic_vector (n-1 DOWNTO 0);
      G    : IN     std_logic_vector (n-1 DOWNTO 0);
      H    : IN     std_logic_vector (n-1 DOWNTO 0);
      Sel  : IN     std_logic_vector (7 DOWNTO 0);
      Fout : OUT    std_logic_vector (n-1 DOWNTO 0)
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
   FOR ALL : Comparator USE ENTITY ece411.Comparator;
   FOR ALL : DataCombiner USE ENTITY ece411.DataCombiner;
   FOR ALL : Decode3to8 USE ENTITY ece411.Decode3to8;
   FOR ALL : EvictionBuffer USE ENTITY ece411.EvictionBuffer;
   FOR ALL : MUX2_1 USE ENTITY mp3lib.MUX2_1;
   FOR ALL : Mux2 USE ENTITY ece411.Mux2;
   FOR ALL : Mux2_N USE ENTITY ece411.Mux2_N;
   FOR ALL : NAND2 USE ENTITY ece411.NAND2;
   FOR ALL : NAND3 USE ENTITY ece411.NAND3;
   FOR ALL : NOR2 USE ENTITY mp3lib.NOR2;
   FOR ALL : NOT1 USE ENTITY ece411.NOT1;
   FOR ALL : OWordMux2 USE ENTITY ece411.OWordMux2;
   FOR ALL : OWordSplitter USE ENTITY ece411.OWordSplitter;
   FOR ALL : Timer2 USE ENTITY ece411.Timer2;
   FOR ALL : TristateMux2_N USE ENTITY ece411.TristateMux2_N;
   FOR ALL : TristateMux8_N USE ENTITY ece411.TristateMux8_N;
   FOR ALL : WordMux2 USE ENTITY ece411.WordMux2;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   one <= '1';

   -- HDL Embedded Text Block 2 eb2
   WBAddrWay0 <= tag0_fw & Index & "0000";
   WBAddrWay1 <= tag1_fw & Index & "0000";
   WriteTag <= Tag;
   WriteIndex <= Index;
   Address <= Tag & Index & Offset & '0';

   -- HDL Embedded Text Block 3 eb3
   cacheline_out_sel <= in_load & not_loading;
   way_data_sel <= present1 & present0;


   -- Instance port mappings.
   U_12 : ENTITY ece411.AND2
      PORT MAP (
         A => evicted_fw,
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
   U_19 : ENTITY ece411.AND2
      PORT MAP (
         A => not_loading,
         B => dirty,
         Y => Y
      );
   U_25 : ENTITY ece411.AND2
      PORT MAP (
         A => Protomiss,
         B => mem_access,
         Y => miss
      );
   U_28 : ENTITY ece411.AND2
      PORT MAP (
         A => ProtoHit,
         B => mem_access,
         Y => hit
      );
   U_30 : ENTITY ece411.AND2
      PORT MAP (
         A => hit,
         B => not_loading,
         Y => truehit
      );
   U_36 : ENTITY ece411.AND2
      PORT MAP (
         A => CompVal0,
         B => valid0_fw,
         Y => present0
      );
   U_37 : ENTITY ece411.AND2
      PORT MAP (
         A => CompVal1,
         B => valid1_fw,
         Y => present1
      );
   writeAND0 : ENTITY ece411.AND2
      PORT MAP (
         A => writegate,
         B => write0pg,
         Y => write0
      );
   writeAND1 : ENTITY ece411.AND2
      PORT MAP (
         A => write1pg,
         B => writegate,
         Y => write1
      );
   writeLRU : ENTITY ece411.AND2
      PORT MAP (
         A => pre_mresp_h,
         B => LRUgate,
         Y => MRESP_H
      );
   TagCompare0 : Comparator
      GENERIC MAP (
         N     => 9,
         Delay => DELAY_COMPARE16
      )
      PORT MAP (
         A => tag0_fw,
         B => Tag,
         Y => CompVal0
      );
   TagCompare1 : Comparator
      GENERIC MAP (
         N     => 9,
         Delay => DELAY_COMPARE16
      )
      PORT MAP (
         A => tag1_fw,
         B => Tag,
         Y => CompVal1
      );
   aDataCombiner : DataCombiner
      PORT MAP (
         MWRITEH_L => MWRITEH_L,
         MWRITEL_L => MWRITEL_L,
         OWordIn   => cacheline_out,
         Offset    => Offset,
         WordIn    => Dataout,
         OWordOut  => WayDataIn
      );
   U_39 : Decode3to8
      PORT MAP (
         input  => Offset,
         output => DecodeOffset
      );
   U_27 : EvictionBuffer
      PORT MAP (
         CacheDataOut           => CacheDataOut,
         WBAddress              => WBAddress,
         clk                    => CLK,
         load_evict_buffer      => load_evict_buffer,
         reset_l                => reset_l,
         set_evict_buffer_valid => set_evict_buffer_valid,
         PMDATAOUT              => PMDATAOUT,
         evict_buffer_valid     => evict_buffer_valid_internal,
         evicted_address        => evicted_address
      );
   U_23 : Mux2
      PORT MAP (
         A   => dirty0_fw,
         B   => dirty1_fw,
         Sel => evicted_fw,
         Y   => dirty
      );
   U_2 : Mux2_N
      GENERIC MAP (
         N => 9
      )
      PORT MAP (
         A   => tag0,
         B   => last_WriteTag,
         Sel => replace_way0,
         Y   => tag0_fw
      );
   U_3 : Mux2_N
      GENERIC MAP (
         N => 9
      )
      PORT MAP (
         A   => tag1,
         B   => last_WriteTag,
         Sel => replace_way1,
         Y   => tag1_fw
      );
   U_9 : NAND2
      PORT MAP (
         A => MWRITEL_L,
         B => MWRITEH_L,
         Y => write
      );
   U_10 : NAND3
      PORT MAP (
         A => MREAD_L,
         B => MWRITEH_L,
         C => MWRITEL_L,
         Y => mem_access
      );
   U_14 : NOT1
      PORT MAP (
         A => evicted_fw,
         Y => evict0
      );
   U_20 : NOT1
      PORT MAP (
         A => in_load,
         Y => not_loading
      );
   U_22 : NOT1
      PORT MAP (
         A => ProtoHit,
         Y => Protomiss
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
   U_18 : ENTITY ece411.OR2
      PORT MAP (
         A => present1,
         B => present0,
         Y => ProtoHit
      );
   U_21 : ENTITY ece411.OR2
      PORT MAP (
         A => Y,
         B => write,
         Y => set_dirty
      );
   PMDataMux : OWordMux2
      PORT MAP (
         A   => Way0Dataout_fw,
         B   => Way1Dataout_fw,
         Sel => evicted_fw,
         Y   => CacheDataOut
      );
   U_0 : OWordMux2
      PORT MAP (
         A   => Way0Dataout,
         B   => last_WayDataIn,
         Sel => replace_way0,
         Y   => Way0Dataout_fw
      );
   U_1 : OWordMux2
      PORT MAP (
         A   => Way1Dataout,
         B   => last_WayDataIn,
         Sel => replace_way1,
         Y   => Way1Dataout_fw
      );
   aSplitter : OWordSplitter
      PORT MAP (
         OWordIn => cacheline_out,
         word0   => word0,
         word1   => word1,
         word2   => word2,
         word3   => word3,
         word4   => word4,
         word5   => word5,
         word6   => word6,
         word7   => word7
      );
   aTimer : Timer2
      PORT MAP (
         CLK       => CLK,
         LRUgate   => LRUgate,
         writegate => writegate
      );
   U_40 : TristateMux2_N
      GENERIC MAP (
         n => 128
      )
      PORT MAP (
         A   => DataOWord,
         B   => PMDATAIN,
         sel => cacheline_out_sel,
         F   => cacheline_out
      );
   U_41 : TristateMux2_N
      GENERIC MAP (
         n => 128
      )
      PORT MAP (
         A   => Way0Dataout_fw,
         B   => Way1Dataout_fw,
         sel => way_data_sel,
         F   => DataOWord
      );
   U_38 : TristateMux8_N
      GENERIC MAP (
         n => 16
      )
      PORT MAP (
         A    => word0,
         B    => word1,
         C    => word2,
         D    => word3,
         E    => word4,
         F    => word5,
         G    => word6,
         H    => word7,
         Sel  => DecodeOffset,
         Fout => DATAIN
      );
   U_24 : WordMux2
      PORT MAP (
         A   => WBAddrWay0,
         B   => WBAddrWay1,
         Sel => evicted_fw,
         F   => WBAddress
      );
   U_35 : WordMux2
      PORT MAP (
         A   => evicted_address,
         B   => Address,
         Sel => in_load,
         F   => PMADDRESS
      );
   U_29 : ENTITY mp3lib.AND2
      PORT MAP (
         A => in_load,
         B => PMRESP_H,
         F => load_resp
      );
   U_34 : AND3
      PORT MAP (
         A => in_idlehit,
         B => miss,
         C => dirty,
         F => load_evict_buffer
      );
   U_4 : MUX2_1
      PORT MAP (
         A   => dirty0,
         B   => last_Set_Dirty,
         SEL => replace_way0,
         F   => dirty0_fw
      );
   U_5 : MUX2_1
      PORT MAP (
         A   => dirty1,
         B   => last_Set_Dirty,
         SEL => replace_way1,
         F   => dirty1_fw
      );
   U_6 : MUX2_1
      PORT MAP (
         A   => valid0,
         B   => one,
         SEL => replace_way0,
         F   => valid0_fw
      );
   U_7 : MUX2_1
      PORT MAP (
         A   => valid1,
         B   => one,
         SEL => replace_way1,
         F   => valid1_fw
      );
   U_8 : MUX2_1
      PORT MAP (
         A   => evicted,
         B   => last_lru_data_in,
         SEL => index_match,
         F   => evicted_fw
      );
   U_26 : MUX2_1
      PORT MAP (
         A   => present0,
         B   => evict0,
         SEL => in_load,
         F   => lru_data_in
      );
   U_31 : NOR2
      PORT MAP (
         A => evict_buffer_valid_internal,
         B => load_evict_buffer,
         F => buffer_occupied_l
      );
   U_32 : NOR2
      PORT MAP (
         A => buffer_occupied_l,
         B => in_writeback,
         F => set_evict_buffer_valid
      );
   U_33 : ENTITY mp3lib.OR2
      PORT MAP (
         A => truehit,
         B => load_resp,
         F => pre_mresp_h
      );

   -- Implicit buffered output assignments
   evict_buffer_valid <= evict_buffer_valid_internal;

END struct;
