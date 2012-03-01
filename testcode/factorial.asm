;; Program to compute n!, where n is stored in location N
;; R0 is assumed to be 0

;; Main idea:
;; int factorial (int n)
;; {
;;	int result = 1;
;;	for (int i=1; i <= n; i++)
;;	{
;;		// do result *= i.  LC3b does not have a multiply instruction,
;;		// so we must do this by repeated addition.  This algorithm
;;		// is suboptimal and could easily be improved upon.
;;
;;		int r = result;
;;		for (int j=1; j < i; j++)
;;			result += r;
;;	}
;; }

SEGMENT  CodeSegment:

;; R0 is 0
;; R1 is n
;; R2 is result
;; R3 is i
;; R4 is r
;; R5 is j
;; R6 is 1
;; R7 is used as a temporary variable

		; initialization: n, i, and result, as well as R6

		LDR R1, R0, N		; Load n into R1
		LDR R2, R0, ONE		; load 1 into R2, to initialize result
		ADD R6, R2, R0		; load 1 into R6
		ADD R3, R6, R0		; load 1 into R3, to initialize i
	
		; check i <= n
LOOP:		NOT R7, R3		; R7 <= not i
		ADD R7, R7, R6		; R7 <= -i
		ADD R7, R7, R1		; R7 = n - i
		BRn DONE

		; init r and j
		ADD R4, R2, R0		; r = result
		ADD R5, R6, R0		; j = 1

		; check j < i
INNER_LOOP:	NOT R7, R5
		ADD R7, R7, R6		; R7 = -j
		ADD R7, R7, R3		; R7 = i-j
		BRnz INNER_LOOP_END

		ADD R2, R2, R4		; result += r
		ADD R5, R5, R6		; j++
		BRnzp INNER_LOOP

INNER_LOOP_END:	ADD R3, R3, R6		; i++
		BRnzp LOOP

DONE:		BRnzp DONE

N:	DATA2 4x0005
ONE:	DATA2 4x0001
