-- VHDL Entity ece411.memStage.interface
--
-- Created:
--          by - wheele11.ews (gelib-057-35.ews.illinois.edu)
--          at - 01:31:13 03/29/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY memStage IS
   PORT( 
      CLK            : IN     std_logic;
      DATAIN         : IN     LC3B_WORD;
      data_resp_h    : IN     std_logic;
      mem_control_in : IN     mem_control_word;
      mem_data_in    : IN     pipe_data;
      mem_foward_sel : IN     LC3B_4MUX_SEL;
      wb_data_in     : IN     pipe_data;
      Dataout        : OUT    LC3b_word;
      data_addr      : OUT    LC3b_word;
      data_mread_l   : OUT    std_logic;
      data_mwriteh_l : OUT    std_logic;
      data_mwritel_l : OUT    std_logic;
      mem_data_out   : OUT    pipe_data;
      mem_ready      : OUT    STD_LOGIC
   );

-- Declarations

END memStage ;

--
-- VHDL Architecture ece411.memStage.struct
--
-- Created:
--          by - wheele11.ews (gelib-057-35.ews.illinois.edu)
--          at - 01:31:13 03/29/12
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

ARCHITECTURE struct OF memStage IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL F                : STD_LOGIC;
   SIGNAL F1               : STD_LOGIC;
   SIGNAL addr_low_bit     : STD_LOGIC;
   SIGNAL addr_low_bit_l   : STD_LOGIC;
   SIGNAL aluout           : LC3B_WORD;
   SIGNAL data_in          : LC3B_WORD;
   SIGNAL mem_access_L     : std_logic;
   SIGNAL mem_read         : std_logic;
   SIGNAL mem_write_byte   : std_logic;
   SIGNAL mem_write_byte_l : std_logic;
   SIGNAL mem_write_word   : std_logic;
   SIGNAL mem_write_word_l : std_logic;
   SIGNAL src_b            : LC3b_word;
   SIGNAL wb_aluout        : LC3B_WORD;
   SIGNAL wb_mem_data      : LC3B_WORD;

   -- Implicit buffer signal declarations
   SIGNAL data_mread_l_internal : std_logic;


   -- Component Declarations
   COMPONENT AND2
   PORT (
      A : IN     STD_LOGIC ;
      B : IN     STD_LOGIC ;
      F : OUT    STD_LOGIC 
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
   COMPONENT MUX4_16
   PORT (
      A   : IN     LC3B_WORD ;
      B   : IN     LC3B_WORD ;
      C   : IN     LC3B_WORD ;
      D   : IN     LC3B_WORD ;
      SEL : IN     STD_LOGIC_VECTOR (1 DOWNTO 0);
      F   : OUT    LC3B_WORD 
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
   FOR ALL : AND3 USE ENTITY mp3lib.AND3;
   FOR ALL : MUX4_16 USE ENTITY mp3lib.MUX4_16;
   FOR ALL : OR2 USE ENTITY mp3lib.OR2;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   data_addr <= aluout;
   data_in <= DATAIN;
   addr_low_bit <= aluout(0);
   wb_mem_data <= wb_data_in.mem_data_in;
   wb_aluout  <= wb_data_in.aluout;

   -- HDL Embedded Text Block 2 eb2
   mem_data_out <= mem_data_in;
   mem_data_out.mem_data_in <= data_in;
   mem_read <= mem_control_in.mem_read;
   mem_write_byte <= mem_control_in.mem_write_byte;
   mem_write_word <= mem_control_in.mem_write_word;
   
   src_b <= mem_data_in.sr2_val;
   aluout <= mem_data_in.aluout;
   wb_mem_data <= wb_data_in.mem_data_in;


   -- Instance port mappings.
   U_5 : ENTITY ece411.NOT1
      PORT MAP (
         A => addr_low_bit,
         Y => addr_low_bit_l
      );
   U_4 : AND2
      PORT MAP (
         A => mem_write_byte_l,
         B => F1,
         F => data_mwritel_l
      );
   U_6 : AND2
      PORT MAP (
         A => mem_write_word_l,
         B => F,
         F => data_mwriteh_l
      );
   U_0 : AND3
      PORT MAP (
         A => mem_write_word_l,
         B => mem_write_byte_l,
         C => data_mread_l_internal,
         F => mem_access_L
      );
   U_10 : MUX4_16
      PORT MAP (
         A   => src_b,
         B   => src_b,
         C   => wb_aluout,
         D   => wb_mem_data,
         SEL => mem_foward_sel,
         F   => Dataout
      );
   U_7 : ENTITY mp3lib.NOT1
      PORT MAP (
         A => mem_read,
         F => data_mread_l_internal
      );
   U_8 : ENTITY mp3lib.NOT1
      PORT MAP (
         A => mem_write_byte,
         F => mem_write_byte_l
      );
   U_9 : ENTITY mp3lib.NOT1
      PORT MAP (
         A => mem_write_word,
         F => mem_write_word_l
      );
   U_1 : OR2
      PORT MAP (
         A => mem_access_L,
         B => data_resp_h,
         F => mem_ready
      );
   U_2 : OR2
      PORT MAP (
         A => mem_write_word_l,
         B => addr_low_bit,
         F => F1
      );
   U_3 : OR2
      PORT MAP (
         A => mem_write_byte_l,
         B => addr_low_bit_l,
         F => F
      );

   -- Implicit buffered output assignments
   data_mread_l <= data_mread_l_internal;

END struct;
