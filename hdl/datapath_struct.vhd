-- VHDL Entity ece411.Datapath.interface
--
-- Created:
--          by - wheele11.ews (gelib-057-03.ews.illinois.edu)
--          at - 21:46:33 03/14/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Datapath IS
   PORT( 
      CLK             : IN     std_logic;
      DATAIN          : IN     LC3B_WORD;
      RESET_L         : IN     STD_LOGIC;
      START_H         : IN     std_logic;
      data_resp_h     : IN     std_logic;
      instr_in        : IN     LC3B_WORD;
      instr_resp_h    : IN     std_logic;
      Dataout         : OUT    LC3b_word;
      data_addr       : OUT    LC3b_word;
      data_mread_l    : OUT    std_logic;
      data_mwriteh_l  : OUT    std_logic;
      data_mwritel_l  : OUT    std_logic;
      instr_addr      : OUT    LC3b_word;
      instr_mread_l   : OUT    std_logic;
      instr_mwriteh_l : OUT    std_logic;
      instr_mwritel_l : OUT    std_logic;
      instr_out       : OUT    LC3b_word
   );

-- Declarations

END Datapath ;

--
-- VHDL Architecture ece411.Datapath.struct
--
-- Created:
--          by - wheele11.ews (gelib-057-03.ews.illinois.edu)
--          at - 21:46:33 03/14/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY ece411;

