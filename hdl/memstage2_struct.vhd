-- VHDL Entity ece411.memStage2.interface
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

ENTITY memStage2 IS
   PORT( 
      CLK                        : IN     std_logic;
      RESET_L                    : IN     STD_LOGIC;
      data_in                    : IN     LC3B_OWORD;
      data_resp_h                : IN     std_logic;
      dcache_ReadIndex           : IN     LC3b_C_INDEX;
      dcache_interstage_data_out : IN     LC3b_cache_interstage_data;
      load_dcache_fwd_pipe       : IN     std_logic;
      mem2_control_in            : IN     mem_control_word;
      mem2_data_in               : IN     pipe_data;
      mem2_foward_sel            : IN     std_logic;
      wb_control_in              : IN     wb_control_word;
      wb_data_in                 : IN     pipe_data;
      btb_pc                     : OUT    lc3b_word;
      btb_taken                  : OUT    std_logic;
      btb_target_pc              : OUT    LC3b_word;
      btb_unconditional          : OUT    std_logic;
      btb_write                  : OUT    std_logic;
      data_mread_l               : OUT    std_logic;
      data_mwrite_l              : OUT    STD_LOGIC;
      data_pm_addr               : OUT    LC3B_WORD;
      data_pm_dataout            : OUT    LC3B_OWORD;
      dcache_feedback            : OUT    LC3b_cache_feedback_data;
      mem2_cc                    : OUT    lc3b_cc;
      mem2_data_out              : OUT    pipe_data;
      mem2_pc                    : OUT    lc3b_word;
      mem_btb_state              : OUT    btb_line;
      mem_conditional            : OUT    std_logic;
      mem_load_pc                : OUT    STD_LOGIC;
      mem_ready                  : OUT    STD_LOGIC;
      mem_taken                  : OUT    std_logic;
      mem_target_pc              : OUT    lc3b_word;
      wb_cc                      : OUT    LC3b_cc;
      wb_dest                    : OUT    LC3B_REG;
      wb_din                     : OUT    LC3B_WORD;
      wb_load_cc                 : OUT    std_logic;
      wb_rw                      : OUT    STD_LOGIC
   );

-- Declarations

END memStage2 ;

--
-- VHDL Architecture ece411.memStage2.struct
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

