-- VHDL Entity ece411.forward_pipe.interface
--
-- Created:
--          by - goldste6.ews (gelib-057-33.ews.illinois.edu)
--          at - 00:07:49 04/26/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY forward_pipe IS
   PORT( 
      CLK                     : IN     std_logic;
      RESET_L                 : IN     STD_LOGIC;
      exec_fw_addr_sel        : IN     std_logic;
      exec_fw_cc_sel          : IN     LC3b_TRISTATE_4mux_sel;
      exec_fw_src1_sel        : IN     LC3b_TRISTATE_4mux_sel;
      exec_fw_src2_sel        : IN     LC3b_TRISTATE_4mux_sel;
      load_fwd_pipe           : IN     std_logic;
      mem2_fw_sel             : IN     std_logic;
      stall_load_use_1cycle   : IN     STD_LOGIC;
      stall_load_use_2cycle   : IN     STD_LOGIC;
      exec_forward_addr_sel   : OUT    STD_LOGIC;
      exec_forward_cc_sel     : OUT    LC3b_TRISTATE_4mux_sel;
      exec_forward_srca_sel   : OUT    LC3b_TRISTATE_4mux_sel;
      exec_forward_srcb_sel   : OUT    LC3b_TRISTATE_4mux_sel;
      mem2_foward_sel         : OUT    std_logic;
      stall_load_use_buffer   : OUT    STD_LOGIC;
      stall_load_use_buffer_l : OUT    STD_LOGIC
   );

-- Declarations

END forward_pipe ;

--
-- VHDL Architecture ece411.forward_pipe.struct
--
-- Created:
--          by - goldste6.ews (gelib-057-33.ews.illinois.edu)
--          at - 00:07:49 04/26/12
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

ARCHITECTURE struct OF forward_pipe IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL F    : STD_LOGIC;
   SIGNAL F1   : STD_LOGIC;
   SIGNAL F2   : STD_LOGIC;
   SIGNAL F3   : STD_LOGIC;
   SIGNAL s0   : STD_LOGIC;
   SIGNAL s0_L : std_logic;
   SIGNAL s1   : STD_LOGIC;
   SIGNAL s1_L : std_logic;


   -- Component Declarations
   COMPONENT NOT1
   PORT (
      A : IN     std_logic ;
      Y : OUT    std_logic 
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
   COMPONENT NOR3
   PORT (
      A : IN     STD_LOGIC ;
      B : IN     STD_LOGIC ;
      C : IN     STD_LOGIC ;
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
   COMPONENT OR3
   PORT (
      A : IN     STD_LOGIC ;
      B : IN     STD_LOGIC ;
      C : IN     STD_LOGIC ;
      F : OUT    STD_LOGIC 
   );
   END COMPONENT;
   COMPONENT REG1
   PORT (
      RESET_L : IN     STD_LOGIC ;
      A       : IN     STD_LOGIC ;
      EN      : IN     STD_LOGIC ;
      CLK     : IN     STD_LOGIC ;
      F       : OUT    STD_LOGIC 
   );
   END COMPONENT;
   COMPONENT REG4
   PORT (
      RESET_L : IN     STD_LOGIC ;
      A       : IN     STD_LOGIC_VECTOR (3 DOWNTO 0);
      EN      : IN     STD_LOGIC ;
      CLK     : IN     STD_LOGIC ;
      F       : OUT    STD_LOGIC_VECTOR (3 DOWNTO 0)
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : AND2 USE ENTITY mp3lib.AND2;
   FOR ALL : AND3 USE ENTITY mp3lib.AND3;
   FOR ALL : NOR3 USE ENTITY mp3lib.NOR3;
   FOR ALL : NOT1 USE ENTITY ece411.NOT1;
   FOR ALL : OR2 USE ENTITY mp3lib.OR2;
   FOR ALL : OR3 USE ENTITY mp3lib.OR3;
   FOR ALL : REG1 USE ENTITY mp3lib.REG1;
   FOR ALL : REG4 USE ENTITY mp3lib.REG4;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   U_8 : NOT1
      PORT MAP (
         A => s0,
         Y => s0_L
      );
   U_9 : NOT1
      PORT MAP (
         A => s1,
         Y => s1_L
      );
   U_10 : AND2
      PORT MAP (
         A => stall_load_use_1cycle,
         B => s0_L,
         F => F
      );
   U_11 : AND2
      PORT MAP (
         A => stall_load_use_2cycle,
         B => s0_L,
         F => F1
      );
   U_3 : AND3
      PORT MAP (
         A => stall_load_use_2cycle,
         B => s0_L,
         C => s1_L,
         F => F2
      );
   U_12 : NOR3
      PORT MAP (
         A => F,
         B => F1,
         C => s1,
         F => stall_load_use_buffer_l
      );
   U_13 : OR2
      PORT MAP (
         A => F,
         B => s1,
         F => F3
      );
   U_14 : OR3
      PORT MAP (
         A => F,
         B => F1,
         C => s1,
         F => stall_load_use_buffer
      );
   U_4 : REG1
      PORT MAP (
         RESET_L => RESET_L,
         A       => exec_fw_addr_sel,
         EN      => load_fwd_pipe,
         CLK     => CLK,
         F       => exec_forward_addr_sel
      );
   U_5 : REG1
      PORT MAP (
         RESET_L => RESET_L,
         A       => F2,
         EN      => load_fwd_pipe,
         CLK     => CLK,
         F       => s1
      );
   U_6 : REG1
      PORT MAP (
         RESET_L => RESET_L,
         A       => mem2_fw_sel,
         EN      => load_fwd_pipe,
         CLK     => CLK,
         F       => mem2_foward_sel
      );
   U_7 : REG1
      PORT MAP (
         RESET_L => RESET_L,
         A       => F3,
         EN      => load_fwd_pipe,
         CLK     => CLK,
         F       => s0
      );
   U_0 : REG4
      PORT MAP (
         RESET_L => RESET_L,
         A       => exec_fw_src1_sel,
         EN      => load_fwd_pipe,
         CLK     => CLK,
         F       => exec_forward_srca_sel
      );
   U_1 : REG4
      PORT MAP (
         RESET_L => RESET_L,
         A       => exec_fw_src2_sel,
         EN      => load_fwd_pipe,
         CLK     => CLK,
         F       => exec_forward_srcb_sel
      );
   U_2 : REG4
      PORT MAP (
         RESET_L => RESET_L,
         A       => exec_fw_cc_sel,
         EN      => load_fwd_pipe,
         CLK     => CLK,
         F       => exec_forward_cc_sel
      );

END struct;
