-- VHDL Entity ece411.memStage.interface
--
-- Created:
--          by - goldste6.ews (gelib-057-18.ews.illinois.edu)
--          at - 23:39:42 04/12/12
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
      CLK                  : IN     std_logic;
      DATAIN               : IN     LC3B_WORD;
      data_resp_h          : IN     std_logic;
      mem_control_in       : IN     mem_control_word;
      mem_data_in          : IN     pipe_data;
      mem_forward_addr_sel : IN     STD_LOGIC;
      mem_foward_sel       : IN     LC3B_4MUX_SEL;
      wb_control_in        : IN     wb_control_word;
      wb_data_in           : IN     pipe_data;
      Dataout              : OUT    LC3b_word;
      data_mread_l         : OUT    std_logic;
      data_mwriteh_l       : OUT    std_logic;
      data_mwritel_l       : OUT    std_logic;
      mem_cc               : OUT    lc3b_cc;
      mem_data_out         : OUT    pipe_data;
      mem_load_pc          : OUT    std_logic;
      mem_pc               : OUT    lc3b_word;
      mem_ready            : OUT    STD_LOGIC;
      mem_target_pc        : OUT    lc3b_word;
      wb_cc                : OUT    LC3b_cc;
      wb_dest              : OUT    LC3B_REG;
      wb_din               : OUT    LC3B_WORD;
      wb_load_cc           : OUT    std_logic;
      wb_rw                : OUT    STD_LOGIC;
      data_addr            : BUFFER LC3b_word
   );

-- Declarations

END memStage ;

--
-- VHDL Architecture ece411.memStage.struct
--
-- Created:
--          by - goldste6.ews (gelib-057-18.ews.illinois.edu)
--          at - 23:39:42 04/12/12
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
   SIGNAL F                    : STD_LOGIC;
   SIGNAL F1                   : STD_LOGIC;
   SIGNAL F2                   : STD_LOGIC;
   SIGNAL addr_low_bit         : STD_LOGIC;
   SIGNAL addr_low_bit_l       : STD_LOGIC;
   SIGNAL aluout               : LC3B_WORD;
   SIGNAL cc                   : LC3B_cc;
   SIGNAL cc_buffer            : LC3b_cc;
   SIGNAL datain_highbyte      : LC3B_WORD;
   SIGNAL datain_lowbyte       : LC3B_WORD;
   SIGNAL datainmux_sel        : LC3B_4MUX_SEL;
   SIGNAL datainmux_sel_low    : STD_LOGIC;
   SIGNAL dataout_mux_sel      : std_logic;
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
   SIGNAL target_pc            : LC3B_word;
   SIGNAL trap                 : STD_LOGIC;
   SIGNAL trapvect8            : LC3B_TRAPVECT8;
   SIGNAL wb_aluout            : LC3B_WORD;
   SIGNAL wb_mem_data          : LC3B_WORD;
   SIGNAL wbdatamux_sel        : std_logic;

   -- Implicit buffer signal declarations
   SIGNAL data_mread_l_internal : std_logic;
   SIGNAL wb_din_internal       : LC3B_WORD;
   SIGNAL mem_pc_internal       : lc3b_word;


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
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   addr_low_bit <= aluout(0);
   wb_mem_data  <= wb_data_in.mem_data_in;
   wb_aluout    <= wb_data_in.aluout;

   -- HDL Embedded Text Block 2 eb2
   mem_read <= mem_control_in.mem_read;
   mem_write_byte <= mem_control_in.mem_write_byte;
   mem_write_word <= mem_control_in.mem_write_word;
   wbdatamux_sel  <= mem_control_in.wbdatamux_sel;
   
   wb_mem_data   <= wb_data_in.mem_data_in;
   trap          <= mem_control_in.trap;
   mem_read_byte <= mem_control_in.mem_read_byte;
   datainmux_sel <= mem_control_in.mem_read_byte & datainmux_sel_low;

   -- HDL Embedded Text Block 3 eb3
   wb_dest    <= mem_data_in.dr;
   wb_rw      <= wb_control_in.regwrite;
   wb_load_cc <= wb_control_in.set_cc;
   
   datain_highbyte <= x"00" & DATAIN(15 downto 8);
   datain_lowbyte  <= x"00" & DATAIN(7 downto 0);
   -- datain_mux_sel  <= mem_control_in.mem_read_byte & data_addr(0);
   
   fwd_dataout_highbyte <= fwd_dataout(7 downto 0) & x"00";

   -- HDL Embedded Text Block 4 eb4
   mem_load_pc   <= trap;
   mem_target_pc <= DATAIN;
   
   
   mem_cc <= cc_buffer;
   wb_cc  <= cc_buffer;


   -- Instance port mappings.
   theGenCC : GenCC
      PORT MAP (
         WordIn => wb_din_internal,
         nzp    => cc_buffer
      );
   U_5 : ENTITY ece411.NOT1
      PORT MAP (
         A => addr_low_bit,
         Y => addr_low_bit_l
      );
   U_14 : PipeDataCombiner
      PORT MAP (
         pc          => mem_pc_internal,
         incr_pc     => incr_pc,
         instr       => instr,
         aluout      => aluout,
         dr          => dr,
         dr_val      => dr_val,
         idx6        => idx6,
         imm4        => imm4,
         imm5        => imm5,
         mem_data_in => muxed_datain,
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
         data_out    => mem_data_out
      );
   U_13 : PipeDataSplitter
      PORT MAP (
         data_in     => mem_data_in,
         pc          => mem_pc_internal,
         incr_pc     => incr_pc,
         instr       => instr,
         aluout      => aluout,
         mem_data_in => OPEN,
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
         C => data_mread_l_internal,
         F => mem_access_L
      );
   U_11 : MUX2_16
      PORT MAP (
         A   => aluout,
         B   => wb_mem_data,
         SEL => mem_forward_addr_sel,
         F   => data_addr
      );
   U_12 : MUX2_16
      PORT MAP (
         A   => aluout,
         B   => muxed_datain,
         SEL => wbdatamux_sel,
         F   => wb_din_internal
      );
   U_16 : MUX2_16
      PORT MAP (
         A   => fwd_dataout,
         B   => fwd_dataout_highbyte,
         SEL => dataout_mux_sel,
         F   => Dataout
      );
   U_10 : MUX4_16
      PORT MAP (
         A   => sr2_val,
         B   => sr2_val,
         C   => wb_aluout,
         D   => wb_mem_data,
         SEL => mem_foward_sel,
         F   => fwd_dataout
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
   U_19 : OR2
      PORT MAP (
         A => F2,
         B => trap,
         F => datainmux_sel_low
      );

   -- Implicit buffered output assignments
   data_mread_l <= data_mread_l_internal;
   wb_din       <= wb_din_internal;
   mem_pc       <= mem_pc_internal;

END struct;
