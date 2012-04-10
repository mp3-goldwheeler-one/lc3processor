ORIGIN 0
SEGMENT CodeSegment:
ADD R2, R2, 2
ADD R3, R3, 3
NOP
NOP
NOP
NOP
NOP
NOP
; ; Test LDB, STB
ldb r6, r0, LowByte ;0
;MAR <= 8
;MDR <= (M[8] = 4x600D)
;R6 <= 4x00 & 4x0D
ldb r7, r0, HighByte ;2
;MAR <= 8 or 9
;MDR <= (M[8] = 4x600D)
;R7 <= 4x00 & 4x60
stb r6, r0, LowSByte ;4
;MAR <= 10
;MDR <= 4xXX & (R6(7:0) = 4x0D)
;*only* MWRITEL_L is active (=0).
;M[10] <= 4x0D
stb r7, r0, HighSByte ;6
;MAR <= 10 or 11
;MDR <= (R7(7:0) = 4x60) & 4xXX
;*only* MWRITEH_L is active (=0).
;M[11] <= 4x60
LowByte: DATA1 4x0D ;8
HighByte: DATA1 4x60 ;9
LowSByte: DATA1 ? ;10
HighSByte: DATA1 ? ;11

