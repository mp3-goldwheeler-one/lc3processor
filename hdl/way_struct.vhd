-- VHDL Entity ece411.Way.symbol
--
-- Created:
--          by - one1.ews (gelib-057-34.ews.illinois.edu)
--          at - 23:42:23 04/25/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Way IS
   PORT( 
      DataIn           : IN     LC3b_pword;
      DataWrite        : IN     std_logic;
      Index            : IN     LC3b_l2_c_index;
      RESET_L          : IN     std_logic;
      SetDirty         : IN     std_logic;
      TagIn            : IN     lc3b_l2_c_tag;
      DataOut          : OUT    LC3b_pword;
      Dirty            : OUT    std_logic;
      Present          : OUT    std_logic;
      WriteBackAddress : OUT    LC3b_word
   );

-- Declarations

END Way ;

--
-- VHDL Architecture ece411.Way.struct
--
-- Created:
--          by - one1.ews (gelib-057-34.ews.illinois.edu)
--          at - 23:42:23 04/25/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY ece411;

ARCHITECTURE struct OF Way IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL CompVal  : std_logic;
   SIGNAL DirtyOut : std_logic;
   SIGNAL Tag      : lc3b_l2_c_tag;
   SIGNAL Valid    : std_logic;


   -- Component Declarations
   COMPONENT AND2
   PORT (
      A : IN     std_logic ;
      B : IN     std_logic ;
      Y : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT Bit_Array
   GENERIC (
      DELAY : Time
   );
   PORT (
      DataIn    : IN     std_logic;
      DataWrite : IN     std_logic;
      Index     : IN     LC3b_c_index;
      RESET_L   : IN     std_logic;
      DataOut   : OUT    std_logic
   );
   END COMPONENT;
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
   COMPONENT Data_Array
   GENERIC (
      N     : Integer;
      DELAY : Time
   );
   PORT (
      DataIn    : IN     std_logic_vector (N-1 DOWNTO 0);
      DataWrite : IN     std_logic;
      Index     : IN     LC3b_c_index;
      RESET_L   : IN     std_logic;
      DataOut   : OUT    std_logic_vector (N-1 DOWNTO 0)
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : AND2 USE ENTITY ece411.AND2;
   FOR ALL : Bit_Array USE ENTITY ece411.Bit_Array;
   FOR ALL : Comparator USE ENTITY ece411.Comparator;
   FOR ALL : Data_Array USE ENTITY ece411.Data_Array;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 2 eb2
   -- Compute WriteBackAddress
   WriteBackAddress <= Tag & Index & "00000";                         


   -- Instance port mappings.
   U_0 : AND2
      PORT MAP (
         A => DirtyOut,
         B => Valid,
         Y => Dirty
      );
   U_1 : AND2
      PORT MAP (
         A => CompVal,
         B => Valid,
         Y => Present
      );
   DirtyBits : Bit_Array
      GENERIC MAP (
         DELAY => DELAY_2KB
      )
      PORT MAP (
         RESET_L   => RESET_L,
         DataWrite => DataWrite,
         Index     => Index,
         DataIn    => SetDirty,
         DataOut   => DirtyOut
      );
   ValidBits : Bit_Array
      GENERIC MAP (
         DELAY => DELAY_2KB
      )
      PORT MAP (
         RESET_L   => RESET_L,
         DataWrite => DataWrite,
         Index     => Index,
         DataIn    => DataWrite,
         DataOut   => Valid
      );
   TagCompare : Comparator
      GENERIC MAP (
         N     => 8,
         Delay => DELAY_COMPARE8
      )
      PORT MAP (
         A => Tag,
         B => TagIn,
         Y => CompVal
      );
   TagBits : Data_Array
      GENERIC MAP (
         N     => 8,
         DELAY => DELAY_2KB
      )
      PORT MAP (
         RESET_L   => RESET_L,
         DataWrite => DataWrite,
         Index     => Index,
         DataIn    => TagIn,
         DataOut   => Tag
      );
   WayData : Data_Array
      GENERIC MAP (
         N     => 256,
         DELAY => DELAY_2KB
      )
      PORT MAP (
         RESET_L   => RESET_L,
         DataWrite => DataWrite,
         Index     => Index,
         DataIn    => DataIn,
         DataOut   => DataOut
      );

END struct;
