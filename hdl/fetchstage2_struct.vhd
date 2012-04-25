-- VHDL Entity ece411.fetchStage2.interface
--
-- Created:
--          by - goldste6.ews (gelib-057-21.ews.illinois.edu)
--          at - 22:49:55 04/24/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY fetchStage2 IS
   PORT( 
      CLK                        : IN     std_logic;
      RESET_L                    : IN     STD_LOGIC;
      decode_insert_bubble       : IN     std_logic;
      fetch2_data_in             : IN     pipe_data;
      icache_ReadIndex           : IN     lc3b_c_index;
      icache_interstage_data_out : IN     LC3b_cache_interstage_data;
      instr_in                   : IN     LC3B_OWORD;
      instr_resp_h               : IN     std_logic;
      load_icache_fwd_pipe       : IN     std_logic;
      read_instr                 : IN     std_logic;
      fetch2_data_out            : OUT    pipe_data;
      fetch_ready                : OUT    std_logic;
      icache_feedback            : OUT    LC3b_cache_feedback_data;
      instr_mread_l              : OUT    std_logic;
      instr_mwrite_l             : OUT    STD_LOGIC;
      instr_pm_addr              : OUT    LC3b_word;
      instr_pm_dataout           : OUT    lc3b_oword;
      instr_addr                 : BUFFER LC3b_word
   );

-- Declarations

END fetchStage2 ;

--
-- VHDL Architecture ece411.fetchStage2.struct
--
-- Created:
--          by - goldste6.ews (gelib-057-21.ews.illinois.edu)
--          at - 22:49:56 04/24/12
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

