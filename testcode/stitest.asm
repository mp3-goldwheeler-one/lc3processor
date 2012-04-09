ORIGIN 0
SEGMENT CodeSegment:
START:
	ADD R1, R1, 2
	; ADD R2, R2, -3
	; LDI R6, R7, GOOD
	; ADD R0, R6, 2
	; LDR R3, R7, GOOD2
	; LDI R5, R3, 1
	; ADD R5, R5, -1
	STI R1, R0, X
	; LDR R6, R0, X
	; STR R1, R6, 0
	LDI R4, R0, X
	NOP
	NOP
	NOP
	BRnzp START
	NOP
	NOP
	NOP
	NOP
	NOP
X: DATA2 Y
Y: DATA2 4xBAAD
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
