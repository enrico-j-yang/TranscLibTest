
// The following ifdef block is the standard way of creating macros which make exporting 
// from a DLL simpler. All files within this DLL are compiled with the USBTRANSC_EXPORTS
// symbol defined on the command line. this symbol should not be defined on any project
// that uses this DLL. This way any other project whose source files include this file see 
// USBTRANSC_API functions as being imported from a DLL, wheras this DLL sees symbols
// defined with this macro as being exported.
#ifndef __USB_TRANSC_H_
#define __USB_TRANSC_H_

#ifdef USBTRANSC_EXPORTS
#define USBTRANSC_API __declspec(dllexport)
#else
#define USBTRANSC_API __declspec(dllimport)
#endif

#define USB_MAINVERSION 1
#define USB_SUBVERSION 3

#define BT_FAIL 0
#define BT_SUCCESS 1

typedef enum
{
	USB_M3USB = 0,
	USB_NBUSB,
	USB_MASS,
	USB_NULL
}
E_USB_TYPE;

typedef enum
{
	DATA_STAGE_NONE,
	DATA_STAGE_IN,
	DATA_STAGE_OUT
}
E_DATA_STAGE;

typedef struct
{
	BYTE  cmd;
	E_DATA_STAGE data_stage;
	UINT cmd_param[2];
	
	PBYTE data_buffer;
	UINT data_length;

	UINT ack_status;
}
T_USB_TRANSC;


USBTRANSC_API HANDLE BT_OpenUSB(LPTSTR strUSBName, E_USB_TYPE usbType);

USBTRANSC_API UINT BT_CloseUSB(HANDLE hUSB);

USBTRANSC_API UINT BT_CommitTransc(HANDLE hUSB, T_USB_TRANSC *pTransc);

USBTRANSC_API BOOL BT_RegisterDevice(HWND hWnd, E_USB_TYPE usbType);

USBTRANSC_API void BT_GetUSBLibVersion(UINT *MainVer, UINT *SubVer);

#endif