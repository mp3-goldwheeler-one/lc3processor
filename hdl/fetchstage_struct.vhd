-- VHDL Entity ece411.fetchStage.interface
--
-- Created:
--          by - wheele11.ews (gelib-057-27.ews.illinois.edu)
--          at - 23:42:08 04/11/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY fetchStage IS
   PORT( 
      CLK                  : IN     std_logic;
      RESET_L              : IN     STD_LOGIC;
      decode_insert_bubble : IN     STD_LOGIC;
      decode_load_pc       : IN     std_logic;
      decode_target_pc     : IN     lc3b_word;
      exec_load_pc         : IN     std_logic;
      exec_target_pc       : IN     LC3b_word;
      instr_in             : IN     LC3B_WORD;
      instr_resp_h         : IN     std_logic;
      load_pc              : IN     std_logic;
      mem_load_pc          : IN     std_logic;
      mem_target_pc        : IN     lc3b_word;
      wb_cc                : IN     LC3b_cc;
      fetch_data_out       : OUT    pipe_data;
      fetch_ready          : OUT    std_logic;
      instr_addr           : OUT    LC3b_word;
      instr_mread_l        : OUT    std_logic
   );

-- Declarations

END fetchStage ;

--
-- VHDL Architecture ece411.fetchStage.struct
--
-- Created:
--          by - wheele11.ews (gelib-057-27.ews.illinois.edu)
--          at - 23:42:08 04/11/12
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

