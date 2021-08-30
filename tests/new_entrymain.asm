
CODE 0	; 0
;program exit point
	halt 0

	proc	; entry
	; line 19
	; line 1a
	break	; c
	push.c 0
	;$par
	push.c 4
	sysreq.c 0	; print
	stack 8
	;$exp
	zero.pri
	ret


DATA 0	; 0
dump 41 41 41 41 41 41 41 41 41 41 41 41 41 41 41 0 

CODE 0	; 38
	proc	; main
	; line 1e
	; line 1f
	break	; 3c
	push.c 40
	;$par
	push.c 4
	sysreq.c 0	; print
	stack 8
	;$exp
	; line 20
	break	; 60
	push.c d0
	;$par
	push.c 4
	sysreq.c 0	; print
	stack 8
	;$exp
	; line 21
	break	; 84
	push.c 158
	;$par
	push.c 4
	sysreq.c 0	; print
	stack 8
	;$exp
	zero.pri
	retn


DATA 0	; 40
dump a 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 
dump 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 
dump 2d 2d 2d 0 20 42 6c 61 6e 6b 20 47 61 6d 65 6d 
dump 6f 64 65 20 62 79 20 79 6f 75 72 20 6e 61 6d 65 
dump 20 68 65 72 65 0 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 
dump 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 2d 
dump 2d 2d 2d 2d 2d 2d 2d 2d a 0 

CODE 0	; b0
	proc	; OnGameModeInit
	; line 27
	; line 29
	break	; b4
	push.c 1e8
	;$par
	push.c 4
	sysreq.c 1	; SetGameModeText
	stack 8
	;$exp
	; line 2a
	break	; d8
	push.c 0
	;$par
	push.c 0
	;$par
	push.c 0
	;$par
	push.c 0
	;$par
	push.c 0
	;$par
	push.c 0
	;$par
	push.c 4386923d
	;$par
	push.c 4175fe5d
	;$par
	push.c 44a7e508
	;$par
	push.c 44f4cc1b
	;$par
	push.c 0
	;$par
	push.c 2c
	sysreq.c 2	; AddPlayerClass
	stack 30
	;$exp
	; line 2b
	break	; 14c
	const.pri 1
	retn


DATA 0	; 1e8
dump 42 6c 61 6e 6b 20 53 63 72 69 70 74 0 

CODE 0	; 15c
	proc	; OnGameModeExit
	; line 2f
	; line 30
	break	; 160
	const.pri 1
	retn

	proc	; OnPlayerRequestClass
	; line 34
	;$lcl classid 10
	;$lcl playerid c
	; line 35
	break	; 174
	push.c 4175fe5d
	;$par
	push.c 44a7e508
	;$par
	push.c 44f4cc1b
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 3	; SetPlayerPos
	stack 14
	;$exp
	; line 36
	break	; 1b0
	push.c 4175fe5d
	;$par
	push.c 44a7e508
	;$par
	push.c 44f4cc1b
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 4	; SetPlayerCameraPos
	stack 14
	;$exp
	; line 37
	break	; 1ec
	push.c 2
	;$par
	push.c 4175fe5d
	;$par
	push.c 44a7e508
	;$par
	push.c 44f4cc1b
	;$par
	push.s c
	;$par
	push.c 14
	sysreq.c 5	; SetPlayerCameraLookAt
	stack 18
	;$exp
	; line 38
	break	; 230
	const.pri 1
	retn

	proc	; OnPlayerConnect
	; line 3c
	;$lcl playerid c
	; line 3d
	break	; 244
	const.pri 1
	retn

	proc	; OnPlayerDisconnect
	; line 41
	;$lcl reason 10
	;$lcl playerid c
	; line 42
	break	; 258
	const.pri 1
	retn

	proc	; OnPlayerSpawn
	; line 46
	;$lcl playerid c
	; line 47
	break	; 26c
	const.pri 1
	retn

	proc	; OnPlayerDeath
	; line 4b
	;$lcl reason 14
	;$lcl killerid 10
	;$lcl playerid c
	; line 4c
	break	; 280
	const.pri 1
	retn

	proc	; OnVehicleSpawn
	; line 50
	;$lcl vehicleid c
	; line 51
	break	; 294
	const.pri 1
	retn

	proc	; OnVehicleDeath
	; line 55
	;$lcl killerid 10
	;$lcl vehicleid c
	; line 56
	break	; 2a8
	const.pri 1
	retn

	proc	; OnPlayerText
	; line 5a
	;$lcl text 10
	;$lcl playerid c
	; line 5b
	break	; 2bc
	const.pri 1
	retn

	proc	; OnPlayerCommandText
	; line 5f
	;$lcl cmdtext 10
	;$lcl playerid c
	; line 60
	break	; 2d0
	push.c a
	;$par
	push.c 1
	;$par
	push.s 10
	;$par
	push.c 21c
	;$par
	push.c 10
	sysreq.c 6	; strcmp
	stack 14
	jnz 0
	;$exp
	; line 63
	break	; 314
	const.pri 1
	retn
l.0		; 324
	; line 65
	break	; 324
	zero.pri
	retn


DATA 0	; 21c
dump 2f 6d 79 63 6f 6d 6d 61 6e 64 0 

