-- VHDL Entity ece411.Datapath.interface
--
-- Created:
--          by - one1.ews (gelib-057-06.ews.illinois.edu)
--          at - 14:45:28 03/29/12
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
--          by - one1.ews (gelib-057-06.ews.illinois.edu)
--          at - 14:45:28 03/29/12
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
   SIGNAL decode_control_out     : control_word;
   SIGNAL decode_data_in         : pipe_data;
   SIGNAL decode_data_out        : pipe_data;
   SIGNAL decode_instr           : STD_LOGIC_VECTOR(15 DOWNTO 0);
   SIGNAL decode_pc              : LC3b_word;
   SIGNAL exec_control           : control_word;
   SIGNAL exec_control_in        : exec_control_word;
   SIGNAL exec_data_in           : pipe_data;
   SIGNAL exec_data_out          : pipe_data;
   SIGNAL exec_forward_srca_sel  : LC3b_4mux_sel;
   SIGNAL exec_forward_srcb_sel  : LC3b_4mux_sel;
   SIGNAL exec_fw_src1_sel       : LC3b_4mux_sel;
   SIGNAL exec_fw_src2_sel       : LC3b_4mux_sel;
   SIGNAL exec_instr             : LC3b_word;
   SIGNAL exec_pc                : LC3b_word;
   SIGNAL exec_target_pc         : LC3b_word;
   SIGNAL fetch_data_out         : pipe_data;
   SIGNAL fetch_instr            : LC3b_word;
   SIGNAL fetch_ready            : std_logic;
   SIGNAL load_decode_exec_pipe  : STD_LOGIC;
   SIGNAL load_exec_mem_pipe     : STD_LOGIC;
   SIGNAL load_fetch_decode_pipe : STD_LOGIC;
   SIGNAL load_fwd_pipe          : std_logic;
   SIGNAL load_jump_pc           : std_logic;
   SIGNAL load_mem_wb_pipe       : std_logic;
   SIGNAL load_pc                : std_logic;
   SIGNAL mem_control            : control_word;
   SIGNAL mem_control_in         : mem_control_word;
   SIGNAL mem_data_in            : pipe_data;
   SIGNAL mem_data_out           : pipe_data;
   SIGNAL mem_foward_sel         : LC3B_4MUX_SEL;
   SIGNAL mem_fw_sel             : LC3b_4mux_sel;
   SIGNAL mem_instr              : LC3b_word;
   SIGNAL mem_pc                 : LC3b_word;
   SIGNAL mem_ready              : STD_LOGIC;
   SIGNAL pc                     : LC3b_word;
   SIGNAL stall_load_use         : std_logic;
   SIGNAL stall_load_use_buffer  : std_logic;
   SIGNAL wb_cc                  : LC3b_cc;
   SIGNAL wb_control             : control_word;
   SIGNAL wb_control_in          : wb_control_word;
   SIGNAL wb_data_in             : pipe_data;
   SIGNAL wb_dest                : LC3B_REG;
   SIGNAL wb_din                 : LC3B_WORD;
   SIGNAL wb_instr               : LC3b_word;
   SIGNAL wb_load_cc             : std_logic;
   SIGNAL wb_pc                  : LC3b_word;
   SIGNAL wb_rw                  : STD_LOGIC;


   -- Component Declarations
   COMPONENT StallUnit
   PORT (
      CLK                    : IN     std_logic ;
      fetch_ready            : IN     std_logic ;
      mem_ready              : IN     STD_LOGIC ;
      stall_load_use_buffer  : IN     std_logic ;
      load_decode_exec_pipe  : OUT    STD_LOGIC ;
      load_exec_mem_pipe     : OUT    STD_LOGIC ;
      load_fetch_decode_pipe : OUT    STD_LOGIC ;
      load_fwd_pipe          : OUT    std_logic ;
      load_mem_wb_pipe       : OUT    std_logic ;
      load_pc                : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT decodeStage
   PORT (
      CLK                : IN     std_logic ;
      RESET_L            : IN     STD_LOGIC ;
      decode_data_in     : IN     pipe_data ;
      decode_instr       : IN     STD_LOGIC_VECTOR (15 DOWNTO 0);
      decode_pc          : IN     LC3b_word ;
      wb_cc              : IN     LC3b_cc ;
      wb_dest            : IN     LC3B_REG ;
      wb_din             : IN     LC3B_WORD ;
      wb_load_cc         : IN     std_logic ;
      wb_rw              : IN     STD_LOGIC ;
      decode_control_out : OUT    control_word ;
      decode_data_out    : OUT    pipe_data 
   );
   END COMPONENT;
   COMPONENT decode_exec_pipe
   PORT (
      CLK                   : IN     std_logic ;
      RESET_L               : IN     STD_LOGIC ;
      decode_control_out    : IN     control_word ;
      decode_data_out       : IN     pipe_data ;
      decode_instr          : IN     STD_LOGIC_VECTOR (15 DOWNTO 0);
      decode_pc             : IN     LC3b_word ;
      load_decode_exec_pipe : IN     STD_LOGIC ;
      stall_load_use_buffer : IN     std_logic ;
      exec_control          : OUT    control_word ;
      exec_control_in       : OUT    exec_control_word ;
      exec_data_in          : OUT    pipe_data ;
      exec_instr            : OUT    LC3b_word ;
      exec_pc               : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT execStage
   PORT (
      CLK                   : IN     std_logic ;
      exec_control_in       : IN     exec_control_word ;
      exec_data_in          : IN     pipe_data ;
      exec_forward_srca_sel : IN     LC3b_4mux_sel ;
      exec_forward_srcb_sel : IN     LC3b_4mux_sel ;
      exec_instr            : IN     LC3b_word ;
      exec_pc               : IN     LC3b_word ;
      mem_data_in           : IN     pipe_data ;
      wb_data_in            : IN     pipe_data ;
      exec_data_out         : OUT    pipe_data ;
      exec_target_pc        : OUT    LC3b_word ;
      load_jump_pc          : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT exec_mem_pipe
   PORT (
      CLK                : IN     std_logic ;
      RESET_L            : IN     STD_LOGIC ;
      exec_control       : IN     control_word ;
      exec_data_out      : IN     pipe_data ;
      exec_instr         : IN     LC3b_word ;
      exec_pc            : IN     LC3b_word ;
      load_exec_mem_pipe : IN     STD_LOGIC ;
      mem_control        : OUT    control_word ;
      mem_control_in     : OUT    mem_control_word ;
      mem_data_in        : OUT    pipe_data ;
      mem_instr          : OUT    LC3b_word ;
      mem_pc             : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT fetchStage
   PORT (
      CLK            : IN     std_logic ;
      RESET_L        : IN     STD_LOGIC ;
      exec_target_pc : IN     LC3b_word ;
      instr_in       : IN     LC3B_WORD ;
      instr_resp_h   : IN     std_logic ;
      load_jump_pc   : IN     std_logic ;
      load_pc        : IN     std_logic ;
      fetch_data_out : OUT    pipe_data ;
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
      fetch_data_out         : IN     pipe_data ;
      fetch_instr            : IN     LC3b_word ;
      fetch_ready            : IN     std_logic ;
      load_fetch_decode_pipe : IN     STD_LOGIC ;
      pc                     : IN     LC3b_word ;
      decode_data_in         : OUT    pipe_data ;
      decode_instr           : OUT    STD_LOGIC_VECTOR (15 DOWNTO 0);
      decode_pc              : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT forward_pipe
   PORT (
      CLK                   : IN     std_logic ;
      RESET_L               : IN     STD_LOGIC ;
      exec_fw_src1_sel      : IN     LC3b_4mux_sel ;
      exec_fw_src2_sel      : IN     LC3b_4mux_sel ;
      load_fwd_pipe         : IN     std_logic ;
      mem_fw_sel            : IN     LC3b_4mux_sel ;
      stall_load_use_buffer : IN     std_logic ;
      exec_forward_srca_sel : OUT    LC3b_4mux_sel ;
      exec_forward_srcb_sel : OUT    LC3b_4mux_sel ;
      mem_foward_sel        : OUT    LC3B_4MUX_SEL ;
      stall_load_use        : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT forwardingUnit
   PORT (
      CLK                   : IN     std_logic ;
      decode_control_out    : IN     control_word ;
      decode_data_out       : IN     pipe_data ;
      exec_control          : IN     control_word ;
      exec_data_in          : IN     pipe_data ;
      mem_control           : IN     control_word ;
      mem_data_in           : IN     pipe_data ;
      stall_load_use        : IN     std_logic ;
      exec_fw_src1_sel      : OUT    LC3b_4mux_sel ;
      exec_fw_src2_sel      : OUT    LC3b_4mux_sel ;
      mem_fw_sel            : OUT    LC3b_4mux_sel ;
      stall_load_use_buffer : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT memStage
   PORT (
      CLK            : IN     std_logic ;
      DATAIN         : IN     LC3B_WORD ;
      data_resp_h    : IN     std_logic ;
      mem_control_in : IN     mem_control_word ;
      mem_data_in    : IN     pipe_data ;
      mem_foward_sel : IN     LC3B_4MUX_SEL ;
      wb_data_in     : IN     pipe_data ;
      Dataout        : OUT    LC3b_word ;
      data_addr      : OUT    LC3b_word ;
      data_mread_l   : OUT    std_logic ;
      data_mwriteh_l : OUT    std_logic ;
      data_mwritel_l : OUT    std_logic ;
      mem_data_out   : OUT    pipe_data ;
      mem_ready      : OUT    STD_LOGIC 
   );
   END COMPONENT;
   COMPONENT mem_wb_pipe
   PORT (
      CLK              : IN     std_logic ;
      RESET_L          : IN     STD_LOGIC ;
      load_mem_wb_pipe : IN     std_logic ;
      mem_control      : IN     control_word ;
      mem_data_out     : IN     pipe_data ;
      mem_instr        : IN     LC3b_word ;
      mem_pc           : IN     LC3b_word ;
      mem_ready        : IN     STD_LOGIC ;
      wb_control       : OUT    control_word ;
      wb_control_in    : OUT    wb_control_word ;
      wb_data_in       : OUT    pipe_data ;
      wb_instr         : OUT    LC3b_word ;
      wb_pc            : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT wbStage
   PORT (
      CLK           : IN     std_logic ;
      wb_control    : IN     control_word ;
      wb_control_in : IN     wb_control_word ;
      wb_data_in    : IN     pipe_data ;
      wb_instr      : IN     LC3b_word ;
      wb_pc         : IN     LC3b_word ;
      wb_cc         : OUT    LC3b_cc ;
      wb_dest       : OUT    LC3B_REG ;
      wb_din        : OUT    LC3B_WORD ;
      wb_load_cc    : OUT    std_logic ;
      wb_rw         : OUT    STD_LOGIC 
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
   FOR ALL : forward_pipe USE ENTITY ece411.forward_pipe;
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
         stall_load_use_buffer  => stall_load_use_buffer,
         load_decode_exec_pipe  => load_decode_exec_pipe,
         load_exec_mem_pipe     => load_exec_mem_pipe,
         load_fetch_decode_pipe => load_fetch_decode_pipe,
         load_fwd_pipe          => load_fwd_pipe,
         load_mem_wb_pipe       => load_mem_wb_pipe,
         load_pc                => load_pc
      );
   decode : decodeStage
      PORT MAP (
         CLK                => CLK,
         RESET_L            => RESET_L,
         decode_data_in     => decode_data_in,
         decode_instr       => decode_instr,
         decode_pc          => decode_pc,
         wb_cc              => wb_cc,
         wb_dest            => wb_dest,
         wb_din             => wb_din,
         wb_load_cc         => wb_load_cc,
         wb_rw              => wb_rw,
         decode_control_out => decode_control_out,
         decode_data_out    => decode_data_out
      );
   pipe2_de : decode_exec_pipe
      PORT MAP (
         CLK                   => CLK,
         RESET_L               => RESET_L,
         decode_control_out    => decode_control_out,
         decode_data_out       => decode_data_out,
         decode_instr          => decode_instr,
         decode_pc             => decode_pc,
         load_decode_exec_pipe => load_decode_exec_pipe,
         stall_load_use_buffer => stall_load_use_buffer,
         exec_control          => exec_control,
         exec_control_in       => exec_control_in,
         exec_data_in          => exec_data_in,
         exec_instr            => exec_instr,
         exec_pc               => exec_pc
      );
   exec : execStage
      PORT MAP (
         CLK                   => CLK,
         exec_control_in       => exec_control_in,
         exec_data_in          => exec_data_in,
         exec_forward_srca_sel => exec_forward_srca_sel,
         exec_forward_srcb_sel => exec_forward_srcb_sel,
         exec_instr            => exec_instr,
         exec_pc               => exec_pc,
         mem_data_in           => mem_data_in,
         wb_data_in            => wb_data_in,
         exec_data_out         => exec_data_out,
         exec_target_pc        => exec_target_pc,
         load_jump_pc          => load_jump_pc
      );
   pipe3_em : exec_mem_pipe
      PORT MAP (
         CLK                => CLK,
         RESET_L            => RESET_L,
         exec_control       => exec_control,
         exec_data_out      => exec_data_out,
         exec_instr         => exec_instr,
         exec_pc            => exec_pc,
         load_exec_mem_pipe => load_exec_mem_pipe,
         mem_control        => mem_control,
         mem_control_in     => mem_control_in,
         mem_data_in        => mem_data_in,
         mem_instr          => mem_instr,
         mem_pc             => mem_pc
      );
   fetch : fetchStage
      PORT MAP (
         CLK            => CLK,
         RESET_L        => RESET_L,
         exec_target_pc => exec_target_pc,
         instr_in       => instr_in,
         instr_resp_h   => instr_resp_h,
         load_jump_pc   => load_jump_pc,
         load_pc        => load_pc,
         fetch_data_out => fetch_data_out,
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
         fetch_data_out         => fetch_data_out,
         fetch_instr            => fetch_instr,
         fetch_ready            => fetch_ready,
         load_fetch_decode_pipe => load_fetch_decode_pipe,
         pc                     => pc,
         decode_data_in         => decode_data_in,
         decode_instr           => decode_instr,
         decode_pc              => decode_pc
      );
   aForwardPipe : forward_pipe
      PORT MAP (
         CLK                   => CLK,
         RESET_L               => RESET_L,
         exec_fw_src1_sel      => exec_fw_src1_sel,
         exec_fw_src2_sel      => exec_fw_src2_sel,
         load_fwd_pipe         => load_fwd_pipe,
         mem_fw_sel            => mem_fw_sel,
         stall_load_use_buffer => stall_load_use_buffer,
         exec_forward_srca_sel => exec_forward_srca_sel,
         exec_forward_srcb_sel => exec_forward_srcb_sel,
         mem_foward_sel        => mem_foward_sel,
         stall_load_use        => stall_load_use
      );
   aForwardingUnit : forwardingUnit
      PORT MAP (
         CLK                   => CLK,
         decode_control_out    => decode_control_out,
         decode_data_out       => decode_data_out,
         exec_control          => exec_control,
         exec_data_in          => exec_data_in,
         mem_control           => mem_control,
         mem_data_in           => mem_data_in,
         stall_load_use        => stall_load_use,
         exec_fw_src1_sel      => exec_fw_src1_sel,
         exec_fw_src2_sel      => exec_fw_src2_sel,
         mem_fw_sel            => mem_fw_sel,
         stall_load_use_buffer => stall_load_use_buffer
      );
   mem : memStage
      PORT MAP (
         CLK            => CLK,
         DATAIN         => DATAIN,
         data_resp_h    => data_resp_h,
         mem_control_in => mem_control_in,
         mem_data_in    => mem_data_in,
         mem_foward_sel => mem_foward_sel,
         wb_data_in     => wb_data_in,
         Dataout        => Dataout,
         data_addr      => data_addr,
         data_mread_l   => data_mread_l,
         data_mwriteh_l => data_mwriteh_l,
         data_mwritel_l => data_mwritel_l,
         mem_data_out   => mem_data_out,
         mem_ready      => mem_ready
      );
   pipe4_mw : mem_wb_pipe
      PORT MAP (
         CLK              => CLK,
         RESET_L          => RESET_L,
         load_mem_wb_pipe => load_mem_wb_pipe,
         mem_control      => mem_control,
         mem_data_out     => mem_data_out,
         mem_instr        => mem_instr,
         mem_pc           => mem_pc,
         mem_ready        => mem_ready,
         wb_control       => wb_control,
         wb_control_in    => wb_control_in,
         wb_data_in       => wb_data_in,
         wb_instr         => wb_instr,
         wb_pc            => wb_pc
      );
   wb : wbStage
      PORT MAP (
         CLK           => CLK,
         wb_control    => wb_control,
         wb_control_in => wb_control_in,
         wb_data_in    => wb_data_in,
         wb_instr      => wb_instr,
         wb_pc         => wb_pc,
         wb_cc         => wb_cc,
         wb_dest       => wb_dest,
         wb_din        => wb_din,
         wb_load_cc    => wb_load_cc,
         wb_rw         => wb_rw
      );

END struct;
