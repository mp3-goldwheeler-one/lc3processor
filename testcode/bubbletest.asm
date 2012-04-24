ORIGIN 0
SEGMENT CodeSegment:
START:
	LEA R0, DataSegment			; 0x0000
	AND R6, R6, 0				; 0x0002
	
;----- (*) Data Forwarding (*) -----
	; LDR-X-LDR (zero-offset)
	LDR R1, R0, THREE_ADDR		; 0x0004, R1 <- THREE_ADDR
	; -> 1 bubble inserted in mem_1
	LDR R2, R1, 0				; 0x0006, R2 <- 3
	NOP					; 0x0008
	NOP					; 0x000A
	NOP					; 0x000C
	NOP					; 0x000E
	ADD R1, R6, R6				; 0x0010, R1 <- 0
	ADD R2, R2, -3				; 0x0012, R2 <- 0

	; ADD-X-X-LDR
	LDR R1, R0, SIX				; 0x0014, R1 <- 6
	; -> 2 bubbles inserted in exec and mem_1
	; -> 2 bubbles inserted in exec and mem_1
	ADD R2, R1, R1				; 0x0016, R2 <- 12
	NOP					; 0x0018
	NOP					; 0x001A
	NOP					; 0x001C
	NOP					; 0x001E
	ADD R1, R1, -6				; 0x0020, R1 <- 0
	ADD R2, R2, -12				; 0x0020, R2 <- 0

	; LDR-X-X-LDR (non-zero offset)
	LDR R1, R0, FIVE_ADDR		; 0x0022, R1 <- FIVE_ADDR
	; -> 2 bubbles inserted in exec and mem_1
	; -> 2 bubbles inserted in exec and mem_1
	LDR R2, R1, 1				; 0x0024, R2 <- 6
	NOP					; 0x0026
	NOP					; 0x0028
	NOP					; 0x002A
	NOP					; 0x002C
	ADD R1, R6, R6				; 0x002E, R1 <- 0
	ADD R2, R2, -6				; 0x0030, R2 <- 0
	NOP					; 0x0032
	NOP					; 0x0034
	NOP					; 0x0036
	NOP					; 0x0038

	; STR-X-LDR (zero-offset)
	ADD R2, R2, 4				; 0x003A, R2 <- 4
	LDR R1, R0, STR_1_ADDR		; 0x003C, R1 <- STR_1
	; -> 1 bubble inserted in mem_1
	STR R2, R1, 0				; 0x003E
	NOP					; 0x0040
	BRnzp SKIP_TRAP_TEST			; 0x0042
    TRAP_PRE_LOC:
	DATA2 TRAP_LOC				; 0x0044
    SKIP_TRAP_TEST:
	NOP					; 0x0046
	LDR R1, R0, STR_1			; 0x0048, R1 <- 4
	NOP					; 0x004A
	NOP					; 0x004C
	NOP					; 0x004E
	NOP					; 0x0050
	ADD R1, R1, -4				; 0x0052, R1 <- 0
	ADD R2, R2, -4				; 0x0054, R2 <- 0
	NOP					; 0x0056
	NOP					; 0x0058
	NOP					; 0x005A
	NOP					; 0x005C

	; STR-X-X-LDR (non-zero offset)
	ADD R2, R2, 5				; 0x005E, R2 <- 5
	LDR R1, R0, STR_2_ADDR			; 0x0060, R1 <- STR_2_ADDR
	; -> 2 bubbles inserted in exec and mem_1
	; -> 2 bubbles inserted in exec and mem_1
	STR R2, R1, 1				; 0x0062
	NOP					; 0x0064
	NOP					; 0x0066
	NOP					; 0x0068
	NOP					; 0x006A
	LDR R1, R0, STR_2_2			; 0x006C, R1 <- 5
	NOP					; 0x006E
	NOP					; 0x0070
	NOP					; 0x0072
	NOP					; 0x0074
	ADD R1, R1, -5				; 0x0076, R1 <- 0
	ADD R2, R2, -5				; 0x0078, R2 <- 0
	NOP					; 0x007A
	NOP					; 0x007C
	NOP					; 0x007E
	NOP					; 0x0080

