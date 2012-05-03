-- VHDL Entity ece411.Pipelined_L1_Stage1.symbol
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Pipelined_L1_Stage1 IS
   PORT( 
      ADDRESS         : IN     LC3B_WORD;
      RESET_L         : IN     std_logic;
      feedback        : IN     LC3b_cache_feedback_data;
      interstage_data : OUT    LC3b_cache_interstage_data;
      ReadIndex       : BUFFER lc3b_c_index
   );

-- Declarations

END Pipelined_L1_Stage1 ;

--
-- VHDL Architecture ece411.Pipelined_L1_Stage1.struct
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY ece411;

ARCHITECTURE struct OF Pipelined_L1_Stage1 IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL LRU_data_in : std_logic;
   SIGNAL LRU_write   : std_logic;
   SIGNAL ReadOffset  : std_logic_vector(2 DOWNTO 0);
   SIGNAL ReadTag     : std_logic_vector(8 DOWNTO 0);
   SIGNAL Set_Dirty   : std_logic;
   SIGNAL Way0Dataout : LC3B_OWORD;
   SIGNAL Way1Dataout : LC3B_OWORD;
   SIGNAL WayDataIn   : LC3b_OWORD;
   SIGNAL WriteIndex  : LC3b_c_index;
   SIGNAL WriteTag    : LC3b_c_tag;
   SIGNAL dirty0      : std_logic;
   SIGNAL dirty1      : std_logic;
   SIGNAL evicted     : std_logic;
   SIGNAL tag0        : LC3b_C_TAG;
   SIGNAL tag1        : LC3b_C_TAG;
   SIGNAL valid0      : std_logic;
   SIGNAL valid1      : std_logic;
   SIGNAL write0      : std_logic;
   SIGNAL write1      : std_logic;


   -- Component Declarations
   COMPONENT Bit_Array_RW
   GENERIC (
      DELAY     : Time    := DELAY_256B;
      INDEX_LEN : INTEGER := 3
   );
   PORT (
      RESET_L    : IN     std_logic ;
      DataWrite  : IN     std_logic ;
      ReadIndex  : IN     std_logic_vector (INDEX_LEN-1 DOWNTO 0);
      WriteIndex : IN     std_logic_vector (INDEX_LEN-1 DOWNTO 0);
      DataIn     : IN     std_logic ;
      DataOut    : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT L1Way
   PORT (
      DataWrite  : IN     std_logic ;
      RESET_L    : IN     std_logic ;
      ReadIndex  : IN     lc3b_c_index ;
      Set_Dirty  : IN     std_logic ;
      WayDataIn  : IN     LC3b_OWORD ;
      WriteIndex : IN     LC3b_c_index ;
      WriteTag   : IN     LC3b_c_tag ;
      Dirty      : OUT    std_logic ;
      TagOut     : OUT    LC3b_C_TAG ;
      Valid      : OUT    std_logic ;
      WayDataout : OUT    LC3B_OWORD 
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

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : Bit_Array_RW USE ENTITY ece411.Bit_Array_RW;
   FOR ALL : L1Way USE ENTITY ece411.L1Way;
   FOR ALL : Splitter USE ENTITY ece411.Splitter;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   interstage_data.index <= ReadIndex;
   interstage_data.offset <= ReadOffset & '0';
   interstage_data.tag <= ReadTag;
   interstage_data.evicted <= evicted;
   
   interstage_data.tag0 <= tag0;
   interstage_data.dirty0 <= dirty0;
   interstage_data.valid0 <= valid0;
   interstage_data.Way0Dataout <= Way0Dataout;
   
   interstage_data.tag1 <= tag1;
   interstage_data.dirty1 <= dirty1;
   interstage_data.valid1 <= valid1;
   interstage_data.Way1Dataout <= Way1Dataout;

   -- HDL Embedded Text Block 2 eb2
   WriteTag    <= feedback.WriteTag;
   WriteIndex  <= feedback.WriteIndex;
   Set_Dirty   <= feedback.Set_Dirty;
   WayDataIn   <= feedback.WayDataIn;
   write0      <= feedback.write0;
   write1      <= feedback.write1;
   LRU_data_in <= feedback.LRU_data_in;
   LRU_write   <= feedback.LRU_write;


   -- Instance port mappings.
   LRU : Bit_Array_RW
      GENERIC MAP (
         DELAY     => DELAY_256B,
         INDEX_LEN => 3
      )
      PORT MAP (
         RESET_L    => RESET_L,
         DataWrite  => LRU_write,
         ReadIndex  => ReadIndex,
         WriteIndex => WriteIndex,
         DataIn     => LRU_data_in,
         DataOut    => evicted
      );
   Way0 : L1Way
      PORT MAP (
         DataWrite  => write0,
         RESET_L    => RESET_L,
         ReadIndex  => ReadIndex,
         Set_Dirty  => Set_Dirty,
         WayDataIn  => WayDataIn,
         WriteIndex => WriteIndex,
         WriteTag   => WriteTag,
         Dirty      => dirty0,
         TagOut     => tag0,
         Valid      => valid0,
         WayDataout => Way0Dataout
      );
   Way1 : L1Way
      PORT MAP (
         DataWrite  => write1,
         RESET_L    => RESET_L,
         ReadIndex  => ReadIndex,
         Set_Dirty  => Set_Dirty,
         WayDataIn  => WayDataIn,
         WriteIndex => WriteIndex,
         WriteTag   => WriteTag,
         Dirty      => dirty1,
         TagOut     => tag1,
         Valid      => valid1,
         WayDataout => Way1Dataout
      );
   aSplitter : Splitter
      PORT MAP (
         Address => ADDRESS,
         Tag     => ReadTag,
         Index   => ReadIndex,
         Offset  => ReadOffset
      );

END struct;
