-- VHDL Entity ece411.decodeStage.interface
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY decodeStage IS
   PORT( 
      CLK                : IN     std_logic;
      RESET_L            : IN     STD_LOGIC;
      decode_data_in     : IN     pipe_data;
      wb_cc              : IN     LC3b_cc;
      wb_dest            : IN     LC3B_REG;
      wb_din             : IN     LC3B_WORD;
      wb_load_cc         : IN     std_logic;
      wb_rw              : IN     STD_LOGIC;
      decode_btb_state   : OUT    btb_line;
      decode_conditional : OUT    std_logic;
      decode_control_out : OUT    control_word;
      decode_data_out    : OUT    pipe_data;
      decode_load_pc     : OUT    std_logic;
      decode_pc          : OUT    lc3b_word;
      decode_taken       : OUT    std_logic;
      decode_target_pc   : OUT    lc3b_word;
      uop_instr_dr       : OUT    LC3b_reg;
      uop_sr2            : OUT    LC3b_reg;
      uop_sr2_val        : OUT    lc3b_word;
      cc                 : BUFFER LC3b_cc
   );

-- Declarations

END decodeStage ;

--
-- VHDL Architecture ece411.decodeStage.struct
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

ARCHITECTURE struct OF decodeStage IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL F1                    : STD_LOGIC;
   SIGNAL F2                    : STD_LOGIC;
   SIGNAL F3                    : LC3B_WORD;
   SIGNAL SrcA                  : LC3B_REG;
   SIGNAL SrcB                  : LC3B_REG;
   SIGNAL SrcBMuxOut            : LC3B_REG;
   SIGNAL SrcBMuxSel            : STD_LOGIC;
   SIGNAL Y                     : std_logic;
   SIGNAL aluout                : lc3b_word;
   SIGNAL bit11                 : std_logic;
   SIGNAL bit4                  : std_logic;
   SIGNAL bit5                  : std_logic;
   SIGNAL btb_data              : btb_line;
   SIGNAL data_addr             : lc3b_word;
   SIGNAL decode_control_buffer : control_word;
   SIGNAL decode_src_a          : LC3B_WORD;
   SIGNAL decode_src_b          : LC3B_WORD;
   SIGNAL default_word          : control_word;
   SIGNAL direction             : std_logic;
   SIGNAL dr                    : LC3b_reg;
   SIGNAL dr_override           : LC3B_reg;
   SIGNAL dr_val                : lc3b_word;
   SIGNAL imm4                  : LC3b_imm4;
   SIGNAL imm5                  : LC3b_imm5;
   SIGNAL incr_pc               : lc3b_word;
   SIGNAL index6                : LC3b_index6;
   SIGNAL instr                 : lc3b_word;
   SIGNAL instr_dr              : LC3b_reg;
   SIGNAL instr_id              : LC3b_word;
   SIGNAL jsr                   : LC3b_TRISTATE_2MUX_SEL;
   SIGNAL mem_data_in           : lc3b_word;
   SIGNAL noop                  : LC3B_WORD;
   SIGNAL nzp                   : LC3b_cc;
   SIGNAL offset11              : LC3b_offset11;
   SIGNAL offset11_16           : LC3B_WORD;
   SIGNAL offset9               : LC3b_offset9;
   SIGNAL offset9_16            : LC3B_WORD;
   SIGNAL op_add                : STD_LOGIC;
   SIGNAL op_and                : STD_LOGIC;
   SIGNAL op_br                 : STD_LOGIC;
   SIGNAL op_jsr                : STD_LOGIC;
   SIGNAL op_ldb                : STD_LOGIC;
   SIGNAL op_ldi                : STD_LOGIC;
   SIGNAL op_ldr                : STD_LOGIC;
   SIGNAL op_lea                : STD_LOGIC;
   SIGNAL op_not                : STD_LOGIC;
   SIGNAL op_ret                : STD_LOGIC;
   SIGNAL op_shf                : STD_LOGIC;
   SIGNAL op_stb                : STD_LOGIC;
   SIGNAL op_sti                : STD_LOGIC;
   SIGNAL op_str                : STD_LOGIC;
   SIGNAL op_trap               : STD_LOGIC;
   SIGNAL opcode                : LC3b_opcode;
   SIGNAL override_dr           : STD_LOGIC;
   SIGNAL taken                 : std_logic;
   SIGNAL target_pc             : LC3B_WORD;
   SIGNAL trapvect8             : lc3b_trapvect8;
   SIGNAL wb_data               : LC3B_word;
   SIGNAL wb_ghost_reg          : STD_LOGIC;

   -- Implicit buffer signal declarations
   SIGNAL decode_pc_internal : lc3b_word;


   -- Component Declarations
   COMPONENT Comparator
   GENERIC (
      N     : Integer;
      Delay : time
   );
   PORT (
      A : IN     std_logic_vector (N-1 DOWNTO 0);
      B : IN     std_logic_vector (N-1 DOWNTO 0);
      Y : OUT    std_logic
   );
   END COMPONENT;
   COMPONENT Control_ROM
   PORT (
      bit11     : IN     std_logic;
      bit4      : IN     std_logic;
      bit5      : IN     std_logic;
      opcode    : IN     LC3b_opcode;
      ctrl_word : OUT    control_word
   );
   END COMPONENT;
   COMPONENT Dec4_16
   PORT (
      A : IN     STD_LOGIC_VECTOR (3 DOWNTO 0);
      F : OUT    STD_LOGIC_VECTOR (15 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT ID
   PORT (
      decode_instr : IN     LC3b_word ;
      Opcode       : OUT    LC3b_opcode ;
      SrcA         : OUT    LC3b_reg ;
      SrcB         : OUT    LC3b_reg ;
      dest         : OUT    LC3b_reg ;
      index6       : OUT    LC3b_index6 ;
      imm5         : OUT    LC3b_imm5 ;
      bit5         : OUT    std_logic ;
      bit4         : OUT    std_logic ;
      offset9      : OUT    LC3b_offset9 ;
      trapvec8     : OUT    LC3b_trapvect8 ;
      offset11     : OUT    LC3b_offset11 ;
      bit11        : OUT    std_logic ;
      imm4         : OUT    LC3b_imm4 ;
      direction    : OUT    std_logic ;
      nzp          : OUT    LC3b_cc 
   );
   END COMPONENT;
   COMPONENT MUX2_ControlWord
   PORT (
      A   : IN     control_word ;
      B   : IN     control_word ;
      SEL : IN     STD_LOGIC ;
      F   : OUT    control_word 
   );
   END COMPONENT;
   COMPONENT NZPReg
   PORT (
      RESET_L  : IN     std_logic;
      clk      : IN     std_logic;
      load_nzp : IN     std_logic;
      wb_cc    : IN     LC3b_cc;
      cc       : OUT    LC3b_cc
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
   COMPONENT SEXT11
   PORT (
      in11   : IN     std_logic_vector (10 DOWNTO 0);
      output : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT SEXT9
   PORT (
      in9    : IN     std_logic_vector (8 DOWNTO 0);
      output : OUT    std_logic_vector (15 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT TristateMux2_N
   GENERIC (
      n : integer
   );
   PORT (
      A   : IN     std_logic_vector (n-1 DOWNTO 0);
      B   : IN     std_logic_vector (n-1 DOWNTO 0);
      sel : IN     LC3b_TRISTATE_2MUX_SEL ;
      F   : OUT    std_logic_vector (n-1 DOWNTO 0)
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
   COMPONENT MUX2_4
   PORT (
      A   : IN     LC3B_NIBBLE ;
      B   : IN     LC3B_NIBBLE ;
      SEL : IN     STD_LOGIC ;
      F   : OUT    LC3B_NIBBLE 
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
   COMPONENT REGFILE
   PORT (
      CLK      : IN     STD_LOGIC ;
      DEST     : IN     LC3B_REG ;
      DIN      : IN     LC3B_WORD ;
      RESET_L  : IN     STD_LOGIC ;
      REGWRITE : IN     STD_LOGIC ;
      SRCA     : IN     LC3B_REG ;
      SRCB     : IN     LC3B_REG ;
      A        : OUT    LC3B_WORD ;
      B        : OUT    LC3B_WORD 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : ADD16 USE ENTITY mp3lib.ADD16;
   FOR ALL : AND2 USE ENTITY mp3lib.AND2;
   FOR ALL : Comparator USE ENTITY ece411.Comparator;
   FOR ALL : Control_ROM USE ENTITY ece411.Control_ROM;
   FOR ALL : Dec4_16 USE ENTITY ece411.Dec4_16;
   FOR ALL : ID USE ENTITY ece411.ID;
   FOR ALL : MUX2_4 USE ENTITY mp3lib.MUX2_4;
   FOR ALL : MUX2_ControlWord USE ENTITY ece411.MUX2_ControlWord;
   FOR ALL : NOT1 USE ENTITY mp3lib.NOT1;
   FOR ALL : NZPReg USE ENTITY ece411.NZPReg;
   FOR ALL : OR3 USE ENTITY mp3lib.OR3;
   FOR ALL : PipeDataCombiner USE ENTITY ece411.PipeDataCombiner;
   FOR ALL : PipeDataSplitter USE ENTITY ece411.PipeDataSplitter;
   FOR ALL : REGFILE USE ENTITY mp3lib.REGFILE;
   FOR ALL : SEXT11 USE ENTITY ece411.SEXT11;
   FOR ALL : SEXT9 USE ENTITY ece411.SEXT9;
   FOR ALL : TristateMux2_N USE ENTITY ece411.TristateMux2_N;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   op_br   <= instr_id(0);
   op_add  <= instr_id(1);
   op_ldb  <= instr_id(2);
   op_stb  <= instr_id(3);
   op_jsr  <= instr_id(4);
   op_and  <= instr_id(5);
   op_ldr  <= instr_id(6);
   op_str  <= instr_id(7);
   -- op_rti
   op_not  <= instr_id(9);
   op_ldi  <= instr_id(10);
   op_sti  <= instr_id(11);
   op_ret  <= instr_id(12);
   op_shf  <= instr_id(13);
   op_lea  <= instr_id(14);
   op_trap <= instr_id(15);

   -- HDL Embedded Text Block 2 eb2
   wb_ghost_reg <= wb_dest(3);

   -- HDL Embedded Text Block 3 eb3
   default_word <= default_control_word;
   
   noop <= x"0000";

   -- HDL Embedded Text Block 4 eb4
   decode_load_pc   <= decode_control_buffer.dec.jsr(1);
   decode_target_pc <= target_pc;
   
   jsr <= decode_control_buffer.dec.jsr;

   -- HDL Embedded Text Block 8 eb8
   override_dr <= decode_control_buffer.dec.override_dr;
   dr_override <= decode_control_buffer.dec.dr_override;
   
   uop_instr_dr <= instr_dr;
   uop_sr2      <= SrcBMuxOut;
   uop_sr2_val  <= decode_src_b;


   -- Instance port mappings.
   U_3 : Comparator
      GENERIC MAP (
         N     => 16,
         Delay => DELAY_COMPARE16
      )
      PORT MAP (
         A => instr,
         B => noop,
         Y => Y
      );
   U_6 : Control_ROM
      PORT MAP (
         opcode    => opcode,
         bit11     => bit11,
         bit5      => bit5,
         bit4      => bit4,
         ctrl_word => decode_control_buffer
      );
   opcodeDecoder : Dec4_16
      PORT MAP (
         A => opcode,
         F => instr_id
      );
   IDUnit : ID
      PORT MAP (
         decode_instr => instr,
         Opcode       => opcode,
         SrcA         => SrcA,
         SrcB         => SrcB,
         dest         => instr_dr,
         index6       => index6,
         imm5         => imm5,
         bit5         => bit5,
         bit4         => bit4,
         offset9      => offset9,
         trapvec8     => trapvect8,
         offset11     => offset11,
         bit11        => bit11,
         imm4         => imm4,
         direction    => direction,
         nzp          => nzp
      );
   U_2 : MUX2_ControlWord
      PORT MAP (
         A   => decode_control_buffer,
         B   => default_word,
         SEL => Y,
         F   => decode_control_out
      );
   U_0 : NZPReg
      PORT MAP (
         clk      => CLK,
         wb_cc    => wb_cc,
         load_nzp => wb_load_cc,
         RESET_L  => RESET_L,
         cc       => cc
      );
   U_9 : PipeDataCombiner
      PORT MAP (
         pc          => decode_pc_internal,
         incr_pc     => incr_pc,
         instr       => instr,
         aluout      => aluout,
         dr          => dr,
         dr_val      => dr_val,
         idx6        => index6,
         imm4        => imm4,
         imm5        => imm5,
         mem_data_in => mem_data_in,
         data_addr   => data_addr,
         off11       => offset11,
         off9        => offset9,
         sr1         => SrcA,
         sr2         => SrcBMuxOut,
         sr1_val     => decode_src_a,
         sr2_val     => decode_src_b,
         trapvect8   => trapvect8,
         nzp         => nzp,
         cc          => cc,
         target_pc   => target_pc,
         taken       => taken,
         btb_data    => btb_data,
         wb_data     => wb_data,
         data_out    => decode_data_out
      );
   U_8 : PipeDataSplitter
      PORT MAP (
         data_in     => decode_data_in,
         pc          => decode_pc_internal,
         incr_pc     => incr_pc,
         instr       => instr,
         aluout      => aluout,
         mem_data_in => mem_data_in,
         data_addr   => data_addr,
         sr1         => OPEN,
         sr2         => OPEN,
         sr1_val     => OPEN,
         sr2_val     => OPEN,
         dr_val      => dr_val,
         dr          => OPEN,
         imm4        => OPEN,
         imm5        => OPEN,
         idx6        => OPEN,
         off9        => OPEN,
         off11       => OPEN,
         trapvect8   => OPEN,
         nzp         => OPEN,
         cc          => OPEN,
         target_pc   => OPEN,
         taken       => taken,
         wb_data     => wb_data,
         btb_data    => btb_data
      );
   U_10 : SEXT11
      PORT MAP (
         in11   => offset11,
         output => offset11_16
      );
   U_11 : SEXT9
      PORT MAP (
         in9    => offset9,
         output => offset9_16
      );
   U_12 : TristateMux2_N
      GENERIC MAP (
         n => 16
      )
      PORT MAP (
         A   => offset9_16,
         B   => offset11_16,
         sel => jsr,
         F   => F3
      );
   U_13 : ADD16
      PORT MAP (
         A => incr_pc,
         B => F3,
         F => target_pc
      );
   U_5 : AND2
      PORT MAP (
         A => wb_rw,
         B => F2,
         F => F1
      );
   U_1 : MUX2_4
      PORT MAP (
         A   => SrcB,
         B   => instr_dr,
         SEL => SrcBMuxSel,
         F   => SrcBMuxOut
      );
   U_4 : MUX2_4
      PORT MAP (
         A   => instr_dr,
         B   => dr_override,
         SEL => override_dr,
         F   => dr
      );
   U_7 : NOT1
      PORT MAP (
         A => wb_ghost_reg,
         F => F2
      );
   U_43 : OR3
      PORT MAP (
         A => op_stb,
         B => op_sti,
         C => op_str,
         F => SrcBMuxSel
      );
   aRF : REGFILE
      PORT MAP (
         CLK      => CLK,
         DEST     => wb_dest,
         DIN      => wb_din,
         RESET_L  => RESET_L,
         REGWRITE => F1,
         SRCA     => SrcA,
         SRCB     => SrcBMuxOut,
         A        => decode_src_a,
         B        => decode_src_b
      );

   -- Implicit buffered output assignments
   decode_pc <= decode_pc_internal;

END struct;
