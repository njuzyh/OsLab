#include <assert.h>
#include <ctype.h>
#include <inttypes.h>
#include <stdio.h>
#include <string.h>

#define SECTOR_SIZE 512
#define BLOCKSIZE 1024
#define SUPER_BLOCK_SIZE 1024 
#define GROUP_DESC_SIZE 512
#define INODE_SIZE 128
#define POINTER_NUM 26
#define DIRENTRY_SIZE 64
#define DIRENT_NAME_LENGTH 60

union SuperBlock {
      uint8_t byte[SUPER_BLOCK_SIZE];
      struct {
             int32_t sectorNum;                   // 文件系统中扇区总数
             int32_t inodeNum;                    // 文件系统中inode总数
             int32_t blockNum;                    // 文件系统中data block总数
             int32_t availInodeNum;               // 文件系统中可用inode总数
             int32_t availBlockNum;               // 文件系统中可用data block总数
             int32_t blockSize;                   // 每个block所含字节数
             int32_t inodesPerGroup;              // 每个group所含inode数
             int32_t blocksPerGroup;              // 每个group所含data block数
      };
};

union GroupDesc {                                 // Group Descriptor Table的表项
      uint8_t byte[GROUP_DESC_SIZE];
      struct {
             int32_t inodeBitmap;                 // 该group中inodeBitmap的偏移量
             int32_t blockBitmap;                 // 该group中blockBitmap的偏移量
             int32_t inodeTable;                  // 该group中inodeTable的偏移量
             int32_t blockTable;
	     int32_t availInodeNum;               // 该group中可用inode总数
             int32_t availBlockNum;               // 该group中可用data block总数
      };
};

union Inode {                                     // Inode Table的表项
      uint8_t byte[INODE_SIZE];
      struct {
             int16_t type;                        // 该文件的类型、访存控制等
             int16_t linkCount;                   // 该文件的链接数
             int32_t blockCount;                  // 该文件的data block总数
             int32_t size;                        // 该文件所含字节数
             int32_t pointer[POINTER_NUM];        // data block偏移量
             int32_t singlyPointer;               // 一级data block偏移量索引
             int32_t doublyPointer;               // 二级data block偏移量索引
             int32_t triplyPointer;               // 三级data block偏移量索引
      };
};

union DirEntry {                                  // 目录文件的表项
      uint8_t byte[DIRENTRY_SIZE];
      struct {
             int32_t inode;                       // 该目录项对应的inode的偏移量
             char name[DIRENT_NAME_LENGTH];              // 该目录项对应的文件名
      };
};

#define INODE_DIR 0x1
#define INODE_FILE 0X2

uint8_t disk[1024 * SECTOR_SIZE];
union SuperBlock superbuffer;
union GroupDesc groupbuffer;
uint8_t inodeBitmap[BLOCKSIZE];
uint8_t blockBitmap[BLOCKSIZE];

void readSect(void *dst, int sectorNum, int len) 
{ 
    	if (sectorNum < 201)
        	assert(0);
    	memcpy(dst, disk + sectorNum * SECTOR_SIZE, SECTOR_SIZE * len);
}

void writeSect(void *src, int sectorNum, int len) 
{
	if (sectorNum < 201) 
        	assert(0);
    	memcpy(disk + sectorNum * SECTOR_SIZE, src, SECTOR_SIZE * len);
}

void save(char *path) {
    	FILE *fd = fopen(path, "wb");
   	fwrite(disk, sizeof(disk), 1, fd);
    	fclose(fd);
}

