-- VHDL Entity ece411.BTB_Datapath.symbol
--
-- Created:
--          by - wheele11.ews (gelib-057-20.ews.illinois.edu)
--          at - 00:57:36 04/16/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY BTB_Datapath IS
   PORT( 
      DataOut      : IN     btb_line;
      MREAD_L      : IN     std_logic;
      MWRITE_L     : IN     std_logic;
      ReadAddress  : IN     LC3b_word;
      WriteAddress : IN     LC3b_word;
      clk          : IN     std_logic;
      reset_l      : IN     std_logic;
      DATAIN       : OUT    btb_line;
      miss         : OUT    std_logic
   );

-- Declarations

END BTB_Datapath ;

--
-- VHDL Architecture ece411.BTB_Datapath.struct
--
-- Created:
--          by - wheele11.ews (gelib-057-20.ews.illinois.edu)
--          at - 00:57:37 04/16/12
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

ARCHITECTURE struct OF BTB_Datapath IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL F           : STD_LOGIC;
   SIGNAL ProtoHit    : std_logic;
   SIGNAL Protomiss   : std_logic;
   SIGNAL ReadIndex   : lc3b_c_index;
   SIGNAL ReadTag     : std_logic_vector(12 DOWNTO 0);
   SIGNAL Way0Dataout : btb_line;
   SIGNAL Way1Dataout : btb_line;
   SIGNAL WriteIndex  : lc3b_c_index;
   SIGNAL WriteTag    : std_logic_vector(12 DOWNTO 0);
   SIGNAL Y           : std_logic;
   SIGNAL evicted     : std_logic;
   SIGNAL hit         : std_logic;
   SIGNAL load0       : std_logic;
   SIGNAL load1       : std_logic;
   SIGNAL mem_access  : std_logic;
   SIGNAL present0    : std_logic;
   SIGNAL present1    : std_logic;
   SIGNAL write0      : std_logic;
   SIGNAL write0pg    : std_logic;
   SIGNAL write1      : std_logic;
   SIGNAL write1pg    : std_logic;
   SIGNAL writegate   : std_logic;
   SIGNAL writehit0   : std_logic;
   SIGNAL writehit1   : std_logic;


   -- Component Declarations
   COMPONENT BTBLineMux2
   PORT (
      A   : IN     btb_line ;
      B   : IN     btb_line ;
      Sel : IN     std_logic ;
      Y   : OUT    btb_line 
   );
   END COMPONENT;
   COMPONENT BTB_PC_Splitter
   PORT (
      Address : IN     LC3b_word ;
      Tag     : OUT    std_logic_vector (12 DOWNTO 0);
      Index   : OUT    std_logic_vector (2 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT BTB_Timer
   PORT (
      clk       : IN     std_logic ;
      writegate : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT BTB_Way
   PORT (
      DataIn     : IN     btb_line ;
      DataWrite  : IN     std_logic ;
      RESET_L    : IN     std_logic ;
      ReadIndex  : IN     lc3b_c_index ;
      ReadTag    : IN     std_logic_vector (12 DOWNTO 0);
      WriteIndex : IN     LC3b_c_index ;
      WriteTag   : IN     std_logic_vector (12 DOWNTO 0);
      DataOut    : OUT    btb_line ;
      Present    : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT Bit_Array_RW
   PORT (
      RESET_L    : IN     std_logic ;
      DataWrite  : IN     std_logic ;
      ReadIndex  : IN     LC3b_c_index ;
      WriteIndex : IN     LC3b_c_index ;
      DataIn     : IN     std_logic ;
      DataOut    : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT NAND2
   PORT (
      A : IN     std_logic ;
      B : IN     std_logic ;
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

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : BTBLineMux2 USE ENTITY ece411.BTBLineMux2;
   FOR ALL : BTB_PC_Splitter USE ENTITY ece411.BTB_PC_Splitter;
   FOR ALL : BTB_Timer USE ENTITY ece411.BTB_Timer;
   FOR ALL : BTB_Way USE ENTITY ece411.BTB_Way;
   FOR ALL : Bit_Array_RW USE ENTITY ece411.Bit_Array_RW;
   FOR ALL : NAND2 USE ENTITY ece411.NAND2;
   FOR ALL : OR2 USE ENTITY ece411.OR2;
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
         Y => miss
      );
   U_16 : ENTITY ece411.AND2
      PORT MAP (
         A => MWRITE_L,
         B => present1,
         Y => writehit1
      );
   U_17 : ENTITY ece411.AND2
      PORT MAP (
         A => MWRITE_L,
         B => present0,
         Y => writehit0
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
   WayDataMux : BTBLineMux2
      PORT MAP (
         A   => Way0Dataout,
         B   => Way1Dataout,
         Sel => present1,
         Y   => DATAIN
      );
   aSplitter : BTB_PC_Splitter
      PORT MAP (
         Address => ReadAddress,
         Tag     => ReadTag,
         Index   => ReadIndex
      );
   aSplitter1 : BTB_PC_Splitter
      PORT MAP (
         Address => WriteAddress,
         Tag     => WriteTag,
         Index   => WriteIndex
      );
   aTimer : BTB_Timer
      PORT MAP (
         clk       => clk,
         writegate => writegate
      );
   Way0 : BTB_Way
      PORT MAP (
         DataIn     => DataOut,
         DataWrite  => write0,
         RESET_L    => reset_l,
         ReadIndex  => ReadIndex,
         ReadTag    => ReadTag,
         WriteIndex => WriteIndex,
         WriteTag   => WriteTag,
         DataOut    => Way0Dataout,
         Present    => present0
      );
   Way1 : BTB_Way
      PORT MAP (
         DataIn     => DataOut,
         DataWrite  => write1,
         RESET_L    => reset_l,
         ReadIndex  => ReadIndex,
         ReadTag    => ReadTag,
         WriteIndex => WriteIndex,
         WriteTag   => WriteTag,
         DataOut    => Way1Dataout,
         Present    => present1
      );
   LRU : Bit_Array_RW
      PORT MAP (
         RESET_L    => reset_l,
         DataWrite  => F,
         ReadIndex  => ReadIndex,
         WriteIndex => WriteIndex,
         DataIn     => present0,
         DataOut    => evicted
      );
   U_2 : NAND2
      PORT MAP (
         A => MREAD_L,
         B => MWRITE_L,
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
         Y => Y
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
   U_1 : ENTITY mp3lib.AND2
      PORT MAP (
         A => evicted,
         B => MWRITE_L,
         F => load0
      );
   U_6 : ENTITY mp3lib.AND2
      PORT MAP (
         A => Y,
         B => MWRITE_L,
         F => load1
      );
   U_7 : ENTITY mp3lib.NOT1
      PORT MAP (
         A => MWRITE_L,
         F => F
      );

END struct;
