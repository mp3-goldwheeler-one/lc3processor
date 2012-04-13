SEGMENT CodeSegment:
        ADD R1, R1, -1
        BRn take
fail:   LDR R7, R0, BAD
        NOP
take:
        BRp fail
        ADD R1, R1, 2
        BRp keepgoing
        LDR R7, R0, BAD
        NOP

sub2:   Data2 trap_subroutine

keepgoing:
        LDR R3, R0, negative_two
        BRn onward
        LDR R7, R0, BAD
onward:
        JSR subroutine
        ADD R6, R6, 5
        TRAP sub2
        BRnzp continue

subroutine:
        ADD R6, R6, 4
        RET
        LDR R7, R0, BAD
        NOP

trap_subroutine:
        ADD R5, R5, 3
        RET
        NOP

continue:
        BRnzp continue

BAD:            Data2 4x0BAD
negative_two:   Data2 4xFFFE

