-- VHDL Entity ece411.Datapath.interface
--
-- Created:
--          by - wheele11.ews (gelib-057-07.ews.illinois.edu)
--          at - 19:19:00 03/08/12
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
      DATAIN          : IN     std_logic;
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
      instr_out       : OUT    std_logic
   );

-- Declarations

END Datapath ;

--
-- VHDL Architecture ece411.Datapath.struct
--
-- Created:
--          by - wheele11.ews (gelib-057-07.ews.illinois.edu)
--          at - 19:19:00 03/08/12
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
   SIGNAL ALUOP           : LC3B_ALUOP;
   SIGNAL ALUout          : LC3B_WORD;
   SIGNAL decode_instr    : LC3b_word;
   SIGNAL decode_opcode   : LC3b_opcode;
   SIGNAL decode_pc       : LC3b_word;
   SIGNAL decode_ready    : std_logic;
   SIGNAL decode_regwrite : std_logic;
   SIGNAL decode_src_a    : LC3b_word;
   SIGNAL decode_src_b    : LC3b_word;
   SIGNAL exec_instr      : LC3b_word;
   SIGNAL exec_opcode     : LC3b_opcode;
   SIGNAL exec_pc         : LC3b_word;
   SIGNAL exec_regwrite   : STD_LOGIC;
   SIGNAL exec_src_a      : LC3b_word;
   SIGNAL exec_src_b      : LC3b_word;
   SIGNAL fetch_instr     : LC3b_word;
   SIGNAL fetch_ready     : std_logic;
   SIGNAL jump_pc         : LC3B_WORD;
   SIGNAL load_jump_pc    : STD_LOGIC := '0';
   SIGNAL mem_controlword : LC3b_word;
   SIGNAL mem_opcode      : LC3b_word;
   SIGNAL mem_pc          : LC3b_word;
   SIGNAL pc              : LC3b_word;
   SIGNAL wb_dest         : LC3B_REG;
   SIGNAL wb_din          : LC3B_WORD;
   SIGNAL wb_regwrite     : STD_LOGIC;


   -- Component Declarations
   COMPONENT decodeStage
   PORT (
      CLK             : IN     std_logic ;
      RESET_L         : IN     STD_LOGIC ;
      decode_instr    : IN     LC3b_word ;
      decode_pc       : IN     LC3b_word ;
      wb_dest         : IN     LC3B_REG ;
      wb_din          : IN     LC3B_WORD ;
      wb_regwrite     : IN     STD_LOGIC ;
      decode_opcode   : OUT    LC3b_opcode ;
      decode_ready    : OUT    std_logic ;
      decode_regwrite : OUT    std_logic ;
      decode_src_a    : OUT    LC3b_word ;
      decode_src_b    : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT decode_exec_pipe
   PORT (
      CLK             : IN     std_logic ;
      RESET_L         : IN     STD_LOGIC ;
      decode_instr    : IN     LC3b_word ;
      decode_opcode   : IN     LC3b_opcode ;
      decode_pc       : IN     LC3b_word ;
      decode_ready    : IN     std_logic ;
      decode_regwrite : IN     std_logic ;
      decode_src_a    : IN     LC3b_word ;
      decode_src_b    : IN     LC3b_word ;
      exec_instr      : OUT    LC3b_word ;
      exec_opcode     : OUT    LC3b_opcode ;
      exec_pc         : OUT    LC3b_word ;
      exec_regwrite   : OUT    STD_LOGIC ;
      exec_src_a      : OUT    LC3b_word ;
      exec_src_b      : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT execStage
   PORT (
      ALUOP         : IN     LC3B_ALUOP ;
      CLK           : IN     std_logic ;
      exec_instr    : IN     LC3b_word ;
      exec_opcode   : IN     LC3b_opcode ;
      exec_pc       : IN     LC3b_word ;
      exec_regwrite : IN     STD_LOGIC ;
      exec_src_a    : IN     LC3b_word ;
      exec_src_b    : IN     LC3b_word ;
      ALUout        : OUT    LC3B_WORD 
   );
   END COMPONENT;
   COMPONENT exec_mem_pipe
   PORT (
      CLK             : IN     std_logic ;
      RESET_L         : IN     STD_LOGIC ;
      exec_instr      : IN     LC3b_word ;
      exec_opcode     : IN     LC3b_opcode ;
      exec_pc         : IN     LC3b_word ;
      exec_regwrite   : IN     STD_LOGIC ;
      exec_src_a      : IN     LC3b_word ;
      exec_src_b      : IN     LC3b_word ;
      jump_pc         : OUT    LC3B_WORD ;
      load_jump_pc    : OUT    STD_LOGIC ;
      mem_controlword : OUT    LC3b_word ;
      mem_opcode      : OUT    LC3b_word ;
      mem_pc          : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT fetchStage
   PORT (
      CLK           : IN     std_logic ;
      RESET_L       : IN     STD_LOGIC ;
      instr_in      : IN     LC3B_WORD ;
      instr_resp_h  : IN     std_logic ;
      fetch_instr   : OUT    LC3b_word ;
      fetch_ready   : OUT    std_logic ;
      instr_addr    : OUT    LC3b_word ;
      instr_mread_l : OUT    std_logic ;
      pc            : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT fetch_decode_pipe
   PORT (
      CLK          : IN     std_logic ;
      RESET_L      : IN     STD_LOGIC ;
      fetch_instr  : IN     LC3b_word ;
      fetch_ready  : IN     std_logic ;
      pc           : IN     LC3b_word ;
      decode_instr : OUT    LC3b_word ;
      decode_pc    : OUT    LC3b_word 
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
      DATAIN         : IN     std_logic ;
      data_resp_h    : IN     std_logic ;
      Dataout        : OUT    LC3b_word ;
      data_addr      : OUT    LC3b_word ;
      data_mread_l   : OUT    std_logic ;
      data_mwriteh_l : OUT    std_logic ;
      data_mwritel_l : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT mem_wb_pipe
   PORT (
      CLK             : IN     std_logic ;
      RESET_L         : IN     STD_LOGIC ;
      mem_controlword : IN     LC3b_word ;
      mem_opcode      : IN     LC3b_word ;
      mem_pc          : IN     LC3b_word 
   );
   END COMPONENT;
   COMPONENT wbStage
   PORT (
      CLK         : IN     std_logic ;
      wb_dest     : OUT    LC3B_REG ;
      wb_din      : OUT    LC3B_WORD ;
      wb_regwrite : OUT    STD_LOGIC 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
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

   -- Instance port mappings.
   decode : decodeStage
      PORT MAP (
         CLK             => CLK,
         RESET_L         => RESET_L,
         decode_instr    => decode_instr,
         decode_pc       => decode_pc,
         wb_dest         => wb_dest,
         wb_din          => wb_din,
         wb_regwrite     => wb_regwrite,
         decode_opcode   => decode_opcode,
         decode_ready    => decode_ready,
         decode_regwrite => decode_regwrite,
         decode_src_a    => decode_src_a,
         decode_src_b    => decode_src_b
      );
   pipe2_de : decode_exec_pipe
      PORT MAP (
         CLK             => CLK,
         RESET_L         => RESET_L,
         decode_instr    => decode_instr,
         decode_opcode   => decode_opcode,
         decode_pc       => decode_pc,
         decode_ready    => decode_ready,
         decode_regwrite => decode_regwrite,
         decode_src_a    => decode_src_a,
         decode_src_b    => decode_src_b,
         exec_instr      => exec_instr,
         exec_opcode     => exec_opcode,
         exec_pc         => exec_pc,
         exec_regwrite   => exec_regwrite,
         exec_src_a      => exec_src_a,
         exec_src_b      => exec_src_b
      );
   exec : execStage
      PORT MAP (
         ALUOP         => ALUOP,
         CLK           => CLK,
         exec_instr    => exec_instr,
         exec_opcode   => exec_opcode,
         exec_pc       => exec_pc,
         exec_regwrite => exec_regwrite,
         exec_src_a    => exec_src_a,
         exec_src_b    => exec_src_b,
         ALUout        => ALUout
      );
   pipe3_em : exec_mem_pipe
      PORT MAP (
         CLK             => CLK,
         RESET_L         => RESET_L,
         exec_instr      => exec_instr,
         exec_opcode     => exec_opcode,
         exec_pc         => exec_pc,
         exec_regwrite   => exec_regwrite,
         exec_src_a      => exec_src_a,
         exec_src_b      => exec_src_b,
         jump_pc         => jump_pc,
         load_jump_pc    => load_jump_pc,
         mem_controlword => mem_controlword,
         mem_opcode      => mem_opcode,
         mem_pc          => mem_pc
      );
   fetch : fetchStage
      PORT MAP (
         CLK           => CLK,
         RESET_L       => RESET_L,
         instr_in      => instr_in,
         instr_resp_h  => instr_resp_h,
         fetch_instr   => fetch_instr,
         fetch_ready   => fetch_ready,
         instr_addr    => instr_addr,
         instr_mread_l => instr_mread_l,
         pc            => pc
      );
   pipe1_fd : fetch_decode_pipe
      PORT MAP (
         CLK          => CLK,
         RESET_L      => RESET_L,
         fetch_instr  => fetch_instr,
         fetch_ready  => fetch_ready,
         pc           => pc,
         decode_instr => decode_instr,
         decode_pc    => decode_pc
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
         Dataout        => Dataout,
         data_addr      => data_addr,
         data_mread_l   => data_mread_l,
         data_mwriteh_l => data_mwriteh_l,
         data_mwritel_l => data_mwritel_l
      );
   pipe4_mw : mem_wb_pipe
      PORT MAP (
         CLK             => CLK,
         RESET_L         => RESET_L,
         mem_controlword => mem_controlword,
         mem_opcode      => mem_opcode,
         mem_pc          => mem_pc
      );
   wb : wbStage
      PORT MAP (
         CLK         => CLK,
         wb_dest     => wb_dest,
         wb_din      => wb_din,
         wb_regwrite => wb_regwrite
      );

END struct;
