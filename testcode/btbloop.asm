ORIGIN 0
SEGMENT CodeSegment:
START:
    LEA R0, DataSegment
    ADD R1, R1, 1
    ADD R2, R2, 2
    BRp JSRR_TEST
    BRn PURGATORY                  ; This shouldn't gets committed to the BTB, flushed
JSRR_TEST:
    ADD R1, R1, -1
    ADD R2, R2, -2
    LDR R3, R0, JSRR_PRE_LOC       ; Test JSRR
    BRn PURGATORY
    JSRR R3
EVICTION_TEST:
    ADD R1, R1, -1
    BRp BR_LOC_1
    BRp BR_LOC_2
    BRp BR_LOC_3
    BRp BR_LOC_4
    BRp BR_LOC_5
    BRp BR_LOC_6
    BRp BR_LOC_7
    BRp BR_LOC_8
    ADD R1, R1, 1
    NOP
    NOP
    NOP
    NOP
    NOP
    ADD R7, R3, R3
    LDR R6, R0, GOOD               ; Only thing left in registers is 600D at the end
    ADD R0, R3, R3
PURGATORY:
    BRnzp PURGATORY 

SEGMENT DataSegment:
THREE_ADDR:
    DATA2 THREE
THREE:
    DATA2 4x0003
GOOD:
    DATA2 4x600D
BAAD:
    DATA2 4xBAAD
JSRR_PRE_LOC:
    DATA2 JSRR_LOC
    NOP
    NOP
    NOP
    NOP
    NOP
JSRR_LOC:
    ADD R3, R1, R1
    RET
BR_LOC_1:
    LDR R6, R0, BAAD
    BRnzp PURGATORY
BR_LOC_2:
    LDR R6, R0, BAAD
    BRnzp PURGATORY
BR_LOC_3:
    LDR R6, R0, BAAD
    BRnzp PURGATORY
BR_LOC_4:
    LDR R6, R0, BAAD
    BRnzp PURGATORY
BR_LOC_5:
    LDR R6, R0, BAAD
    BRnzp PURGATORY
BR_LOC_6:
    LDR R6, R0, BAAD
    BRnzp PURGATORY
BR_LOC_7:
    LDR R6, R0, BAAD
    BRnzp PURGATORY
BR_LOC_8:
    LDR R6, R0, BAAD
    BRnzp PURGATORY
