ORIGIN 0
SEGMENT CodeSegment:
BOOT:
    BRnzp START
    NOP
    NOP
    NOP
    NOP
    NOP
START:
    LDR R5, R0, GOOD
	NOP
	ADD R6, R5, 1
	NOP
	NOP
	NOP
	LDR R1, R0, GOOD
    ADD R1, R1, 2
    ADD R2, R2, -3
    ADD R3, R3, 4
    ADD R4, R4, 5
	NOP
	NOP
	NOP
	BRp START
	NOP
	NOP
	NOP
	NOP
	NOP
GOOD: DATA2 4x600D
X: DATA2 4xBAAD
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
