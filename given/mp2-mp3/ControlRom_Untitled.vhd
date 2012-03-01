--
-- VHDL Architecture mp3lib.ControlRom.Untitled
--
-- Created:
--          by - glazesk1.stdt (eelnx30.ews.illinois.edu)
--          at - 13:57:03 01/18/11
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
LIBRARY ECE411;
USE ECE411.LC3B_TYPES.ALL;

ENTITY ControlRom IS
PORT (
    opcode  : IN  LC3B_OPCODE;
    control : OUT CONTROL_WORD
);
END ENTITY ControlRom;

--
ARCHITECTURE Untitled OF ControlRom IS
BEGIN
    PROCESS (opcode)
    VARIABLE newControl : CONTROL_WORD;
    BEGIN
        CASE opcode IS
            WHEN OP_ADD =>
                newControl.name := add_op;
                newControl.ex.aluop := ALU_ADD;
                -- add more signals
            WHEN OP_AND =>
                newControl.name := and_op;
                newControl.ex.aluop := ALU_AND;
            -- add more opcodes
            WHEN OTHERS =>
                newControl.name := bad_op;
                newControl.ex.aluop := ALU_PASS;
        END CASE;
        
        control <= newControl AFTER DELAY_ROM;
    END PROCESS;
END ARCHITECTURE Untitled;

