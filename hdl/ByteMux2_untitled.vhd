--
-- VHDL Architecture ece411.ByteMux2.untitled
--
-- Created:
--          by - goldste6.ews (evrt-252-17.ews.illinois.edu)
--          at - 16:18:28 02/22/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ByteMux2 IS
   PORT( 
      A   : IN     std_logic_vector ( 7 DOWNTO 0 );
      B   : IN     std_logic_vector ( 7 DOWNTO 0 );
      sel : IN     std_logic;
      Y   : OUT    std_logic_vector ( 7 DOWNTO 0 )
   );

-- Declarations

END ByteMux2 ;

--
ARCHITECTURE untitled OF ByteMux2 IS
  signal temp : std_logic_vector(7 downto 0);
BEGIN
  with sel select
    temp <= A when '0',
            B when '1',
           "XXXXXXXX" when others;
  
  Y <= temp after DELAY_MUX2;
END ARCHITECTURE untitled;

