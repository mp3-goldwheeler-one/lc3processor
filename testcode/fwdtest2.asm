ORIGIN 0
SEGMENT CodeSegment:
START:
	LEA R0, DataSegment
	AND R6, R6, 0

	; Basic ADD/ADD dep.
	ADD R1, R1, 1
	ADD R1, R1, -1

	BRnp FAIL

	;  Load-use with LDR/ADD.
	LDR R2, R0, SIX
	ADD R2, R2, -6

	BRnp FAIL

	; LDI
	LDI R3, R0, SEVEN_ADDR
	ADD R3, R3, -7

	BRnp FAIL

	; LD/LD with offset 0
	LDR R4, R0, SEVEN_ADDR
	LDR R5, R4, 0
	AND R4, R4, 0
	ADD R5, R5, -7

	BRnp FAIL

	; LD/LD with offset !0
	LDR R4, R0, SEVEN_ADDR
	LDR R5, R4, 1
	AND R4, R4, 0
	ADD R5, R5, -9

	BRnp FAIL

	; STI test
	ADD R6, R6, 10
	STI R6, R0, TEN_ADDR
	ADD R1, R1, 1
	NOP
	NOP
	LDR R7, R0, TEN
	NOP
	NOP
	ADD R7, R7, -10
	; BRnp FAIL
FINISH:
	BRnzp FINISH
FAIL:
	LDR R2, R0, BAD
	BRnzp FAIL

SEGMENT DataSegment:
SIX:
	DATA2 4x0006
SEVEN_ADDR:
	DATA2 SEVEN
SEVEN:
	DATA2 4x0007
NINE:
	DATA2 4x0009
TEN_ADDR:
	DATA2 TEN
TEN:
	DATA2 4x0000 ; To be filled with an STI test
BAD:
	DATA2 4xBAAD
