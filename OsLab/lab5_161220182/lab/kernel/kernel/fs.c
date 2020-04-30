#include "common.h"
#include "device.h"
#include "x86.h"

int strcmp(const char *s1, const char *s2) 
{
	while (*s1 && (*s1 == *s2)) 
	{
		s1++;
		s2++;
	}
    	return *(const unsigned char *)s1 - *(const unsigned char *)s2;
}

char *strncpy(char *dest, const char *src, int n) 
{
    	int i;
    	for (i = 0; i < n - 1 && src[i] != '\0'; i++) 
		dest[i] = src[i];
    	dest[i] = '\0';
    	return dest;
}

char *strcpy(char *dest, const char *src) 
{ 
	return strncpy(dest, src, 256); 
}

char *strchr(const char *s, int c) 
{
    	while (*s != (char)c)
	{
        	if (!*s++) 
			return 0;
	}
    	return (char *)s;
}

size_t strcspn(const char *s1, const char *s2) 
{
    	size_t ret = 0;
    	while (*s1)
	{
        	if (strchr(s2, *s1))
            		return ret;
        	else
		{
            		s1++; 
			ret++;
		}
	}
    	return ret;
}

size_t strspn(const char *s1, const char *s2) 
{
    	size_t ret = 0;
    	while (*s1 && strchr(s2, *s1++)) 
	{
		ret++;
	}
    	return ret;
}

char *strtok(char *str, const char *delim) 
{
    	static char *p = 0;
    	if (str)
        	p = str;
    	else if (!p)
        	return 0;
    	str = p + strspn(p, delim);
    	p = str + strcspn(str, delim);
    	if (p == str) 
		return p = 0;
    	p = *p ? *p = 0, p + 1 : 0;
    	return str;
}

void *memcpy(void *dest, const void *src, size_t n) 
{
    	char *dp = (char *)dest;
    	const char *sp = (const char *)src;
    	while (n--) 
	{
		*dp++ = *sp++;
	}	
    	return dest;
}

void *memset(void *s, int c, size_t len) 
{
    	unsigned char *dst = (unsigned char *)s;
    	while (len > 0) 
	{
        	*dst = (unsigned char)c;
        	dst++;
        	len--;
    	}
    	return s;
}

int fs_ls(const char *path);
void fs_cat(const char *path);

size_t fs_write(int32_t inode, uint8_t *buf, size_t count, int offset);
int fs_read(int32_t inode, uint8_t *buf, size_t count, int offset);

int fs_mkdir(const char *path);
int fs_create(const char *path);
int32_t findinodenum(const char *path, char *file_name);
size_t fs_size(const char *path);
uint32_t allocInode();
void freeInode(uint32_t inode);
uint32_t allocBlock();
void freeBlock(uint32_t blk);
int createFCB();
int deleteFCB(int id);
void init_fs();

void init_fs() 
{
    	for (int i = 0; i < 16; i++) 
        	FCBlist[i].flags = 0;
}

int createFCB() 
{
    	for (int i = 0; i < 16; i++) 
	{
        	if (FCBlist[i].flags == 0)
		{
            		FCBlist[i].flags = 1;
            		return i + 3;
		}
        }
    	return -1;
}

int deleteFCB(int fd) {
    	FCBlist[fd].flags = 1;
    	return 0;
}

uint32_t allocInode() 
{
    	readSect(inodeBitmap, 204);
	readSect(inodeBitmap + 512, 205);
    	int i;
    	for (i = 0; i < 1024; i++) 
	{
        	if (inodeBitmap[i] == 0) 
		{
            		inodeBitmap[i] = 1;
            		writeSect(inodeBitmap, 204);
			writeSect(inodeBitmap + 512, 205);
			//Log("alloc inode = %d\n", i);
            		return i;
        	}
    	}
    	return -1;
}

void freeInode(uint32_t inode) 
{
    	readSect(inodeBitmap, 204);
	readSect(inodeBitmap + 512, 205);
    	inodeBitmap[inode] = 0;
    	writeSect(inodeBitmap, 204);
	writeSect(inodeBitmap + 512, 205);
}

