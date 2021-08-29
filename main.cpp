
#include "main.h"

bool printable(unsigned char b)
{
	//return (0x20 < b);
	return isprint((int)b);
}

void hexdump(unsigned char* block, int size)
{
	int row=0;
	unsigned char byte;
	int x, i = 0;

	printf("\n");

	while (true)
	{
		// stop the infinite loop if there's no bytes to print
		if (size < i)
			break;

		// print the address
		printf("%08X    ", row);

		// print next 8 bytes from the block in the line
		for (x = 0; x != 8; x++) {
			byte = (x + i < size) ? block[x + i] : 0x00;
			printf("%02X ", byte);
		}

		printf("  "); // seperator for the next column

		// print the another next 8 bytes from the block in the line
		for (x = 0; x != 8; x++) {
			byte = (x + i < size) ? block[x + i] : 0x00;
			printf("%02X ", byte);
		}

		printf("    "); // seperating the bytes column with the next ASCII column

		// now print the 16 bytes as characters
		// if we hit the size, print '.' instead
		for (x = 0; x != 16; x++)
		{
			byte = (printable(block[x+i]) && x + i < size) ? block[x + i] : '.';
			printf("%c", byte);
		}

		printf("\n"); // done with the row, starting a new line

		// add 16 bytes as offset, so we can print the next bytes for the next line
		i += 16;
		row += 16;
	}
}

void bytedump(unsigned char* block, int size)
{
	// printing bytes from the given AMX file
	printf("\n--- BLOCK START ---\n");
	for (int i = 0; i < size; i++)
		printf("%02X ", block[i]);
	printf("\n--- BLOCK END ---\n");
}

char* getflags(int flag)
{
	struct {
		const char* name;
		int flag;
	} _flags[] = {
		{"CHAR16",	0x01},
		{"DEBUG",	0x02},
		{"COMPACT", 0x04},
		{"BYTEOPC",	0x08},
		{"NOCHECKS",0x10},
		{"NTVREG",	0x1000},
		{"JITC",	0x2000},
		{"BROWSE",	0x4000},
		{"RELOC",	0x8000}
	};

	char flag_names[100];
	memset(flag_names, 0, sizeof(flag_names));

	if (flag == 0)
	{
		strcpy(flag_names, "(nothing)");
		return flag_names;
	}

	bool next = false;
	for (int i = 0; i < 9; i++)
	{
		if ((_flags[i].flag & flag) != 0)
		{
			if (next)
				strcat(flag_names, ", ");
			strcat(flag_names, _flags[i].name);
			next = true;
		}
	}

	return flag_names;
}

void headerinfodump(AMX_HEADER* hdr)
{
	printf(
		"Header info:\n"
		"  Size: %d\n"
		"  Magic: 0x%X (%d)\n"
		"  File version: %d\n"
		"  AMX version: %d\n"
		"  Flags: %s\n"
		"  Definition size: %d\n"
		"  Code block: 0x%X\n"
		"  Data block: 0x%X\n"
		"  Heap start: 0x%X\n"
		"  Stack top: 0x%X\n"
		"  Instuction pointer: 0x%X\n"
		"  Publics offset: 0x%X\n"
		"  Natives offset: 0x%X\n"
		"  Libraries offset: 0x%X\n"
		"  Public variables table: 0x%X\n"
		"  Tags table: 0x%X\n"
		"  Nametable: 0x%X\n",
		hdr->size,
		hdr->magic, hdr->magic,
		hdr->file_version,
		hdr->amx_version,
		getflags(hdr->flags),
		hdr->defsize,
		hdr->cod,
		hdr->dat,
		hdr->hea,
		hdr->stp,
		hdr->cip,
		hdr->publics,
		hdr->natives,
		hdr->libraries,
		hdr->pubvars,
		hdr->tags,
		hdr->nametable);
}

