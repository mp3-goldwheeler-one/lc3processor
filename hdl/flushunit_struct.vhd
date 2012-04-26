-- VHDL Entity ece411.flushUnit.interface
--
-- Created:
--          by - goldste6.ews (gelib-057-33.ews.illinois.edu)
--          at - 22:14:11 04/25/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY flushUnit IS
   PORT( 
      CLK                       : IN     std_logic;
      btb_pc                    : IN     lc3b_word;
      btb_taken                 : IN     std_logic;
      btb_target_pc             : IN     LC3b_word;
      btb_unconditional         : IN     std_logic;
      btb_write                 : IN     std_logic;
      decode_btb_state          : IN     btb_line;
      decode_conditional        : IN     std_logic;
      decode_load_pc            : IN     std_logic;
      decode_pc                 : IN     lc3b_word;
      decode_taken              : IN     std_logic;
      decode_target_pc          : IN     lc3b_word;
      exec_btb_state            : IN     btb_line;
      exec_conditional          : IN     control_word;
      exec_control_buffer       : IN     exec_control_word;
      exec_load_pc              : IN     std_logic;
      exec_pc                   : IN     lc3b_word;
      exec_taken                : IN     std_logic;
      exec_target_pc            : IN     LC3b_word;
      instr_addr                : IN     LC3b_word;
      mem2_pc                   : IN     lc3b_word;
      mem_btb_state             : IN     btb_line;
      mem_conditional           : IN     std_logic;
      mem_load_pc               : IN     STD_LOGIC;
      mem_taken                 : IN     std_logic;
      mem_target_pc             : IN     lc3b_word;
      wb_cc                     : IN     LC3b_cc;
      decode_flush              : OUT    std_logic;
      decode_prediction_correct : OUT    STD_LOGIC;
      exec_flush                : OUT    std_logic;
      exec_prediction_correct   : OUT    std_logic;
      fetch2_flush              : OUT    std_logic;
      mem1_flush                : OUT    std_logic;
      mem2_flush                : OUT    STD_LOGIC;
      mem_prediction_correct    : OUT    std_logic;
      target_pc_mux_sel         : OUT    LC3B_TRISTATE_4mux_sel;
      uarch_flush               : OUT    std_logic
   );

-- Declarations

END flushUnit ;

--
-- VHDL Architecture ece411.flushUnit.struct
--
-- Created:
--          by - goldste6.ews (gelib-057-33.ews.illinois.edu)
--          at - 22:14:11 04/25/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY mp3lib;

ARCHITECTURE struct OF flushUnit IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL F               : STD_LOGIC;
   SIGNAL F1              : STD_LOGIC;
   SIGNAL F2              : STD_LOGIC;
   SIGNAL F3              : STD_LOGIC;
   SIGNAL F4              : STD_LOGIC;
   SIGNAL F5              : STD_LOGIC;
   SIGNAL F6              : STD_LOGIC;
   SIGNAL F7              : STD_LOGIC;
   SIGNAL F8              : STD_LOGIC;
   SIGNAL F9              : STD_LOGIC;
   SIGNAL decode_mismatch : std_logic;
   SIGNAL exec_mismatch   : std_logic;
   SIGNAL flush_exec      : STD_LOGIC;
   SIGNAL flush_fd        : STD_LOGIC;
   SIGNAL mem_mismatch    : std_logic;
   SIGNAL no_mispredict   : STD_LOGIC;
   SIGNAL use_dec_pc      : STD_LOGIC;
   SIGNAL use_exec_pc     : STD_LOGIC;


   -- Component Declarations
   COMPONENT AND2
   PORT (
      A : IN     STD_LOGIC ;
      B : IN     STD_LOGIC ;
      F : OUT    STD_LOGIC 
   );
   END COMPONENT;
   COMPONENT COMP16
   PORT (
      A : IN     LC3B_WORD ;
      B : IN     LC3B_WORD ;
      F : OUT    STD_LOGIC 
   );
   END COMPONENT;
   COMPONENT NOR3
   PORT (
      A : IN     STD_LOGIC ;
      B : IN     STD_LOGIC ;
      C : IN     STD_LOGIC ;
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
   FOR ALL : AND2 USE ENTITY mp3lib.AND2;
   FOR ALL : COMP16 USE ENTITY mp3lib.COMP16;
   FOR ALL : NOR3 USE ENTITY mp3lib.NOR3;
   FOR ALL : NOT1 USE ENTITY mp3lib.NOT1;
   FOR ALL : OR2 USE ENTITY mp3lib.OR2;
   FOR ALL : OR3 USE ENTITY mp3lib.OR3;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   mem1_flush   <= mem_mismatch;
   mem2_flush   <= mem_mismatch;
   exec_flush   <= flush_exec;
   uarch_flush  <= flush_exec;
   fetch2_flush <= flush_fd;
   decode_flush <= flush_fd;

   -- HDL Embedded Text Block 2 eb2
   target_pc_mux_sel <= mem_mismatch & use_exec_pc & use_dec_pc & no_mispredict;


   -- Instance port mappings.
   U_3 : AND2
      PORT MAP (
         A => F1,
         B => decode_load_pc,
         F => decode_mismatch
      );
   U_4 : AND2
      PORT MAP (
         A => F3,
         B => exec_load_pc,
         F => exec_mismatch
      );
   U_5 : AND2
      PORT MAP (
         A => F5,
         B => mem_load_pc,
         F => mem_mismatch
      );
   U_9 : AND2
      PORT MAP (
         A => exec_mismatch,
         B => F6,
         F => use_exec_pc
      );
   U_10 : AND2
      PORT MAP (
         A => decode_mismatch,
         B => F9,
         F => F7
      );
   U_14 : AND2
      PORT MAP (
         A => F8,
         B => F7,
         F => use_dec_pc
      );
   U_0 : COMP16
      PORT MAP (
         A => exec_pc,
         B => mem_target_pc,
         F => F4
      );
   U_1 : COMP16
      PORT MAP (
         A => decode_pc,
         B => exec_target_pc,
         F => F2
      );
   U_2 : COMP16
      PORT MAP (
         A => instr_addr,
         B => decode_target_pc,
         F => F
      );
   U_13 : NOR3
      PORT MAP (
         A => decode_mismatch,
         B => exec_mismatch,
         C => mem_mismatch,
         F => no_mispredict
      );
   U_6 : NOT1
      PORT MAP (
         A => F,
         F => F1
      );
   U_7 : NOT1
      PORT MAP (
         A => F2,
         F => F3
      );
   U_8 : NOT1
      PORT MAP (
         A => F4,
         F => F5
      );
   U_15 : NOT1
      PORT MAP (
         A => mem_mismatch,
         F => F6
      );
   U_16 : NOT1
      PORT MAP (
         A => mem_mismatch,
         F => F8
      );
   U_17 : NOT1
      PORT MAP (
         A => exec_mismatch,
         F => F9
      );
   U_11 : OR2
      PORT MAP (
         A => exec_mismatch,
         B => mem_mismatch,
         F => flush_exec
      );
   U_12 : OR3
      PORT MAP (
         A => mem_mismatch,
         B => exec_mismatch,
         C => decode_mismatch,
         F => flush_fd
      );

END struct;
