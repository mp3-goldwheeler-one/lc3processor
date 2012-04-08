--
-- VHDL Architecture ece411.Control_ROM.untitled
--
-- Created:
--          by - wheele11.ews (gelib-057-20.ews.illinois.edu)
--          at - 22:19:10 03/12/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY UOp_ROM IS
   PORT( 
      idx       : IN     uop_rom_sel;
      ctrl_word : OUT    control_word
   );

-- Declarations

END UOp_ROM ;

--
ARCHITECTURE untitled OF UOp_ROM IS
  -- Define the ROM array of control words
  type ROM_ARRAY is ARRAY(0 to 15) of control_word;
  
  constant ROM_ENTRIES : ROM_ARRAY := (
    0   => default_control_word,
    1   => ldi2_instr,
    2   => sti2_instr,
    3   => default_control_word,
    4   => default_control_word,
    5   => default_control_word,
    6   => default_control_word,
    7   => default_control_word,
    8   => default_control_word,
    9   => default_control_word,
    10  => default_control_word,
    11  => default_control_word,
    12  => default_control_word,
    13  => default_control_word,
    14  => default_control_word,
    15  => default_control_word
  );
  
BEGIN
  PROCESS(idx)
  BEGIN
    ctrl_word <= ROM_ENTRIES(to_integer(unsigned(idx))) after DELAY_ROM;
  END PROCESS;
END ARCHITECTURE untitled;