uint32_t allocBlock() 
{
    	readSect(blockBitmap, 206);
	readSect(blockBitmap + 512, 207);
    	int i;
    	for (i = 0; i < 1024; i++) 
	{
        	if (blockBitmap[i] == 0) 
		{
            		blockBitmap[i] = 1;
            		writeSect(blockBitmap, 206);
			writeSect(blockBitmap + 512, 207);
			//Log("[kernel] alloc block %d\n", i + 333);
            		return i + 272;
        	}
    	}
    	return -1;
}

void freeBlock(uint32_t blk) 
{
    	readSect(blockBitmap, 206);
	readSect(blockBitmap + 512, 207);
    	blockBitmap[blk] = 0;
    	writeSect(blockBitmap, 206);
	writeSect(blockBitmap + 512, 207);
}

size_t fs_size(const char *path) {
    	uint8_t InodeBuf[BLOCKSIZE];
    	int32_t num = 0;
    	union Inode *inode0 = NULL;
    	char file_name[256];
    	num = findinodenum(path, file_name);
    	readSect(InodeBuf, 208 + num / 4);
	readSect(InodeBuf + 512, 208 + num / 4 + 1);
    	inode0 = ((union Inode *)InodeBuf) + num % 4;
    	return inode0->size;
}

int32_t findinodenum(const char *path, char *file_name) 
{
    	char aimpath[256];
    	strcpy(aimpath, path + 1);
	uint8_t InodeBuf[BLOCKSIZE];
    	uint8_t DirentBuf[BLOCKSIZE];
    	int32_t num = 0;
    	union Inode *inode0 = NULL;
    	union DirEntry *dirent0 = NULL;
    	int i = 0, j = 0;
    	int direntnum;
    	int flag = 0;
    	char *s = strtok(aimpath, "/");
    	while (s != NULL) 
	{
        	readSect(InodeBuf, 208 + num / 4);
		readSect(InodeBuf + 512, 208 + num / 4 + 1);
		inode0 = ((union Inode *)InodeBuf) + num % 4;
		direntnum = inode0->size;
        	i = j = 0;
        	flag = 0;
        	while (inode0->pointer[i] != -1) 
		{
			for(int x = 0; x < 2; x++)
            			readSect(DirentBuf + 512 * x, inode0->pointer[i]+ x);
			dirent0 = (union DirEntry *)DirentBuf;
            		for (; j < direntnum; j++) 
			{
                		if (strcmp(s, dirent0->name) == 0) 
				{
                    			strcpy(file_name, s);
                    			num = dirent0->inode;
                    			flag = 1;
                    			break;
                		}
                		dirent0++;
            		}
			if (flag) 
				break;
            		i++;
        	}
        	if (!flag) 
		{
            		strcpy(file_name, s);
            		return num;
        	}
        	s = strtok(NULL, "/");
	}
	return num;
}

