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

ENTITY Control_ROM IS
   PORT( 
      opcode    : IN     LC3b_opcode;
      bit11     : IN     std_logic;
      bit5      : IN     std_logic;
      bit4      : IN     std_logic;
      ctrl_word : OUT    control_word
   );

-- Declarations

END Control_ROM ;

--
ARCHITECTURE untitled OF Control_ROM IS
  -- Define the ROM array of control words
  type ROM_ARRAY is ARRAY(0 to 127) of control_word;
  
  constant ROM_ENTRIES : ROM_ARRAY := (
    0   => br_instr,
    1   => br_instr,
    2   => br_instr,
    3   => br_instr,
    4   => br_instr,
    5   => br_instr,
    6   => br_instr,
    7   => br_instr,
    8   => add_reg_instr,
    9   => add_reg_instr,
    10  => add_imm_instr,
    11  => add_imm_instr,
    12  => add_reg_instr,
    13  => add_reg_instr,
    14  => add_imm_instr,
    15  => add_imm_instr,
    16  => ldb_instr,
    17  => ldb_instr,
    18  => ldb_instr,
    19  => ldb_instr,
    20  => ldb_instr,
    21  => ldb_instr,
    22  => ldb_instr,
    23  => ldb_instr,
	32  => jsrr_instr,
	33  => jsrr_instr,
	34  => jsrr_instr,
	35  => jsrr_instr,
	36  => jsr_instr,
	37  => jsr_instr,
	38  => jsr_instr,
	39  => jsr_instr,
    40  => and_imm_instr,
    41  => and_imm_instr,
    42  => and_reg_instr,
    43  => and_reg_instr,
    44  => and_imm_instr,
    45  => and_imm_instr,
    46  => and_reg_instr,
    47  => and_reg_instr,
    96  => jmp_instr,
    97  => jmp_instr,
    98  => jmp_instr,
    99  => jmp_instr,
    100 => jmp_instr,
    101 => jmp_instr,
    102 => jmp_instr,
    103 => jmp_instr,
    
    OTHERS => add_reg_instr -- FIXME: To avoid compilation issues
  );
  
BEGIN

  -- Fill in contents of this array
  PROCESS(instr)
  BEGIN
    
    
    
  END PROCESS;
    
END ARCHITECTURE untitled;
