-- VHDL Entity ece411.Cache_Controller.interface
--
-- Created:
--          by - goldste6.UNKNOWN (linux1.ews.illinois.edu)
--          at - 18:41:04 02/11/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Cache_Controller IS
   PORT( 
      CLK          : IN     STD_LOGIC;
      Dirty        : IN     std_logic;
      PMRESP_H     : IN     STD_LOGIC;
      RESET_L      : IN     STD_LOGIC;
      miss         : IN     std_logic;
      PMREAD_L     : OUT    STD_LOGIC;
      PMWRITE_L    : OUT    STD_LOGIC;
      in_idlehit   : OUT    std_logic;
      in_load      : OUT    std_logic;
      in_writeback : OUT    std_logic
   );

-- Declarations

END Cache_Controller ;

--
-- VHDL Architecture ece411.Cache_Controller.fsm
--
-- Created:
--          by - goldste6.UNKNOWN (linux1.ews.illinois.edu)
--          at - 18:41:04 02/11/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;
 
ARCHITECTURE fsm OF Cache_Controller IS

   TYPE STATE_TYPE IS (
      IDLE_HIT,
      WRITE_BACK,
      LOAD
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
      RESET_L
   )
   -----------------------------------------------------------------
   BEGIN
      IF (RESET_L = '0') THEN
         current_state <= IDLE_HIT;
      ELSIF (clk'EVENT AND clk = '1') THEN
         current_state <= next_state;
      END IF;
   END PROCESS clocked_proc;
 
   -----------------------------------------------------------------
   nextstate_proc : PROCESS ( 
      Dirty,
      PMRESP_H,
      current_state,
      miss
   )
   -----------------------------------------------------------------
   BEGIN
      CASE current_state IS
         WHEN IDLE_HIT => 
            IF (dirty = '1' and
                miss = '1') THEN 
               next_state <= WRITE_BACK;
            ELSIF (dirty = '0' and
                   miss = '1') THEN 
               next_state <= LOAD;
            ELSE
               next_state <= IDLE_HIT;
            END IF;
         WHEN WRITE_BACK => 
            IF (PMRESP_H = '1') THEN 
               next_state <= LOAD;
            ELSE
               next_state <= WRITE_BACK;
            END IF;
         WHEN LOAD => 
            IF (PMRESP_H = '1') THEN 
               next_state <= IDLE_HIT;
            ELSE
               next_state <= LOAD;
            END IF;
         WHEN OTHERS =>
            next_state <= IDLE_HIT;
      END CASE;
   END PROCESS nextstate_proc;
 
   -----------------------------------------------------------------
   output_proc : PROCESS ( 
      current_state
   )
   -----------------------------------------------------------------
   BEGIN
      -- Default Assignment
      PMREAD_L <= '1';
      PMWRITE_L <= '1';
      in_idlehit <= '0';
      in_load <= '0';
      in_writeback <= '0';

      -- Combined Actions
      CASE current_state IS
         WHEN IDLE_HIT => 
            in_idlehit <= '1';
         WHEN WRITE_BACK => 
            in_writeback <= '1';
            PMWRITE_L <= '0' after 6ns;
         WHEN LOAD => 
            in_load <= '1';
            PMREAD_L <= '0' after 6ns;
         WHEN OTHERS =>
            NULL;
      END CASE;
   END PROCESS output_proc;
 
END fsm;
