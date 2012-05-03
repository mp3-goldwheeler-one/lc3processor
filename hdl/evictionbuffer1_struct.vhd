-- VHDL Entity ece411.EvictionBuffer1.interface
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY EvictionBuffer1 IS
   PORT( 
      CacheDataOut           : IN     LC3b_pword;
      WBAddress              : IN     LC3b_word;
      clk                    : IN     std_logic;
      load_evict_buffer      : IN     std_logic;
      reset_l                : IN     STD_LOGIC;
      set_evict_buffer_valid : IN     std_logic;
      PMDATAOUT              : OUT    LC3B_PWORD;
      evict_buffer_valid     : OUT    std_logic;
      evicted_address        : OUT    LC3b_word
   );

-- Declarations

END EvictionBuffer1 ;

--
-- VHDL Architecture ece411.EvictionBuffer1.struct
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY ece411;
LIBRARY mp3lib;

ARCHITECTURE struct OF EvictionBuffer1 IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL en_valid : STD_LOGIC;


   -- Component Declarations
   COMPONENT Reg_256
   PORT (
      Clk     : IN     std_logic ;
      Data    : IN     LC3b_pword ;
      Write   : IN     std_logic ;
      DataOut : OUT    LC3b_pword 
   );
   END COMPONENT;
   COMPONENT REG1
   PORT (
      RESET_L : IN     STD_LOGIC ;
      A       : IN     STD_LOGIC ;
      EN      : IN     STD_LOGIC ;
      CLK     : IN     STD_LOGIC ;
      F       : OUT    STD_LOGIC 
   );
   END COMPONENT;
   COMPONENT REG16
   PORT (
      RESET_L : IN     STD_LOGIC ;
      A       : IN     STD_LOGIC_VECTOR (15 DOWNTO 0);
      EN      : IN     STD_LOGIC ;
      CLK     : IN     STD_LOGIC ;
      F       : OUT    STD_LOGIC_VECTOR (15 DOWNTO 0)
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : REG1 USE ENTITY mp3lib.REG1;
   FOR ALL : REG16 USE ENTITY mp3lib.REG16;
   FOR ALL : Reg_256 USE ENTITY ece411.Reg_256;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 2 eb2
   --Always enable valid bit
   en_valid <= '1';                                       


   -- Instance port mappings.
   U_1 : Reg_256
      PORT MAP (
         Clk     => clk,
         Data    => CacheDataOut,
         Write   => load_evict_buffer,
         DataOut => PMDATAOUT
      );
   U_0 : REG1
      PORT MAP (
         RESET_L => reset_l,
         A       => set_evict_buffer_valid,
         EN      => en_valid,
         CLK     => clk,
         F       => evict_buffer_valid
      );
   U_10 : REG16
      PORT MAP (
         RESET_L => reset_l,
         A       => WBAddress,
         EN      => load_evict_buffer,
         CLK     => clk,
         F       => evicted_address
      );

END struct;