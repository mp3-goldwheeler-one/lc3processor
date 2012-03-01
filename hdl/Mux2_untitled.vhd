--
-- VHDL Architecture ece411.Mux2.untitled
--
-- Created:
--          by - goldste6.ews (linux3.ews.illinois.edu)
--          at - 00:07:59 02/17/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Mux2 IS
   PORT( 
      A   : IN     std_logic;
      B   : IN     std_logic;
      Sel : IN     std_logic;
      Y   : OUT    std_logic
   );

-- Declarations

END Mux2 ;

--
ARCHITECTURE untitled OF Mux2 IS
BEGIN
  with sel select
    Y <= A when '0',
         B when '1',
         'X' when others;

END ARCHITECTURE untitled;

