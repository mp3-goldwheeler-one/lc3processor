-- VHDL Entity ece411.execStage.interface
--
-- Created:
--          by - wheele11.ews (linux5.ews.illinois.edu)
--          at - 21:38:24 04/13/12
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
      exec_forward_cc_sel   : IN     LC3b_4mux_sel;
      exec_forward_srca_sel : IN     LC3b_4mux_sel;
      exec_forward_srcb_sel : IN     LC3b_4mux_sel;
      mem_cc                : IN     lc3b_cc;
      mem_data_in           : IN     pipe_data;
      wb_data_in            : IN     pipe_data;
      exec_data_out         : OUT    pipe_data;
      exec_load_pc          : OUT    std_logic;
      exec_pc               : OUT    lc3b_word;
      exec_target_pc        : OUT    LC3b_word
   );

-- Declarations

END execStage ;

--
-- VHDL Architecture ece411.execStage.struct
--
-- Created:
--          by - wheele11.ews (linux5.ews.illinois.edu)
--          at - 21:38:25 04/13/12
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
   SIGNAL B                 : LC3B_WORD;
   SIGNAL F2                : LC3B_WORD;
   SIGNAL alumux_sel        : LC3b_4mux_sel;
   SIGNAL aluop             : LC3B_ALUOP;
   SIGNAL aluout            : lc3b_word;
   SIGNAL ben               : STD_LOGIC;
   SIGNAL br                : STD_LOGIC;
   SIGNAL cc                : lc3b_cc;
   SIGNAL dr                : lc3b_reg;
   SIGNAL dr_val            : lc3b_word;
   SIGNAL fwd_cc            : LC3B_cc;
   SIGNAL fwd_sr1           : LC3B_WORD;
   SIGNAL fwd_sr2           : LC3B_WORD;
   SIGNAL idx6              : LC3b_INDEX6;
   SIGNAL imm4              : LC3B_imm4;
   SIGNAL imm4_16           : LC3B_WORD;
   SIGNAL imm5              : LC3b_imm5;
   SIGNAL imm5_16           : LC3b_word;
   SIGNAL imm6_16           : LC3B_WORD;
   SIGNAL incr_pc           : lc3b_word;
   SIGNAL instr             : lc3b_word;
   SIGNAL load_pc           : STD_LOGIC;
   SIGNAL mem_aluout        : LC3B_WORD;
   SIGNAL mem_data_in1      : lc3b_word;
   SIGNAL n_match           : std_logic;
   SIGNAL no_shift_imm6     : LC3b_word;
   SIGNAL nzp               : lc3b_cc;
   SIGNAL offset11          : LC3B_OFFSET11;
   SIGNAL offset9           : LC3B_OFFSET9;
   SIGNAL offset9_16        : LC3B_WORD;
   SIGNAL p_match           : std_logic;
   SIGNAL shift_imm         : std_logic;
   SIGNAL shift_imm6        : LC3B_WORD;
   SIGNAL sr1               : lc3b_reg;
   SIGNAL sr1_val           : lc3b_word;
   SIGNAL sr2               : lc3b_reg;
   SIGNAL sr2_val           : LC3B_WORD;
   SIGNAL srcamux_sel       : LC3b_4mux_sel;
   SIGNAL srcb_b            : LC3B_WORD;
   SIGNAL srcbbmux_sel      : STD_LOGIC;
   SIGNAL take_branch       : STD_LOGIC;
   SIGNAL target_pc         : LC3B_word;
   SIGNAL target_pc_mux_sel : LC3b_4mux_sel;
   SIGNAL trapvect8         : LC3B_TRAPVECT8;
   SIGNAL trapvect8_16      : LC3B_WORD;
   SIGNAL wb_aluout         : LC3B_WORD;
   SIGNAL wb_cc             : lc3b_cc;
   SIGNAL wb_memdata        : LC3B_WORD;
   SIGNAL z_match           : std_logic;

   -- Implicit buffer signal declarations
   SIGNAL exec_pc_internal : lc3b_word;


   -- Component Declarations
   COMPONENT PipeDataCombiner
   PORT (
      pc          : IN     lc3b_word ;
      incr_pc     : IN     lc3b_word ;
      instr       : IN     lc3b_word ;
      aluout      : IN     lc3b_word ;
      dr          : IN     LC3b_reg ;
      dr_val      : IN     lc3b_word ;
      idx6        : IN     LC3B_INDEX6 ;
      imm4        : IN     LC3b_imm4 ;
      imm5        : IN     LC3b_imm5 ;
      mem_data_in : IN     lc3b_word ;
      off11       : IN     LC3B_OFFSET11 ;
      off9        : IN     LC3B_OFFSET9 ;
      sr1         : IN     LC3b_reg ;
      sr2         : IN     LC3b_reg ;
      sr1_val     : IN     lc3b_word ;
      sr2_val     : IN     lc3b_word ;
      trapvect8   : IN     lc3b_trapvect8 ;
      nzp         : IN     lc3b_cc ;
      cc          : IN     lc3b_cc ;
      target_pc   : IN     lc3b_word ;
      data_out    : OUT    pipe_data 
   );
   END COMPONENT;
   COMPONENT PipeDataSplitter
   PORT (
      data_in     : IN     pipe_data ;
      pc          : OUT    lc3b_word ;
      incr_pc     : OUT    lc3b_word ;
      instr       : OUT    lc3b_word ;
      aluout      : OUT    lc3b_word ;
      mem_data_in : OUT    lc3b_word ;
      sr1         : OUT    lc3b_reg ;
      sr2         : OUT    lc3b_reg ;
      sr1_val     : OUT    lc3b_word ;
      sr2_val     : OUT    lc3b_word ;
      dr_val      : OUT    lc3b_word ;
      dr          : OUT    lc3b_reg ;
      imm4        : OUT    LC3B_IMM4 ;
      imm5        : OUT    LC3B_IMM5 ;
      idx6        : OUT    LC3B_INDEX6 ;
      off9        : OUT    LC3B_OFFSET9 ;
      off11       : OUT    LC3B_OFFSET11 ;
      trapvect8   : OUT    LC3B_TRAPVECT8 ;
      nzp         : OUT    LC3B_cc ;
      cc          : OUT    LC3B_cc ;
      target_pc   : OUT    LC3B_word 
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
   COMPONENT MUX4_3
   PORT (
      A   : IN     STD_LOGIC_VECTOR (2 DOWNTO 0);
      B   : IN     STD_LOGIC_VECTOR (2 DOWNTO 0);
      C   : IN     STD_LOGIC_VECTOR (2 DOWNTO 0);
      D   : IN     STD_LOGIC_VECTOR (2 DOWNTO 0);
      SEL : IN     STD_LOGIC_VECTOR (1 DOWNTO 0);
      F   : OUT    STD_LOGIC_VECTOR (2 DOWNTO 0)
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
   FOR ALL : ALU USE ENTITY mp3lib.ALU;
   FOR ALL : MUX2_16 USE ENTITY mp3lib.MUX2_16;
   FOR ALL : MUX4_16 USE ENTITY mp3lib.MUX4_16;
   FOR ALL : MUX4_3 USE ENTITY mp3lib.MUX4_3;
   FOR ALL : OR2 USE ENTITY mp3lib.OR2;
   FOR ALL : OR3 USE ENTITY mp3lib.OR3;
   FOR ALL : PipeDataCombiner USE ENTITY ece411.PipeDataCombiner;
   FOR ALL : PipeDataSplitter USE ENTITY ece411.PipeDataSplitter;
   FOR ALL : SEXT5 USE ENTITY ece411.SEXT5;
   FOR ALL : SEXT6 USE ENTITY ece411.SEXT6;
   FOR ALL : SEXT9 USE ENTITY ece411.SEXT9;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   imm4_16 <= "000000000000" & imm4;
   shift_imm6 <= no_shift_imm6(14 downto 0) & '0';
   trapvect8_16 <= "0000000" & trapvect8 & '0';

   -- HDL Embedded Text Block 2 eb2
   alumux_sel    <= exec_control_in.alumux_sel;
   aluop         <= exec_control_in.aluop;
   shift_imm     <= exec_control_in.shift_imm;
   srcamux_sel   <= exec_control_in.srcamux_sel;
   srcbbmux_sel  <= exec_control_in.srcbbmux_sel;
   br            <= exec_control_in.br;
   load_pc       <= exec_control_in.load_pc;
   
   --for forwarding
   mem_aluout   <= mem_data_in.aluout;
   wb_aluout    <= wb_data_in.aluout;
   wb_memdata   <= wb_data_in.mem_data_in;
   
   wb_cc  <= wb_data_in.cc;

   -- HDL Embedded Text Block 3 eb3
   target_pc_mux_sel <= br & take_branch;


   -- Instance port mappings.
   U_38 : ENTITY ece411.AND2
      PORT MAP (
         A => nzp(2),
         B => fwd_cc(2),
         Y => n_match
      );
   U_39 : ENTITY ece411.AND2
      PORT MAP (
         A => nzp(1),
         B => fwd_cc(1),
         Y => z_match
      );
   U_40 : ENTITY ece411.AND2
      PORT MAP (
         A => nzp(0),
         B => fwd_cc(0),
         Y => p_match
      );
   U_12 : PipeDataCombiner
      PORT MAP (
         pc          => exec_pc_internal,
         incr_pc     => incr_pc,
         instr       => instr,
         aluout      => aluout,
         dr          => dr,
         dr_val      => dr_val,
         idx6        => idx6,
         imm4        => imm4,
         imm5        => imm5,
         mem_data_in => mem_data_in1,
         off11       => offset11,
         off9        => offset9,
         sr1         => sr1,
         sr2         => sr2,
         sr1_val     => fwd_sr1,
         sr2_val     => fwd_sr2,
         trapvect8   => trapvect8,
         nzp         => nzp,
         cc          => fwd_cc,
         target_pc   => target_pc,
         data_out    => exec_data_out
      );
   U_11 : PipeDataSplitter
      PORT MAP (
         data_in     => exec_data_in,
         pc          => exec_pc_internal,
         incr_pc     => incr_pc,
         instr       => instr,
         aluout      => OPEN,
         mem_data_in => mem_data_in1,
         sr1         => sr1,
         sr2         => sr2,
         sr1_val     => sr1_val,
         sr2_val     => sr2_val,
         dr_val      => dr_val,
         dr          => dr,
         imm4        => imm4,
         imm5        => imm5,
         idx6        => idx6,
         off9        => offset9,
         off11       => offset11,
         trapvect8   => trapvect8,
         nzp         => nzp,
         cc          => cc,
         target_pc   => target_pc
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
   U_15 : SEXT9
      PORT MAP (
         in9    => offset9,
         output => offset9_16
      );
   aALU : ALU
      PORT MAP (
         A     => F2,
         ALUOP => aluop,
         B     => B,
         F     => aluout
      );
   U_5 : ENTITY mp3lib.AND2
      PORT MAP (
         A => ben,
         B => br,
         F => take_branch
      );
   U_3 : MUX2_16
      PORT MAP (
         A   => no_shift_imm6,
         B   => shift_imm6,
         SEL => shift_imm,
         F   => imm6_16
      );
   U_14 : MUX2_16
      PORT MAP (
         A   => imm4_16,
         B   => offset9_16,
         SEL => srcbbmux_sel,
         F   => srcb_b
      );
   U_0 : MUX4_16
      PORT MAP (
         A   => fwd_sr2,
         B   => srcb_b,
         C   => imm5_16,
         D   => imm6_16,
         SEL => alumux_sel,
         F   => B
      );
   U_4 : MUX4_16
      PORT MAP (
         A   => fwd_sr1,
         B   => fwd_sr1,
         C   => incr_pc,
         D   => target_pc,
         SEL => target_pc_mux_sel,
         F   => exec_target_pc
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
   U_13 : MUX4_16
      PORT MAP (
         A   => fwd_sr1,
         B   => incr_pc,
         C   => trapvect8_16,
         D   => trapvect8_16,
         SEL => srcamux_sel,
         F   => F2
      );
   U_17 : MUX4_3
      PORT MAP (
         A   => cc,
         B   => cc,
         C   => mem_cc,
         D   => wb_cc,
         SEL => exec_forward_cc_sel,
         F   => fwd_cc
      );
   U_6 : OR2
      PORT MAP (
         A => br,
         B => load_pc,
         F => exec_load_pc
      );
   U_41 : OR3
      PORT MAP (
         A => n_match,
         B => z_match,
         C => p_match,
         F => ben
      );

   -- Implicit buffered output assignments
   exec_pc <= exec_pc_internal;

END struct;
