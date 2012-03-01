-- VHDL Architecture ece411.CacheCheck.untitled
--
-- Created:
--          by - anbrown2.stdt (eelnx28.ews.illinois.edu)
--          at - 14:29:48 10/06/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
-- You must specify the path to this component in your *.do scripts (i.e. modify path in doify.sh)
-- 
-- This component keeps track of all memory accesses in a local "perfect" memory. It then compares 
-- the data being returned from your cache memory with the "perfect" memory whenever the cache 
-- responds with MRESP_H.  Any mismatches mean an error within the cache has occurred, at which point 
-- traditional debugging methods must be used.  This code will only generate warnings, which will be
-- red messages displayed in ModelSim during simulation. 

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;
LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY CacheCheck IS
   PORT( 
      ADDRESS       : IN     LC3b_word;
      CACHE_DATAIN  : IN     LC3b_word;
      CACHE_MRESP_H : IN     std_logic;
      CLK           : IN     std_logic;
      DATAOUT       : IN     LC3b_word;
      MREAD_L       : IN     std_logic;
      MWRITEH_L     : IN     std_logic;
      MWRITEL_L     : IN     std_logic;
      RESET_L       : IN     std_logic
   );

-- Declarations

END CacheCheck ;

--

ARCHITECTURE UNTITLED OF CacheCheck IS
SIGNAL DATAIN : LC3B_WORD;
BEGIN
  -------------------------------------------------------------------
  VHDL_MEMORY : PROCESS (RESET_L, MREAD_L, MWRITEH_L, MWRITEL_L) 
  -------------------------------------------------------------------
  VARIABLE MEM : MEMORY_ARRAY_64K;
  VARIABLE INT_OLD_ADDRESS : INTEGER;
  VARIABLE INT_ADDRESS : INTEGER;
  BEGIN
	  INT_ADDRESS := TO_INTEGER(UNSIGNED('0' & ADDRESS(15 DOWNTO 1) & '0'));
	  IF RESET_L = '0' THEN
		  MYDRAMINIT_64K(MEM);
    ELSIF (RESET_L = 'U') AND (MREAD_L = 'U') AND (MWRITEH_L = 'U') AND (MWRITEL_L = 'U') THEN
      -- resetting
      ASSERT TRUE;
	  ELSE
		  IF ((INT_ADDRESS >= 0) AND (INT_ADDRESS <= 65535)) THEN
			  IF (MREAD_L = '0' AND MWRITEL_L = '1' AND MWRITEH_L = '1') THEN
				  DATAIN(7 DOWNTO 0) <= MEM(INT_ADDRESS);
				  DATAIN(15 DOWNTO 8) <= MEM(INT_ADDRESS + 1);
					INT_OLD_ADDRESS := INT_ADDRESS;
			  ELSIF ((MWRITEL_L = '0' OR MWRITEH_L = '0') AND MREAD_L = '1') THEN
				  IF (MWRITEL_L = '0') THEN
					  MEM(INT_ADDRESS) := DATAOUT(7 DOWNTO 0);
				  END IF;
				  IF (MWRITEH_L = '0') THEN
					  MEM(INT_ADDRESS + 1) := DATAOUT(15 DOWNTO 8);
				  END IF;
					INT_OLD_ADDRESS := INT_ADDRESS;
				END IF;
		  ELSE
			  ASSERT FALSE
			  REPORT "INVALID ADDRESS"
			  SEVERITY FAILURE;
		  END IF;
	  END IF;
  END PROCESS VHDL_MEMORY;
   
  -------------------------------------------------------------------
  CACHE_CHECK : PROCESS (CACHE_MRESP_H) 
  -------------------------------------------------------------------
  BEGIN    
    IF (CACHE_MRESP_H'EVENT AND (CACHE_MRESP_H = '1') AND (MREAD_L = '0')) THEN
      ASSERT (DATAIN = CACHE_DATAIN)
      REPORT "CACHE CHECK ERROR: MEMORY LOAD MISMATCH"
      SEVERITY WARNING; --FAILURE;
		END IF;
  END PROCESS CACHE_CHECK; 
END ARCHITECTURE untitled;


