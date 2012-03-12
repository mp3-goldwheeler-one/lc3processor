-- VHDL Entity ece411.ArbiterController.interface
--
-- Created:
--          by - goldste6.ews (gelib-057-08.ews.illinois.edu)
--          at - 22:35:33 03/11/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ArbiterController IS
   PORT( 
      D_ACCESS         : IN     STD_LOGIC;
      I_ACCESS         : IN     STD_LOGIC;
      PMRESP_H         : IN     std_logic;
      clk              : IN     std_logic;
      reset_l          : IN     std_logic;
      ArbiterSel       : OUT    STD_LOGIC;
      in_data_access_L : OUT    std_logic;
      in_inst_access_L : OUT    std_logic
   );

-- Declarations

END ArbiterController ;

--
-- VHDL Architecture ece411.ArbiterController.fsm
--
-- Created:
--          by - goldste6.ews (gelib-057-08.ews.illinois.edu)
--          at - 22:35:33 03/11/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;
 
ARCHITECTURE fsm OF ArbiterController IS

   TYPE STATE_TYPE IS (
      idle,
      DataAccess,
      InstAccess
   );
 
   -- State vector declaration
   ATTRIBUTE state_vector : string;
   ATTRIBUTE state_vector OF fsm : ARCHITECTURE IS "current_state";

   -- Declare current and next state signals
   SIGNAL current_state : STATE_TYPE;
   SIGNAL next_state : STATE_TYPE;

BEGIN

   -----------------------------------------------------------------
   clocked_proc : PROCESS ( 
      clk,
      reset_l
   )
   -----------------------------------------------------------------
   BEGIN
      IF (reset_l = '0') THEN
         current_state <= idle;
      ELSIF (clk'EVENT AND clk = '1') THEN
         current_state <= next_state;
      END IF;
   END PROCESS clocked_proc;
 
   -----------------------------------------------------------------
   nextstate_proc : PROCESS ( 
      D_ACCESS,
      I_ACCESS,
      PMRESP_H,
      current_state
   )
   -----------------------------------------------------------------
   BEGIN
      CASE current_state IS
         WHEN idle => 
            IF (D_ACCESS = '1') THEN 
               next_state <= DataAccess;
            ELSIF (I_ACCESS = '1') THEN 
               next_state <= InstAccess;
            ELSE
               next_state <= idle;
            END IF;
         WHEN DataAccess => 
            IF (PMRESP_H = '1') THEN 
               next_state <= idle;
            ELSE
               next_state <= DataAccess;
            END IF;
         WHEN InstAccess => 
            IF (PMRESP_H = '1') THEN 
               next_state <= idle;
            ELSE
               next_state <= InstAccess;
            END IF;
         WHEN OTHERS =>
            next_state <= idle;
      END CASE;
   END PROCESS nextstate_proc;
 
   -----------------------------------------------------------------
   output_proc : PROCESS ( 
      current_state
   )
   -----------------------------------------------------------------
   BEGIN
      -- Default Assignment
      in_data_access_L <= '1';
      in_inst_access_L <= '1';

      -- Combined Actions
      CASE current_state IS
         WHEN idle => 
            ArbiterSel <= 'X';
         WHEN DataAccess => 
            in_data_access_L <= '0';
            ArbiterSel <= '0';
         WHEN InstAccess => 
            in_inst_access_L <= '0';
            ArbiterSel <= '1';
         WHEN OTHERS =>
            NULL;
      END CASE;
   END PROCESS output_proc;
 
END fsm;