void expand(unsigned char* code, long codesize, long memsize)
{
	ucell c;
	struct {
		long memloc;
		ucell c;
	} spare[AMX_COMPACTMARGIN];
	int sh = 0, st = 0, sc = 0;
	int shift;

	/* for in-place expansion, move from the end backward */
	assert(memsize % sizeof(cell) == 0);
	while (codesize > 0) {
		c = 0;
		shift = 0;
		do {
			codesize--;
			/* no input byte should be shifted out completely */
			assert(shift < 8 * sizeof(cell));
			/* we work from the end of a sequence backwards; the final code in
			 * a sequence may not have the continuation bit set */
			assert(shift > 0 || (code[(size_t)codesize] & 0x80) == 0);
			c |= (ucell)(code[(size_t)codesize] & 0x7f) << shift;
			shift += 7;
		} while (codesize > 0 && (code[(size_t)codesize - 1] & 0x80) != 0);
		/* sign expand */
		if ((code[(size_t)codesize] & 0x40) != 0) {
			while (shift < (int)(8 * sizeof(cell))) {
				c |= (ucell)0xff << shift;
				shift += 8;
			} /* while */
		} /* if */
		/* store */
		while (sc && (spare[sh].memloc > codesize)) {
			*(ucell*)(code + (int)spare[sh].memloc) = spare[sh].c;
			sh = (sh + 1) % AMX_COMPACTMARGIN;
			sc--;
		} /* while */
		memsize -= sizeof(cell);
		assert(memsize >= 0);
		if ((memsize > codesize) || ((memsize == codesize) && (memsize == 0))) {
			*(ucell*)(code + (size_t)memsize) = c;
		}
		else {
			assert(sc < AMX_COMPACTMARGIN);
			spare[st].memloc = memsize;
			spare[st].c = c;
			st = (st + 1) % AMX_COMPACTMARGIN;
			sc++;
		} /* if */
	} /* while */
	/* when all bytes have been expanded, the complete memory block should be done */
	assert(memsize == 0);
}

int main(int argc, char* argv[])
{
	if (argc < 2) {
		printf("No arguments defined.\n");
		return 0;
	}

	FILE* fp = fopen(argv[1], "rb");
	if (!fp) {
		printf("File not found. Exiting...\n");
		return 0;
	}
	
	AMX_HEADER hdr;
	assert(sizeof(hdr) == 56); // check the header structure aligned correctly
	fread(&hdr, sizeof(hdr), 1, fp);

	headerinfodump(&hdr);

	unsigned char* memblock;
	if ((memblock = (unsigned char*)malloc(hdr.stp)) == NULL)
	{
		printf("Failed to allocate for STP. Exiting...\n");
		fclose(fp);
		return 0;
	}

	rewind(fp);
	fread(memblock, 1, (size_t)hdr.size, fp);
	fclose(fp);

	hexdump(memblock, hdr.size);
	//bytedump(memblock, hdr.size);
	
	AMX amx;
	memset(&amx, 0, sizeof(AMX));

	// be aware that while memblock is not equal to hdr since,
	// hdr only contains the first 56 bytes, while memblock
	// contains all the bytes that the .amx file has
	if ((hdr.flags & 0x04)!=0) // check if it has compact flag
		expand((unsigned char*)memblock + (int)hdr.cod,
			hdr.size - hdr.cod, hdr.hea - hdr.cod);

	amx.base = (unsigned char*)memblock;
	*(cell*)(amx.base + (int)hdr.stp - sizeof(cell)) = 0;
	amx.hlw = hdr.hea - hdr.dat;
	amx.stp = hdr.stp - hdr.dat - sizeof(cell);
	amx.hea = amx.hlw;
	amx.stk = amx.stp;

	/*int publics_count = NUMENTRIES(&hdr, publics, natives);
	printf("Publics count: %d\n", publics_count);*/

	// Printing out the code/instruction block
	ucell codesize = (ucell)(hdr.dat - hdr.cod);
	unsigned char* code = amx.base + (int)hdr.cod;
	/*for (ucell i = 0; i < codesize; i++)
	{
		printf("%02X ", code[i]);
	}
	printf("\n");*/

	// Now trying to print the instructions
	cell* ptr = (cell*)code;
	for (ucell i = 0; i < codesize / sizeof(cell); i++)
	{
		printf("%s ", OPCODES[ptr[i]].name);
		// if the given parameter needs a parameter to include
		if (OPCODES[ptr[i]].flag == 1)
		{
			printf("%d", ptr[++i]);
		}
		printf("\n");
	}

	//cell* cip = (cell*)(code + (int)hdr.cip);

	free(memblock); 0x0B;
	return 0;
}
