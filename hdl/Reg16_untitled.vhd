--
-- VHDL Architecture ece411.Reg16.untitled
--
-- Created:
--          by - goldste6.UNKNOWN (evrt-252-18.ews.illinois.edu)
--          at - 15:23:28 01/18/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Reg16 IS
   PORT( 
      clk    : IN     std_logic;
      input  : IN     LC3b_word;
      load   : IN     std_logic;
      reset  : IN     std_logic;
      output : OUT    LC3b_word
   );

-- Declarations

END Reg16 ;

--
ARCHITECTURE untitled OF Reg16 IS
  signal pre_out : LC3b_word;
BEGIN
  PROCESS (CLK, RESET, Input)
  BEGIN
    if RESET = '0' then
      pre_out <= (others => '0');
    elsif clk'event and clk = '1' then
      if (load = '1') then
        pre_out <= Input;
      end if;
    end if;
  end process;
  
  Output <= pre_out after delay_reg;
  
END ARCHITECTURE untitled;
