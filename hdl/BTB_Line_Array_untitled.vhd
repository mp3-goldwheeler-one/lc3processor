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

ENTITY BTB_Line_Array IS
  GENERIC( 
     DELAY : Time := DELAY_128B
  );
   PORT( 
      RESET_L    : IN     std_logic;
      DataWrite  : IN     std_logic;
      ReadIndex  : IN     std_logic_vector(3 downto 0);
      WriteIndex : IN     std_logic_vector(3 downto 0);
      DataIn     : IN     btb_line;
      DataOut    : OUT    btb_line
   );

-- Declarations

END BTB_Line_Array ;

--
ARCHITECTURE untitled OF BTB_Line_Array IS
  Type DataArray IS array (15 downto 0) of btb_line;
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
      Data(0) <= default_btb_line;
      Data(1) <= default_btb_line;
      Data(2) <= default_btb_line;
      Data(3) <= default_btb_line;
      Data(4) <= default_btb_line;
      Data(5) <= default_btb_line;
      Data(6) <= default_btb_line;
      Data(7) <= default_btb_line;
      Data(8) <= default_btb_line;
      Data(9) <= default_btb_line;
      Data(10) <= default_btb_line;
      Data(11) <= default_btb_line;
      Data(12) <= default_btb_line;
      Data(13) <= default_btb_line;
      Data(14) <= default_btb_line;
      Data(15) <= default_btb_line;
    end if;
    if (dataWrite = '1') then
      Data(DataIndex) <= DataIn;
    end if;
  end process WriteToDataArray;
  
END ARCHITECTURE untitled;

