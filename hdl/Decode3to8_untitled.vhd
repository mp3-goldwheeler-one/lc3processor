--
-- VHDL Architecture ece411.Decode3to8.untitled
--
-- Created:
--          by - goldste6.UNKNOWN (evrt-252-04.ews.illinois.edu)
--          at - 14:58:45 02/08/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Decode3to8 IS
  Port (
          input  : in std_logic_vector(2 downto 0);
          out0   : out std_logic;
          out1   : out std_logic;
          out2   : out std_logic;
          out3   : out std_logic;
          out4   : out std_logic;
          out5   : out std_logic;
          out6   : out std_logic;
          out7   : out std_logic
       );
END ENTITY Decode3to8;

--
ARCHITECTURE untitled OF Decode3to8 IS
  signal output  : std_logic_vector(7 downto 0);
BEGIN
  UpdateOutput : Process(input) is
    variable temp_output : std_logic_vector(7 downto 0);
  begin
    temp_output := "XXXXXXXX";
    if (input = "000") then
      temp_output := x"01";
    elsif (input = "001") then
      temp_output := x"02";
    elsif (input = "010") then
      temp_output := x"04";
    elsif (input = "011") then
      temp_output := x"08";
    elsif (input = "100") then
      temp_output := x"10";
    elsif (input = "101") then
      temp_output := x"20";
    elsif (input = "110") then
      temp_output := x"40";
    elsif (input = "111") then
      temp_output := x"80";
    end if;
    output <= temp_output after DELAY_DECODE3;
  end process;
  
  out0 <= output(0);
  out1 <= output(1);
  out2 <= output(2);
  out3 <= output(3);
  out4 <= output(4);
  out5 <= output(5);
  out6 <= output(6);
  out7 <= output(7);
END ARCHITECTURE untitled;

