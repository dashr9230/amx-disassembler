
CODE 0	; 0
;program exit point
	halt 0

	proc	; OnGameModeInit
	; line 22
	; line 24
	break	; c
	push.c 0
	;$par
	push.c 4
	sysreq.c 0	; SetGameModeText
	stack 8
	;$exp
	; line 25
	break	; 30
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
	sysreq.c 1	; AddPlayerClass
	stack 30
	;$exp
	; line 26
	break	; a4
	const.pri 1
	retn


DATA 0	; 0
dump 42 6c 61 6e 6b 20 53 63 72 69 70 74 0 

CODE 0	; b4
	proc	; OnGameModeExit
	; line 2a
	; line 2b
	break	; b8
	const.pri 1
	retn

	proc	; OnPlayerRequestClass
	; line 2f
	;$lcl classid 10
	;$lcl playerid c
	; line 30
	break	; cc
	push.c 4175fe5d
	;$par
	push.c 44a7e508
	;$par
	push.c 44f4cc1b
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 2	; SetPlayerPos
	stack 14
	;$exp
	; line 31
	break	; 108
	push.c 4175fe5d
	;$par
	push.c 44a7e508
	;$par
	push.c 44f4cc1b
	;$par
	push.s c
	;$par
	push.c 10
	sysreq.c 3	; SetPlayerCameraPos
	stack 14
	;$exp
	; line 32
	break	; 144
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
	sysreq.c 4	; SetPlayerCameraLookAt
	stack 18
	;$exp
	; line 33
	break	; 188
	const.pri 1
	retn

	proc	; OnPlayerConnect
	; line 37
	;$lcl playerid c
	; line 38
	break	; 19c
	const.pri 1
	retn

	proc	; OnPlayerDisconnect
	; line 3c
	;$lcl reason 10
	;$lcl playerid c
	; line 3d
	break	; 1b0
	const.pri 1
	retn

	proc	; OnPlayerSpawn
	; line 41
	;$lcl playerid c
	; line 42
	break	; 1c4
	const.pri 1
	retn

	proc	; OnPlayerDeath
	; line 46
	;$lcl reason 14
	;$lcl killerid 10
	;$lcl playerid c
	; line 47
	break	; 1d8
	const.pri 1
	retn

	proc	; OnVehicleSpawn
	; line 4b
	;$lcl vehicleid c
	; line 4c
	break	; 1ec
	const.pri 1
	retn

	proc	; OnVehicleDeath
	; line 50
	;$lcl killerid 10
	;$lcl vehicleid c
	; line 51
	break	; 200
	const.pri 1
	retn

	proc	; OnPlayerText
	; line 55
	;$lcl text 10
	;$lcl playerid c
	; line 56
	break	; 214
	const.pri 1
	retn

	proc	; OnPlayerCommandText
	; line 5a
	;$lcl cmdtext 10
	;$lcl playerid c
	; line 5b
	break	; 228
	push.c a
	;$par
	push.c 1
	;$par
	push.s 10
	;$par
	push.c 34
	;$par
	push.c 10
	sysreq.c 5	; strcmp
	stack 14
	jnz 0
	;$exp
	; line 5e
	break	; 26c
	const.pri 1
	retn
l.0		; 27c
	; line 60
	break	; 27c
	zero.pri
	retn


DATA 0	; 34
dump 2f 6d 79 63 6f 6d 6d 61 6e 64 0 

