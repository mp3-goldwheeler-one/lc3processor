ORIGIN 0
SEGMENT CodeSegment:
	ADD R5, R5, 10
START:
    ADD R1, R1, 2
    ADD R2, R2, -3
    ADD R3, R3, 4
    ADD R4, R4, 5
	ADD R5, R5, -1
	BRp START
	ADD R7, R7, 1
	BRnzp -1
	NOP
	NOP
	NOP
	NOP
	NOP