ARCHITECTURE struct OF memStage2 IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL DATAIN               : LC3B_WORD;
   SIGNAL Dataout              : LC3b_word;
   SIGNAL F                    : STD_LOGIC;
   SIGNAL F1                   : STD_LOGIC;
   SIGNAL F2                   : STD_LOGIC;
   SIGNAL MRESP_H              : std_logic;
   SIGNAL addr_low_bit         : STD_LOGIC;
   SIGNAL addr_low_bit_l       : STD_LOGIC;
   SIGNAL aluout               : LC3B_WORD;
   SIGNAL btb_data             : btb_line;
   SIGNAL cc                   : LC3B_cc;
   SIGNAL cc_buffer            : LC3b_cc;
   SIGNAL data_addr            : lc3b_word;
   SIGNAL data_mwriteh_l       : std_logic;
   SIGNAL data_mwritel_l       : std_logic;
   SIGNAL datain_highbyte      : LC3B_WORD;
   SIGNAL datain_lowbyte       : LC3B_WORD;
   SIGNAL datainmux_sel        : LC3B_4MUX_SEL;
   SIGNAL datainmux_sel_low    : STD_LOGIC;
   SIGNAL dataout_mux_sel      : std_logic;
   SIGNAL dcache_mread_l       : std_logic;
   SIGNAL dr                   : lc3b_reg;
   SIGNAL dr_val               : lc3b_word;
   SIGNAL fwd_dataout          : LC3B_WORD;
   SIGNAL fwd_dataout_highbyte : LC3B_WORD;
   SIGNAL idx6                 : LC3B_INDEX6;
   SIGNAL imm4                 : LC3B_IMM4;
   SIGNAL imm5                 : LC3B_IMM5;
   SIGNAL incr_pc              : lc3b_word;
   SIGNAL instr                : lc3b_word;
   SIGNAL mem_access_L         : std_logic;
   SIGNAL mem_read             : std_logic;
   SIGNAL mem_read_byte        : STD_LOGIC;
   SIGNAL mem_write_byte       : std_logic;
   SIGNAL mem_write_byte_l     : std_logic;
   SIGNAL mem_write_word       : std_logic;
   SIGNAL mem_write_word_l     : std_logic;
   SIGNAL muxed_datain         : LC3b_word;
   SIGNAL nzp                  : LC3B_cc;
   SIGNAL off11                : LC3B_OFFSET11;
   SIGNAL off9                 : LC3B_OFFSET9;
   SIGNAL sr1                  : lc3b_reg;
   SIGNAL sr1_val              : lc3b_word;
   SIGNAL sr2                  : lc3b_reg;
   SIGNAL sr2_val              : lc3b_word;
   SIGNAL taken                : std_logic;
   SIGNAL target_pc            : lc3b_word;
   SIGNAL trap                 : STD_LOGIC;
   SIGNAL trapvect8            : LC3B_TRAPVECT8;
   SIGNAL wb_data              : LC3B_WORD;
   SIGNAL wb_din_buffer        : LC3B_WORD;
   SIGNAL wbdatamux_sel        : std_logic;

   -- Implicit buffer signal declarations
   SIGNAL mem2_pc_internal : lc3b_word;


   -- Component Declarations
   COMPONENT GenCC
   PORT (
      WordIn : IN     LC3b_word ;
      nzp    : OUT    LC3b_cc 
   );
   END COMPONENT;
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

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : AND2 USE ENTITY mp3lib.AND2;
   FOR ALL : AND3 USE ENTITY mp3lib.AND3;
   FOR ALL : GenCC USE ENTITY ece411.GenCC;
   FOR ALL : MUX2_16 USE ENTITY mp3lib.MUX2_16;
   FOR ALL : MUX4_16 USE ENTITY mp3lib.MUX4_16;
   FOR ALL : OR2 USE ENTITY mp3lib.OR2;
   FOR ALL : PipeDataCombiner USE ENTITY ece411.PipeDataCombiner;
   FOR ALL : PipeDataSplitter USE ENTITY ece411.PipeDataSplitter;
   FOR ALL : Pipelined_L1_Stage2 USE ENTITY ece411.Pipelined_L1_Stage2;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 2 eb2
   addr_low_bit <= aluout(0);
   wb_data  <= wb_data_in.wb_data;

   -- HDL Embedded Text Block 3 eb3
   mem_read <= mem2_control_in.mem_read;
   mem_write_byte <= mem2_control_in.mem_write_byte;
   mem_write_word <= mem2_control_in.mem_write_word;
   wbdatamux_sel  <= mem2_control_in.wbdatamux_sel;
   
   trap          <= mem2_control_in.trap;
   mem_read_byte <= mem2_control_in.mem_read_byte;
   datainmux_sel <= mem2_control_in.mem_read_byte & datainmux_sel_low;

   -- HDL Embedded Text Block 4 eb4
   wb_dest    <= mem2_data_in.dr;
   wb_rw      <= wb_control_in.regwrite;
   wb_load_cc <= wb_control_in.set_cc;
   wb_din     <= wb_din_buffer;
   
   datain_highbyte <= x"00" & DATAIN(15 downto 8);
   datain_lowbyte  <= x"00" & DATAIN(7 downto 0);
   -- datain_mux_sel  <= mem2_control_in.mem_read_byte & data_addr(0);
   
   fwd_dataout_highbyte <= fwd_dataout(7 downto 0) & x"00";

   -- HDL Embedded Text Block 5 eb5
   mem_load_pc   <= trap;
   mem_target_pc <= DATAIN;
   
   mem2_cc <= cc_buffer;
   wb_cc  <= cc_buffer;

   -- HDL Embedded Text Block 6 eb6
   btb_write <= mem2_control_in.write_btb;
   btb_unconditional <= mem2_control_in.unconditional;
   btb_pc <= mem2_pc_internal;
   btb_taken <= taken;
   mem_btb_state <= btb_data;


   -- Instance port mappings.
   theGenCC : GenCC
      PORT MAP (
         WordIn => wb_din_buffer,
         nzp    => cc_buffer
      );
   U_5 : ENTITY ece411.NOT1
      PORT MAP (
         A => addr_low_bit,
         Y => addr_low_bit_l
      );
   U_11 : PipeDataCombiner
      PORT MAP (
         pc          => mem2_pc_internal,
         incr_pc     => incr_pc,
         instr       => instr,
         aluout      => aluout,
         dr          => dr,
         dr_val      => dr_val,
         idx6        => idx6,
         imm4        => imm4,
         imm5        => imm5,
         mem_data_in => muxed_datain,
         data_addr   => data_addr,
         off11       => off11,
         off9        => off9,
         sr1         => sr1,
         sr2         => sr2,
         sr1_val     => sr1_val,
         sr2_val     => sr2_val,
         trapvect8   => trapvect8,
         nzp         => nzp,
         cc          => cc_buffer,
         target_pc   => target_pc,
         taken       => taken,
         btb_data    => btb_data,
         wb_data     => wb_din_buffer,
         data_out    => mem2_data_out
      );
   U_13 : PipeDataSplitter
      PORT MAP (
         data_in     => mem2_data_in,
         pc          => mem2_pc_internal,
         incr_pc     => incr_pc,
         instr       => instr,
         aluout      => aluout,
         mem_data_in => OPEN,
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
         wb_data     => OPEN,
         btb_data    => btb_data
      );
   U_10 : Pipelined_L1_Stage2
      PORT MAP (
         CLK             => CLK,
         Dataout         => Dataout,
         MREAD_L         => dcache_mread_l,
         MWRITEH_L       => data_mwriteh_l,
         MWRITEL_L       => data_mwritel_l,
         PMDATAIN        => data_in,
         PMRESP_H        => data_resp_h,
         RESET_L         => RESET_L,
         ReadIndex       => dcache_ReadIndex,
         interstage_data => dcache_interstage_data_out,
         reuse_data_l    => load_dcache_fwd_pipe,
         DATAIN          => DATAIN,
         PMADDRESS       => data_pm_addr,
         PMDATAOUT       => data_pm_dataout,
         PMREAD_L        => data_mread_l,
         PMWRITE_L       => data_mwrite_l,
         feedback        => dcache_feedback,
         MRESP_H         => MRESP_H
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
   U_17 : AND2
      PORT MAP (
         A => mem_write_byte,
         B => addr_low_bit,
         F => dataout_mux_sel
      );
   U_18 : AND2
      PORT MAP (
         A => mem_read_byte,
         B => addr_low_bit,
         F => F2
      );
   U_0 : AND3
      PORT MAP (
         A => mem_write_word_l,
         B => mem_write_byte_l,
         C => dcache_mread_l,
         F => mem_access_L
      );
   U_12 : MUX2_16
      PORT MAP (
         A   => aluout,
         B   => muxed_datain,
         SEL => wbdatamux_sel,
         F   => wb_din_buffer
      );
   U_14 : MUX2_16
      PORT MAP (
         A   => sr2_val,
         B   => wb_data,
         SEL => mem2_foward_sel,
         F   => fwd_dataout
      );
   U_16 : MUX2_16
      PORT MAP (
         A   => fwd_dataout,
         B   => fwd_dataout_highbyte,
         SEL => dataout_mux_sel,
         F   => Dataout
      );
   U_20 : MUX2_16
      PORT MAP (
         A   => target_pc,
         B   => DATAIN,
         SEL => trap,
         F   => btb_target_pc
      );
   U_15 : MUX4_16
      PORT MAP (
         A   => DATAIN,
         B   => incr_pc,
         C   => datain_lowbyte,
         D   => datain_highbyte,
         SEL => datainmux_sel,
         F   => muxed_datain
      );
   U_7 : ENTITY mp3lib.NOT1
      PORT MAP (
         A => mem_read,
         F => dcache_mread_l
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
         B => MRESP_H,
         F => mem_ready
      );
   U_2 : OR2
      PORT MAP (
         A => addr_low_bit,
         B => mem_write_word_l,
         F => F1
      );
   U_3 : OR2
      PORT MAP (
         A => mem_write_byte_l,
         B => addr_low_bit_l,
         F => F
      );
   U_19 : OR2
      PORT MAP (
         A => F2,
         B => trap,
         F => datainmux_sel_low
      );

   -- Implicit buffered output assignments
   mem2_pc <= mem2_pc_internal;

END struct;