;----- (*) Condition Code Forwarding (*) -----
	; BR-X-X-LDR
	LDR R1, R0, NINE			; 0x008A
	; -> 2 bubbles inserted in exec and mem_1
	; -> 2 bubbles inserted in exec and mem_1
	BRnz PURGATORY				; 0x008C
	NOP					; 0x008E
	NOP					; 0x0090
	NOP					; 0x0092
	NOP					; 0x0094
	ADD R1, R1, -9				; 0x0096

;----- (*) Control Instruction Data Forwarding (*) -----
	; JSRR-X-X-LDR
	LDR R1, R0, JSRR_PRE_LOC		; 0x0098, R1 <- JSRR_PRE_LOC
	; -> 2 bubbles inserted in exec and mem_1
	; -> 2 bubbles inserted in exec and mem_1
	JSRR R1					; 0x009A
	NOP					; 0x009C
	NOP					; 0x009E
	NOP					; 0x00A0
	NOP					; 0x00A2
	ADD R1, R6, R6				; 0x00A4, R1 <- 0
	ADD R2, R2, -11				; 0x00A4, R2 <- 0
	ADD R7, R6, R6				; 0x00A6
	NOP					; 0x00A8
	NOP					; 0x00AA
	NOP					; 0x00AC
	BRnzp JMP_TEST				; 0x00AE
    JSRR_LOC:
	ADD R2, R2, 11				; 0x00B0, R2 <- 11
	RET					; 0x00B2
	NOP					; 0x00B4
	NOP					; 0x00B6

JMP_TEST:
	LDR R1, R0, JMP_PRE_LOC			; 0x00B8, R1 <- JMP_PRE_LOC
	; -> 2 bubbles inserted in exec and mem_1
	; -> 2 bubbles inserted in exec and mem_1
	JMP R1					; 0x00BA
	NOP					; 0x00BC
	NOP					; 0x00BE
	NOP					; 0x00C0
	ADD R3, R3, 14				; 0x00C2, SHOULD NEVER RUN
    JMP_LOC:
	NOP					; 0x00C4
	NOP					; 0x00C6
	ADD R1, R6, R6				; 0x00C8, R1 <- 0
	NOP					; 0x00CA
	NOP					; 0x00CC
	NOP					; 0x00CE
	NOP					; 0x00D0

;----- (*) TRAP Forwarding (*) -----
	LDR R1, R0, THREE			; 0x00D2, R1 <- 3
	TRAP TRAP_PRE_LOC			; 0x00D4
	NOP					; 0x00D6
	NOP					; 0x00D8
	NOP					; 0x00DA
	BRnzp AFTER_TRAP			; 0x00DC
    TRAP_LOC:
	ADD R2, R2, 13				; 0x00DE
	RET					; 0x00E0
	NOP					; 0x00E2
    AFTER_TRAP:
	ADD R1, R6, R6				; 0x00E4, R1 <- 0
	ADD R2, R2, -13				; 0x00E6, R2 <- 0
	ADD R1, R7, R7				; 0x00E8, R7 <- 0
	NOP					; 0x00EA
	NOP					; 0x00EC
	NOP					; 0x00EE
	NOP					; 0x00F0
	
PURGATORY:
	BRnzp PURGATORY

SEGMENT DataSegment:
THREE_ADDR:
	DATA2 THREE
THREE:
	DATA2 4x0003
FIVE_ADDR:
	DATA2 FIVE
FIVE:
	DATA2 4x0005
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
ELEVEN_ADDR:
	DATA2 ELEVEN
ELEVEN:
	DATA2 4x000B
STR_1_ADDR:
	DATA2 STR_1
STR_1:
	DATA2 4x0000
STR_2_ADDR:
	DATA2 STR_2_1
STR_2_1:
	DATA2 4xBAAD
STR_2_2:
	DATA2 4xBADD
JSRR_PRE_LOC:
	DATA2 JSRR_LOC 
JMP_PRE_LOC:
	DATA2 JMP_LOC
BAD:
	DATA2 4xBAAD