int fs_mkdir(const char *path) {
    	uint8_t InodeBuf[BLOCKSIZE];
    	uint8_t DirentBuf[BLOCKSIZE];
    	int32_t num = 0;
    	union Inode *inode0 = NULL;
    	union DirEntry *dirent0 = NULL;
    	int direntnum;
    	int32_t newinode;

    	char file_name[128];
    	num = findinodenum(path, file_name);
	
    	readSect(InodeBuf, 208 + num / 4);
	readSect(InodeBuf + 512, 208 + num / 4 + 1);
    	inode0 = ((union Inode *)InodeBuf) + num % 4;
    	direntnum = inode0->size;

    	
	for(int x = 0; x < 2; x++)
        	readSect(DirentBuf + 512 * x, inode0->pointer[0]+ x);
    	dirent0 = (union DirEntry *)DirentBuf;
    	dirent0 += direntnum;

	newinode = allocInode();
    	dirent0->inode = newinode;
    	strncpy(dirent0->name, file_name, DIRENT_NAME_LENGTH);
	for(int x = 0; x < 2; x++)
        	writeSect(DirentBuf + 512 * x, inode0->pointer[0]+ x);
	//writeSect(DirentBuf, inode0->pointer[0]);
	
	inode0->size++;
    	writeSect(InodeBuf, 208 + num / 4);
	writeSect(InodeBuf + 512, 208 + newinode / 4 + 1);

    	readSect(InodeBuf, 208 + newinode / 4);
	readSect(InodeBuf + 512, 208 + newinode / 4 + 1);
    	inode0 = ((union Inode *)InodeBuf) + newinode % 4;
    	inode0->type = INODE_DIR;
    	inode0->linkCount = 1;
    	inode0->blockCount = 1;
    	inode0->size = 2;
    	inode0->pointer[0] = allocBlock();
    	inode0->pointer[1] = -1;
    	inode0->singlyPointer = -1;
    	inode0->doublyPointer = -1;
    	inode0->triplyPointer = -1;
	writeSect(InodeBuf, 208 + newinode / 4);
    	writeSect(InodeBuf + 512, 208 + newinode / 4 + 1);

	for(int x = 0; x < 2; x++)
    		readSect(DirentBuf + 512 * x, inode0->pointer[0] + x);
    	dirent0 = (union DirEntry *)DirentBuf;
    	dirent0->inode = newinode;
    	strncpy(dirent0->name, ".", DIRENT_NAME_LENGTH);
	dirent0++;
    	dirent0->inode = num;
    	strncpy(dirent0->name, "..", DIRENT_NAME_LENGTH);
	for(int x = 0; x < 2; x++)
    		writeSect(DirentBuf + 512 * x, inode0->pointer[0] + x);
    	return 0;
}

int fs_create(const char *path) {
    	char aimpath[128];
    	strcpy(aimpath, path + 1);
	uint8_t InodeBuf[BLOCKSIZE];
        uint8_t DirentBuf[BLOCKSIZE];
        int32_t num = 0;
        union Inode *inode0 = NULL;
        union DirEntry *dirent0 = NULL;
        int i = 0, j = 0;
        int direntnum;
        int flag = 0;
        char *s = strtok(aimpath, "/");
	int newinode;
	while (s != NULL)
        {
                readSect(InodeBuf, 208 + num / 4);
		readSect(InodeBuf + 512, 208 + num / 4 + 1);
                inode0 = ((union Inode *)InodeBuf) + num % 4;
                direntnum = inode0->size;
                i = j = 0;
                flag = 0;
                while (inode0->pointer[i] != -1)
                {
			
			for(int x = 0; x < 2; x++)
                		readSect(DirentBuf + 512 * x, inode0->pointer[i] + x);
                        //readSect(DirentBuf, inode0->pointer[i]);
                        dirent0 = (union DirEntry *)DirentBuf;
                        for (; j < direntnum; j++)
                        {
                                if (strcmp(s, dirent0->name) == 0)
                                {
                                        num = dirent0->inode;
                                        flag = 1;
                                        break;
                                }
				dirent0++;
			}
			if (flag)
                                break;
                        i++;
                }
		if (!flag) 
		{
            		newinode = allocInode();
            		dirent0->inode = newinode;
            		strncpy(dirent0->name, s, DIRENT_NAME_LENGTH);
			for(int x = 0; x < 2; x++)
		                writeSect(DirentBuf + 512 * x, inode0->pointer[i - 1] + x);
            		//writeSect(DirentBuf, inode0->pointer[i - 1], 4);
            		readSect(InodeBuf, 208 + num / 4);
			readSect(InodeBuf + 512, 208 + num / 4 + 1);
            		inode0 = ((union Inode *)InodeBuf) + num % 4;
            		inode0->size++;
            		writeSect(InodeBuf, 208 + num / 4);
			writeSect(InodeBuf + 512, 208 + num / 4 + 1);
            		readSect(InodeBuf, 208 + newinode / 4);
			readSect(InodeBuf + 512, 208 + newinode / 4 + 1);
            		inode0 = ((union Inode *)InodeBuf) + newinode % 4;
            		inode0->type = INODE_FILE;
            		inode0->linkCount = 1;
            		inode0->blockCount = 1;
            		inode0->size = 0;
            		inode0->pointer[0] = allocBlock();
            		inode0->pointer[1] = -1;
            		inode0->singlyPointer = -1;
            		inode0->doublyPointer = -1;
			inode0->triplyPointer = -1;
            		writeSect(InodeBuf, 208 + newinode / 4);
			writeSect(InodeBuf + 512, 208 + newinode / 4 + 1);
            		return newinode;
        	}
        	s = strtok(NULL, "/");
    	}
    	return 0;
}

