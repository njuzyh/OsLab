#ifndef __X86_FS_H__
#define __X86_FS_H__

#include "common.h"
#include "device.h"
#include "x86.h"

#define SECTOR_SIZE 512
#define BLOCKSIZE 1024
#define SUPER_BLOCK_SIZE 1024 
#define GROUP_DESC_SIZE 512
#define INODE_SIZE 128
#define POINTER_NUM 26
#define DIRENTRY_SIZE 64
#define DIRENT_NAME_LENGTH 60
#define INODE_DIR 0x1
#define INODE_FILE 0X2

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

uint8_t inodeBitmap[BLOCKSIZE];
uint8_t blockBitmap[BLOCKSIZE];

struct FCB{
	int flags;
	int offset;
	int inode;
};

struct FCB FCBlist[16];

uint32_t allocInode();
void freeInode(uint32_t inode);
uint32_t allocBlock();
void freeBlock(uint32_t blk);
int findinodenum(const char *path, char *file_name);
int fs_mkdir(const char *path);
int fs_create(const char *path);

int fs_ls(const char *path);
void fs_cat(const char *path);

size_t fs_write(int32_t inode, uint8_t *buf, size_t count, int offset);
int fs_read(int32_t inode, uint8_t *buf, size_t count, int offset);

size_t fs_size(const char *path); 
int createFCB();
int deleteFCB(int id);
void init_fs();

#endif
