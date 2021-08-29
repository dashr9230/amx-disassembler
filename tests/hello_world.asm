
CODE 0	; 0
;program exit point
	halt 0

	proc	; main
	; line 2
	zero.pri
	retn

	proc	; OnGameModeInit
	; line 4
	; line 5
	break	; 18
	push.c 0
	;$par
	push.c 4
	sysreq.c 0	; print
	stack 8
	;$exp
	; line 6
	break	; 3c
	const.pri c
	retn


DATA 0	; 0
dump 48 65 6c 6c 6f 20 57 6f 72 6c 64 21 0 

STKSIZE 1000