int fs_read(int32_t inode, uint8_t *buf, size_t count, int offset) {
    	uint8_t InodeBuf[BLOCKSIZE];
    	uint8_t BlockBuf[BLOCKSIZE];
    	int32_t num = inode;
    	union Inode *inode0 = NULL;
    	int index;
    	uint8_t *buf1 = buf;

    	readSect(InodeBuf, 208 + num / 4);
	readSect(InodeBuf + 512, 208 + num / 4 + 1);
    	inode0 = ((union Inode *)InodeBuf) + num % 4;

    	index = offset / SECTOR_SIZE;
    	offset = offset % SECTOR_SIZE;
    	while (count > 0) 
	{
        	for(int x = 0; x < 2; x++)
			readSect(BlockBuf + 512 * x, inode0->pointer[index] + x);
        	if (count + offset > SECTOR_SIZE) 
		{
            		memcpy(buf, BlockBuf + offset, SECTOR_SIZE - offset);
            		buf += (SECTOR_SIZE - offset);
            		count -= (SECTOR_SIZE - offset);
            		offset = 0;
        	} 
		else 
		{
            		memcpy(buf, BlockBuf + offset, count);
            		buf += count;
            		count = 0;
            		offset = 0;
        	}
        	index++;
    	}	
    	return buf - buf1;
}

size_t fs_write(int32_t inode, uint8_t *buf, size_t count, int offset) 
{
	uint8_t InodeBuf[BLOCKSIZE];
        uint8_t BlockBuf[BLOCKSIZE];
        int32_t num = inode;
        union Inode *inode0 = NULL;
    	int index;
    	int blocknum0, blocknum1;
    	uint8_t *buf1 = buf;
	
	readSect(InodeBuf, 208 + num / 4);
	readSect(InodeBuf + 512, 208 + num / 4 + 1);
    	inode0 = ((union Inode *)InodeBuf) + num % 4;
	
	blocknum0 = (inode0->size - 1) / SECTOR_SIZE + 1;
    	blocknum1 = (offset + count - 1) / SECTOR_SIZE + 1;
    	int i;
	if (blocknum1 > blocknum0) 
	{
        	for (i = blocknum0; i < blocknum1; i++) 
            		inode0->pointer[i] = allocBlock();
    	} 
	else if (blocknum1 < blocknum0) 
	{
        	for (i = blocknum0; i < blocknum1; i++) 
            		freeBlock(inode0->pointer[i]);
    	}
	inode0->pointer[blocknum1] = -1;
    	if (inode0->size < offset + count) 
		inode0->size = offset + count;
    	writeSect(InodeBuf, 208 + num / 4);
        writeSect(InodeBuf + 512, 208 + num / 4 + 1);
    	index = offset / SECTOR_SIZE;
    	offset = offset % SECTOR_SIZE;
    	while (count > 0) 
	{
		for(int x = 0; x < 2; x++)
        		readSect(BlockBuf + 512 * x, inode0->pointer[index] + x);
        	if (count + offset > SECTOR_SIZE) 
		{
            		memcpy(BlockBuf + offset, buf, SECTOR_SIZE - offset);
            		buf += (SECTOR_SIZE - offset);
            		count -= (SECTOR_SIZE - offset);
            		offset = 0;
        	}  
		else 
		{
			memcpy(BlockBuf + offset, buf, count);
            		buf += count;
            		count = 0;
            		offset = 0;
        	}
		for(int x = 0; x < 2; x++)
        		writeSect(BlockBuf + 512 * x, inode0->pointer[index] + x);
        	index++;
    	}
	//printf("[debug] write %d bytes\n", buf - buf1);
    	return buf - buf1;
}

