--
-- VHDL Architecture ece411.DataMuxer.untitled
--
-- Created:
--          by - goldste6.UNKNOWN (evrt-252-04.ews.illinois.edu)
--          at - 14:50:26 02/08/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY DataMuxer IS
   PORT( 
      MWRITEH_L     : IN     std_logic;
      MWRITEL_L     : IN     std_logic;
      DecodedOffset : IN     std_logic_vector (7 DOWNTO 0);
      WordIn        : IN     LC3b_word;
      word0         : IN     LC3b_word;
      word1         : IN     LC3b_word;
      word2         : IN     LC3b_word;
      word3         : IN     LC3b_word;
      word4         : IN     LC3b_word;
      word5         : IN     LC3b_word;
      word6         : IN     LC3b_word;
      word7         : IN     LC3b_word;
      word0out      : OUT    LC3b_word;
      word1out      : OUT    LC3b_word;
      word2out      : OUT    LC3b_word;
      word3out      : OUT    LC3b_word;
      word4out      : OUT    LC3b_word;
      word5out      : OUT    LC3b_word;
      word6out      : OUT    LC3b_word;
      word7out      : OUT    LC3b_word
   );

-- Declarations

END DataMuxer ;

--
ARCHITECTURE untitled OF DataMuxer IS
  signal MWRITEL_H : std_logic;
  signal MWRITEH_H : std_logic;
  signal replace_low : std_logic_vector(7 downto 0);
  signal replace_high : std_logic_vector(7 downto 0);
  
  signal temp_word0out : LC3b_word;
  signal temp_word1out : LC3b_word;
  signal temp_word2out : LC3b_word;
  signal temp_word3out : LC3b_word;
  signal temp_word4out : LC3b_word;
  signal temp_word5out : LC3b_word;
  signal temp_word6out : LC3b_word;
  signal temp_word7out : LC3b_word;
BEGIN
  MWRITEL_H <= not MWRITEL_L after 1ns;
  MWRITEH_H <= not MWRITEH_L after 1ns;

  replace_low(0) <= (DecodedOffset(0) and MWRITEL_H) after DELAY_LOGIC2;
  replace_low(1) <= (DecodedOffset(1) and MWRITEL_H) after DELAY_LOGIC2;
  replace_low(2) <= (DecodedOffset(2) and MWRITEL_H) after DELAY_LOGIC2;
  replace_low(3) <= (DecodedOffset(3) and MWRITEL_H) after DELAY_LOGIC2;
  replace_low(4) <= (DecodedOffset(4) and MWRITEL_H) after DELAY_LOGIC2;
  replace_low(5) <= (DecodedOffset(5) and MWRITEL_H) after DELAY_LOGIC2;
  replace_low(6) <= (DecodedOffset(6) and MWRITEL_H) after DELAY_LOGIC2;
  replace_low(7) <= (DecodedOffset(7) and MWRITEL_H) after DELAY_LOGIC2;
  
  replace_high(0) <= (DecodedOffset(0) and MWRITEL_H) after DELAY_LOGIC2;
  replace_high(1) <= (DecodedOffset(1) and MWRITEL_H) after DELAY_LOGIC2;
  replace_high(2) <= (DecodedOffset(2) and MWRITEL_H) after DELAY_LOGIC2;
  replace_high(3) <= (DecodedOffset(3) and MWRITEL_H) after DELAY_LOGIC2;
  replace_high(4) <= (DecodedOffset(4) and MWRITEL_H) after DELAY_LOGIC2;
  replace_high(5) <= (DecodedOffset(5) and MWRITEL_H) after DELAY_LOGIC2;
  replace_high(6) <= (DecodedOffset(6) and MWRITEL_H) after DELAY_LOGIC2;
  replace_high(7) <= (DecodedOffset(7) and MWRITEL_H) after DELAY_LOGIC2;
  
  with (replace_low(0)) select
    temp_word0out(7 downto 0) <= word0(7 downto 0) when '0',
                            WordIn(7 downto 0) when '1',
                            "XXXXXXXX" when others;
  
  with (replace_high(0)) select
    temp_word0out(15 downto 8) <= word0(15 downto 8) when '0',
                            WordIn(15 downto 8) when '1',
                            "XXXXXXXX" when others;
  
  with (replace_low(1)) select
    temp_word1out(7 downto 0) <= word1(7 downto 0) when '0',
                            WordIn(7 downto 0) when '1',
                            "XXXXXXXX" when others;
  
  with (replace_high(1)) select
    temp_word1out(15 downto 8) <= word1(15 downto 8) when '0',
                             WordIn(15 downto 8) when '1',
                             "XXXXXXXX" when others;

  with (replace_low(2)) select
    temp_word2out(7 downto 0) <= word2(7 downto 0) when '0',
                            WordIn(7 downto 0) when '1',
                            "XXXXXXXX" when others;
  
  with (replace_high(2)) select
    temp_word2out(15 downto 8) <= word2(15 downto 8) when '0',
                             WordIn(15 downto 8) when '1',
                             "XXXXXXXX" when others;

  with (replace_low(3)) select
    temp_word3out(7 downto 0) <= word3(7 downto 0) when '0',
                            WordIn(7 downto 0) when '1',
                            "XXXXXXXX" when others;
  
  with (replace_high(3)) select
    temp_word3out(15 downto 8) <= word3(15 downto 8) when '0',
                             WordIn(15 downto 8) when '1',
                             "XXXXXXXX" when others;

  with (replace_low(4)) select
    temp_word4out(7 downto 0) <= word4(7 downto 0) when '0',
                            WordIn(7 downto 0) when '1',
                            "XXXXXXXX" when others;
  
  with (replace_high(4)) select
    temp_word4out(15 downto 8) <= word4(15 downto 8) when '0',
                             WordIn(15 downto 8) when '1',
                             "XXXXXXXX" when others;

  with (replace_low(5)) select
    temp_word5out(7 downto 0) <= word5(7 downto 0) when '0',
                            WordIn(7 downto 0) when '1',
                            "XXXXXXXX" when others;
  
  with (replace_high(5)) select
    temp_word5out(15 downto 8) <= word5(15 downto 8) when '0',
                             WordIn(15 downto 8) when '1',
                             "XXXXXXXX" when others;

  with (replace_low(6)) select
    temp_word6out(7 downto 0) <= word6(7 downto 0) when '0',
                            WordIn(7 downto 0) when '1',
                            "XXXXXXXX" when others;
  
  with (replace_high(6)) select
    temp_word6out(15 downto 8) <= word6(15 downto 8) when '0',
                             WordIn(15 downto 8) when '1',
                             "XXXXXXXX" when others;
                             
  with (replace_low(7)) select
    temp_word7out(7 downto 0) <= word7(7 downto 0) when '0',
                            WordIn(7 downto 0) when '1',
                            "XXXXXXXX" when others;
  
  with (replace_high(7)) select
    temp_word7out(15 downto 8) <= word7(15 downto 8) when '0',
                             WordIn(15 downto 8) when '1',
                             "XXXXXXXX" when others;
                             
  word0out <= temp_word0out after DELAY_MUX2;
  word1out <= temp_word1out after DELAY_MUX2;
  word2out <= temp_word2out after DELAY_MUX2;
  word3out <= temp_word3out after DELAY_MUX2;
  word4out <= temp_word4out after DELAY_MUX2;
  word5out <= temp_word5out after DELAY_MUX2;
  word6out <= temp_word6out after DELAY_MUX2;
  word7out <= temp_word7out after DELAY_MUX2;
END ARCHITECTURE untitled;

