--
-- VHDL Architecture ece411.ALU.untitled
--
-- Created:
--          by - goldste6.UNKNOWN (linux4.ews.illinois.edu)
--          at - 20:28:43 01/18/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ALU IS
   PORT( 
      ALUMUXout : IN     LC3b_word;
      ALUop     : IN     LC3b_aluop;
      RFAout    : IN     LC3b_word;
      clk       : IN     std_logic;
      ALUout    : OUT    LC3b_word
   );

-- Declarations

END ALU ;

--
ARCHITECTURE UNTITLED OF ALU IS
BEGIN
	----------------------------------------
	VHDL_ALU : PROCESS (RFAOUT, ALUMUXOUT, ALUOP)
	----------------------------------------
	VARIABLE TEMP_ALUOUT : LC3B_WORD;
	BEGIN
		-- CHECK FOR ALU OPERATION TYPE, AND EXECUTE
		CASE ALUOP IS
			WHEN ALU_ADD =>
				TEMP_ALUOUT := STD_LOGIC_VECTOR(SIGNED(RFAOUT) + SIGNED(ALUMUXOUT));
			WHEN ALU_AND =>
				TEMP_ALUOUT := (RFAOUT AND ALUMUXOUT);
			WHEN ALU_NOT =>
				TEMP_ALUOUT := (RFAOUT XOR "1111111111111111");
			WHEN ALU_PASS =>
				TEMP_ALUOUT := (RFAOUT);
			WHEN ALU_SLL =>
			  TEMP_ALUOUT := std_logic_vector(unsigned(RFAOUT) sll to_integer(unsigned(ALUMUXOUT)));
			WHEN ALU_SLA =>  -- In case the arithmetic bit is set for a left shift
			  TEMP_ALUOUT := std_logic_vector(unsigned(RFAOUT) sll to_integer(unsigned(ALUMUXOUT)));
			WHEN ALU_SRL =>
			  TEMP_ALUOUT := std_logic_vector(unsigned(RFAOUT) srl to_integer(unsigned(ALUMUXOUT)));
			WHEN ALU_SRA =>
			  TEMP_ALUOUT := std_logic_vector(SHIFT_RIGHT(signed(RFAOUT),natural(to_integer(unsigned(ALUMUXOUT)))));
			WHEN OTHERS =>
		END CASE;
	--SET OUTPUT VALUE ALUOUT TO BE THE TEMPORARY VALUE CALCULATED WITHIN THE PROCESS AFTER A DELAY
	ALUOUT <= TEMP_ALUOUT AFTER DELAY_ALU;
	END PROCESS VHDL_ALU;
END UNTITLED;

