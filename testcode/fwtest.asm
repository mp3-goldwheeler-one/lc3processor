ORIGIN 0
SEGMENT CodeSegment:
START:
	LDR R1, R0, GOOD
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	STR R1, R0, X
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	LDR R4, R0, X
	NOP
	NOP
	NOP
LOOP:
	BRnzp LOOP
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
