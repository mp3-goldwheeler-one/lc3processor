-- VHDL Entity ece411.Cache_Controller_L2.symbol
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Cache_Controller_L2 IS
   PORT( 
      CLK                : IN     std_logic;
      PMRESP_H           : IN     std_logic;
      RESET_L            : IN     std_logic;
      evict_buffer_valid : IN     std_logic;
      mem_access         : IN     std_logic;
      miss               : IN     std_logic;
      LRUgate            : OUT    std_logic;
      PMREAD_L           : OUT    std_logic;
      in_idlehit         : OUT    std_logic;
      in_idlehit2        : OUT    std_logic;
      in_load            : OUT    std_logic;
      in_load_resp       : OUT    std_logic;
      process_hit        : OUT    std_logic
   );

-- Declarations

END Cache_Controller_L2 ;

--
-- VHDL Architecture ece411.Cache_Controller_L2.fsm
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;
 
ARCHITECTURE fsm OF Cache_Controller_L2 IS

   TYPE STATE_TYPE IS (
      IDLE_HIT,
      LOAD,
      IDLE_HIT2,
      HIT_RESP,
      LOAD_RESP
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
      CLK,
      RESET_L
   )
   -----------------------------------------------------------------
   BEGIN
      IF (RESET_L = '0') THEN
         current_state <= IDLE_HIT;
      ELSIF (CLK'EVENT AND CLK = '1') THEN
         current_state <= next_state;
      END IF;
   END PROCESS clocked_proc;
 
   -----------------------------------------------------------------
   nextstate_proc : PROCESS ( 
      PMRESP_H,
      current_state,
      evict_buffer_valid,
      mem_access,
      miss
   )
   -----------------------------------------------------------------
   BEGIN
      CASE current_state IS
         WHEN IDLE_HIT => 
            IF (mem_access = '1') THEN 
               next_state <= IDLE_HIT2;
            ELSE
               next_state <= IDLE_HIT;
            END IF;
         WHEN LOAD => 
            IF (PMRESP_H = '1') THEN 
               next_state <= LOAD_RESP;
            ELSE
               next_state <= LOAD;
            END IF;
         WHEN IDLE_HIT2 => 
            IF (miss = '0') THEN 
               next_state <= HIT_RESP;
            ELSIF (miss = '1' and evict_buffer_valid = '0') THEN 
               next_state <= LOAD;
            ELSE
               next_state <= IDLE_HIT2;
            END IF;
         WHEN HIT_RESP => 
            next_state <= IDLE_HIT;
         WHEN LOAD_RESP => 
            next_state <= IDLE_HIT;
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
      LRUgate <= '0';
      PMREAD_L <= '1';
      in_idlehit <= '0';
      in_idlehit2 <= '0';
      in_load <= '0';
      in_load_resp <= '0';
      process_hit <= '0';

      -- Combined Actions
      CASE current_state IS
         WHEN IDLE_HIT => 
            in_idlehit <= '1';
         WHEN LOAD => 
            in_load <= '1';
            PMREAD_L <= '0' after 2ns;
         WHEN IDLE_HIT2 => 
            in_idlehit  <= '1';
            in_idlehit2 <= '1';
         WHEN HIT_RESP => 
            LRUgate <= '1' after 1 ns;
            in_idlehit <= '1';
            process_hit <= '1';
         WHEN LOAD_RESP => 
            in_load_resp <= '1';
         WHEN OTHERS =>
            NULL;
      END CASE;
   END PROCESS output_proc;
 
END fsm;