void format() {
    	superbuffer.sectorNum = 1024;
   	superbuffer.inodeNum = 256;
    	superbuffer.blockNum = 512;
        superbuffer.availInodeNum = 256;
        superbuffer.availBlockNum = 512;
        superbuffer.blockSize = 1024;
        superbuffer.inodesPerGroup = 256;
        superbuffer.blocksPerGroup = 1024;

    	groupbuffer.inodeBitmap = 204;
        groupbuffer.blockBitmap = 206;
        groupbuffer.inodeTable = 208;
        groupbuffer.blockTable = 272;
        groupbuffer.availInodeNum = 256;
	groupbuffer.availBlockNum = 512;

    	memset(inodeBitmap, 0, BLOCKSIZE);
    	memset(blockBitmap, 0, BLOCKSIZE);

    	inodeBitmap[0] = 1;
	blockBitmap[0] = 1;
    	superbuffer.availInodeNum--;
    	superbuffer.availBlockNum--;
    	groupbuffer.availInodeNum--;
    	groupbuffer.availBlockNum--;
    	writeSect((void *)inodeBitmap, 204, 2);
    	writeSect((void *)blockBitmap, 206, 2);
    	writeSect((void *)&superbuffer, 201, 2);
    	writeSect((void *)&groupbuffer, 203, 1);

	union Inode *inode0 = (union Inode *)&disk[208 * SECTOR_SIZE];
    	inode0->type = INODE_DIR;
    	inode0->linkCount = 1;
    	inode0->blockCount = 1;
    	inode0->size = 2;
    	inode0->pointer[0] = 272;
    	inode0->pointer[1] = -1;
    	inode0->singlyPointer = -1;
    	inode0->doublyPointer = -1;
    	inode0->triplyPointer = -1;

    	union DirEntry *dirent0 = (union DirEntry *)&disk[272 * SECTOR_SIZE];
    	dirent0->inode = 0;
    	strncpy(dirent0->name, ".", DIRENT_NAME_LENGTH);
    	dirent0++;
    	dirent0->inode = 0;
    	strncpy(dirent0->name, "..", DIRENT_NAME_LENGTH);
        dirent0++;
}

uint8_t bootloaderBuf[SECTOR_SIZE];
uint8_t kernelBuf[200 * SECTOR_SIZE];
uint8_t appBuf[1024 * SECTOR_SIZE];
uint8_t appBuf2[1024 * SECTOR_SIZE];

int bootloadersize = 0;
int kernelsize = 0;
int appsize = 0;

uint32_t allocInode() 
{
    	readSect(inodeBitmap, 204, 2);
    	int i;
    	for (i = 0; i < 1024; i++) 
	{
        	if (inodeBitmap[i] == 0) 
		{
            		inodeBitmap[i] = 1;
            		writeSect(inodeBitmap, 204, 2);
			//printf("[debug] alloc inode %d\n", i);
            		return i;
        	}
    	}
    	return -1;
}

void freeInode(uint32_t inode) 
{
    	readSect(inodeBitmap, 204, 2);
    	inodeBitmap[inode] = 0;
    	writeSect(inodeBitmap, 204, 2);
}

uint32_t allocBlock() 
{
    	readSect(blockBitmap, 206, 2);
    	int i;
    	for (i = 0; i < 1024; i++) 
	{
        	if (blockBitmap[i] == 0) 
		{
            		blockBitmap[i] = 1;
            		writeSect(blockBitmap, 206, 2);
			//printf("[debug] alloc block %d\n", i + 333);
            		return i + 272;
        	}
    	}
    	return -1;
}

