--
-- VHDL Architecture ece411.Comparator.untitled
--
-- Created:
--          by - goldste6.UNKNOWN (linux3.ews.illinois.edu)
--          at - 18:31:19 02/07/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Comparator IS
  Generic (N : Integer; Delay : time := DELAY_COMPARE16);
  Port (
          A : in std_logic_vector(N-1 downto 0);
          B : in std_logic_vector(N-1 downto 0);
          Y : out std_logic
       );
END ENTITY Comparator;

--
ARCHITECTURE untitled OF Comparator IS
BEGIN
  Compare : Process (A, B) is
  begin
    if (A = B) then
      Y <= '1' after Delay;
    else
      Y <= '0' after Delay;
    end if;
  end process;
END ARCHITECTURE untitled;

