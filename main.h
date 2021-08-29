
#pragma once

#include <stdio.h>
#include <stdint.h>
#include <assert.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#define AMX_COMPACTMARGIN 64
#define AMX_USERNUM 4
#define AMXAPI __cdecl

#define PACKED
#define _FAR

typedef int cell;
typedef unsigned int ucell;

typedef int (AMXAPI* AMX_CALLBACK)(struct tagAMX* amx, cell index,
	cell* result, cell* params);
typedef int (AMXAPI* AMX_DEBUG)(struct tagAMX* amx);

typedef struct tagAMX_HEADER {
	int32_t size          PACKED;
	uint16_t magic        PACKED;
	char    file_version  PACKED;
	char    amx_version   PACKED;
	int16_t flags         PACKED;
	int16_t defsize       PACKED;
	int32_t cod           PACKED;
	int32_t dat           PACKED;
	int32_t hea           PACKED;
	int32_t stp           PACKED;
	int32_t cip           PACKED;
	int32_t publics       PACKED;
	int32_t natives       PACKED;
	int32_t libraries     PACKED;
	int32_t pubvars       PACKED;
	int32_t tags          PACKED;
	int32_t nametable     PACKED;
} PACKED AMX_HEADER;

typedef struct tagAMX {
	unsigned char _FAR* base PACKED;
	unsigned char _FAR* data PACKED;
	AMX_CALLBACK callback PACKED;
	AMX_DEBUG debug       PACKED;
	cell cip              PACKED;
	cell frm              PACKED;
	cell hea              PACKED;
	cell hlw              PACKED;
	cell stk              PACKED;
	cell stp              PACKED;
	int flags             PACKED;
	long usertags[AMX_USERNUM] PACKED;
	void _FAR* userdata[AMX_USERNUM] PACKED;
	int error             PACKED;
	int paramcount;
	cell pri              PACKED;
	cell alt              PACKED;
	cell reset_stk        PACKED;
	cell reset_hea        PACKED;
	cell sysreq_d         PACKED;
#if defined JIT
	int reloc_size      PACKED;
	long code_size      PACKED;
#endif
} PACKED AMX;

#define NUMENTRIES(hdr,field,nextfield) \
	(unsigned)(((hdr)->nextfield - (hdr)->field) / (hdr)->defsize)

struct {
	const char* name;
	int flag;
} OPCODES[] = { // TODO: find out which instruction has additional parameter(s)
	{"none",0},
	{"load.pri",0},
	{"load.alt",0},
	{"load.s.pri",0},
	{"load.s.alt",0},
	{"lref.pri",0},
	{"lref.alt",0},
	{"lref.s.pri",0},
	{"lref.s.alt",0},
	{"load.i",0},
	{"lodb.i",0},
	{"const.pri",1},
	{"const.alt",0},
	{"addr.pri",0},
	{"addr.alt",0},
	{"stor.pri",0},
	{"stor.alt",0},
	{"stor.s.pri",0},
	{"stor.s.alt",0},
	{"sref.pri",0},
	{"sref.alt",0},
	{"sref.s.pri",0},
	{"sref.s.alt",0},
	{"stor.i",0},
	{"strb.i",0},
	{"lidx",0},
	{"lidx.b",0},
	{"idxaddr",0},
	{"idxaddr.b",0},
	{"align.pri",0},
	{"align.alt",0},
	{"lctrl",0},
	{"sctrl",0},
	{"move.pri",0},
	{"move.alt",0},
	{"xchg",0},
	{"push.pri",0},
	{"push.alt",0},
	{"push.r",0},
	{"push.c",1},
	{"push",0},
	{"push.s",0},
	{"pop.pri",0},
	{"pop.alt",0},
	{"stack",1},
	{"heap",0},
	{"proc",0},
	{"ret",0},
	{"retn",0},
	{"call",0},
	{"call.pri",0},
	{"jump",0},
	{"jrel",0},
	{"jzer",0},
	{"jnz",0},
	{"jeq",0},
	{"jneq",0},
	{"jless",0},
	{"jleq",0},
	{"jgrtr",0},
	{"jgeq",0},
	{"jsless",0},
	{"jsleq",0},
	{"jsgrtr",0},
	{"jsgeq",0},
	{"shl",0},
	{"shr",0},
	{"sshr",0},
	{"shl.c.pri",0},
	{"shl.c.alt",0},
	{"shr.c.pri",0},
	{"shr.c.alt",0},
	{"smul",0},
	{"sdiv",0},
	{"sdiv.alt",0},
	{"umul",0},
	{"udiv",0},
	{"udiv.alt",0},
	{"add",0},
	{"sub",0},
	{"sub.alt",0},
	{"and",0},
	{"or",0},
	{"xor",0},
	{"not",0},
	{"neg",0},
	{"invert",0},
	{"add.c",0},
	{"smul.c",0},
	{"zero.pri",0},
	{"zero.alt",0},
	{"zero",0},
	{"zero.s",0},
	{"sign.pri",0},
	{"sign.alt",0},
	{"eq",0},
	{"neq",0},
	{"less",0},
	{"leq",0},
	{"grtr",0},
	{"geq",0},
	{"sless",0},
	{"sleq",0},
	{"sgrtr",0},
	{"sgeq",0},
	{"eq.c.pri",0},
	{"eq.c.alt",0},
	{"inc.pri",0},
	{"inc.alt",0},
	{"inc",0},
	{"inc.s",0},
	{"inc.i",0},
	{"dec.pri",0},
	{"dec.alt",0},
	{"dec",0},
	{"dec.s",0},
	{"dec.i",0},
	{"movs",0},
	{"cmps",0},
	{"fill",0},
	{"halt",1},
	{"bounds",0},
	{"sysreq.pri",0},
	{"sysreq.c",1},
	{"file",0},
	{"line",0},
	{"symbol",0},
	{"srange",0},
	{"jump.pri",0},
	{"switch",0},
	{"casetbl",0},
	{"swap.pri",0},
	{"swap.alt",0},
	{"pushaddr",0},
	{"nop",0},
	{"sysreq.d",0},
	{"symtag",0},
	{"break",0},
};