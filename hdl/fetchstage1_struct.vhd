-- VHDL Entity ece411.fetchStage1.interface
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY fetchStage1 IS
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
      icache_feedback           : IN     LC3b_cache_feedback_data;
      load_pc                   : IN     std_logic;
      mem2_pc                   : IN     lc3b_word;
      mem_btb_state             : IN     btb_line;
      mem_conditional           : IN     std_logic;
      mem_load_pc               : IN     STD_LOGIC;
      mem_prediction_correct    : IN     std_logic;
      mem_taken                 : IN     std_logic;
      mem_target_pc             : IN     lc3b_word;
      target_pc_mux_sel         : IN     LC3B_tristate_4mux_sel;
      wb_cc                     : IN     LC3b_cc;
      fetch1_data_out           : OUT    pipe_data;
      icache_ReadIndex          : OUT    lc3b_c_index;
      icache_interstage_data_in : OUT    LC3b_cache_interstage_data
   );

-- Declarations

END fetchStage1 ;

--
-- VHDL Architecture ece411.fetchStage1.struct
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

ARCHITECTURE struct OF fetchStage1 IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL PCMuxOut     : LC3B_WORD;
   SIGNAL aluout       : lc3b_word;
   SIGNAL btb_state    : btb_line;
   SIGNAL cc           : LC3B_cc;
   SIGNAL data_addr    : lc3b_word;
   SIGNAL default_data : pipe_data;
   SIGNAL dr           : LC3b_reg;
   SIGNAL dr_val       : lc3b_word;
   SIGNAL fetch_instr  : LC3b_word;
   SIGNAL idx6         : LC3B_INDEX6;
   SIGNAL imm4         : LC3b_imm4;
   SIGNAL imm5         : LC3b_imm5;
   SIGNAL incr_pc      : LC3B_WORD;
   SIGNAL instr_addr   : LC3b_word;
   SIGNAL mem_data_in  : lc3b_word;
   SIGNAL mem_pc       : lc3b_word;
   SIGNAL next_pc      : LC3B_WORD;
   SIGNAL nzp          : LC3B_cc;
   SIGNAL off11        : LC3B_OFFSET11;
   SIGNAL off9         : LC3B_OFFSET9;
   SIGNAL sr1          : LC3b_reg;
   SIGNAL sr1_val      : lc3b_word;
   SIGNAL sr2          : LC3b_reg;
   SIGNAL sr2_val      : lc3b_word;
   SIGNAL taken        : std_logic;
   SIGNAL target_pc    : LC3B_word;
   SIGNAL trapvect8    : LC3B_TRAPVECT8;
   SIGNAL wb_data      : LC3B_word;

   -- Implicit buffer signal declarations
   SIGNAL icache_ReadIndex_internal : lc3b_c_index;


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
   COMPONENT Pipelined_L1_Stage1
   PORT (
      ADDRESS         : IN     LC3B_WORD ;
      RESET_L         : IN     std_logic ;
      feedback        : IN     LC3b_cache_feedback_data ;
      interstage_data : OUT    LC3b_cache_interstage_data ;
      ReadIndex       : BUFFER lc3b_c_index 
   );
   END COMPONENT;
   COMPONENT Predictor
   PORT (
      CLK                       : IN     std_logic ;
      RESET_L                   : IN     STD_LOGIC ;
      btb_pc                    : IN     lc3b_word ;
      btb_taken                 : IN     std_logic ;
      btb_target_pc             : IN     LC3b_word ;
      btb_unconditional         : IN     std_logic ;
      btb_write                 : IN     std_logic ;
      decode_btb_state          : IN     btb_line ;
      decode_conditional        : IN     std_logic ;
      decode_load_pc            : IN     std_logic ;
      decode_pc                 : IN     lc3b_word ;
      decode_prediction_correct : IN     STD_LOGIC ;
      decode_taken              : IN     std_logic ;
      decode_target_pc          : IN     lc3b_word ;
      exec_btb_state            : IN     btb_line ;
      exec_conditional          : IN     control_word ;
      exec_control_buffer       : IN     exec_control_word ;
      exec_load_pc              : IN     std_logic ;
      exec_pc                   : IN     lc3b_word ;
      exec_prediction_correct   : IN     std_logic ;
      exec_taken                : IN     std_logic ;
      exec_target_pc            : IN     LC3b_word ;
      instr_addr                : IN     LC3b_word ;
      mem_btb_state             : IN     btb_line ;
      mem_conditional           : IN     std_logic ;
      mem_load_pc               : IN     STD_LOGIC ;
      mem_pc                    : IN     lc3b_word ;
      mem_prediction_correct    : IN     std_logic ;
      mem_taken                 : IN     std_logic ;
      mem_target_pc             : IN     lc3b_word ;
      target_pc_mux_sel         : IN     LC3B_tristate_4mux_sel ;
      incr_pc                   : OUT    LC3B_WORD ;
      next_pc                   : OUT    LC3B_WORD ;
      btb_state                 : BUFFER btb_line 
   );
   END COMPONENT;
   COMPONENT TristateMux4_N
   GENERIC (
      n : integer := 16
   );
   PORT (
      A   : IN     std_logic_vector (n-1 DOWNTO 0);
      B   : IN     std_logic_vector ( n-1 DOWNTO 0 );
      C   : IN     std_logic_vector ( n-1 DOWNTO 0 );
      D   : IN     std_logic_vector ( n-1 DOWNTO 0 );
      Sel : IN     std_logic_vector ( 3  DOWNTO  0 );
      F   : OUT    std_logic_vector (n-1 DOWNTO 0)
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
   FOR ALL : PipeDataCombiner USE ENTITY ece411.PipeDataCombiner;
   FOR ALL : PipeDataSplitter USE ENTITY ece411.PipeDataSplitter;
   FOR ALL : Pipelined_L1_Stage1 USE ENTITY ece411.Pipelined_L1_Stage1;
   FOR ALL : Predictor USE ENTITY ece411.Predictor;
   FOR ALL : REG16 USE ENTITY mp3lib.REG16;
   FOR ALL : TristateMux4_N USE ENTITY ece411.TristateMux4_N;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   default_data <= default_pipe_data;


   -- Instance port mappings.
   U_1 : PipeDataCombiner
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
         btb_data    => btb_state,
         wb_data     => wb_data,
         data_out    => fetch1_data_out
      );
   U_2 : PipeDataSplitter
      PORT MAP (
         data_in     => default_data,
         pc          => OPEN,
         incr_pc     => OPEN,
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
         btb_data    => OPEN
      );
   U_3 : Pipelined_L1_Stage1
      PORT MAP (
         ADDRESS         => instr_addr,
         RESET_L         => RESET_L,
         feedback        => icache_feedback,
         interstage_data => icache_interstage_data_in,
         ReadIndex       => icache_ReadIndex_internal
      );
   predictUnit : Predictor
      PORT MAP (
         CLK                       => CLK,
         RESET_L                   => RESET_L,
         btb_pc                    => btb_pc,
         btb_taken                 => btb_taken,
         btb_target_pc             => btb_target_pc,
         btb_unconditional         => btb_unconditional,
         btb_write                 => btb_write,
         decode_btb_state          => decode_btb_state,
         decode_conditional        => decode_conditional,
         decode_load_pc            => decode_load_pc,
         decode_pc                 => decode_pc,
         decode_prediction_correct => decode_prediction_correct,
         decode_taken              => decode_taken,
         decode_target_pc          => decode_target_pc,
         exec_btb_state            => exec_btb_state,
         exec_conditional          => exec_conditional,
         exec_control_buffer       => exec_control_buffer,
         exec_load_pc              => exec_load_pc,
         exec_pc                   => exec_pc,
         exec_prediction_correct   => exec_prediction_correct,
         exec_taken                => exec_taken,
         exec_target_pc            => exec_target_pc,
         instr_addr                => instr_addr,
         mem_btb_state             => mem_btb_state,
         mem_conditional           => mem_conditional,
         mem_load_pc               => mem_load_pc,
         mem_pc                    => mem_pc,
         mem_prediction_correct    => mem_prediction_correct,
         mem_taken                 => mem_taken,
         mem_target_pc             => mem_target_pc,
         target_pc_mux_sel         => target_pc_mux_sel,
         incr_pc                   => incr_pc,
         next_pc                   => next_pc,
         btb_state                 => btb_state
      );
   U_0 : TristateMux4_N
      GENERIC MAP (
         n => 16
      )
      PORT MAP (
         A   => next_pc,
         B   => decode_target_pc,
         C   => exec_target_pc,
         D   => mem_target_pc,
         Sel => target_pc_mux_sel,
         F   => PCMuxOut
      );
   PCReg : REG16
      PORT MAP (
         RESET_L => RESET_L,
         A       => PCMuxOut,
         EN      => load_pc,
         CLK     => CLK,
         F       => instr_addr
      );

   -- Implicit buffered output assignments
   icache_ReadIndex <= icache_ReadIndex_internal;

END struct;