ARCHITECTURE struct OF fetchStage2 IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL Dataout      : LC3b_word;
   SIGNAL F            : STD_LOGIC;
   SIGNAL MRESP_H      : std_logic;
   SIGNAL Zero_16      : LC3B_WORD;
   SIGNAL aluout       : lc3b_word;
   SIGNAL btb_data     : btb_line;
   SIGNAL cc           : LC3B_cc;
   SIGNAL data_addr    : lc3b_word;
   SIGNAL dr           : lc3b_reg;
   SIGNAL dr_val       : lc3b_word;
   SIGNAL fetch_instr  : LC3b_word;
   SIGNAL idx6         : LC3B_INDEX6;
   SIGNAL imm4         : LC3B_IMM4;
   SIGNAL imm5         : LC3B_IMM5;
   SIGNAL incr_pc      : lc3b_word;
   SIGNAL instr        : lc3b_word;
   SIGNAL mem_data_in  : lc3b_word;
   SIGNAL nzp          : LC3B_cc;
   SIGNAL off11        : LC3B_OFFSET11;
   SIGNAL off9         : LC3B_OFFSET9;
   SIGNAL one          : std_logic;
   SIGNAL read_instr_l : std_logic;
   SIGNAL sr1          : lc3b_reg;
   SIGNAL sr1_val      : lc3b_word;
   SIGNAL sr2          : lc3b_reg;
   SIGNAL sr2_val      : lc3b_word;
   SIGNAL taken        : std_logic;
   SIGNAL target_pc    : lc3b_word;
   SIGNAL trapvect8    : LC3B_TRAPVECT8;
   SIGNAL wb_data      : LC3B_word;


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
      data_addr   : IN     lc3b_word ;
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
      taken       : IN     std_logic ;
      btb_data    : IN     btb_line ;
      wb_data     : IN     lc3b_word ;
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
      data_addr   : OUT    lc3b_word ;
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
      target_pc   : OUT    LC3B_word ;
      taken       : OUT    std_logic ;
      wb_data     : OUT    LC3B_word ;
      btb_data    : OUT    btb_line 
   );
   END COMPONENT;
   COMPONENT Pipelined_L1_Stage2
   PORT (
      CLK             : IN     std_logic ;
      Dataout         : IN     LC3b_word ;
      MREAD_L         : IN     std_logic ;
      MWRITEH_L       : IN     std_logic ;
      MWRITEL_L       : IN     std_logic ;
      PMDATAIN        : IN     LC3B_OWORD ;
      PMRESP_H        : IN     STD_LOGIC ;
      RESET_L         : IN     STD_LOGIC ;
      ReadIndex       : IN     LC3b_C_INDEX ;
      interstage_data : IN     LC3b_cache_interstage_data ;
      reuse_data_l    : IN     STD_LOGIC ;
      DATAIN          : OUT    LC3b_word ;
      PMADDRESS       : OUT    LC3B_WORD ;
      PMDATAOUT       : OUT    LC3B_OWORD ;
      PMREAD_L        : OUT    STD_LOGIC ;
      PMWRITE_L       : OUT    STD_LOGIC ;
      feedback        : OUT    LC3b_cache_feedback_data ;
      MRESP_H         : BUFFER std_logic 
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
   COMPONENT OR2
   PORT (
      A : IN     STD_LOGIC ;
      B : IN     STD_LOGIC ;
      F : OUT    STD_LOGIC 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : MUX2_16 USE ENTITY mp3lib.MUX2_16;
   FOR ALL : NOT1 USE ENTITY mp3lib.NOT1;
   FOR ALL : OR2 USE ENTITY mp3lib.OR2;
   FOR ALL : PipeDataCombiner USE ENTITY ece411.PipeDataCombiner;
   FOR ALL : PipeDataSplitter USE ENTITY ece411.PipeDataSplitter;
   FOR ALL : Pipelined_L1_Stage2 USE ENTITY ece411.Pipelined_L1_Stage2;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   one <= '1';
   Zero_16 <= x"0000";
   Dataout <= (Others => 'X');


   -- Instance port mappings.
   U_0 : PipeDataCombiner
      PORT MAP (
         pc          => instr_addr,
         incr_pc     => incr_pc,
         instr       => fetch_instr,
         aluout      => aluout,
         dr          => dr,
         dr_val      => dr_val,
         idx6        => idx6,
         imm4        => imm4,
         imm5        => imm5,
         mem_data_in => mem_data_in,
         data_addr   => data_addr,
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
         taken       => taken,
         btb_data    => btb_data,
         wb_data     => wb_data,
         data_out    => fetch2_data_out
      );
   U_1 : PipeDataSplitter
      PORT MAP (
         data_in     => fetch2_data_in,
         pc          => instr_addr,
         incr_pc     => incr_pc,
         instr       => OPEN,
         aluout      => aluout,
         mem_data_in => mem_data_in,
         data_addr   => data_addr,
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
         target_pc   => target_pc,
         taken       => taken,
         wb_data     => wb_data,
         btb_data    => btb_data
      );
   icache_stage2 : Pipelined_L1_Stage2
      PORT MAP (
         CLK             => CLK,
         Dataout         => Dataout,
         MREAD_L         => read_instr_l,
         MWRITEH_L       => one,
         MWRITEL_L       => one,
         PMDATAIN        => instr_in,
         PMRESP_H        => instr_resp_h,
         RESET_L         => RESET_L,
         ReadIndex       => icache_ReadIndex,
         interstage_data => icache_interstage_data_out,
         reuse_data_l    => load_icache_fwd_pipe,
         DATAIN          => instr,
         PMADDRESS       => instr_pm_addr,
         PMDATAOUT       => instr_pm_dataout,
         PMREAD_L        => instr_mread_l,
         PMWRITE_L       => instr_mwrite_l,
         feedback        => icache_feedback,
         MRESP_H         => MRESP_H
      );
   U_2 : MUX2_16
      PORT MAP (
         A   => instr,
         B   => Zero_16,
         SEL => F,
         F   => fetch_instr
      );
   U_3 : NOT1
      PORT MAP (
         A => read_instr,
         F => read_instr_l
      );
   U_4 : OR2
      PORT MAP (
         A => read_instr_l,
         B => MRESP_H,
         F => fetch_ready
      );
   U_5 : OR2
      PORT MAP (
         A => read_instr_l,
         B => decode_insert_bubble,
         F => F
      );

END struct;