CODE 0	; 288
	proc	; OnPlayerEnterVehicle
	; line 64
	;$lcl ispassenger 14
	;$lcl vehicleid 10
	;$lcl playerid c
	; line 65
	break	; 28c
	const.pri 1
	retn

	proc	; OnPlayerExitVehicle
	; line 69
	;$lcl vehicleid 10
	;$lcl playerid c
	; line 6a
	break	; 2a0
	const.pri 1
	retn

	proc	; OnPlayerStateChange
	; line 6e
	;$lcl oldstate 14
	;$lcl newstate 10
	;$lcl playerid c
	; line 6f
	break	; 2b4
	const.pri 1
	retn

	proc	; OnPlayerEnterCheckpoint
	; line 73
	;$lcl playerid c
	; line 74
	break	; 2c8
	const.pri 1
	retn

	proc	; OnPlayerLeaveCheckpoint
	; line 78
	;$lcl playerid c
	; line 79
	break	; 2dc
	const.pri 1
	retn

	proc	; OnPlayerEnterRaceCheckpoint
	; line 7d
	;$lcl playerid c
	; line 7e
	break	; 2f0
	const.pri 1
	retn

	proc	; OnPlayerLeaveRaceCheckpoint
	; line 82
	;$lcl playerid c
	; line 83
	break	; 304
	const.pri 1
	retn

	proc	; OnRconCommand
	; line 87
	;$lcl cmd c
	; line 88
	break	; 318
	const.pri 1
	retn

	proc	; OnPlayerRequestSpawn
	; line 8c
	;$lcl playerid c
	; line 8d
	break	; 32c
	const.pri 1
	retn

	proc	; OnObjectMoved
	; line 91
	;$lcl objectid c
	; line 92
	break	; 340
	const.pri 1
	retn

	proc	; OnPlayerObjectMoved
	; line 96
	;$lcl objectid 10
	;$lcl playerid c
	; line 97
	break	; 354
	const.pri 1
	retn

	proc	; OnPlayerPickUpPickup
	; line 9b
	;$lcl pickupid 10
	;$lcl playerid c
	; line 9c
	break	; 368
	const.pri 1
	retn

	proc	; OnVehicleMod
	; line a0
	;$lcl componentid 14
	;$lcl vehicleid 10
	;$lcl playerid c
	; line a1
	break	; 37c
	const.pri 1
	retn

	proc	; OnVehiclePaintjob
	; line a5
	;$lcl paintjobid 14
	;$lcl vehicleid 10
	;$lcl playerid c
	; line a6
	break	; 390
	const.pri 1
	retn

	proc	; OnVehicleRespray
	; line aa
	;$lcl color2 18
	;$lcl color1 14
	;$lcl vehicleid 10
	;$lcl playerid c
	; line ab
	break	; 3a4
	const.pri 1
	retn

	proc	; OnPlayerSelectedMenuRow
	; line af
	;$lcl row 10
	;$lcl playerid c
	; line b0
	break	; 3b8
	const.pri 1
	retn

	proc	; OnPlayerExitedMenu
	; line b4
	;$lcl playerid c
	; line b5
	break	; 3cc
	const.pri 1
	retn

	proc	; OnPlayerInteriorChange
	; line b9
	;$lcl oldinteriorid 14
	;$lcl newinteriorid 10
	;$lcl playerid c
	; line ba
	break	; 3e0
	const.pri 1
	retn

	proc	; OnPlayerKeyStateChange
	; line be
	;$lcl oldkeys 14
	;$lcl newkeys 10
	;$lcl playerid c
	; line bf
	break	; 3f4
	const.pri 1
	retn

	proc	; OnRconLoginAttempt
	; line c3
	;$lcl success 14
	;$lcl password 10
	;$lcl ip c
	; line c4
	break	; 408
	const.pri 1
	retn

	proc	; OnPlayerUpdate
	; line c8
	;$lcl playerid c
	; line c9
	break	; 41c
	const.pri 1
	retn

	proc	; OnPlayerStreamIn
	; line cd
	;$lcl forplayerid 10
	;$lcl playerid c
	; line ce
	break	; 430
	const.pri 1
	retn

	proc	; OnPlayerStreamOut
	; line d2
	;$lcl forplayerid 10
	;$lcl playerid c
	; line d3
	break	; 444
	const.pri 1
	retn

	proc	; OnVehicleStreamIn
	; line d7
	;$lcl forplayerid 10
	;$lcl vehicleid c
	; line d8
	break	; 458
	const.pri 1
	retn

	proc	; OnVehicleStreamOut
	; line dc
	;$lcl forplayerid 10
	;$lcl vehicleid c
	; line dd
	break	; 46c
	const.pri 1
	retn

	proc	; OnDialogResponse
	; line e1
	;$lcl inputtext 1c
	;$lcl listitem 18
	;$lcl response 14
	;$lcl dialogid 10
	;$lcl playerid c
	; line e2
	break	; 480
	const.pri 1
	retn

	proc	; OnPlayerClickPlayer
	; line e6
	;$lcl source 14
	;$lcl clickedplayerid 10
	;$lcl playerid c
	; line e7
	break	; 494
	const.pri 1
	retn


STKSIZE 1000
