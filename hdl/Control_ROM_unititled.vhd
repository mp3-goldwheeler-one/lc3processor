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
    24  => stb_instr,
    25  => stb_instr,
    26  => stb_instr,
    27  => stb_instr,
    28  => stb_instr,
    29  => stb_instr,
    30  => stb_instr,
    31  => stb_instr,
	32  => jsrr_instr,
	33  => jsrr_instr,
	34  => jsrr_instr,
	35  => jsrr_instr,
	36  => jsr_instr,
	37  => jsr_instr,
	38  => jsr_instr,
	39  => jsr_instr,
    40  => and_reg_instr,
    41  => and_reg_instr,
    42  => and_imm_instr,
    43  => and_imm_instr,
    44  => and_reg_instr,
    45  => and_reg_instr,
    46  => and_imm_instr,
    47  => and_imm_instr,
    48  => ldr_instr,
    49  => ldr_instr,
    50  => ldr_instr,
    51  => ldr_instr,
    52  => ldr_instr,
    53  => ldr_instr,
    54  => ldr_instr,
    55  => ldr_instr,
    56  => str_instr,
    57  => str_instr,
    58  => str_instr,
    59  => str_instr,
    60  => str_instr,
    61  => str_instr,
    62  => str_instr,
    63  => str_instr,
    64  => rti_instr,
    65  => rti_instr,
    66  => rti_instr,
    67  => rti_instr,
    68  => rti_instr,
    69  => rti_instr,
    70  => rti_instr,
    71  => rti_instr,
    72  => not_instr,
    73  => not_instr,
    74  => not_instr,
    75  => not_instr,
    76  => not_instr,
    77  => not_instr,
    78  => not_instr,
    79  => not_instr,
    80  => ldi_instr,
    81  => ldi_instr,
    82  => ldi_instr,
    83  => ldi_instr,
    84  => ldi_instr,
    85  => ldi_instr,
    86  => ldi_instr,
    87  => ldi_instr,
    88  => sti_instr,
    89  => sti_instr,
    90  => sti_instr,
    91  => sti_instr,
    92  => sti_instr,
    93  => sti_instr,
    94  => sti_instr,
    95  => sti_instr,
    96  => jmp_instr,
    97  => jmp_instr,
    98  => jmp_instr,
    99  => jmp_instr,
    100 => jmp_instr,
    101 => jmp_instr,
    102 => jmp_instr,
    103 => jmp_instr,
    104 => lshf_instr,
    105 => rshfl_instr,
    106 => lshf_instr,
    107 => rshfa_instr,
    108 => lshf_instr,
    109 => rshfl_instr,
    110 => lshf_instr,
    111 => rshfa_instr,
    112 => lea_instr,
    113 => lea_instr,
    114 => lea_instr,
    115 => lea_instr,
    116 => lea_instr,
    117 => lea_instr,
    118 => lea_instr,
    119 => lea_instr,
    120 => trap_instr,
    121 => trap_instr,
    122 => trap_instr,
    123 => trap_instr,
    124 => trap_instr,
    125 => trap_instr,
    126 => trap_instr,
    127 => trap_instr
  );
  
BEGIN
  PROCESS(opcode, bit11, bit5, bit4)
  BEGIN
    ctrl_word <= ROM_ENTRIES(to_integer(unsigned((opcode & bit11 & bit5 & bit4)))) after DELAY_ROM;
  END PROCESS;
END ARCHITECTURE untitled;
