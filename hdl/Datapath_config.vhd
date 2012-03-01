-- Generation properties:
--   Format              : hierarchical
--   Generic mappings    : exclude
--   Leaf-level entities : direct binding
--   Regular libraries   : use library name
--   View name           : include
--   
library ece411;
configuration Datapath_config of Datapath is
   for struct
      for all : ADJ6
         use entity ece411.ADJ6(untitled);
      end for;
      for all : ADJ9
         use entity ece411.ADJ9(untitled);
      end for;
      for all : ALU
         use entity ece411.ALU(untitled);
      end for;
      for all : BRadd
         use entity ece411.BRadd(untitled);
      end for;
      for all : GenCC
         use entity ece411.GenCC(untitled);
      end for;
      for all : IR
         use entity ece411.IR(untitled);
      end for;
      for all : NZP
         use entity ece411.NZP(untitled);
      end for;
      for all : NZPsplit
         use entity ece411.NZPsplit(untitled);
      end for;
      for all : Plus2
         use entity ece411.Plus2(untitled);
      end for;
      for all : Reg16
         use entity ece411.Reg16(untitled);
      end for;
      for all : RegFile
         use entity ece411.RegFile(untitled);
      end for;
      for all : StoreMux
         use entity ece411.StoreMux(untitled);
      end for;
      for all : WordMux2
         use entity ece411.WordMux2(untitled);
      end for;
   end for;
end Datapath_config;
