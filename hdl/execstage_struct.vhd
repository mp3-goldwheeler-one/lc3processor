-- VHDL Entity ece411.execStage.interface
--
-- Created:
--          by - wheele11.ews (gelib-057-28.ews.illinois.edu)
--          at - 21:02:05 04/08/12
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
      CLK                   : IN     std_logic;
      exec_control_in       : IN     exec_control_word;
      exec_data_in          : IN     pipe_data;
      exec_forward_srca_sel : IN     LC3b_4mux_sel;
      exec_forward_srcb_sel : IN     LC3b_4mux_sel;
      exec_instr            : IN     LC3b_word;
      exec_pc               : IN     LC3b_word;
      mem_data_in           : IN     pipe_data;
      wb_data_in            : IN     pipe_data;
      exec_data_out         : OUT    pipe_data;
      exec_target_pc        : OUT    LC3b_word;
      load_jump_pc          : OUT    std_logic
   );

-- Declarations

END execStage ;

--
-- VHDL Architecture ece411.execStage.struct
--
-- Created:
--          by - wheele11.ews (gelib-057-28.ews.illinois.edu)
--          at - 21:02:06 04/08/12
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
   SIGNAL aluout         : lc3b_word;
   SIGNAL dr             : lc3b_reg;
   SIGNAL dr_val         : lc3b_word;
   SIGNAL exec_src_a     : LC3b_word;
   SIGNAL fwd_sr1        : LC3B_WORD;
   SIGNAL fwd_sr2        : LC3B_WORD;
   SIGNAL idx6           : LC3b_INDEX6;
   SIGNAL imm4           : LC3B_imm4;
   SIGNAL imm4_16        : LC3B_WORD;
   SIGNAL imm5           : LC3b_imm5;
   SIGNAL imm5_16        : LC3b_word;
   SIGNAL imm6_16        : LC3B_WORD;
   SIGNAL mem_aluout     : LC3B_WORD;
   SIGNAL mem_data_in1   : lc3b_word;
   SIGNAL no_shift_imm6  : LC3b_word;
   SIGNAL offset11       : LC3B_OFFSET11;
   SIGNAL offset11_16    : LC3B_WORD;
   SIGNAL offset9        : LC3B_OFFSET9;
   SIGNAL offset9_16     : LC3B_WORD;
   SIGNAL shift_imm      : std_logic;
   SIGNAL shift_imm6     : LC3B_WORD;
   SIGNAL sr1            : lc3b_reg;
   SIGNAL sr1_val        : lc3b_word;
   SIGNAL sr2            : lc3b_reg;
   SIGNAL sr2_val        : lc3b_word;
   SIGNAL use_offset11   : STD_LOGIC;
   SIGNAL use_pc_adder   : STD_LOGIC;
   SIGNAL wb_aluout      : LC3B_WORD;
   SIGNAL wb_memdata     : LC3B_WORD;

   -- Implicit buffer signal declarations
   SIGNAL load_jump_pc_internal : std_logic;


   -- Component Declarations
   COMPONENT PipeDataCombiner
   PORT (
      aluout       : IN     lc3b_word ;
      dr           : IN     LC3b_reg ;
      dr_val       : IN     lc3b_word ;
      idx6         : IN     LC3B_INDEX6 ;
      imm4         : IN     LC3b_imm4 ;
      imm5         : IN     LC3b_imm5 ;
      load_jump_pc : IN     STD_LOGIC ;
      mem_data_in  : IN     lc3b_word ;
      off11        : IN     LC3B_OFFSET11 ;
      off9         : IN     LC3B_OFFSET9 ;
      sr1          : IN     LC3b_reg ;
      sr2          : IN     LC3b_reg ;
      sr1_val      : IN     lc3b_word ;
      sr2_val      : IN     lc3b_word ;
      data_out     : OUT    pipe_data 
   );
   END COMPONENT;
   COMPONENT PipeDataSplitter
   PORT (
      data_in      : IN     pipe_data ;
      aluout       : OUT    lc3b_word ;
      mem_data_in  : OUT    lc3b_word ;
      sr1          : OUT    lc3b_reg ;
      sr2          : OUT    lc3b_reg ;
      sr1_val      : OUT    lc3b_word ;
      sr2_val      : OUT    lc3b_word ;
      dr_val       : OUT    lc3b_word ;
      dr           : OUT    lc3b_reg ;
      imm4         : OUT    LC3B_IMM4 ;
      imm5         : OUT    LC3B_IMM5 ;
      idx6         : OUT    LC3B_INDEX6 ;
      off9         : OUT    LC3B_OFFSET9 ;
      off11        : OUT    LC3B_OFFSET11 ;
      load_jump_pc : OUT    std_logic 
   );
   END COMPONENT;
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
   FOR ALL : PipeDataCombiner USE ENTITY ece411.PipeDataCombiner;
   FOR ALL : PipeDataSplitter USE ENTITY ece411.PipeDataSplitter;
   FOR ALL : SEXT11 USE ENTITY ece411.SEXT11;
   FOR ALL : SEXT5 USE ENTITY ece411.SEXT5;
   FOR ALL : SEXT6 USE ENTITY ece411.SEXT6;
   FOR ALL : SEXT9 USE ENTITY ece411.SEXT9;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   imm4_16 <= "000000000000" & imm4;
   shift_imm6 <= no_shift_imm6(14 downto 0) & '0';

   -- HDL Embedded Text Block 2 eb2
   alumux_sel   <= exec_control_in.alumux_sel;
   aluop        <= exec_control_in.aluop;
   use_offset11 <= exec_control_in.use_offset11;
   use_pc_adder <= exec_control_in.use_pc_adder;
   shift_imm    <= exec_control_in.shift_imm;
   
   --for forwarding
   mem_aluout   <= mem_data_in.aluout;
   wb_aluout    <= wb_data_in.aluout;
   wb_memdata   <= wb_data_in.mem_data_in;


   -- Instance port mappings.
   U_12 : PipeDataCombiner
      PORT MAP (
         aluout       => aluout,
         dr           => dr,
         dr_val       => dr_val,
         idx6         => idx6,
         imm4         => imm4,
         imm5         => imm5,
         load_jump_pc => load_jump_pc_internal,
         mem_data_in  => mem_data_in1,
         off11        => offset11,
         off9         => offset9,
         sr1          => sr1,
         sr2          => sr2,
         sr1_val      => fwd_sr1,
         sr2_val      => fwd_sr2,
         data_out     => exec_data_out
      );
   U_11 : PipeDataSplitter
      PORT MAP (
         data_in      => exec_data_in,
         aluout       => OPEN,
         mem_data_in  => mem_data_in1,
         sr1          => sr1,
         sr2          => sr2,
         sr1_val      => sr1_val,
         sr2_val      => sr2_val,
         dr_val       => dr_val,
         dr           => dr,
         imm4         => imm4,
         imm5         => imm5,
         idx6         => idx6,
         off9         => offset9,
         off11        => offset11,
         load_jump_pc => load_jump_pc_internal
      );
   U_5 : SEXT11
      PORT MAP (
         in11   => offset11,
         output => offset11_16
      );
   U_1 : SEXT5
      PORT MAP (
         in5    => imm5,
         output => imm5_16
      );
   U_2 : SEXT6
      PORT MAP (
         in6    => idx6,
         output => no_shift_imm6
      );
   U_4 : SEXT9
      PORT MAP (
         in9    => offset9,
         output => offset9_16
      );
   U_6 : ADD16
      PORT MAP (
         A => exec_pc,
         B => F,
         F => PCAdder_aluout
      );
   aALU : ALU
      PORT MAP (
         A     => fwd_sr1,
         ALUOP => aluop,
         B     => B,
         F     => aluout
      );
   U_3 : MUX2_16
      PORT MAP (
         A   => no_shift_imm6,
         B   => shift_imm6,
         SEL => shift_imm,
         F   => imm6_16
      );
   U_7 : MUX2_16
      PORT MAP (
         A   => offset9_16,
         B   => offset11_16,
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
         A   => fwd_sr2,
         B   => imm4_16,
         C   => imm5_16,
         D   => imm6_16,
         SEL => alumux_sel,
         F   => B
      );
   U_9 : MUX4_16
      PORT MAP (
         A   => sr1_val,
         B   => mem_aluout,
         C   => wb_aluout,
         D   => wb_memdata,
         SEL => exec_forward_srca_sel,
         F   => fwd_sr1
      );
   U_10 : MUX4_16
      PORT MAP (
         A   => sr2_val,
         B   => mem_aluout,
         C   => wb_aluout,
         D   => wb_memdata,
         SEL => exec_forward_srcb_sel,
         F   => fwd_sr2
      );

   -- Implicit buffered output assignments
   load_jump_pc <= load_jump_pc_internal;

END struct;