void freeBlock(uint32_t blk) 
{
    	readSect(blockBitmap, 206, 2);
    	blockBitmap[blk] = 0;
    	writeSect(blockBitmap, 206, 2);
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
		//printf("[debug] s = %s\n", s);
	      	readSect(InodeBuf, 208 + num / 4, 2);
		inode0 = ((union Inode *)InodeBuf) + num % 4;
		direntnum = inode0->size;
		//printf("direntnum = %d\n", direntnum);
        	i = j = 0;
        	flag = 0;
		//printf("pointer = %d\n", inode0->pointer[i]);
        	while (inode0->pointer[i] != -1) 
		{
			readSect(DirentBuf, inode0->pointer[i], 2);
			dirent0 = (union DirEntry *)DirentBuf;
            		for (; j < direntnum; j++) 
			{
				//printf("name = %s\n", dirent0->name);
                		if (strcmp(s, dirent0->name) == 0) 
				{
                    			strcpy(file_name, s);
                    			num = dirent0->inode;
					//printf("flag == 1, num = %d\n", num);
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
			//printf(" %s\n", s);
            		strcpy(file_name, s);
			//printf(" %s\n", file_name);
			//printf("flag == 0, num = %d\n", num);
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

    	char file_name[256];
    	num = findinodenum(path, file_name);
	
    	readSect(InodeBuf, 208 + num / 4, 2);
    	inode0 = ((union Inode *)InodeBuf) + num % 4;
    	direntnum = inode0->size;

    	readSect(DirentBuf, inode0->pointer[0], 2);
    	dirent0 = (union DirEntry *)DirentBuf;
    	dirent0 += direntnum;

	newinode = allocInode();
    	dirent0->inode = newinode;
	//printf("filename = %s\n", file_name);
    	strncpy(dirent0->name, file_name, DIRENT_NAME_LENGTH);
	//printf("dirame = %s\n", dirent0->name);
    	writeSect(DirentBuf, inode0->pointer[0], 2);
	
	inode0->size++;
    	writeSect(InodeBuf, 208 + num / 4, 2);

    	readSect(InodeBuf, 208 + newinode / 4, 2);
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
    	writeSect(InodeBuf, 208 + newinode / 4, 2);

    	readSect(DirentBuf, inode0->pointer[0], 2);
    	dirent0 = (union DirEntry *)DirentBuf;
    	dirent0->inode = newinode;
    	strncpy(dirent0->name, ".", DIRENT_NAME_LENGTH);
	dirent0++;
    	dirent0->inode = num;
    	strncpy(dirent0->name, "..", DIRENT_NAME_LENGTH);
    	writeSect(DirentBuf, inode0->pointer[0], 2);
    	return 0;
}

int fs_create_file(const char *path) {
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
	int newinode;
	while (s != NULL)
        {
                readSect(InodeBuf, 208 + num / 4, 2);
                inode0 = ((union Inode *)InodeBuf) + num % 4;
                direntnum = inode0->size;
                i = j = 0;
                flag = 0;
                while (inode0->pointer[i] != -1)
                {
                        readSect(DirentBuf, inode0->pointer[i], 2);
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
            		writeSect(DirentBuf, inode0->pointer[i - 1], 2);
            		readSect(InodeBuf, 208 + num / 4, 2);
            		inode0 = ((union Inode *)InodeBuf) + num % 4;
            		inode0->size++;
            		writeSect(InodeBuf, 208 + num / 4, 2);
            		readSect(InodeBuf, 208 + newinode / 4, 2);
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
            		writeSect(InodeBuf, 208 + newinode / 4, 2);
            		return 0;
        	}
        	s = strtok(NULL, "/");
    	}
    	return 0;
}

int fs_read(const char *path, uint8_t *buf, size_t count, int offset) {
        uint8_t InodeBuf[BLOCKSIZE];
        uint8_t BlockBuf[BLOCKSIZE];
        int32_t num;
        union Inode *inode0 = NULL;
        int index;
        uint8_t *buf1 = buf;
	
	char file_name[128];
    	num = findinodenum(path, file_name);
	printf("inode = %d\n", num);

        readSect(InodeBuf, 208 + num / 4, 2);
        inode0 = ((union Inode *)InodeBuf) + num % 4;

        index = offset / SECTOR_SIZE;
        offset = offset % SECTOR_SIZE;
        while (count > 0)
        {
                readSect(BlockBuf, inode0->pointer[index], 2);
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

size_t fs_write(const char *path, uint8_t *buf, size_t count, int offset) 
{
	uint8_t InodeBuf[BLOCKSIZE];
        uint8_t BlockBuf[BLOCKSIZE];
        int32_t num = 0;
        union Inode *inode0 = NULL;
        union DirEntry *dirent0 = NULL;
    	int index;
    	int blocknum0, blocknum1;
    	uint8_t *buf1 = buf;
	
    	char file_name[256];
    	num = findinodenum(path, file_name);
	readSect(InodeBuf, 208 + num / 4, 2);
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
    	writeSect(InodeBuf, 208 + num / 4, 2);
    	index = offset / SECTOR_SIZE;
    	offset = offset % SECTOR_SIZE;
    	while (count > 0) 
	{
        	readSect(BlockBuf, inode0->pointer[index], 2);
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
        	writeSect(BlockBuf, inode0->pointer[index], 2);
        	index++;
    	}
	//printf("[debug] write %d bytes\n", buf - buf1);
    	return buf - buf1;
}

size_t fs_size(const char *path) {
        uint8_t InodeBuf[BLOCKSIZE];
        int32_t num = 0;
        union Inode *inode0 = NULL;
        char file_name[256];
        num = findinodenum(path, file_name);
        readSect(InodeBuf, 208 + num / 4, 2);
        //readSect(InodeBuf + 512, 208 + num / 2 + 1);
        inode0 = ((union Inode *)InodeBuf) + num % 4;
        return inode0->size;
}

int fs_ls(const char *path) 
{
	char aimpath[128];
	strncpy(aimpath, path + 1, 128);
	printf("ls - %s\n", path);
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
		printf("s = %s\n", s);
        	readSect(InodeBuf, 208 + num / 4, 2);
		printf("inodenum = %d\n", num);
        	inode0 = ((union Inode *)InodeBuf) + num % 4;
        	direntnum = inode0->size;
		printf("direntnum = %d\n", direntnum);
        	i = j = 0;
        	flag = 0;
        	while (inode0->pointer[i] != -1) 
		{
			printf("inodepointer = %d\n", inode0->pointer[i]);
            		readSect(DirentBuf, inode0->pointer[i], 2);
            		dirent0 = (union DirEntry *)DirentBuf;
            		for (; j < direntnum; j++) 
			{
				printf("direntname = %s\n", dirent0->name);
                		if (strcmp(s, dirent0->name) == 0) 
				{
                    			pinode = num;
                    			num = dirent0->inode;
                    			flag = 1;
					printf("flag == 1\n");
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
			printf("flag == 0\n");
            		return -1;
        	}
        	s = strtok(NULL, "/");
    	}
    	readSect(InodeBuf, 208 + num / 4, 2);
    	inode0 = ((union Inode *)InodeBuf) + num % 4;
	direntnum = inode0->size;
    	i = j = 0;
    	while (inode0->pointer[i] != -1) 
	{
        	readSect(DirentBuf, inode0->pointer[i], 2);
        	dirent0 = (union DirEntry *)DirentBuf;
        	for (; j < direntnum; j++) 
		{
            		readSect(newInodeBuf, 208 + (dirent0->inode) / 4, 2);
            		inode1 = ((union Inode *)newInodeBuf) + (dirent0->inode) % 4;
            		if (inode1->type == INODE_DIR) 
			{
                		printf("file type: dir   ");
                		printf("entries num:  %d   ", inode1->size);
            		} 
			else 
			{
                		printf("file type: file  ");
                		printf("bytes:  %d   ", inode1->size);
            		}
            		printf("path: %s/%s\n", path, dirent0->name);
            		dirent0++;
        	}
        	if (flag) 
			break;
        	i++;
    	}
}

void fs_cat(const char *path) {
    	uint8_t InodeBuf[BLOCKSIZE];
    	int32_t num = 0;
    	union Inode *inode0 = NULL;
    	int size;
    	int i;

    	char file_name[128];
    	num = findinodenum(path, file_name);

    	readSect(InodeBuf, 208 + num / 4, 2);
    	inode0 = ((union Inode *)InodeBuf) + num % 4;
    	size = inode0->size;

    	printf("%s file size: %d\n", path, size);
    	fs_read(path, InodeBuf, inode0->size, 0);
    	for (i = 0; i < size; i++) {
        	printf("%x ", InodeBuf[i]);
    	}
	printf("\n");
}     

int main(int argc, char **argv) {
    	memset(disk, 0, sizeof(disk));
    	char *bootloaderfile, *kernelfile, *appfile, *aimfile;
    	FILE *fp;
    	if (argc == 5) 
	{
        	bootloaderfile = argv[1];
        	kernelfile = argv[2];
        	appfile = argv[3];
        	aimfile = argv[4];
    	}
	fp = fopen(bootloaderfile, "rb");
	if (fp != NULL) 
	{
        	bootloadersize = fread(bootloaderBuf, sizeof(uint8_t), SECTOR_SIZE, fp);
        	fclose(fp);
    	}
	//printf("boot = %d\n", bootloadersize);
	fp = fopen(kernelfile, "rb");
	if (fp != NULL) 
	{
        	kernelsize = fread(kernelBuf, sizeof(uint8_t), 200 * SECTOR_SIZE, fp);
        	fclose(fp);
    	}
	//printf("kernel = %d\n", kernelsize);
	fp = fopen(appfile, "rb");
    	if (fp != NULL) 
	{
        	appsize = fread(appBuf, sizeof(uint8_t), 1024 * SECTOR_SIZE, fp);
        	fclose(fp);
    	}
	//printf("app = %d\n", appsize);
	memcpy(disk, bootloaderBuf, SECTOR_SIZE);
    	memcpy(disk + SECTOR_SIZE, kernelBuf, 200 * SECTOR_SIZE);
	format();
	fs_mkdir("/sbin");
	fs_mkdir("/dev");
	fs_mkdir("/usr");
    	fs_create_file("/usr/app");
    	fs_write("/usr/app", appBuf, appsize, 0);
	save(aimfile);
	//fs_ls("/usr");
	//fs_ls("/sbin");
	//fs_ls("/dev");
	//fs_cat("/usr/app");
	//int size = fs_size("/usr/app");
	//printf("size = %d\n", size);
}


	

