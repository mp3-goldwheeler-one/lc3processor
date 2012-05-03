-- VHDL Entity ece411.LRU_4_Logic.symbol
--
-- Created:
--          by - one1.ews (gelib-057-06.ews.illinois.edu)
--          at - 21:36:42 04/19/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY LRU_4_Logic IS
   PORT( 
      line_access : IN     LRU_4_Section;
      line_in     : IN     LRU_4_Line;
      LRU_Way     : OUT    LRU_4_Section;
      line_out    : OUT    LRU_4_Line
   );

-- Declarations

END LRU_4_Logic ;

--
-- VHDL Architecture ece411.LRU_4_Logic.struct
--
-- Created:
--          by - one1.ews (gelib-057-06.ews.illinois.edu)
--          at - 21:36:42 04/19/12
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

ARCHITECTURE struct OF LRU_4_Logic IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL inA            : std_logic;
   SIGNAL inB            : std_logic;
   SIGNAL inC            : std_logic;
   SIGNAL inD            : std_logic;
   SIGNAL new_A          : LRU_4_Section;
   SIGNAL new_B          : STD_LOGIC_VECTOR(1 DOWNTO 0);
   SIGNAL new_C          : STD_LOGIC_VECTOR(1 DOWNTO 0);
   SIGNAL new_D          : STD_LOGIC_VECTOR(1 DOWNTO 0);
   SIGNAL read_line_A    : LRU_4_Section;
   SIGNAL read_line_B    : LRU_4_Section;
   SIGNAL read_line_C    : LRU_4_Section;
   SIGNAL read_line_D    : LRU_4_Section;
   SIGNAL shift_B        : STD_LOGIC;
   SIGNAL shift_D        : STD_LOGIC;
   SIGNAL write_loc      : STD_LOGIC_VECTOR(1 DOWNTO 0);
   SIGNAL write_loc_high : std_logic;
   SIGNAL write_loc_low  : std_logic;


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
   COMPONENT Encoder_4_2
   PORT (
      A  : IN     std_logic ;
      B  : IN     std_logic ;
      C  : IN     std_logic ;
      D  : IN     std_logic ;
      F0 : OUT    std_logic ;
      F1 : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT AND2
   PORT (
      A : IN     STD_LOGIC ;
      B : IN     STD_LOGIC ;
      F : OUT    STD_LOGIC 
   );
   END COMPONENT;
   COMPONENT MUX2_2
   PORT (
      A   : IN     STD_LOGIC_VECTOR (1 DOWNTO 0);
      B   : IN     STD_LOGIC_VECTOR (1 DOWNTO 0);
      SEL : IN     STD_LOGIC ;
      F   : OUT    STD_LOGIC_VECTOR (1 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT MUX4_2
   PORT (
      A   : IN     STD_LOGIC_VECTOR (1 DOWNTO 0);
      B   : IN     STD_LOGIC_VECTOR (1 DOWNTO 0);
      C   : IN     STD_LOGIC_VECTOR (1 DOWNTO 0);
      D   : IN     STD_LOGIC_VECTOR (1 DOWNTO 0);
      SEL : IN     STD_LOGIC_VECTOR (1 DOWNTO 0);
      F   : OUT    STD_LOGIC_VECTOR (1 DOWNTO 0)
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
   FOR ALL : Comparator USE ENTITY ece411.Comparator;
   FOR ALL : Encoder_4_2 USE ENTITY ece411.Encoder_4_2;
   FOR ALL : MUX2_2 USE ENTITY mp3lib.MUX2_2;
   FOR ALL : MUX4_2 USE ENTITY mp3lib.MUX4_2;
   FOR ALL : OR2 USE ENTITY mp3lib.OR2;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   read_line_D <= line_in(7 downto 6);
   read_line_C <= line_in(5 downto 4);
   read_line_B <= line_in(3 downto 2);
   read_line_A <= line_in(1 downto 0);
   
   line_out <= new_D & new_C & new_B & new_A;
   
   LRU_Way <= line_in(7 downto 6);
   
   write_loc <= write_loc_high & write_loc_low;


   -- Instance port mappings.
   U_1 : Comparator
      GENERIC MAP (
         N     => 2,
         Delay => DELAY_COMPARE8
      )
      PORT MAP (
         A => read_line_D,
         B => line_access,
         Y => inD
      );
   U_2 : Comparator
      GENERIC MAP (
         N     => 2,
         Delay => DELAY_COMPARE8
      )
      PORT MAP (
         A => read_line_C,
         B => line_access,
         Y => inC
      );
   U_3 : Comparator
      GENERIC MAP (
         N     => 2,
         Delay => DELAY_COMPARE8
      )
      PORT MAP (
         A => read_line_B,
         B => line_access,
         Y => inB
      );
   U_4 : Comparator
      GENERIC MAP (
         N     => 2,
         Delay => DELAY_COMPARE8
      )
      PORT MAP (
         A => read_line_A,
         B => line_access,
         Y => inA
      );
   U_5 : Encoder_4_2
      PORT MAP (
         A  => inA,
         B  => inB,
         C  => inC,
         D  => inD,
         F0 => write_loc_low,
         F1 => write_loc_high
      );
   U_10 : AND2
      PORT MAP (
         A => write_loc_high,
         B => write_loc_low,
         F => shift_D
      );
   U_6 : MUX2_2
      PORT MAP (
         A   => read_line_D,
         B   => read_line_C,
         SEL => shift_D,
         F   => new_D
      );
   U_7 : MUX2_2
      PORT MAP (
         A   => read_line_C,
         B   => read_line_B,
         SEL => write_loc_high,
         F   => new_C
      );
   U_8 : MUX2_2
      PORT MAP (
         A   => read_line_B,
         B   => read_line_A,
         SEL => shift_B,
         F   => new_B
      );
   U_0 : MUX4_2
      PORT MAP (
         A   => read_line_A,
         B   => read_line_B,
         C   => read_line_C,
         D   => read_line_D,
         SEL => write_loc,
         F   => new_A
      );
   U_12 : OR2
      PORT MAP (
         A => write_loc_high,
         B => write_loc_low,
         F => shift_B
      );

END struct;