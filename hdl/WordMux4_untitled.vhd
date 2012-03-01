--
-- VHDL Architecture ece411.WordMux4.untitled
--
-- Created:
--          by - goldste6.UNKNOWN (evrt-252-13.ews.illinois.edu)
--          at - 17:12:17 01/27/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY WordMux4 IS
   PORT( 
      in0 : IN     LC3b_word;
      in1 : IN     LC3b_word;
      in2 : IN     LC3b_word;
      in3 : IN     LC3b_word;
      sel : IN     LC3b_4MUX_SEL;
      Y   : OUT    LC3b_word
   );

-- Declarations

END WordMux4 ;

--
ARCHITECTURE untitled OF WordMux4 IS
  signal output : LC3b_word;
BEGIN
  do_output : Process(sel, in0, in1, in2, in3) is
  begin
    case sel is
      when "00" =>
        output <= in0;
      when "01" =>
        output <= in1;
      when "10" =>
        output <= in2;
      when "11" =>
        output <= in3;
      when others =>
        output <= "XXXXXXXXXXXXXXXX";
    end case;
  end process;
  
  Y <= output after DELAY_MUX4;
END ARCHITECTURE untitled;

