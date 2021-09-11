
// The following ifdef block is the standard way of creating macros which make exporting 
// from a DLL simpler. All files within this DLL are compiled with the TRANSC_EXPORTS
// symbol defined on the command line. this symbol should not be defined on any project
// that uses this DLL. This way any other project whose source files include this file see 
// TRANSC_API functions as being imported from a DLL, wheras this DLL sees symbols
// defined with this macro as being exported.

#ifndef _TRANSC_H_
#define _TRANSC_H_
#include "USBTransc.h"

#ifdef TRANSC_EXPORTS
#define TRANSC_API __declspec(dllexport)
#else
#define TRANSC_API __declspec(dllimport)
#endif

#ifndef BT_FAIL
    #define BT_FAIL                 0
#endif
#ifndef BT_SUCCESS
    #define BT_SUCCESS              1
#endif
#define BT_DL_FILE_OPEN_FAIL        2
#define BT_DL_FILE_READ_FAIL        3
#define BT_DL_FILE_DOWNLOAD_FAIL    4
#define BT_SECAREA_FORMAT_ERR       5
#define BT_SECAREA_MOUNT_ERR        6
#define BT_DL_COMPARE_FAIL          7
#define BT_DL_UPDATE_BIN_OVER       8
#define BT_PARTION_PARAM_ERR        9
#define BT_PARTION_MEDIUM_ERR       10
#define BT_IMG_MATCH_ERR            11
#define BT_IMG_WRITE_ERR            12
#define BT_FILE_CREATE_FAIL         13
#define BT_FILE_WRITE_FAIL          14 
#define BT_UPDATE_BIN_OVER_RANGE    15

#define ASA_MODE_OPEN		0
#define ASA_MODE_CREATE		1



#ifndef ZT_FAKE
#define ZT_FAKE                      5
#endif

#define    DOWNLOAD_BIN_FILENAME_SIZE	    (15+1)

typedef enum
{
    MODE_SPIFLASH = 0,
    MODE_NEWBURN,
    MODE_UPDATE,
	MODE_ERASE,
	MODE_DEBUG
}E_BURN_MODE;

typedef struct tag_Nand_Phy_Info
{
    UINT32  chip_id;			//芯片ID号
    USHORT  page_size;			//Page大小
    USHORT  page_per_blk;		//一个block的总Page数
    USHORT  blk_num;			//总block数目
    USHORT  group_blk_num;		//
    USHORT  plane_blk_num;		//
    UCHAR   spare_size;			//spare size
    UCHAR   col_cycle;			//column address cycle
    UCHAR   lst_col_mask;		//last column address cycle mask bit
    UCHAR   row_cycle;			//row address cycle
    UCHAR   last_row_mask;		//last row address cycle mask bit
    UCHAR   custom_nd;			//initial bad block type
    UINT32	flag;					//
    UINT32  cmd_len;			//nandflash command length
    UINT32  data_len;			//nandflash data length
    CHAR   des_str[32];		   //描述符
}T_NAND_PHY_INFO;

typedef struct
{
    BOOL  bCompare;
    BOOL  bBackup;
    BOOL  bUpdateSelf;
    TCHAR pc_path[MAX_PATH+1];
    UINT  ld_addr;
    CHAR  file_name[MAX_PATH];
}T_DOWNLOAD_BIN;

#pragma pack(1)

typedef struct
{
	UINT StartAddr;		    //this zone start address, 介质信息中表示此分区开始块，分区信息中表示分区在介质中开始扇区
	UINT AddrCnt;			//this zone end address, 介质信息中表示此分区大小
	BYTE Subarea_Flag;		//flag of muti partition, 归属多分区标记
	BYTE Open_Flag;		    //flag of open,对用户公开区的标记
	BYTE Type;		        //this zone type, 此分区类型（分区作用：存放何种资料）
	BYTE Symbol;			//this zone symbol, 此分区分配的盘符
	BYTE Nand_NO;			//this zone vest in which nand,此分区归属号码
	BYTE Partition_NO;		//
	BYTE Nand_Char;			//this nand character, 此nand分区特性(读写特性：只读、读写等)
	BYTE Medium_Char;		//this medium character, 此medium分区特性(读写特性：只读、读写等)
}T_ZONE_DETAIL;

typedef struct
{
	BYTE Disk_Name;				//盘符名
    BYTE bOpenZone;				//
    BYTE ProtectType;			//	
    BYTE ZoneType;				//
	UINT Size;
	UINT resv[4];				
}T_PARTION_INFO;

typedef struct
{
	UINT  TotalLen;				//the length of this struct,此结构体总长度
	UINT  BootBlock;			//reserve block for boot area,boot区的block大小
	TBYTE RsvBlkNum;            //MTD alloc area, used to MTD write period.
    BYTE  Zone_Cnt;				//number of Zone, 分区个数
	BYTE  resv;					//用于对齐
	T_ZONE_DETAIL *Zone_Group; 		//point to group of all zone,分区详细信息指针
}T_ZONE_INFO;

#pragma pack()



typedef enum
{
    BT_USB_STATUS_IDLE = 0, //idle
    BT_USB_STATUS_WORK,     //Attach usb
	BT_USB_STATUS_RUNNING,	//get event to run
    BT_USB_STATUS_SWITCH,   //1.1 to 2.0
}E_USB_STATUS;

typedef enum
{
    CHIP_3224, //AK_3224
    CHIP_322L, //AK_322L
    CHIP_36XX, //Sundance
    CHIP_780X, //Aspen
    CHIP_880X, //Aspen2
    CHIP_10X6, //Snowbird
    CHIP_3631, //Sundance2
    CHIP_3671, //Sundance2A
    CHIP_RESERVER,
}E_CHIP_TYPE;

