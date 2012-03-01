--
-- VHDL Architecture ece411.StoreMux.untitled
--
-- Created:
--          by - goldste6.UNKNOWN (linux4.ews.illinois.edu)
--          at - 21:03:17 01/18/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY StoreMux IS
   PORT( 
      B           : IN     std_logic_vector (2 DOWNTO 0);
      sel         : IN     std_logic;
      A           : IN     std_logic_vector (2 DOWNTO 0);
      Muxout      : OUT    std_logic_vector (2 DOWNTO 0)
   );

-- Declarations

END StoreMux;

--
ARCHITECTURE untitled OF StoreMux IS
  SIGNAL result: std_logic_vector (2 DOWNTO 0);
BEGIN
  compute : Process(A, B, sel) is
  begin
    if (sel = '1') then
      result <= B;
    elsif (sel = '0') then
      result <= A;
    else
      result <= "XXX";
    end if;
  end process;
  
  Muxout <= result after DELAY_MUX2;
END ARCHITECTURE untitled;

