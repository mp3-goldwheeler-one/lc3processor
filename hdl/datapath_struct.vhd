-- VHDL Entity ece411.Datapath.interface
--
-- Created:
--          by - goldste6.ews (linux6.ews.illinois.edu)
--          at - 21:42:39 04/13/12
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
--          by - goldste6.ews (linux6.ews.illinois.edu)
--          at - 21:42:40 04/13/12
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
   SIGNAL decode_flush           : std_logic;
   SIGNAL decode_insert_bubble   : std_logic;
   SIGNAL decode_load_pc         : std_logic;
   SIGNAL decode_pc              : lc3b_word;
   SIGNAL decode_target_pc       : lc3b_word;
   SIGNAL decode_uop_control_out : control_word;
   SIGNAL decode_uop_data_out    : pipe_data;
   SIGNAL exec_control           : control_word;
   SIGNAL exec_control_in        : exec_control_word;
   SIGNAL exec_data_in           : pipe_data;
   SIGNAL exec_data_out          : pipe_data;
   SIGNAL exec_flush             : std_logic;
   SIGNAL exec_forward_cc_sel    : LC3b_4mux_sel;
   SIGNAL exec_forward_srca_sel  : LC3b_4mux_sel;
   SIGNAL exec_forward_srcb_sel  : LC3b_4mux_sel;
   SIGNAL exec_fw_cc_sel         : LC3b_4mux_sel;
   SIGNAL exec_fw_src1_sel       : LC3b_4mux_sel;
   SIGNAL exec_fw_src2_sel       : LC3b_4mux_sel;
   SIGNAL exec_insert_bubble     : std_logic;
   SIGNAL exec_load_pc           : std_logic;
   SIGNAL exec_pc                : lc3b_word;
   SIGNAL exec_target_pc         : LC3b_word;
   SIGNAL fetch_data_out         : pipe_data;
   SIGNAL fetch_ready            : std_logic;
   SIGNAL load_decode_exec_pipe  : STD_LOGIC;
   SIGNAL load_exec_mem_pipe     : STD_LOGIC;
   SIGNAL load_fetch_decode_pipe : STD_LOGIC;
   SIGNAL load_fwd_pipe          : std_logic;
   SIGNAL load_mem_wb_pipe       : std_logic;
   SIGNAL load_pc                : std_logic;
   SIGNAL load_uarch_pipe        : std_logic;
   SIGNAL mem_cc                 : lc3b_cc;
   SIGNAL mem_control            : control_word;
   SIGNAL mem_control_in         : mem_control_word;
   SIGNAL mem_data_in            : pipe_data;
   SIGNAL mem_data_out           : pipe_data;
   SIGNAL mem_flush              : std_logic;
   SIGNAL mem_forward_addr_sel   : STD_LOGIC;
   SIGNAL mem_foward_sel         : LC3B_4MUX_SEL;
   SIGNAL mem_fw_addr_sel        : std_logic;
   SIGNAL mem_fw_sel             : LC3b_4mux_sel;
   SIGNAL mem_insert_bubble      : std_logic;
   SIGNAL mem_load_pc            : STD_LOGIC;
   SIGNAL mem_pc                 : lc3b_word;
   SIGNAL mem_ready              : STD_LOGIC;
   SIGNAL mem_target_pc          : lc3b_word;
   SIGNAL stall_load_use         : std_logic;
   SIGNAL stall_load_use_buffer  : std_logic;
   SIGNAL target_pc_mux_sel      : LC3B_4mux_sel;
   SIGNAL uarch_control_in       : control_word;
   SIGNAL uarch_control_out      : control_word;
   SIGNAL uarch_data_in          : pipe_data;
   SIGNAL uarch_data_out         : pipe_data;
   SIGNAL uarch_flush            : std_logic;
   SIGNAL uarch_insert_bubble    : std_logic;
   SIGNAL uarch_sel_in           : STD_LOGIC;
   SIGNAL uarch_sel_out          : STD_LOGIC;
   SIGNAL uarch_stall_in         : std_logic;
   SIGNAL uarch_stall_in_buffer  : std_logic;
   SIGNAL uop_instr_dr           : LC3b_reg;
   SIGNAL uop_sr2                : LC3b_reg;
   SIGNAL uop_sr2_val            : lc3b_word;
   SIGNAL wb_cc                  : LC3b_cc;
   SIGNAL wb_control_in          : wb_control_word;
   SIGNAL wb_data_in             : pipe_data;
   SIGNAL wb_dest                : LC3B_REG;
   SIGNAL wb_din                 : LC3B_WORD;
   SIGNAL wb_load_cc             : std_logic;
   SIGNAL wb_rw                  : STD_LOGIC;

   -- Implicit buffer signal declarations
   SIGNAL data_addr_internal  : LC3b_word;
   SIGNAL instr_addr_internal : LC3b_word;


   -- Component Declarations
   COMPONENT StallUnit
   PORT (
      CLK                    : IN     std_logic ;
      fetch_ready            : IN     std_logic ;
      mem_ready              : IN     STD_LOGIC ;
      stall_load_use_buffer  : IN     std_logic ;
      uarch_stall_in_buffer  : IN     std_logic ;
      load_decode_exec_pipe  : OUT    STD_LOGIC ;
      load_exec_mem_pipe     : OUT    STD_LOGIC ;
      load_fetch_decode_pipe : OUT    STD_LOGIC ;
      load_fwd_pipe          : OUT    std_logic ;
      load_mem_wb_pipe       : OUT    std_logic ;
      load_pc                : OUT    std_logic ;
      load_uarch_pipe        : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT bubbleUnit
   PORT (
      CLK                   : IN     std_logic ;
      decode_flush          : IN     std_logic ;
      exec_flush            : IN     std_logic ;
      mem_flush             : IN     std_logic ;
      stall_load_use_buffer : IN     std_logic ;
      uarch_flush           : IN     std_logic ;
      decode_insert_bubble  : OUT    std_logic ;
      exec_insert_bubble    : OUT    std_logic ;
      mem_insert_bubble     : OUT    std_logic ;
      uarch_insert_bubble   : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT decodeStage
   PORT (
      CLK                : IN     std_logic ;
      RESET_L            : IN     STD_LOGIC ;
      decode_data_in     : IN     pipe_data ;
      wb_cc              : IN     LC3b_cc ;
      wb_dest            : IN     LC3B_REG ;
      wb_din             : IN     LC3B_WORD ;
      wb_load_cc         : IN     std_logic ;
      wb_rw              : IN     STD_LOGIC ;
      decode_control_out : OUT    control_word ;
      decode_data_out    : OUT    pipe_data ;
      decode_load_pc     : OUT    std_logic ;
      decode_pc          : OUT    lc3b_word ;
      decode_target_pc   : OUT    lc3b_word ;
      uop_instr_dr       : OUT    LC3b_reg ;
      uop_sr2            : OUT    LC3b_reg ;
      uop_sr2_val        : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT decode_exec_pipe
   PORT (
      CLK                    : IN     std_logic ;
      RESET_L                : IN     STD_LOGIC ;
      decode_uop_control_out : IN     control_word ;
      decode_uop_data_out    : IN     pipe_data ;
      exec_insert_bubble     : IN     std_logic ;
      load_decode_exec_pipe  : IN     STD_LOGIC ;
      exec_control           : OUT    control_word ;
      exec_control_in        : OUT    exec_control_word ;
      exec_data_in           : OUT    pipe_data 
   );
   END COMPONENT;
   COMPONENT execStage
   PORT (
      CLK                   : IN     std_logic ;
      exec_control_in       : IN     exec_control_word ;
      exec_data_in          : IN     pipe_data ;
      exec_forward_cc_sel   : IN     LC3b_4mux_sel ;
      exec_forward_srca_sel : IN     LC3b_4mux_sel ;
      exec_forward_srcb_sel : IN     LC3b_4mux_sel ;
      mem_cc                : IN     lc3b_cc ;
      mem_data_in           : IN     pipe_data ;
      wb_data_in            : IN     pipe_data ;
      exec_data_out         : OUT    pipe_data ;
      exec_load_pc          : OUT    std_logic ;
      exec_pc               : OUT    lc3b_word ;
      exec_target_pc        : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT exec_mem_pipe
   PORT (
      CLK                : IN     std_logic ;
      RESET_L            : IN     STD_LOGIC ;
      exec_control       : IN     control_word ;
      exec_data_out      : IN     pipe_data ;
      load_exec_mem_pipe : IN     STD_LOGIC ;
      mem_insert_bubble  : IN     std_logic ;
      mem_control        : OUT    control_word ;
      mem_control_in     : OUT    mem_control_word ;
      mem_data_in        : OUT    pipe_data ;
      wb_control_in      : OUT    wb_control_word 
   );
   END COMPONENT;
   COMPONENT fetchStage
   PORT (
      CLK                  : IN     std_logic ;
      RESET_L              : IN     STD_LOGIC ;
      decode_insert_bubble : IN     std_logic ;
      decode_load_pc       : IN     std_logic ;
      decode_pc            : IN     lc3b_word ;
      decode_target_pc     : IN     lc3b_word ;
      exec_load_pc         : IN     std_logic ;
      exec_pc              : IN     lc3b_word ;
      exec_target_pc       : IN     LC3b_word ;
      instr_in             : IN     LC3B_WORD ;
      instr_resp_h         : IN     std_logic ;
      load_pc              : IN     std_logic ;
      mem_load_pc          : IN     STD_LOGIC ;
      mem_pc               : IN     lc3b_word ;
      mem_target_pc        : IN     lc3b_word ;
      target_pc_mux_sel    : IN     LC3B_4mux_sel ;
      wb_cc                : IN     LC3b_cc ;
      fetch_data_out       : OUT    pipe_data ;
      fetch_ready          : OUT    std_logic ;
      instr_addr           : OUT    LC3b_word ;
      instr_mread_l        : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT fetch_decode_pipe
   PORT (
      CLK                    : IN     std_logic ;
      RESET_L                : IN     STD_LOGIC ;
      fetch_data_out         : IN     pipe_data ;
      fetch_ready            : IN     std_logic ;
      load_fetch_decode_pipe : IN     STD_LOGIC ;
      decode_data_in         : OUT    pipe_data 
   );
   END COMPONENT;
   COMPONENT flushUnit
   PORT (
      CLK               : IN     std_logic ;
      decode_load_pc    : IN     std_logic ;
      decode_pc         : IN     lc3b_word ;
      decode_target_pc  : IN     lc3b_word ;
      exec_load_pc      : IN     std_logic ;
      exec_pc           : IN     lc3b_word ;
      exec_target_pc    : IN     LC3b_word ;
      instr_addr        : IN     LC3b_word ;
      mem_load_pc       : IN     STD_LOGIC ;
      mem_pc            : IN     lc3b_word ;
      mem_target_pc     : IN     lc3b_word ;
      wb_cc             : IN     LC3b_cc ;
      decode_flush      : OUT    std_logic ;
      exec_flush        : OUT    std_logic ;
      mem_flush         : OUT    std_logic ;
      target_pc_mux_sel : OUT    LC3B_4mux_sel ;
      uarch_flush       : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT forward_pipe
   PORT (
      CLK                   : IN     std_logic ;
      RESET_L               : IN     STD_LOGIC ;
      exec_fw_cc_sel        : IN     LC3b_4mux_sel ;
      exec_fw_src1_sel      : IN     LC3b_4mux_sel ;
      exec_fw_src2_sel      : IN     LC3b_4mux_sel ;
      load_fwd_pipe         : IN     std_logic ;
      mem_fw_addr_sel       : IN     std_logic ;
      mem_fw_sel            : IN     LC3b_4mux_sel ;
      stall_load_use_buffer : IN     std_logic ;
      exec_forward_cc_sel   : OUT    LC3b_4mux_sel ;
      exec_forward_srca_sel : OUT    LC3b_4mux_sel ;
      exec_forward_srcb_sel : OUT    LC3b_4mux_sel ;
      mem_forward_addr_sel  : OUT    STD_LOGIC ;
      mem_foward_sel        : OUT    LC3B_4MUX_SEL ;
      stall_load_use        : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT forwardingUnit
   PORT (
      CLK                    : IN     std_logic ;
      decode_uop_control_out : IN     control_word ;
      decode_uop_data_out    : IN     pipe_data ;
      exec_control           : IN     control_word ;
      exec_data_in           : IN     pipe_data ;
      mem_control            : IN     control_word ;
      mem_data_in            : IN     pipe_data ;
      stall_load_use         : IN     std_logic ;
      exec_fw_cc_sel         : OUT    LC3b_4mux_sel ;
      exec_fw_src1_sel       : OUT    LC3b_4mux_sel ;
      exec_fw_src2_sel       : OUT    LC3b_4mux_sel ;
      mem_fw_addr_sel        : OUT    std_logic ;
      mem_fw_sel             : OUT    LC3b_4mux_sel ;
      stall_load_use_buffer  : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT memStage
   PORT (
      CLK                  : IN     std_logic ;
      DATAIN               : IN     LC3B_WORD ;
      data_resp_h          : IN     std_logic ;
      mem_control_in       : IN     mem_control_word ;
      mem_data_in          : IN     pipe_data ;
      mem_forward_addr_sel : IN     STD_LOGIC ;
      mem_foward_sel       : IN     LC3B_4MUX_SEL ;
      wb_control_in        : IN     wb_control_word ;
      wb_data_in           : IN     pipe_data ;
      Dataout              : OUT    LC3b_word ;
      data_mread_l         : OUT    std_logic ;
      data_mwriteh_l       : OUT    std_logic ;
      data_mwritel_l       : OUT    std_logic ;
      mem_cc               : OUT    lc3b_cc ;
      mem_data_out         : OUT    pipe_data ;
      mem_load_pc          : OUT    STD_LOGIC ;
      mem_pc               : OUT    lc3b_word ;
      mem_ready            : OUT    STD_LOGIC ;
      mem_target_pc        : OUT    lc3b_word ;
      wb_cc                : OUT    LC3b_cc ;
      wb_dest              : OUT    LC3B_REG ;
      wb_din               : OUT    LC3B_WORD ;
      wb_load_cc           : OUT    std_logic ;
      wb_rw                : OUT    STD_LOGIC ;
      data_addr            : BUFFER LC3b_word 
   );
   END COMPONENT;
   COMPONENT mem_wb_pipe
   PORT (
      CLK              : IN     std_logic ;
      RESET_L          : IN     STD_LOGIC ;
      load_mem_wb_pipe : IN     std_logic ;
      mem_control      : IN     control_word ;
      mem_data_out     : IN     pipe_data ;
      mem_ready        : IN     STD_LOGIC ;
      wb_data_in       : OUT    pipe_data 
   );
   END COMPONENT;
   COMPONENT uarch
   PORT (
      CLK                   : IN     std_logic ;
      decode_control_out    : IN     control_word ;
      decode_data_out       : IN     pipe_data ;
      uarch_stall_in        : IN     std_logic ;
      uop_instr_dr          : IN     LC3b_reg ;
      uop_sr2               : IN     LC3b_reg ;
      uop_sr2_val           : IN     lc3b_word ;
      uarch_control_out     : OUT    control_word ;
      uarch_data_out        : OUT    pipe_data ;
      uarch_sel_out         : OUT    STD_LOGIC ;
      uarch_stall_in_buffer : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT uarch_pipe
   PORT (
      CLK                   : IN     std_logic ;
      RESET_L               : IN     STD_LOGIC ;
      load_uarch_pipe       : IN     std_logic ;
      uarch_control_out     : IN     control_word ;
      uarch_data_out        : IN     pipe_data ;
      uarch_insert_bubble   : IN     std_logic ;
      uarch_sel_out         : IN     STD_LOGIC ;
      uarch_stall_in_buffer : IN     std_logic ;
      uarch_control_in      : OUT    control_word ;
      uarch_data_in         : OUT    pipe_data ;
      uarch_sel_in          : OUT    STD_LOGIC ;
      uarch_stall_in        : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT uop_mux
   PORT (
      CLK                    : IN     std_logic ;
      decode_control_out     : IN     control_word ;
      decode_data_out        : IN     pipe_data ;
      uarch_control_in       : IN     control_word ;
      uarch_data_in          : IN     pipe_data ;
      uarch_sel_in           : IN     STD_LOGIC ;
      decode_uop_control_out : OUT    control_word ;
      decode_uop_data_out    : OUT    pipe_data 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : StallUnit USE ENTITY ece411.StallUnit;
   FOR ALL : bubbleUnit USE ENTITY ece411.bubbleUnit;
   FOR ALL : decodeStage USE ENTITY ece411.decodeStage;
   FOR ALL : decode_exec_pipe USE ENTITY ece411.decode_exec_pipe;
   FOR ALL : execStage USE ENTITY ece411.execStage;
   FOR ALL : exec_mem_pipe USE ENTITY ece411.exec_mem_pipe;
   FOR ALL : fetchStage USE ENTITY ece411.fetchStage;
   FOR ALL : fetch_decode_pipe USE ENTITY ece411.fetch_decode_pipe;
   FOR ALL : flushUnit USE ENTITY ece411.flushUnit;
   FOR ALL : forward_pipe USE ENTITY ece411.forward_pipe;
   FOR ALL : forwardingUnit USE ENTITY ece411.forwardingUnit;
   FOR ALL : memStage USE ENTITY ece411.memStage;
   FOR ALL : mem_wb_pipe USE ENTITY ece411.mem_wb_pipe;
   FOR ALL : uarch USE ENTITY ece411.uarch;
   FOR ALL : uarch_pipe USE ENTITY ece411.uarch_pipe;
   FOR ALL : uop_mux USE ENTITY ece411.uop_mux;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   -- deal with instruction write
   instr_mwriteh_l <= '1';
   instr_mwritel_l <= '1';
   instr_out <= "XXXXXXXXXXXXXXXX";                                   


   -- Instance port mappings.
   aStall : StallUnit
      PORT MAP (
         CLK                    => CLK,
         fetch_ready            => fetch_ready,
         mem_ready              => mem_ready,
         stall_load_use_buffer  => stall_load_use_buffer,
         uarch_stall_in_buffer  => uarch_stall_in_buffer,
         load_decode_exec_pipe  => load_decode_exec_pipe,
         load_exec_mem_pipe     => load_exec_mem_pipe,
         load_fetch_decode_pipe => load_fetch_decode_pipe,
         load_fwd_pipe          => load_fwd_pipe,
         load_mem_wb_pipe       => load_mem_wb_pipe,
         load_pc                => load_pc,
         load_uarch_pipe        => load_uarch_pipe
      );
   bubbleBath : bubbleUnit
      PORT MAP (
         CLK                   => CLK,
         decode_flush          => decode_flush,
         exec_flush            => exec_flush,
         mem_flush             => mem_flush,
         stall_load_use_buffer => stall_load_use_buffer,
         uarch_flush           => uarch_flush,
         decode_insert_bubble  => decode_insert_bubble,
         exec_insert_bubble    => exec_insert_bubble,
         mem_insert_bubble     => mem_insert_bubble,
         uarch_insert_bubble   => uarch_insert_bubble
      );
   decode : decodeStage
      PORT MAP (
         CLK                => CLK,
         RESET_L            => RESET_L,
         decode_data_in     => decode_data_in,
         wb_cc              => wb_cc,
         wb_dest            => wb_dest,
         wb_din             => wb_din,
         wb_load_cc         => wb_load_cc,
         wb_rw              => wb_rw,
         decode_control_out => decode_control_out,
         decode_data_out    => decode_data_out,
         decode_load_pc     => decode_load_pc,
         decode_pc          => decode_pc,
         decode_target_pc   => decode_target_pc,
         uop_instr_dr       => uop_instr_dr,
         uop_sr2            => uop_sr2,
         uop_sr2_val        => uop_sr2_val
      );
   pipe2_de : decode_exec_pipe
      PORT MAP (
         CLK                    => CLK,
         RESET_L                => RESET_L,
         decode_uop_control_out => decode_uop_control_out,
         decode_uop_data_out    => decode_uop_data_out,
         exec_insert_bubble     => exec_insert_bubble,
         load_decode_exec_pipe  => load_decode_exec_pipe,
         exec_control           => exec_control,
         exec_control_in        => exec_control_in,
         exec_data_in           => exec_data_in
      );
   exec : execStage
      PORT MAP (
         CLK                   => CLK,
         exec_control_in       => exec_control_in,
         exec_data_in          => exec_data_in,
         exec_forward_cc_sel   => exec_forward_cc_sel,
         exec_forward_srca_sel => exec_forward_srca_sel,
         exec_forward_srcb_sel => exec_forward_srcb_sel,
         mem_cc                => mem_cc,
         mem_data_in           => mem_data_in,
         wb_data_in            => wb_data_in,
         exec_data_out         => exec_data_out,
         exec_load_pc          => exec_load_pc,
         exec_pc               => exec_pc,
         exec_target_pc        => exec_target_pc
      );
   pipe3_em : exec_mem_pipe
      PORT MAP (
         CLK                => CLK,
         RESET_L            => RESET_L,
         exec_control       => exec_control,
         exec_data_out      => exec_data_out,
         load_exec_mem_pipe => load_exec_mem_pipe,
         mem_insert_bubble  => mem_insert_bubble,
         mem_control        => mem_control,
         mem_control_in     => mem_control_in,
         mem_data_in        => mem_data_in,
         wb_control_in      => wb_control_in
      );
   fetch : fetchStage
      PORT MAP (
         CLK                  => CLK,
         RESET_L              => RESET_L,
         decode_insert_bubble => decode_insert_bubble,
         decode_load_pc       => decode_load_pc,
         decode_pc            => decode_pc,
         decode_target_pc     => decode_target_pc,
         exec_load_pc         => exec_load_pc,
         exec_pc              => exec_pc,
         exec_target_pc       => exec_target_pc,
         instr_in             => instr_in,
         instr_resp_h         => instr_resp_h,
         load_pc              => load_pc,
         mem_load_pc          => mem_load_pc,
         mem_pc               => mem_pc,
         mem_target_pc        => mem_target_pc,
         target_pc_mux_sel    => target_pc_mux_sel,
         wb_cc                => wb_cc,
         fetch_data_out       => fetch_data_out,
         fetch_ready          => fetch_ready,
         instr_addr           => instr_addr_internal,
         instr_mread_l        => instr_mread_l
      );
   pipe1_fd : fetch_decode_pipe
      PORT MAP (
         CLK                    => CLK,
         RESET_L                => RESET_L,
         fetch_data_out         => fetch_data_out,
         fetch_ready            => fetch_ready,
         load_fetch_decode_pipe => load_fetch_decode_pipe,
         decode_data_in         => decode_data_in
      );
   toilet : flushUnit
      PORT MAP (
         CLK               => CLK,
         decode_load_pc    => decode_load_pc,
         decode_pc         => decode_pc,
         decode_target_pc  => decode_target_pc,
         exec_load_pc      => exec_load_pc,
         exec_pc           => exec_pc,
         exec_target_pc    => exec_target_pc,
         instr_addr        => instr_addr_internal,
         mem_load_pc       => mem_load_pc,
         mem_pc            => mem_pc,
         mem_target_pc     => mem_target_pc,
         wb_cc             => wb_cc,
         decode_flush      => decode_flush,
         exec_flush        => exec_flush,
         mem_flush         => mem_flush,
         target_pc_mux_sel => target_pc_mux_sel,
         uarch_flush       => uarch_flush
      );
   aForwardPipe : forward_pipe
      PORT MAP (
         CLK                   => CLK,
         RESET_L               => RESET_L,
         exec_fw_cc_sel        => exec_fw_cc_sel,
         exec_fw_src1_sel      => exec_fw_src1_sel,
         exec_fw_src2_sel      => exec_fw_src2_sel,
         load_fwd_pipe         => load_fwd_pipe,
         mem_fw_addr_sel       => mem_fw_addr_sel,
         mem_fw_sel            => mem_fw_sel,
         stall_load_use_buffer => stall_load_use_buffer,
         exec_forward_cc_sel   => exec_forward_cc_sel,
         exec_forward_srca_sel => exec_forward_srca_sel,
         exec_forward_srcb_sel => exec_forward_srcb_sel,
         mem_forward_addr_sel  => mem_forward_addr_sel,
         mem_foward_sel        => mem_foward_sel,
         stall_load_use        => stall_load_use
      );
   aForwardingUnit : forwardingUnit
      PORT MAP (
         CLK                    => CLK,
         decode_uop_control_out => decode_uop_control_out,
         decode_uop_data_out    => decode_uop_data_out,
         exec_control           => exec_control,
         exec_data_in           => exec_data_in,
         mem_control            => mem_control,
         mem_data_in            => mem_data_in,
         stall_load_use         => stall_load_use,
         exec_fw_cc_sel         => exec_fw_cc_sel,
         exec_fw_src1_sel       => exec_fw_src1_sel,
         exec_fw_src2_sel       => exec_fw_src2_sel,
         mem_fw_addr_sel        => mem_fw_addr_sel,
         mem_fw_sel             => mem_fw_sel,
         stall_load_use_buffer  => stall_load_use_buffer
      );
   mem : memStage
      PORT MAP (
         CLK                  => CLK,
         DATAIN               => DATAIN,
         data_resp_h          => data_resp_h,
         mem_control_in       => mem_control_in,
         mem_data_in          => mem_data_in,
         mem_forward_addr_sel => mem_forward_addr_sel,
         mem_foward_sel       => mem_foward_sel,
         wb_control_in        => wb_control_in,
         wb_data_in           => wb_data_in,
         Dataout              => Dataout,
         data_mread_l         => data_mread_l,
         data_mwriteh_l       => data_mwriteh_l,
         data_mwritel_l       => data_mwritel_l,
         mem_cc               => mem_cc,
         mem_data_out         => mem_data_out,
         mem_load_pc          => mem_load_pc,
         mem_pc               => mem_pc,
         mem_ready            => mem_ready,
         mem_target_pc        => mem_target_pc,
         wb_cc                => wb_cc,
         wb_dest              => wb_dest,
         wb_din               => wb_din,
         wb_load_cc           => wb_load_cc,
         wb_rw                => wb_rw,
         data_addr            => data_addr_internal
      );
   pipe4_mw : mem_wb_pipe
      PORT MAP (
         CLK              => CLK,
         RESET_L          => RESET_L,
         load_mem_wb_pipe => load_mem_wb_pipe,
         mem_control      => mem_control,
         mem_data_out     => mem_data_out,
         mem_ready        => mem_ready,
         wb_data_in       => wb_data_in
      );
   aUArch : uarch
      PORT MAP (
         CLK                   => CLK,
         decode_control_out    => decode_control_out,
         decode_data_out       => decode_data_out,
         uarch_stall_in        => uarch_stall_in,
         uop_instr_dr          => uop_instr_dr,
         uop_sr2               => uop_sr2,
         uop_sr2_val           => uop_sr2_val,
         uarch_control_out     => uarch_control_out,
         uarch_data_out        => uarch_data_out,
         uarch_sel_out         => uarch_sel_out,
         uarch_stall_in_buffer => uarch_stall_in_buffer
      );
   aUArchPipe : uarch_pipe
      PORT MAP (
         CLK                   => CLK,
         RESET_L               => RESET_L,
         load_uarch_pipe       => load_uarch_pipe,
         uarch_control_out     => uarch_control_out,
         uarch_data_out        => uarch_data_out,
         uarch_insert_bubble   => uarch_insert_bubble,
         uarch_sel_out         => uarch_sel_out,
         uarch_stall_in_buffer => uarch_stall_in_buffer,
         uarch_control_in      => uarch_control_in,
         uarch_data_in         => uarch_data_in,
         uarch_sel_in          => uarch_sel_in,
         uarch_stall_in        => uarch_stall_in
      );
   auop_mux : uop_mux
      PORT MAP (
         CLK                    => CLK,
         decode_control_out     => decode_control_out,
         decode_data_out        => decode_data_out,
         uarch_control_in       => uarch_control_in,
         uarch_data_in          => uarch_data_in,
         uarch_sel_in           => uarch_sel_in,
         decode_uop_control_out => decode_uop_control_out,
         decode_uop_data_out    => decode_uop_data_out
      );

   -- Implicit buffered output assignments
   data_addr  <= data_addr_internal;
   instr_addr <= instr_addr_internal;

END struct;