int fs_ls(const char *path)
{
        char aimpath[256];
        strncpy(aimpath, path + 1, 256);
        Log("ls - %s\n", path);
        uint8_t InodeBuf[BLOCKSIZE];
        uint8_t newInodeBuf[BLOCKSIZE];
        uint8_t DirentBuf[BLOCKSIZE];
        int32_t pinode = 0, num = 0;
        union Inode *inode0 = NULL, *inode1 = NULL;
        union DirEntry *dirent0 = NULL;
        int i = 0, j = 0;
        int direntnum;
        int flag = 0;
        char *s = strtok(aimpath, "/");
        while (s != NULL)
        {
                //printf("s = %s\n", s);
                readSect(InodeBuf, 208 + num / 4);
		readSect(InodeBuf + 512, 208 + num / 4 + 1);
                //printf("inodenum = %d\n", num);
                inode0 = ((union Inode *)InodeBuf) + num % 4;
                direntnum = inode0->size;
                //printf("direntnum = %d\n", direntnum);
                i = j = 0;
                flag = 0;
                while (inode0->pointer[i] != -1)
                {
                        //printf("inodepointer = %d\n", inode0->pointer[i]);
                        readSect(DirentBuf, inode0->pointer[i]);
			readSect(DirentBuf + 512, inode0->pointer[i] + 1);
                        dirent0 = (union DirEntry *)DirentBuf;
                        for (; j < direntnum; j++)
                        {
				//printf("direntname = %s\n", dirent0->name);
                                if (strcmp(s, dirent0->name) == 0)
                                {
                                        pinode = num;
                                        num = dirent0->inode;
                                        flag = 1;
                                        //printf("flag == 1\n");
                                        break;
                                }
                                dirent0++;
                        }
                        if (flag)
                                break;
                        i++;
                }
                if (!flag)
                {
                        //printf("flag == 0\n");
                        return -1;
                }
                s = strtok(NULL, "/");
        }
        readSect(InodeBuf, 208 + num / 4);
	readSect(InodeBuf + 512, 208 + num / 4 + 1);
        inode0 = ((union Inode *)InodeBuf) + num % 4;
        direntnum = inode0->size;
        i = j = 0;
        while (inode0->pointer[i] != -1)
        {
                readSect(DirentBuf, inode0->pointer[i]);
		readSect(DirentBuf + 512, inode0->pointer[i] + 1);
                dirent0 = (union DirEntry *)DirentBuf;
                for (; j < direntnum; j++)
                {
                        readSect(newInodeBuf, 208 + (dirent0->inode) / 4);
			readSect(newInodeBuf + 512, 208 + (dirent0->inode) / 4 + 1);
                        inode1 = ((union Inode *)newInodeBuf) + (dirent0->inode) % 4;
                        if (inode1->type == INODE_DIR)
			{
                                Log("type: dir   ");
                                Log("entnum:  %d   ", inode1->size);
                        }
                        else
                        {
                                Log("type: file  ");
                                Log("bytes:  %d   ", inode1->size);
                        }
                        Log("path: %s%s\n", path, dirent0->name);
                        dirent0++;
                }
                if (flag)
                        break;
                i++;
        }
	return pinode;
}

void fs_cat(const char *path) {
    	uint8_t InodeBuf[BLOCKSIZE];
    	int32_t num = 0;
    	union Inode *inode0 = NULL;
    	int size;
    	int i;
    	char file_name[128];
    	num = findinodenum(path, file_name);
    	readSect(InodeBuf, 208 + num / 4);
	readSect(InodeBuf + 512, 208 + num / 4 + 1);
    	inode0 = ((union Inode *)InodeBuf) + num % 4;
    	size = inode0->size;
    	fs_read(findinodenum(path, NULL), InodeBuf, inode0->size, 0);
    	for (i = 0; i < size; i++) {
        	Log("%c", InodeBuf[i]);
    	}
}
