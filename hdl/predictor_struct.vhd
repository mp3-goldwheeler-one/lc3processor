-- VHDL Entity ece411.Predictor.interface
--
-- Created:
--          by - goldste6.ews (evrt-252-29.ews.illinois.edu)
--          at - 23:52:58 04/18/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Predictor IS
   PORT( 
      CLK                       : IN     std_logic;
      RESET_L                   : IN     STD_LOGIC;
      btb_pc                    : IN     lc3b_word;
      btb_taken                 : IN     std_logic;
      btb_target_pc             : IN     LC3b_word;
      btb_unconditional         : IN     std_logic;
      btb_write                 : IN     std_logic;
      decode_btb_state          : IN     btb_line;
      decode_conditional        : IN     std_logic;
      decode_load_pc            : IN     std_logic;
      decode_pc                 : IN     lc3b_word;
      decode_prediction_correct : IN     STD_LOGIC;
      decode_taken              : IN     std_logic;
      decode_target_pc          : IN     lc3b_word;
      exec_btb_state            : IN     btb_line;
      exec_conditional          : IN     control_word;
      exec_control_buffer       : IN     exec_control_word;
      exec_load_pc              : IN     std_logic;
      exec_pc                   : IN     lc3b_word;
      exec_prediction_correct   : IN     std_logic;
      exec_taken                : IN     std_logic;
      exec_target_pc            : IN     LC3b_word;
      instr_addr                : IN     LC3b_word;
      mem_btb_state             : IN     btb_line;
      mem_conditional           : IN     std_logic;
      mem_load_pc               : IN     STD_LOGIC;
      mem_pc                    : IN     lc3b_word;
      mem_prediction_correct    : IN     std_logic;
      mem_taken                 : IN     std_logic;
      mem_target_pc             : IN     lc3b_word;
      target_pc_mux_sel         : IN     LC3B_4mux_sel;
      incr_pc                   : OUT    LC3B_WORD;
      next_pc                   : OUT    LC3B_WORD;
      btb_state                 : BUFFER btb_line
   );

-- Declarations

END Predictor ;

--
-- VHDL Architecture ece411.Predictor.struct
--
-- Created:
--          by - goldste6.ews (evrt-252-29.ews.illinois.edu)
--          at - 23:52:58 04/18/12
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

