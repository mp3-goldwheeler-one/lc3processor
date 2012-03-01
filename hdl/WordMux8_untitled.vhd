--
-- VHDL Architecture ece411.WordMux8.untitled
--
-- Created:
--          by - goldste6.UNKNOWN (evrt-252-20.ews.illinois.edu)
--          at - 16:59:08 02/02/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY WordMux8 IS
   PORT( 
      in0    : IN     lc3b_word;
      in1    : IN     lc3b_word;
      in2    : IN     lc3b_word;
      in3    : IN     lc3b_word;
      in4    : IN     lc3b_word;
      in5    : IN     lc3b_word;
      in6    : IN     lc3b_word;
      in7    : IN     lc3b_word;
      sel    : IN     lc3b_8Mux_sel;
      output : OUT    lc3b_word
   );

-- Declarations

END WordMux8 ;

--
ARCHITECTURE untitled OF WordMux8 IS
  signal tempout : lc3b_word;
BEGIN
  update_output : process(in0, in1, in2, in3, in4, in5, in6, in7, sel) is
  begin
    case sel is
      when "000" =>
        tempout <= in0;
      when "001" =>
        tempout <= in1;
      when "010" =>
        tempout <= in2;
      when "011" =>
        tempout <= in3;
      when "100" =>
        tempout <= in4;
      when "101" =>
        tempout <= in5;
      when "110" =>
        tempout <= in6;
      when "111" =>
        tempout <= in7;
      when others =>
        tempout <= "XXXXXXXXXXXXXXXX";
    end case;
  end process;
  
  output <= tempout after DELAY_MUX8;
END ARCHITECTURE untitled;

