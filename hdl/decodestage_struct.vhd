-- VHDL Entity ece411.decodeStage.interface
--
-- Created:
--          by - wheele11.ews (gelib-057-18.ews.illinois.edu)
--          at - 22:43:58 03/07/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY decodeStage IS
   PORT( 
      CLK          : IN     std_logic;
      decode_pc    : IN     LC3b_word;
      control_word : OUT    LC3b_word;
      opcode       : OUT    LC3b_opcode
   );

-- Declarations

END decodeStage ;

--
-- VHDL Architecture ece411.decodeStage.struct
--
-- Created:
--          by - wheele11.ews (gelib-057-18.ews.illinois.edu)
--          at - 22:43:58 03/07/12
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;


ARCHITECTURE struct OF decodeStage IS

   -- Architecture declarations

   -- Internal signal declarations



BEGIN

   -- Instance port mappings.

END struct;