typedef struct
{
    UINT reg_addr;
    UINT reg_value;
}T_RAM_REG;

typedef struct
{
	BOOL  bCompare;
	TCHAR pc_path[MAX_PATH];
	CHAR  driver_name;
}T_DOWNLOAD_IMG;

typedef struct
{
    BOOL  bCompare;
    TCHAR pc_path[MAX_PATH+1];
    char  udisk_path[MAX_PATH+1];
} T_DOWNLOAD_FILE;

#pragma pack(1)
typedef struct
{
    UINT	num;
    BYTE	dir;
    BYTE	level;
	BYTE	Pullup;
	BYTE	Pulldown;
} T_GPIO_PARAM;
#pragma pack()

typedef enum
{
	E_GPIO_DIR_OUT = 0,
	E_GPIO_DIR_IN,
	E_GPIO_LEVEL_HIGH,
    E_GPIO_LEVEL_LOW,
	E_GPIO_PULL_ABLE,
    E_GPIO_PULL_DISABLE,
}E_GPIO;

typedef struct
{
	UINT nSize_enlarge; // set this value if enlarge capacity,otherwise set 0 
	CHAR driver_Name;
	CHAR pstrVolumeLable[12];
}T_FORMAT_DRIVER;

typedef struct
{
    UINT  data_length;
    UINT  ld_addr;
    BYTE  bBackup;
    CHAR  file_name[DOWNLOAD_BIN_FILENAME_SIZE];
}T_BIN_INFO;

typedef struct
{
    CHAR  file_name[DOWNLOAD_BIN_FILENAME_SIZE];
	TCHAR pc_path[MAX_PATH+1];
}T_UPLOAD_BIN;

#pragma pack(1)
typedef struct
ImgInfo
{
    UINT   data_length;
    BYTE    DriverName;
}T_IMG_INFO;
#pragma pack()

typedef struct
{
    BYTE DiskName;		
	BYTE Rsv1[3];			
    UINT PageCnt;          
    UINT Rsv2;
    UINT Rsv3;
}T_DRIVER_INFO;

TRANSC_API void   BT_GetVersion(UINT *MainVersion, UINT *SubVersion);
TRANSC_API UINT   BT_Init(UINT nBurrnObject,  BOOL(* BurnProcess)( UINT nID), VOID (*BurnProgress)(UINT nID, UINT  nDataLen));
TRANSC_API UINT   BT_AttachUSB(TCHAR *pstrUSBName, E_USB_TYPE usbType);
TRANSC_API UINT   BT_DetachUSB(TCHAR *pstrUSBName, E_USB_TYPE usbType);
TRANSC_API UINT   BT_Start(VOID);
//set ram register parameter
TRANSC_API UINT   BT_SetRamParam(UINT nID, T_RAM_REG RamReg[], UINT nNumReg);
TRANSC_API UINT   BT_DownloadProducer(UINT nID, TCHAR *pstrPath, UINT runAddr);
TRANSC_API UINT   BT_SwitchUSBHighSpeed(UINT nID);
TRANSC_API UINT   BT_TestConnection(UINT nID);
TRANSC_API UINT   BT_SetMode(UINT nID, E_BURN_MODE mode);
TRANSC_API UINT	  BT_GetFlashID(UINT nID, UINT ce2_gpio, UINT ce3_gpio, UINT *FlashID,  UINT *nChipCnt);
TRANSC_API UINT   BT_SetNandParam(UINT nID, T_NAND_PHY_INFO *NandPhyInfo);
//TRANSC_API UINT   BT_DetectNandParam(UINT nID, T_NAND_PHY_INFO *pNandPhyInfo);
TRANSC_API UINT   BT_InitSecArea(UINT nID, UINT type);
TRANSC_API UINT   BT_SetResvAreaSize(UINT nID, UINT nSize, BOOL bErase);
TRANSC_API UINT   BT_DownloadBin(UINT nID, T_DOWNLOAD_BIN *pDowloadBin);
TRANSC_API UINT   BT_CreatePartion(UINT nID, T_PARTION_INFO PartionInfo[], UINT nNumPartion, UINT resvSize);
TRANSC_API UINT   BT_FormatDriver(UINT nID, T_FORMAT_DRIVER *formatDriver);
TRANSC_API UINT   BT_MountDriver(UINT nID, char driverName[], UINT nDriverNum);
TRANSC_API UINT   BT_DownloadBoot(UINT nID, TCHAR *pstrPath,  E_CHIP_TYPE ChipType);
TRANSC_API UINT   BT_DownloadImg(UINT nID, T_DOWNLOAD_IMG *pDowloadImg);
TRANSC_API UINT   BT_DownloadFile(UINT nID, T_DOWNLOAD_FILE *pDowloadFile);
TRANSC_API UINT   BT_Close(UINT nID);
TRANSC_API UINT   BT_SetGPIO(UINT nID, T_GPIO_PARAM *GpioParam);
TRANSC_API UINT   BT_ResetDevice(UINT nID);
TRANSC_API UINT   BT_GetRegValue(UINT nID, UINT regAddr, UINT *regValue);
TRANSC_API UINT   BT_GetDiskInfo(UINT nID,  UINT *DriverNum, T_DRIVER_INFO* pDriverInfo);
TRANSC_API UINT  BT_UploadBin(UINT nID, T_UPLOAD_BIN* pUploadBin);
TRANSC_API UINT  BT_UploadBoot(UINT nID, TCHAR* pstrPath, UINT fileLen);
TRANSC_API UINT  BT_WriteASAFile(UINT nID, char* fileName, BYTE* pBuf, UINT bufSize, UINT mode);
TRANSC_API UINT BT_WriteMobileDeviceCode(UINT nID);
#endif //_TRANSC_H_