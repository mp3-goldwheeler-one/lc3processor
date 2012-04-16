--
-- VHDL Architecture ece411.Bit_Array.untitled
--
-- Created:
--          by - goldste6.UNKNOWN (linux1.ews.illinois.edu)
--          at - 16:23:01 02/07/12
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Bit_Array_RW IS
   PORT( 
      RESET_L    : IN     std_logic;
      DataWrite  : IN     std_logic;
      ReadIndex  : IN     LC3b_c_index;
      WriteIndex : IN     LC3b_c_index;
      DataIn     : IN     std_logic;
      DataOut    : OUT    std_logic
   );

-- Declarations

END Bit_Array_RW ;

--
ARCHITECTURE untitled OF Bit_Array_RW IS
  Type DataArray IS array (7 downto 0) of std_logic;
  signal Data : DataArray;
BEGIN
  --------------------------------------------------------------
  ReadFromDataArray : Process (Data, ReadIndex)
  --------------------------------------------------------------
  variable DataIndex : integer;
  begin
    DataIndex := to_integer(unsigned(ReadIndex));
    DataOut <= Data(DataIndex) after DELAY_256B;
  end process ReadFromDataArray;
  
  --------------------------------------------------------------
  WriteToDataArray : Process (Reset_l, WriteIndex, DataWrite, DataIn)
  --------------------------------------------------------------
  variable DataIndex : integer;
  begin
    DataIndex := to_integer(unsigned(WriteIndex));
    if (reset_l = '0') then
      Data(0) <= '0';
      Data(1) <= '0';
      Data(2) <= '0';
      Data(3) <= '0';
      Data(4) <= '0';
      Data(5) <= '0';
      Data(6) <= '0';
      Data(7) <= '0';
    end if;
    if (dataWrite = '1') then
      Data(DataIndex) <= DataIn;
    end if;
  end process WriteToDataArray;
  
END ARCHITECTURE untitled;