ARCHITECTURE struct OF fetchStage IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL PCMuxOut               : LC3B_WORD;
   SIGNAL Two_16                 : LC3B_WORD;
   SIGNAL Zero_16                : LC3B_WORD;
   SIGNAL aluout                 : lc3b_word;
   SIGNAL cc                     : LC3B_cc;
   SIGNAL default_data           : pipe_data;
   SIGNAL dr                     : LC3b_reg;
   SIGNAL dr_val                 : lc3b_word;
   SIGNAL fetch_instr            : LC3b_word;
   SIGNAL idx6                   : LC3B_INDEX6;
   SIGNAL imm4                   : LC3b_imm4;
   SIGNAL imm5                   : LC3b_imm5;
   SIGNAL incr_pc                : LC3b_word;
   SIGNAL mem_data_in            : lc3b_word;
   SIGNAL nzp                    : LC3B_cc;
   SIGNAL off11                  : LC3B_OFFSET11;
   SIGNAL off9                   : LC3B_OFFSET9;
   SIGNAL sr1                    : LC3b_reg;
   SIGNAL sr1_val                : lc3b_word;
   SIGNAL sr2                    : LC3b_reg;
   SIGNAL sr2_val                : lc3b_word;
   SIGNAL target_pc              : LC3B_word;
   SIGNAL target_pc_mux_sel      : LC3B_4mux_sel;
   SIGNAL target_pc_mux_sel_high : STD_LOGIC;
   SIGNAL target_pc_mux_sel_low  : STD_LOGIC;
   SIGNAL trapvect8              : LC3B_TRAPVECT8;

   -- Implicit buffer signal declarations
   SIGNAL instr_addr_internal : LC3b_word;


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
   COMPONENT ADD16
   PORT (
      A : IN     LC3B_WORD ;
      B : IN     LC3B_WORD ;
      F : OUT    LC3B_WORD 
   );
   END COMPONENT;
   COMPONENT MUX2_1
   PORT (
      A   : IN     STD_LOGIC ;
      B   : IN     STD_LOGIC ;
      SEL : IN     STD_LOGIC ;
      F   : OUT    STD_LOGIC 
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
   COMPONENT OR2
   PORT (
      A : IN     STD_LOGIC ;
      B : IN     STD_LOGIC ;
      F : OUT    STD_LOGIC 
   );
   END COMPONENT;
   COMPONENT REG16
   PORT (
      RESET_L : IN     STD_LOGIC ;
      A       : IN     STD_LOGIC_VECTOR (15 DOWNTO 0);
      EN      : IN     STD_LOGIC ;
      CLK     : IN     STD_LOGIC ;
      F       : OUT    STD_LOGIC_VECTOR (15 DOWNTO 0)
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : ADD16 USE ENTITY mp3lib.ADD16;
   FOR ALL : MUX2_1 USE ENTITY mp3lib.MUX2_1;
   FOR ALL : MUX2_16 USE ENTITY mp3lib.MUX2_16;
   FOR ALL : MUX4_16 USE ENTITY mp3lib.MUX4_16;
   FOR ALL : OR2 USE ENTITY mp3lib.OR2;
   FOR ALL : PipeDataCombiner USE ENTITY ece411.PipeDataCombiner;
   FOR ALL : PipeDataSplitter USE ENTITY ece411.PipeDataSplitter;
   FOR ALL : REG16 USE ENTITY mp3lib.REG16;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   Zero_16 <= "0000000000000000";
   Two_16  <= "0000000000000010";
   instr_mread_l <= '0';
   fetch_ready <= instr_resp_h;
   
   default_data <= default_pipe_data;
   
   target_pc_mux_sel <= target_pc_mux_sel_high & target_pc_mux_sel_low;


   -- Instance port mappings.
   U_1 : PipeDataCombiner
      PORT MAP (
         pc          => instr_addr_internal,
         incr_pc     => incr_pc,
         instr       => fetch_instr,
         aluout      => aluout,
         dr          => dr,
         dr_val      => dr_val,
         idx6        => idx6,
         imm4        => imm4,
         imm5        => imm5,
         mem_data_in => mem_data_in,
         off11       => off11,
         off9        => off9,
         sr1         => sr1,
         sr2         => sr2,
         sr1_val     => sr1_val,
         sr2_val     => sr2_val,
         trapvect8   => trapvect8,
         nzp         => nzp,
         cc          => cc,
         target_pc   => target_pc,
         data_out    => fetch_data_out
      );
   U_2 : PipeDataSplitter
      PORT MAP (
         data_in     => default_data,
         pc          => OPEN,
         incr_pc     => OPEN,
         instr       => OPEN,
         aluout      => aluout,
         mem_data_in => mem_data_in,
         sr1         => sr1,
         sr2         => sr2,
         sr1_val     => sr1_val,
         sr2_val     => sr2_val,
         dr_val      => dr_val,
         dr          => dr,
         imm4        => imm4,
         imm5        => imm5,
         idx6        => idx6,
         off9        => off9,
         off11       => off11,
         trapvect8   => trapvect8,
         nzp         => nzp,
         cc          => cc,
         target_pc   => target_pc
      );
   PCAdder : ADD16
      PORT MAP (
         A => instr_addr_internal,
         B => Two_16,
         F => incr_pc
      );
   U_4 : MUX2_1
      PORT MAP (
         A   => decode_load_pc,
         B   => mem_load_pc,
         SEL => target_pc_mux_sel_high,
         F   => target_pc_mux_sel_low
      );
   U_0 : MUX2_16
      PORT MAP (
         A   => instr_in,
         B   => Zero_16,
         SEL => decode_insert_bubble,
         F   => fetch_instr
      );
   PCMux : MUX4_16
      PORT MAP (
         A   => incr_pc,
         B   => decode_target_pc,
         C   => exec_target_pc,
         D   => mem_target_pc,
         SEL => target_pc_mux_sel,
         F   => PCMuxOut
      );
   U_3 : OR2
      PORT MAP (
         A => exec_load_pc,
         B => mem_load_pc,
         F => target_pc_mux_sel_high
      );
   PCReg : REG16
      PORT MAP (
         RESET_L => RESET_L,
         A       => PCMuxOut,
         EN      => load_pc,
         CLK     => CLK,
         F       => instr_addr_internal
      );

   -- Implicit buffered output assignments
   instr_addr <= instr_addr_internal;

END struct;
