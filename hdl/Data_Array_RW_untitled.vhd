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

ENTITY Data_Array_RW IS
   GENERIC( 
      N     : Integer;
      DELAY : Time := DELAY_256B;
      INDEX_LEN : Integer := 3
   );
   PORT( 
      RESET_L    : IN     std_logic;
      DataWrite  : IN     std_logic;
      ReadIndex  : IN     std_logic_vector(INDEX_LEN-1 downto 0);
      WriteIndex : IN     std_logic_vector(INDEX_LEN-1 downto 0);
      DataIn     : IN     std_logic_vector (N-1 DOWNTO 0);
      DataOut    : OUT    std_logic_vector (N-1 DOWNTO 0)
   );

-- Declarations

END Data_Array_RW ;

--
ARCHITECTURE untitled OF Data_Array_RW IS
  Type DataArray IS array (2**INDEX_LEN-1 downto 0) of std_logic_vector(N-1 downto 0);
  signal Data : DataArray;
BEGIN
  --------------------------------------------------------------
  ReadFromDataArray : Process (Data, ReadIndex)
  --------------------------------------------------------------
  variable DataIndex : integer;
  begin
    DataIndex := to_integer(unsigned(ReadIndex));
    DataOut <= Data(DataIndex) after DELAY;
  end process ReadFromDataArray;
  
  --------------------------------------------------------------
  WriteToDataArray : Process (Reset_l, WriteIndex, DataWrite, DataIn)
  --------------------------------------------------------------
  variable DataIndex : integer;
  begin
    DataIndex := to_integer(unsigned(WriteIndex));
    if (reset_l = '0') then
      for i in 0 to 2**INDEX_LEN-1 loop
        Data(i) <= (Others => 'X');
      end loop;
    end if;
    if (dataWrite = '1') then
      Data(DataIndex) <= DataIn;
    end if;
  end process WriteToDataArray;
  
END ARCHITECTURE untitled;

