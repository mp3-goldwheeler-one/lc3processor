--
-- VHDL Architecture ece411.Data_Array.untitled
--
-- Created:
--          by - goldste6.UNKNOWN (linux1.ews.illinois.edu)
--          at - 15:53:49 02/07/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Data_Array_L2 IS
   PORT( 
      reset_l    : IN     std_logic;
      DataWrite  : IN     std_logic;
      Index      : IN     lc3b_l2_c_index;
      DataIn     : IN     LRU_8_Line;
      DataOut    : OUT    LRU_8_Line
   );

-- Declarations

END Data_Array_L2 ;

--
ARCHITECTURE untitled OF Data_Array_L2 IS
  Type DataArray IS array (7 downto 0) of LRU_8_Line;
  signal Data : DataArray;
BEGIN
  --------------------------------------------------------------
  ReadFromDataArray : Process (Data, Index)
  --------------------------------------------------------------
  variable DataIndex : integer;
  begin
    DataIndex := to_integer(unsigned(Index));
    DataOut <= Data(DataIndex) after DELAY_2KB;
  end process ReadFromDataArray;
  
  --------------------------------------------------------------
  WriteToDataArray : Process (Reset_l, Index, DataWrite, DataIn)
  --------------------------------------------------------------
  variable DataIndex : integer;
  begin
    DataIndex := to_integer(unsigned(Index));
    if (reset_l = '0') then
      Data(0) <= "000001010011100101110111";
      Data(1) <= "000001010011100101110111";
      Data(2) <= "000001010011100101110111";
      Data(3) <= "000001010011100101110111";
      Data(4) <= "000001010011100101110111";
      Data(5) <= "000001010011100101110111";
      Data(6) <= "000001010011100101110111";
      Data(7) <= "000001010011100101110111";
    end if;
    if (dataWrite = '1') then
      Data(DataIndex) <= DataIn;
    end if;
  end process WriteToDataArray;
  
END ARCHITECTURE untitled;