ARCHITECTURE struct OF Predictor IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL F                  : STD_LOGIC;
   SIGNAL F1                 : STD_LOGIC;
   SIGNAL F2                 : STD_LOGIC;
   SIGNAL F3                 : STD_LOGIC;
   SIGNAL F4                 : STD_LOGIC;
   SIGNAL F5                 : STD_LOGIC;
   SIGNAL btb_data_out       : btb_line;
   SIGNAL btb_new_state      : btb_state_counter;
   SIGNAL btb_new_state_high : STD_LOGIC;
   SIGNAL btb_new_state_low  : STD_LOGIC;
   SIGNAL btb_state_high     : std_logic;
   SIGNAL btb_state_low      : std_logic;
   SIGNAL btb_state_low_not  : std_logic;
   SIGNAL miss               : std_logic;
   SIGNAL predict_branch     : STD_LOGIC;
   SIGNAL target_pc          : LC3B_WORD;
   SIGNAL two_16             : LC3B_WORD;
   SIGNAL zero               : std_logic;

   -- Implicit buffer signal declarations
   SIGNAL incr_pc_internal : LC3B_WORD;


   -- Component Declarations
   COMPONENT BTBLineCombiner
   PORT (
      state        : IN     btb_state_counter ;
      target       : IN     LC3B_WORD ;
      btb_data_out : OUT    btb_line 
   );
   END COMPONENT;
   COMPONENT BTBLineSplitter
   PORT (
      btb_data_in : IN     btb_line ;
      state       : OUT    btb_state_counter ;
      target      : OUT    LC3B_WORD 
   );
   END COMPONENT;
   COMPONENT BTB_Datapath
   PORT (
      DataOut      : IN     btb_line ;
      MREAD_L      : IN     std_logic ;
      MWRITE_H     : IN     std_logic ;
      ReadAddress  : IN     LC3b_word ;
      WriteAddress : IN     LC3b_word ;
      clk          : IN     std_logic ;
      reset_l      : IN     std_logic ;
      DATAIN       : OUT    btb_line ;
      miss         : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT ADD16
   PORT (
      A : IN     LC3B_WORD ;
      B : IN     LC3B_WORD ;
      F : OUT    LC3B_WORD 
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
   COMPONENT NOT1
   PORT (
      A : IN     STD_LOGIC ;
      F : OUT    STD_LOGIC 
   );
   END COMPONENT;
   COMPONENT OR3
   PORT (
      A : IN     STD_LOGIC ;
      B : IN     STD_LOGIC ;
      C : IN     STD_LOGIC ;
      F : OUT    STD_LOGIC 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : ADD16 USE ENTITY mp3lib.ADD16;
   FOR ALL : AND2 USE ENTITY mp3lib.AND2;
   FOR ALL : BTBLineCombiner USE ENTITY ece411.BTBLineCombiner;
   FOR ALL : BTBLineSplitter USE ENTITY ece411.BTBLineSplitter;
   FOR ALL : BTB_Datapath USE ENTITY ece411.BTB_Datapath;
   FOR ALL : MUX2_16 USE ENTITY mp3lib.MUX2_16;
   FOR ALL : NOT1 USE ENTITY mp3lib.NOT1;
   FOR ALL : OR3 USE ENTITY mp3lib.OR3;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   two_16 <= x"0002";
   target_pc <= btb_state.target;
   zero <= '0';
   predict_branch <= btb_state.state(1);

   -- HDL Embedded Text Block 2 eb2
   btb_state_high <= mem_btb_state.state(1);
   btb_state_low  <= mem_btb_state.state(0);
   
   btb_new_state  <= btb_new_state_high & btb_new_state_low;


   -- Instance port mappings.
   U_3 : BTBLineCombiner
      PORT MAP (
         state        => btb_new_state,
         target       => btb_target_pc,
         btb_data_out => btb_data_out
      );
   U_1 : BTBLineSplitter
      PORT MAP (
         btb_data_in => mem_btb_state,
         state       => OPEN,
         target      => OPEN
      );
   BTB : BTB_Datapath
      PORT MAP (
         DataOut      => btb_data_out,
         MREAD_L      => zero,
         MWRITE_H     => btb_write,
         ReadAddress  => instr_addr,
         WriteAddress => btb_pc,
         clk          => CLK,
         reset_l      => RESET_L,
         DATAIN       => btb_state,
         miss         => miss
      );
   U_0 : ADD16
      PORT MAP (
         A => instr_addr,
         B => two_16,
         F => incr_pc_internal
      );
   U_7 : AND2
      PORT MAP (
         A => btb_state_high,
         B => btb_state_low,
         F => F
      );
   U_8 : AND2
      PORT MAP (
         A => btb_state_high,
         B => btb_taken,
         F => F1
      );
   U_9 : AND2
      PORT MAP (
         A => btb_taken,
         B => btb_state_low,
         F => F2
      );
   U_10 : AND2
      PORT MAP (
         A => btb_state_high,
         B => btb_taken,
         F => F3
      );
   U_11 : AND2
      PORT MAP (
         A => btb_state_high,
         B => btb_state_low_not,
         F => F4
      );
   U_12 : AND2
      PORT MAP (
         A => btb_taken,
         B => btb_state_low_not,
         F => F5
      );
   U_2 : MUX2_16
      PORT MAP (
         A   => incr_pc_internal,
         B   => target_pc,
         SEL => predict_branch,
         F   => next_pc
      );
   U_6 : NOT1
      PORT MAP (
         A => btb_state_low,
         F => btb_state_low_not
      );
   U_4 : OR3
      PORT MAP (
         A => F,
         B => F1,
         C => F2,
         F => btb_new_state_high
      );
   U_5 : OR3
      PORT MAP (
         A => F3,
         B => F4,
         C => F5,
         F => btb_new_state_low
      );

   -- Implicit buffered output assignments
   incr_pc <= incr_pc_internal;

END struct;