ARCHITECTURE struct OF Datapath IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL decode_alumux_sel      : STD_LOGIC_VECTOR(1 DOWNTO 0);
   SIGNAL decode_aluop           : LC3b_aluop;
   SIGNAL decode_dr              : LC3B_REG;
   SIGNAL decode_instr           : STD_LOGIC_VECTOR(15 DOWNTO 0);
   SIGNAL decode_load_jump_pc    : STD_LOGIC;
   SIGNAL decode_opcode          : LC3b_opcode;
   SIGNAL decode_pc              : LC3b_word;
   SIGNAL decode_read            : std_logic;
   SIGNAL decode_regwrite        : std_logic;
   SIGNAL decode_set_cc          : std_logic;
   SIGNAL decode_shift_imm       : STD_LOGIC;
   SIGNAL decode_src_a           : LC3b_word;
   SIGNAL decode_src_b           : LC3b_word;
   SIGNAL decode_use_offset11    : STD_LOGIC;
   SIGNAL decode_use_pc_adder    : STD_LOGIC;
   SIGNAL decode_write_byte      : std_logic;
   SIGNAL decode_write_word      : std_logic;
   SIGNAL exec_alumux_sel        : LC3b_4mux_sel;
   SIGNAL exec_aluop             : LC3B_ALUOP;
   SIGNAL exec_aluout            : LC3B_WORD;
   SIGNAL exec_dr                : LC3B_REG;
   SIGNAL exec_instr             : LC3b_word;
   SIGNAL exec_load_jump_pc      : STD_LOGIC;
   SIGNAL exec_load_pc           : STD_LOGIC;
   SIGNAL exec_opcode            : LC3b_opcode;
   SIGNAL exec_pc                : LC3b_word;
   SIGNAL exec_read              : std_logic;
   SIGNAL exec_regwrite          : STD_LOGIC;
   SIGNAL exec_set_cc            : std_logic;
   SIGNAL exec_shift_imm         : STD_LOGIC;
   SIGNAL exec_src_a             : LC3b_word;
   SIGNAL exec_src_b             : LC3b_word;
   SIGNAL exec_target_pc         : LC3b_word;
   SIGNAL exec_use_offset11      : std_logic;
   SIGNAL exec_use_pc_adder      : std_logic;
   SIGNAL exec_write_byte        : std_logic;
   SIGNAL exec_write_word        : std_logic;
   SIGNAL fetch_instr            : LC3b_word;
   SIGNAL fetch_ready            : std_logic;
   SIGNAL load_decode_exec_pipe  : STD_LOGIC;
   SIGNAL load_exec_mem_pipe     : STD_LOGIC;
   SIGNAL load_fetch_decode_pipe : STD_LOGIC;
   SIGNAL load_mem_wb_pipe       : std_logic;
   SIGNAL load_pc                : std_logic;
   SIGNAL mem_aluout             : LC3B_WORD;
   SIGNAL mem_data_in            : LC3B_WORD;
   SIGNAL mem_dr                 : LC3B_REG;
   SIGNAL mem_instr              : LC3b_word;
   SIGNAL mem_opcode             : LC3b_opcode;
   SIGNAL mem_pc                 : LC3b_word;
   SIGNAL mem_read               : std_logic;
   SIGNAL mem_ready              : STD_LOGIC;
   SIGNAL mem_regwrite           : STD_LOGIC;
   SIGNAL mem_set_cc             : std_logic;
   SIGNAL mem_src_a              : LC3b_word;
   SIGNAL mem_src_b              : LC3b_word;
   SIGNAL mem_write_byte         : std_logic;
   SIGNAL mem_write_word         : std_logic;
   SIGNAL pc                     : LC3b_word;
   SIGNAL wb_aluout              : LC3b_word;
   SIGNAL wb_cc                  : LC3b_cc;
   SIGNAL wb_data_in             : LC3b_word;
   SIGNAL wb_dest                : LC3B_REG;
   SIGNAL wb_din                 : LC3B_WORD;
   SIGNAL wb_dr                  : LC3B_REG;
   SIGNAL wb_instr               : LC3b_word;
   SIGNAL wb_load_cc             : std_logic;
   SIGNAL wb_mread               : std_logic;
   SIGNAL wb_opcode              : LC3b_opcode;
   SIGNAL wb_pc                  : LC3b_word;
   SIGNAL wb_regwrite            : STD_LOGIC;
   SIGNAL wb_rw                  : STD_LOGIC;
   SIGNAL wb_set_cc              : std_logic;
   SIGNAL wb_src_a               : LC3b_word;
   SIGNAL wb_src_b               : LC3b_word;


   -- Component Declarations
   COMPONENT StallUnit
   PORT (
      CLK                    : IN     std_logic ;
      fetch_ready            : IN     std_logic ;
      mem_ready              : IN     STD_LOGIC ;
      load_decode_exec_pipe  : OUT    STD_LOGIC ;
      load_exec_mem_pipe     : OUT    STD_LOGIC ;
      load_fetch_decode_pipe : OUT    STD_LOGIC ;
      load_mem_wb_pipe       : OUT    std_logic ;
      load_pc                : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT decodeStage
   PORT (
      CLK                 : IN     std_logic ;
      RESET_L             : IN     STD_LOGIC ;
      decode_instr        : IN     STD_LOGIC_VECTOR (15 DOWNTO 0);
      decode_pc           : IN     LC3b_word ;
      wb_cc               : IN     LC3b_cc ;
      wb_dest             : IN     LC3B_REG ;
      wb_din              : IN     LC3B_WORD ;
      wb_load_cc          : IN     std_logic ;
      wb_rw               : IN     STD_LOGIC ;
      decode_alumux_sel   : OUT    STD_LOGIC_VECTOR (1 DOWNTO 0);
      decode_aluop        : OUT    LC3b_aluop ;
      decode_dr           : OUT    LC3B_REG ;
      decode_load_jump_pc : OUT    STD_LOGIC ;
      decode_opcode       : OUT    LC3b_opcode ;
      decode_read         : OUT    std_logic ;
      decode_regwrite     : OUT    std_logic ;
      decode_set_cc       : OUT    std_logic ;
      decode_shift_imm    : OUT    STD_LOGIC ;
      decode_src_a        : OUT    LC3b_word ;
      decode_src_b        : OUT    LC3b_word ;
      decode_use_offset11 : OUT    STD_LOGIC ;
      decode_use_pc_adder : OUT    STD_LOGIC ;
      decode_write_byte   : OUT    std_logic ;
      decode_write_word   : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT decode_exec_pipe
   PORT (
      CLK                   : IN     std_logic ;
      RESET_L               : IN     STD_LOGIC ;
      decode_alumux_sel     : IN     STD_LOGIC_VECTOR (1 DOWNTO 0);
      decode_aluop          : IN     LC3b_aluop ;
      decode_dr             : IN     LC3B_REG ;
      decode_instr          : IN     STD_LOGIC_VECTOR (15 DOWNTO 0);
      decode_load_jump_pc   : IN     STD_LOGIC ;
      decode_opcode         : IN     LC3b_opcode ;
      decode_pc             : IN     LC3b_word ;
      decode_read           : IN     std_logic ;
      decode_regwrite       : IN     std_logic ;
      decode_set_cc         : IN     std_logic ;
      decode_shift_imm      : IN     STD_LOGIC ;
      decode_src_a          : IN     LC3b_word ;
      decode_src_b          : IN     LC3b_word ;
      decode_use_offset11   : IN     STD_LOGIC ;
      decode_use_pc_adder   : IN     STD_LOGIC ;
      decode_write_byte     : IN     std_logic ;
      decode_write_word     : IN     std_logic ;
      load_decode_exec_pipe : IN     STD_LOGIC ;
      exec_alumux_sel       : OUT    LC3b_4mux_sel ;
      exec_aluop            : OUT    LC3B_ALUOP ;
      exec_dr               : OUT    LC3B_REG ;
      exec_instr            : OUT    LC3b_word ;
      exec_load_jump_pc     : OUT    STD_LOGIC ;
      exec_opcode           : OUT    LC3b_opcode ;
      exec_pc               : OUT    LC3b_word ;
      exec_read             : OUT    std_logic ;
      exec_regwrite         : OUT    STD_LOGIC ;
      exec_set_cc           : OUT    std_logic ;
      exec_shift_imm        : OUT    STD_LOGIC ;
      exec_src_a            : OUT    LC3b_word ;
      exec_src_b            : OUT    LC3b_word ;
      exec_use_offset11     : OUT    std_logic ;
      exec_use_pc_adder     : OUT    std_logic ;
      exec_write_byte       : OUT    std_logic ;
      exec_write_word       : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT execStage
   PORT (
      CLK               : IN     std_logic ;
      exec_alumux_sel   : IN     LC3b_4mux_sel ;
      exec_aluop        : IN     LC3B_ALUOP ;
      exec_dr           : IN     LC3B_REG ;
      exec_instr        : IN     LC3b_word ;
      exec_load_jump_pc : IN     STD_LOGIC ;
      exec_opcode       : IN     LC3b_opcode ;
      exec_pc           : IN     LC3b_word ;
      exec_read         : IN     std_logic ;
      exec_regwrite     : IN     STD_LOGIC ;
      exec_set_cc       : IN     std_logic ;
      exec_shift_imm    : IN     STD_LOGIC ;
      exec_src_a        : IN     LC3b_word ;
      exec_src_b        : IN     LC3b_word ;
      exec_use_offset11 : IN     std_logic ;
      exec_use_pc_adder : IN     std_logic ;
      exec_write_byte   : IN     std_logic ;
      exec_write_word   : IN     std_logic ;
      exec_aluout       : OUT    LC3B_WORD ;
      exec_load_pc      : OUT    STD_LOGIC ;
      exec_target_pc    : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT exec_mem_pipe
   PORT (
      CLK                : IN     std_logic ;
      RESET_L            : IN     STD_LOGIC ;
      exec_alumux_sel    : IN     LC3b_4mux_sel ;
      exec_aluop         : IN     LC3B_ALUOP ;
      exec_aluout        : IN     LC3B_WORD ;
      exec_dr            : IN     LC3B_REG ;
      exec_instr         : IN     LC3b_word ;
      exec_load_jump_pc  : IN     STD_LOGIC ;
      exec_opcode        : IN     LC3b_opcode ;
      exec_pc            : IN     LC3b_word ;
      exec_read          : IN     std_logic ;
      exec_regwrite      : IN     STD_LOGIC ;
      exec_set_cc        : IN     std_logic ;
      exec_shift_imm     : IN     STD_LOGIC ;
      exec_src_a         : IN     LC3b_word ;
      exec_src_b         : IN     LC3b_word ;
      exec_use_offset11  : IN     std_logic ;
      exec_use_pc_adder  : IN     std_logic ;
      exec_write_byte    : IN     std_logic ;
      exec_write_word    : IN     std_logic ;
      load_exec_mem_pipe : IN     STD_LOGIC ;
      mem_aluout         : OUT    LC3B_WORD ;
      mem_dr             : OUT    LC3B_REG ;
      mem_instr          : OUT    LC3b_word ;
      mem_opcode         : OUT    LC3b_opcode ;
      mem_pc             : OUT    LC3b_word ;
      mem_read           : OUT    std_logic ;
      mem_regwrite       : OUT    STD_LOGIC ;
      mem_set_cc         : OUT    std_logic ;
      mem_src_a          : OUT    LC3b_word ;
      mem_src_b          : OUT    LC3b_word ;
      mem_write_byte     : OUT    std_logic ;
      mem_write_word     : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT fetchStage
   PORT (
      CLK            : IN     std_logic ;
      RESET_L        : IN     STD_LOGIC ;
      exec_load_pc   : IN     STD_LOGIC ;
      exec_target_pc : IN     LC3b_word ;
      instr_in       : IN     LC3B_WORD ;
      instr_resp_h   : IN     std_logic ;
      load_pc        : IN     STD_LOGIC ;
      fetch_instr    : OUT    LC3b_word ;
      fetch_ready    : OUT    std_logic ;
      instr_addr     : OUT    LC3b_word ;
      instr_mread_l  : OUT    std_logic ;
      pc             : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT fetch_decode_pipe
   PORT (
      CLK                    : IN     std_logic ;
      RESET_L                : IN     STD_LOGIC ;
      fetch_instr            : IN     LC3b_word ;
      fetch_ready            : IN     std_logic ;
      load_fetch_decode_pipe : IN     STD_LOGIC ;
      pc                     : IN     LC3b_word ;
      decode_instr           : OUT    STD_LOGIC_VECTOR (15 DOWNTO 0);
      decode_pc              : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT forwardingUnit
   PORT (
      CLK : IN     std_logic 
   );
   END COMPONENT;
   COMPONENT memStage
   PORT (
      CLK            : IN     std_logic ;
      DATAIN         : IN     LC3B_WORD ;
      data_resp_h    : IN     std_logic ;
      mem_aluout     : IN     LC3B_WORD ;
      mem_read       : IN     std_logic ;
      mem_src_b      : IN     LC3b_word ;
      mem_write_byte : IN     std_logic ;
      mem_write_word : IN     std_logic ;
      Dataout        : OUT    LC3b_word ;
      data_addr      : OUT    LC3b_word ;
      data_mread_l   : OUT    std_logic ;
      data_mwriteh_l : OUT    std_logic ;
      data_mwritel_l : OUT    std_logic ;
      mem_data_in    : OUT    LC3B_WORD ;
      mem_ready      : OUT    STD_LOGIC 
   );
   END COMPONENT;
   COMPONENT mem_wb_pipe
   PORT (
      CLK              : IN     std_logic ;
      RESET_L          : IN     STD_LOGIC ;
      load_mem_wb_pipe : IN     std_logic ;
      mem_aluout       : IN     LC3B_WORD ;
      mem_data_in      : IN     LC3B_WORD ;
      mem_dr           : IN     LC3B_REG ;
      mem_instr        : IN     LC3b_word ;
      mem_opcode       : IN     LC3b_opcode ;
      mem_pc           : IN     LC3b_word ;
      mem_read         : IN     std_logic ;
      mem_ready        : IN     STD_LOGIC ;
      mem_regwrite     : IN     STD_LOGIC ;
      mem_set_cc       : IN     std_logic ;
      mem_src_a        : IN     LC3b_word ;
      mem_src_b        : IN     LC3b_word ;
      mem_write_byte   : IN     std_logic ;
      mem_write_word   : IN     std_logic ;
      wb_aluout        : OUT    LC3b_word ;
      wb_data_in       : OUT    LC3b_word ;
      wb_dr            : OUT    LC3B_REG ;
      wb_instr         : OUT    LC3b_word ;
      wb_mread         : OUT    std_logic ;
      wb_opcode        : OUT    LC3b_opcode ;
      wb_pc            : OUT    LC3b_word ;
      wb_regwrite      : OUT    STD_LOGIC ;
      wb_set_cc        : OUT    std_logic ;
      wb_src_a         : OUT    LC3b_word ;
      wb_src_b         : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT wbStage
   PORT (
      CLK         : IN     std_logic ;
      wb_aluout   : IN     LC3b_word ;
      wb_data_in  : IN     LC3b_word ;
      wb_dr       : IN     LC3B_REG ;
      wb_instr    : IN     LC3b_word ;
      wb_mread    : IN     std_logic ;
      wb_opcode   : IN     LC3b_opcode ;
      wb_pc       : IN     LC3b_word ;
      wb_regwrite : IN     STD_LOGIC ;
      wb_set_cc   : IN     std_logic ;
      wb_src_a    : IN     LC3b_word ;
      wb_src_b    : IN     LC3b_word ;
      wb_cc       : OUT    LC3b_cc ;
      wb_dest     : OUT    LC3B_REG ;
      wb_din      : OUT    LC3B_WORD ;
      wb_load_cc  : OUT    std_logic ;
      wb_rw       : OUT    STD_LOGIC 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : StallUnit USE ENTITY ece411.StallUnit;
   FOR ALL : decodeStage USE ENTITY ece411.decodeStage;
   FOR ALL : decode_exec_pipe USE ENTITY ece411.decode_exec_pipe;
   FOR ALL : execStage USE ENTITY ece411.execStage;
   FOR ALL : exec_mem_pipe USE ENTITY ece411.exec_mem_pipe;
   FOR ALL : fetchStage USE ENTITY ece411.fetchStage;
   FOR ALL : fetch_decode_pipe USE ENTITY ece411.fetch_decode_pipe;
   FOR ALL : forwardingUnit USE ENTITY ece411.forwardingUnit;
   FOR ALL : memStage USE ENTITY ece411.memStage;
   FOR ALL : mem_wb_pipe USE ENTITY ece411.mem_wb_pipe;
   FOR ALL : wbStage USE ENTITY ece411.wbStage;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   -- deal with instruction write
   instr_mwriteh_l <= '1';
   instr_mwritel_l <= '1';                                   


   -- Instance port mappings.
   aStall : StallUnit
      PORT MAP (
         CLK                    => CLK,
         fetch_ready            => fetch_ready,
         mem_ready              => mem_ready,
         load_decode_exec_pipe  => load_decode_exec_pipe,
         load_exec_mem_pipe     => load_exec_mem_pipe,
         load_fetch_decode_pipe => load_fetch_decode_pipe,
         load_mem_wb_pipe       => load_mem_wb_pipe,
         load_pc                => load_pc
      );
   decode : decodeStage
      PORT MAP (
         CLK                 => CLK,
         RESET_L             => RESET_L,
         decode_instr        => decode_instr,
         decode_pc           => decode_pc,
         wb_cc               => wb_cc,
         wb_dest             => wb_dest,
         wb_din              => wb_din,
         wb_load_cc          => wb_load_cc,
         wb_rw               => wb_rw,
         decode_alumux_sel   => decode_alumux_sel,
         decode_aluop        => decode_aluop,
         decode_dr           => decode_dr,
         decode_load_jump_pc => decode_load_jump_pc,
         decode_opcode       => decode_opcode,
         decode_read         => decode_read,
         decode_regwrite     => decode_regwrite,
         decode_set_cc       => decode_set_cc,
         decode_shift_imm    => decode_shift_imm,
         decode_src_a        => decode_src_a,
         decode_src_b        => decode_src_b,
         decode_use_offset11 => decode_use_offset11,
         decode_use_pc_adder => decode_use_pc_adder,
         decode_write_byte   => decode_write_byte,
         decode_write_word   => decode_write_word
      );
   pipe2_de : decode_exec_pipe
      PORT MAP (
         CLK                   => CLK,
         RESET_L               => RESET_L,
         decode_alumux_sel     => decode_alumux_sel,
         decode_aluop          => decode_aluop,
         decode_dr             => decode_dr,
         decode_instr          => decode_instr,
         decode_load_jump_pc   => decode_load_jump_pc,
         decode_opcode         => decode_opcode,
         decode_pc             => decode_pc,
         decode_read           => decode_read,
         decode_regwrite       => decode_regwrite,
         decode_set_cc         => decode_set_cc,
         decode_shift_imm      => decode_shift_imm,
         decode_src_a          => decode_src_a,
         decode_src_b          => decode_src_b,
         decode_use_offset11   => decode_use_offset11,
         decode_use_pc_adder   => decode_use_pc_adder,
         decode_write_byte     => decode_write_byte,
         decode_write_word     => decode_write_word,
         load_decode_exec_pipe => load_decode_exec_pipe,
         exec_alumux_sel       => exec_alumux_sel,
         exec_aluop            => exec_aluop,
         exec_dr               => exec_dr,
         exec_instr            => exec_instr,
         exec_load_jump_pc     => exec_load_jump_pc,
         exec_opcode           => exec_opcode,
         exec_pc               => exec_pc,
         exec_read             => exec_read,
         exec_regwrite         => exec_regwrite,
         exec_set_cc           => exec_set_cc,
         exec_shift_imm        => exec_shift_imm,
         exec_src_a            => exec_src_a,
         exec_src_b            => exec_src_b,
         exec_use_offset11     => exec_use_offset11,
         exec_use_pc_adder     => exec_use_pc_adder,
         exec_write_byte       => exec_write_byte,
         exec_write_word       => exec_write_word
      );
   exec : execStage
      PORT MAP (
         CLK               => CLK,
         exec_alumux_sel   => exec_alumux_sel,
         exec_aluop        => exec_aluop,
         exec_dr           => exec_dr,
         exec_instr        => exec_instr,
         exec_load_jump_pc => exec_load_jump_pc,
         exec_opcode       => exec_opcode,
         exec_pc           => exec_pc,
         exec_read         => exec_read,
         exec_regwrite     => exec_regwrite,
         exec_set_cc       => exec_set_cc,
         exec_shift_imm    => exec_shift_imm,
         exec_src_a        => exec_src_a,
         exec_src_b        => exec_src_b,
         exec_use_offset11 => exec_use_offset11,
         exec_use_pc_adder => exec_use_pc_adder,
         exec_write_byte   => exec_write_byte,
         exec_write_word   => exec_write_word,
         exec_aluout       => exec_aluout,
         exec_load_pc      => exec_load_pc,
         exec_target_pc    => exec_target_pc
      );
   pipe3_em : exec_mem_pipe
      PORT MAP (
         CLK                => CLK,
         RESET_L            => RESET_L,
         exec_alumux_sel    => exec_alumux_sel,
         exec_aluop         => exec_aluop,
         exec_aluout        => exec_aluout,
         exec_dr            => exec_dr,
         exec_instr         => exec_instr,
         exec_load_jump_pc  => exec_load_jump_pc,
         exec_opcode        => exec_opcode,
         exec_pc            => exec_pc,
         exec_read          => exec_read,
         exec_regwrite      => exec_regwrite,
         exec_set_cc        => exec_set_cc,
         exec_shift_imm     => exec_shift_imm,
         exec_src_a         => exec_src_a,
         exec_src_b         => exec_src_b,
         exec_use_offset11  => exec_use_offset11,
         exec_use_pc_adder  => exec_use_pc_adder,
         exec_write_byte    => exec_write_byte,
         exec_write_word    => exec_write_word,
         load_exec_mem_pipe => load_exec_mem_pipe,
         mem_aluout         => mem_aluout,
         mem_dr             => mem_dr,
         mem_instr          => mem_instr,
         mem_opcode         => mem_opcode,
         mem_pc             => mem_pc,
         mem_read           => mem_read,
         mem_regwrite       => mem_regwrite,
         mem_set_cc         => mem_set_cc,
         mem_src_a          => mem_src_a,
         mem_src_b          => mem_src_b,
         mem_write_byte     => mem_write_byte,
         mem_write_word     => mem_write_word
      );
   fetch : fetchStage
      PORT MAP (
         CLK            => CLK,
         RESET_L        => RESET_L,
         exec_load_pc   => exec_load_pc,
         exec_target_pc => exec_target_pc,
         instr_in       => instr_in,
         instr_resp_h   => instr_resp_h,
         load_pc        => load_pc,
         fetch_instr    => fetch_instr,
         fetch_ready    => fetch_ready,
         instr_addr     => instr_addr,
         instr_mread_l  => instr_mread_l,
         pc             => pc
      );
   pipe1_fd : fetch_decode_pipe
      PORT MAP (
         CLK                    => CLK,
         RESET_L                => RESET_L,
         fetch_instr            => fetch_instr,
         fetch_ready            => fetch_ready,
         load_fetch_decode_pipe => load_fetch_decode_pipe,
         pc                     => pc,
         decode_instr           => decode_instr,
         decode_pc              => decode_pc
      );
   U_11 : forwardingUnit
      PORT MAP (
         CLK => CLK
      );
   men : memStage
      PORT MAP (
         CLK            => CLK,
         DATAIN         => DATAIN,
         data_resp_h    => data_resp_h,
         mem_aluout     => mem_aluout,
         mem_read       => mem_read,
         mem_src_b      => mem_src_b,
         mem_write_byte => mem_write_byte,
         mem_write_word => mem_write_word,
         Dataout        => Dataout,
         data_addr      => data_addr,
         data_mread_l   => data_mread_l,
         data_mwriteh_l => data_mwriteh_l,
         data_mwritel_l => data_mwritel_l,
         mem_data_in    => mem_data_in,
         mem_ready      => mem_ready
      );
   pipe4_mw : mem_wb_pipe
      PORT MAP (
         CLK              => CLK,
         RESET_L          => RESET_L,
         load_mem_wb_pipe => load_mem_wb_pipe,
         mem_aluout       => mem_aluout,
         mem_data_in      => mem_data_in,
         mem_dr           => mem_dr,
         mem_instr        => mem_instr,
         mem_opcode       => mem_opcode,
         mem_pc           => mem_pc,
         mem_read         => mem_read,
         mem_ready        => mem_ready,
         mem_regwrite     => mem_regwrite,
         mem_set_cc       => mem_set_cc,
         mem_src_a        => mem_src_a,
         mem_src_b        => mem_src_b,
         mem_write_byte   => mem_write_byte,
         mem_write_word   => mem_write_word,
         wb_aluout        => wb_aluout,
         wb_data_in       => wb_data_in,
         wb_dr            => wb_dr,
         wb_instr         => wb_instr,
         wb_mread         => wb_mread,
         wb_opcode        => wb_opcode,
         wb_pc            => wb_pc,
         wb_regwrite      => wb_regwrite,
         wb_set_cc        => wb_set_cc,
         wb_src_a         => wb_src_a,
         wb_src_b         => wb_src_b
      );
   wb : wbStage
      PORT MAP (
         CLK         => CLK,
         wb_aluout   => wb_aluout,
         wb_data_in  => wb_data_in,
         wb_dr       => wb_dr,
         wb_instr    => wb_instr,
         wb_mread    => wb_mread,
         wb_opcode   => wb_opcode,
         wb_pc       => wb_pc,
         wb_regwrite => wb_regwrite,
         wb_set_cc   => wb_set_cc,
         wb_src_a    => wb_src_a,
         wb_src_b    => wb_src_b,
         wb_cc       => wb_cc,
         wb_dest     => wb_dest,
         wb_din      => wb_din,
         wb_load_cc  => wb_load_cc,
         wb_rw       => wb_rw
      );

END struct;