CODE 0	; 330
	proc	; OnPlayerEnterVehicle
	; line 69
	;$lcl ispassenger 14
	;$lcl vehicleid 10
	;$lcl playerid c
	; line 6a
	break	; 334
	const.pri 1
	retn

	proc	; OnPlayerExitVehicle
	; line 6e
	;$lcl vehicleid 10
	;$lcl playerid c
	; line 6f
	break	; 348
	const.pri 1
	retn

	proc	; OnPlayerStateChange
	; line 73
	;$lcl oldstate 14
	;$lcl newstate 10
	;$lcl playerid c
	; line 74
	break	; 35c
	const.pri 1
	retn

	proc	; OnPlayerEnterCheckpoint
	; line 78
	;$lcl playerid c
	; line 79
	break	; 370
	const.pri 1
	retn

	proc	; OnPlayerLeaveCheckpoint
	; line 7d
	;$lcl playerid c
	; line 7e
	break	; 384
	const.pri 1
	retn

	proc	; OnPlayerEnterRaceCheckpoint
	; line 82
	;$lcl playerid c
	; line 83
	break	; 398
	const.pri 1
	retn

	proc	; OnPlayerLeaveRaceCheckpoint
	; line 87
	;$lcl playerid c
	; line 88
	break	; 3ac
	const.pri 1
	retn

	proc	; OnRconCommand
	; line 8c
	;$lcl cmd c
	; line 8d
	break	; 3c0
	const.pri 1
	retn

	proc	; OnPlayerRequestSpawn
	; line 91
	;$lcl playerid c
	; line 92
	break	; 3d4
	const.pri 1
	retn

	proc	; OnObjectMoved
	; line 96
	;$lcl objectid c
	; line 97
	break	; 3e8
	const.pri 1
	retn

	proc	; OnPlayerObjectMoved
	; line 9b
	;$lcl objectid 10
	;$lcl playerid c
	; line 9c
	break	; 3fc
	const.pri 1
	retn

	proc	; OnPlayerPickUpPickup
	; line a0
	;$lcl pickupid 10
	;$lcl playerid c
	; line a1
	break	; 410
	const.pri 1
	retn

	proc	; OnVehicleMod
	; line a5
	;$lcl componentid 14
	;$lcl vehicleid 10
	;$lcl playerid c
	; line a6
	break	; 424
	const.pri 1
	retn

	proc	; OnVehiclePaintjob
	; line aa
	;$lcl paintjobid 14
	;$lcl vehicleid 10
	;$lcl playerid c
	; line ab
	break	; 438
	const.pri 1
	retn

	proc	; OnVehicleRespray
	; line af
	;$lcl color2 18
	;$lcl color1 14
	;$lcl vehicleid 10
	;$lcl playerid c
	; line b0
	break	; 44c
	const.pri 1
	retn

	proc	; OnPlayerSelectedMenuRow
	; line b4
	;$lcl row 10
	;$lcl playerid c
	; line b5
	break	; 460
	const.pri 1
	retn

	proc	; OnPlayerExitedMenu
	; line b9
	;$lcl playerid c
	; line ba
	break	; 474
	const.pri 1
	retn

	proc	; OnPlayerInteriorChange
	; line be
	;$lcl oldinteriorid 14
	;$lcl newinteriorid 10
	;$lcl playerid c
	; line bf
	break	; 488
	const.pri 1
	retn

	proc	; OnPlayerKeyStateChange
	; line c3
	;$lcl oldkeys 14
	;$lcl newkeys 10
	;$lcl playerid c
	; line c4
	break	; 49c
	const.pri 1
	retn

	proc	; OnRconLoginAttempt
	; line c8
	;$lcl success 14
	;$lcl password 10
	;$lcl ip c
	; line c9
	break	; 4b0
	const.pri 1
	retn

	proc	; OnPlayerUpdate
	; line cd
	;$lcl playerid c
	; line ce
	break	; 4c4
	const.pri 1
	retn

	proc	; OnPlayerStreamIn
	; line d2
	;$lcl forplayerid 10
	;$lcl playerid c
	; line d3
	break	; 4d8
	const.pri 1
	retn

	proc	; OnPlayerStreamOut
	; line d7
	;$lcl forplayerid 10
	;$lcl playerid c
	; line d8
	break	; 4ec
	const.pri 1
	retn

	proc	; OnVehicleStreamIn
	; line dc
	;$lcl forplayerid 10
	;$lcl vehicleid c
	; line dd
	break	; 500
	const.pri 1
	retn

	proc	; OnVehicleStreamOut
	; line e1
	;$lcl forplayerid 10
	;$lcl vehicleid c
	; line e2
	break	; 514
	const.pri 1
	retn

	proc	; OnDialogResponse
	; line e6
	;$lcl inputtext 1c
	;$lcl listitem 18
	;$lcl response 14
	;$lcl dialogid 10
	;$lcl playerid c
	; line e7
	break	; 528
	const.pri 1
	retn

	proc	; OnPlayerClickPlayer
	; line eb
	;$lcl source 14
	;$lcl clickedplayerid 10
	;$lcl playerid c
	; line ec
	break	; 53c
	const.pri 1
	retn


STKSIZE 1000
