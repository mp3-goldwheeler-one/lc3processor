-- VHDL Entity ece411.execStage.interface
--
-- Created:
--          by - goldste6.ews (evrt-252-03.ews.illinois.edu)
--          at - 20:25:23 03/27/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY execStage IS
   PORT( 
      CLK             : IN     std_logic;
      exec_control_in : IN     exec_control_word;
      exec_data_in    : IN     pipe_data;
      exec_instr      : IN     LC3b_word;
      exec_pc         : IN     LC3b_word;
      exec_data_out   : OUT    pipe_data;
      exec_target_pc  : OUT    LC3b_word;
      load_jump_pc    : OUT    std_logic
   );

-- Declarations

END execStage ;

--
-- VHDL Architecture ece411.execStage.struct
--
-- Created:
--          by - goldste6.ews (evrt-252-03.ews.illinois.edu)
--          at - 20:25:23 03/27/12
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

ARCHITECTURE struct OF execStage IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL B              : LC3B_WORD;
   SIGNAL F              : LC3B_WORD;
   SIGNAL PCAdder_aluout : LC3B_WORD;
   SIGNAL alumux_sel     : LC3b_4mux_sel;
   SIGNAL aluop          : LC3B_ALUOP;
   SIGNAL exec_aluout    : LC3B_WORD;
   SIGNAL exec_src_a     : LC3b_word;
   SIGNAL imm4           : LC3B_WORD;
   SIGNAL imm5           : LC3b_word;
   SIGNAL imm6           : LC3B_WORD;
   SIGNAL no_shift_imm6  : LC3b_word;
   SIGNAL of11           : LC3b_word;
   SIGNAL off9           : LC3b_word;
   SIGNAL shift_imm      : STD_LOGIC;
   SIGNAL shift_imm6     : LC3B_WORD;
   SIGNAL src_a          : LC3b_word;
   SIGNAL src_b          : LC3b_word;
   SIGNAL use_offset11   : STD_LOGIC;
   SIGNAL use_pc_adder   : STD_LOGIC;


   -- Component Declarations
   COMPONENT SEXT11
   PORT (
      in11   : IN     LC3b_offset11 ;
      output : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT SEXT5
   PORT (
      in5    : IN     LC3b_imm5;
      output : OUT    LC3b_word
   );
   END COMPONENT;
   COMPONENT SEXT6
   PORT (
      in6    : IN     LC3b_index6;
      output : OUT    LC3b_word
   );
   END COMPONENT;
   COMPONENT SEXT9
   PORT (
      in9    : IN     LC3b_offset9 ;
      output : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT ADD16
   PORT (
      A : IN     LC3B_WORD ;
      B : IN     LC3B_WORD ;
      F : OUT    LC3B_WORD 
   );
   END COMPONENT;
   COMPONENT ALU
   PORT (
      A     : IN     LC3B_WORD ;
      ALUOP : IN     LC3B_ALUOP ;
      B     : IN     LC3B_WORD ;
      F     : OUT    LC3B_WORD 
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

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : ADD16 USE ENTITY mp3lib.ADD16;
   FOR ALL : ALU USE ENTITY mp3lib.ALU;
   FOR ALL : MUX2_16 USE ENTITY mp3lib.MUX2_16;
   FOR ALL : MUX4_16 USE ENTITY mp3lib.MUX4_16;
   FOR ALL : SEXT11 USE ENTITY ece411.SEXT11;
   FOR ALL : SEXT5 USE ENTITY ece411.SEXT5;
   FOR ALL : SEXT6 USE ENTITY ece411.SEXT6;
   FOR ALL : SEXT9 USE ENTITY ece411.SEXT9;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   imm4 <= "000000000000" & exec_instr(3 downto 0);
   shift_imm6 <= no_shift_imm6(14 downto 0) & '0';

   -- HDL Embedded Text Block 2 eb2
   exec_data_out.aluout <= exec_aluout;
   exec_data_out <= exec_data_in;
   
   src_a        <= exec_data_in.sr1_val;
   src_b        <= exec_data_in.sr2_val;
   load_jump_pc <= exec_data_in.load_jump_pc;
   
   alumux_sel   <= exec_control_in.alumux_sel;
   aluop        <= exec_control_in.aluop;
   shift_imm    <= exec_control_in.shift_imm;
   use_offset11 <= exec_control_in.use_offset11;
   use_pc_adder <= exec_control_in.use_pc_adder;


   -- Instance port mappings.
   U_5 : SEXT11
      PORT MAP (
         in11   => exec_instr(10 DOWNTO 0),
         output => of11
      );
   U_1 : SEXT5
      PORT MAP (
         in5    => exec_instr(4 DOWNTO 0),
         output => imm5
      );
   U_2 : SEXT6
      PORT MAP (
         in6    => exec_instr(5 DOWNTO 0),
         output => no_shift_imm6
      );
   U_4 : SEXT9
      PORT MAP (
         in9    => exec_instr(8 DOWNTO 0),
         output => off9
      );
   U_6 : ADD16
      PORT MAP (
         A => exec_pc,
         B => F,
         F => PCAdder_aluout
      );
   aALU : ALU
      PORT MAP (
         A     => src_a,
         ALUOP => aluop,
         B     => B,
         F     => exec_aluout
      );
   U_3 : MUX2_16
      PORT MAP (
         A   => no_shift_imm6,
         B   => shift_imm6,
         SEL => shift_imm,
         F   => imm6
      );
   U_7 : MUX2_16
      PORT MAP (
         A   => off9,
         B   => of11,
         SEL => use_offset11,
         F   => F
      );
   U_8 : MUX2_16
      PORT MAP (
         A   => exec_src_a,
         B   => PCAdder_aluout,
         SEL => use_pc_adder,
         F   => exec_target_pc
      );
   U_0 : MUX4_16
      PORT MAP (
         A   => src_b,
         B   => imm4,
         C   => imm5,
         D   => imm6,
         SEL => alumux_sel,
         F   => B
      );

END struct;
