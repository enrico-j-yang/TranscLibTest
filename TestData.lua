-- TestData.lua
-- V1.0.0
--
-- All_API_parameter_equivalent_data_defined_below.
g_tblTestInputData =
{
    BT_GetVersion = 
    {
        MainVersion = 
        {
            Valid            = 999, --RunTimepointer,
            Invalid            = 0
        },
        SubVersion =
        {
            Valid            = 999, --RunTimepointer,
            Invalid            = 0        
        }
    },
    BT_Init =
    {
        nBurnObject =
        {
            BelowMinimum    = 0,
            Minimum            = 1,
            Typical            = 2,
            Maximum            = 8,
            OverMaximum        = 9
        },
        BurnProcess =
        {
            Valid            = 999, --RunTimepointer,
            Invalid            = 0
        },
        BurnProgress =
        {
            Valid            = 999, --RunTimepointer,
            Invalid            = 0
        }
    },
    BT_AttachUSB = 
    {
        pstrUSBName =
        {
            Valid            = 999, --RunTimepointer,
            Invalid            = 0
        },
        usbType = 
        {
            USB_M3USB        = 0,
            USB_NBUSB        = 1,
            USB_MASS        = 2,
            USB_NULL        = 3
        }        
    },
    BT_DetachUSB = 
    {
        pstrUSBName =
        {
            Valid            = 999, --RunTimepointer,
            Invalid            = 0
        },
        usbType = 
        {
            USB_M3USB        = 0,
            USB_NBUSB        = 1,
            USB_MASS        = 2,
            USB_NULL        = 3
        }        
    },
    BT_SetRamParam =
    {
        nID =
        {
            Valid            = value_amount_nBurnObject,
            Invalid            = 9, --nBurnObject+1
        },
        RamReg =
        {
            Valid            = 999, --RunTimepointer,
            Invalid            = 0, --null_pointer
        },
        nNumReg = 
        {
            Zero            = 0,
            Valid            = 999, --RunTimeValue,
        }
    },
    BT_DownloadProducer =
    {
        nID =
        {
            Valid            = value_amount_nBurnObject,
            Invalid            = 9, --nBurnObject+1
        },
        pstrPath =
        {
            Valid            = ".\\TestData\\producer_sundance2A_uboot.bin",
            Invalid            = 0, --null_pointer
        },
        runAddr =
        {
            Valid            = 805306368, --ram_address(typically_0x30000000)
        }
    },            
    BT_SwitchUSBHighSpeed =
    {
        nID =
        {
            Valid            = value_amount_nBurnObject,
            Invalid            = 9, --nBurnObject+1
        }
    },
    BT_TestConnection =
    {
        nID =
        {
            Valid            = value_amount_nBurnObject,
            Invalid            = 9, --nBurnObject+1
        }
    },
    BT_SetMode =
    {
        nID =
        {
            Valid            = value_amount_nBurnObject,
            Invalid            = 9, --nBurnObject+1
        },
        mode =
        {
            MODE_NEWBURN    = 1,
            MODE_UPDATE        = 2,
            MODE_SPIFLASH    = 0,
            MODE_ERASE      = 3,
            MODE_DEBUG        = 4,
        }
    },
    BT_GetFlashID =
    {
        nID =
        {
            Valid            = value_amount_nBurnObject,
            Invalid            = 9, --nBurnObject+1
        },
        Ce2_gpio =
        {
            Valid            = 0,
            Invalid            = 255,
        },
        Ce3_gpio =
        {
            Valid            = 1,
            Invalid            = 255,
        },
        FlashID =
        {
            Valid            = 999, --RuntimePointer,
            Invalid            = 0, --null_pointer
        },
        nChipCnt =
        {
            Valid            = 999, --RunTimepointer,
            Invalid            = 0, --null_pointer
        }
    },
    BT_SetNandParam =
    {
        nID =
        {
            Valid            = value_amount_nBurnObject,
            Invalid            = 9, --nBurnObject+1
        },
        NandPhyInfo =
        {
            Valid            = 999, --RunTimepointer,
            Invalid            = 0, --null_pointer
        }
    },
    BT_DetectNandParam =
    {
        nID =
        {
            Valid            = value_amount_nBurnObject,
            Invalid            = 9, --nBurnObject+1
        },
        pNandPhyInfo =
        {
            Valid            = 999, --RunTimepointer,
            Invalid            = 0, --null_pointer
        }
    },
    BT_InitSecArea =
    {
        nID =
        {
            Valid            = value_amount_nBurnObject,
            Invalid            = 9, --nBurnObject+1
        },
        Type =
        {
            Zero            = 0,
            One                = 1,
            Others            = 2,
        }

    },
    BT_SetResvAreaSize =
    {
        nID =
        {
            Valid            = value_amount_nBurnObject,
            Invalid            = 9, --nBurnObject+1
        },
        nSize =
        {
            Overmax           = 2048*1024*1024,
			Maximum            = (1024-0)*1024*1024,
            Valid            = 4,
            Zero            = 0,
        },
        bErase =
        {
            TRUE            = 1,
            FALSE            = 0,
        }
    },
    BT_DownloadBin =
    {
        nID =
        {
            Valid            = value_amount_nBurnObject,
            Invalid            = 9, --nBurnObject+1
        },
        pDownloadBin =
        {
            Valid            = 999, --RunTimepointer,
            Invalid            = 0, --null_pointer
        },
        bCompare =
        {
            TRUE            = 1,
            FALSE            = 0
        },
        bBackup =
        {
            TRUE            = 1,
            FALSE            = 0
        },
        bUpdateSelf =
        {
            TRUE            = 1,
            FALSE            = 0
        },
        pc_path =
        {
            Valid            = ".\\TestData\\Spring2_bios.bin",
            Larger            = ".\\TestData\\Larger_bios.bin",
            Performance500    = ".\\TestData\\500.bin",
            Performance1k    = ".\\TestData\\1k.bin",
            Performance2k    = ".\\TestData\\2k.bin",
            Performance4k    = ".\\TestData\\4k.bin",
            Performance8k    = ".\\TestData\\8k.bin",
            Performance16k    = ".\\TestData\\16k.bin",
            Performance32k    = ".\\TestData\\32k.bin",
            Performance64k    = ".\\TestData\\64k.bin",
            Performance128k    = ".\\TestData\\128k.bin",
            Performance256k    = ".\\TestData\\256k.bin",            
            Performance512k    = ".\\TestData\\512k.bin",            
            Performance1024    = ".\\TestData\\1024k.bin",            
            Performance2048    = ".\\TestData\\2048k.bin",                        
            Performance4096    = ".\\TestData\\4096k.bin",                        
            Performance8192    = ".\\TestData\\8192k.bin",                        
            EmptyPath        = "",
            Invalid            = 0, --null_pointer
        },
        ld_addr =
        {
            Valid            = 810549248, --ram_address(typically_0x30500000)
        },
        file_name =
        {
            Valid            = "BIOS",
            EmptyPath        = "",
            Invalid            = 0, --null_pointer
        }
    },
    BT_CreatePartition =
    {
        nID =
        {
            Valid            = value_amount_nBurnObject,
            Invalid            = 9, --nBurnObject+1
        },
        PartitionInfo =
        {
            Valid            = 999, --RunTimepointer,
            Invalid            = 0, --null_pointer
        },
        Disk_Name = 
        {    
            Valid            = 65, --'A'
            Lower            = 97, --'a'
            Invalid            = 0,
        },
        bOpenZone = 
        {
            TRUE            = 1,
            FALSE            = 0,
        },
        ProtectType = 
        {
            Valid             = 0,
        },
        ZoneType = 
        {
            Valid             = 0,
        },
        Size = 
        {
            Valid             = 100,
            Invalid            = 0,
            Over            = 4294967296, --4G        
        },
        nNumPartition =
        {
            Zero            = 0,
            Valid            = 1,
            IdenticalTwo    = 2,
            Maximum            = 26,
            Over            = 27,
        },
        resvSize = 
        {
            Valid            = 64
        },            
    },
    BT_FormatDriver =
    {
        nID =
        {
            Valid            = value_amount_nBurnObject,
            Invalid            = 9, --nBurnObject+1
        },
        formatDriver = 
        {
            Valid            = 999, --RunTimepointer,
            Invalid            = 0, --null_pointer            
        },
        nSize_enlarge =
        {
            Zero            = 0,
            Maximum            = 4294967296,
        },
        driverName =
        {
            Valid            = 65, --'A',
            Lower            = 97, --'a',
            Invalid            = 0,
        },
        pstrVolumeLable =
        {
            Valid            = "test",
            Invalid            = 0, --null_pointer
        }
    },
    BT_MountDriver =
    {
        nID =
        {
            Valid            = value_amount_nBurnObject,
            Invalid            = 9, --nBurnObject+1
        },
        driverName =
        {
            Valid            = "A", --'A'
            Invalid            = "1",
            Null            = 0, --null_pointer
        },
        nDriverNum =
        {
            Zero            = 0,
            Valid            = 1,
            Over            = 27, --driver_count_+_1
        }
    },
    BT_DownloadBoot =
    {
        nID =
        {
            Valid            = value_amount_nBurnObject,
            Invalid            = 9, --nBurnObject+1
        },
        pstrPath =
        {
            Valid            = ".\\TestData\\nandboot_sundance2A.bin",
            Invalid            = 0, --null_pointer
        },
        ChipType =
        {
            CHIP_3224        = 0,
            CHIP_322L        = 1,
            CHIP_36XX        = 2,
            CHIP_780X        = 3,
            CHIP_880X        = 4,
            CHIP_10X6        = 5,
            CHIP_3631        = 6,
            CHIP_3671        = 7,
        }
    },
    BT_DownloadImg =
    {
        nID =
        {
            Valid            = value_amount_nBurnObject,
            Invalid            = 9, --nBurnObject+1
        },
        pDownloadImg =
        {
            Valid            = 999, --RunTimepointer,
            Invalid            = 0, --null_pointer
        },
        bCompare =
        {
            TRUE            = 1,
            FALSE            = 0
        },
        pc_path =
        {
            Valid            = ".\\TestData\\A.img",
            Performance4k    = ".\\TestData\\4k.bin",
            Performance32k    = ".\\TestData\\32k.bin",
            Performance60k    = ".\\TestData\\60k.bin",
            Performance100k    = ".\\TestData\\100k.bin",
            EmptyPath        = "",            
            Invalid            = 0, --null_pointer
        },
        driver_name =
        {
            Valid            = 65, --'A',
            Invalid            = 0,
        }
    },
    BT_DownloadFile =
    {
        nID =
        {
            Valid            = value_amount_nBurnObject,
            Invalid            = 9, --nBurnObject+1
        },
        pDownloadFile =
        {
            Valid            = 999, --RunTimepointer,
            Invalid            = 0, --null_pointer
        },
        bCompare =
        {
            TRUE            = 1,
            FALSE            = 0,
        },
        pc_path =
        {
            --Valid            = ".\\TestData\\文本文档.txt", lua_tostring不能把中文字符正确转换，因此中文字符暂时在烧录工具验�?
            Valid            = ".\\TestData\\text.txt",
            Spring          = ".\\TestData\\Spring.bin",
            AkResData       = ".\\TestData\\AkResData.Bin",
            LangCodepage    = ".\\TestData\\LangCodepage.bin",
            DynamicFont         = ".\\TestData\\DynamicFont4_16.bin",
            Performance500    = ".\\TestData\\500.bin",
            Performance1k    = ".\\TestData\\1k.bin",
            Performance2k    = ".\\TestData\\2k.bin",
            Performance4k    = ".\\TestData\\4k.bin",
            Performance8k    = ".\\TestData\\8k.bin",
            Performance16k    = ".\\TestData\\16k.bin",
            Performance32k    = ".\\TestData\\32k.bin",
            Performance64k    = ".\\TestData\\64k.bin",
            Performance128k    = ".\\TestData\\128k.bin",
            Performance256k    = ".\\TestData\\256k.bin",            
            Performance512k    = ".\\TestData\\512k.bin",            
            Performance1024    = ".\\TestData\\1024k.bin",            
            Performance2048    = ".\\TestData\\2048k.bin",                        
            Performance4096    = ".\\TestData\\4096k.bin",                        
            Performance8192    = ".\\TestData\\8192k.bin",                        
            EmptyPath        = "",
            Invalid            = 0, --null_pointer
        },
        udisk_path =
        {
            Valid                        = "A:\\text.txt",
            SpringValid                 = "A:\\Spring.bin",
            AkResDataValid                 = "A:\\AkResData.bin",
            LangCodepageValid             = "A:\\LangCodepage.bin",
            DynamicFontValid            = "A:\\DynamicFont4_16.bin",
            EmptyPath                    = "",
            Invalid                        = 0, --null_pointer
        }
    },
    BT_Close =
    {
        nID =
        {
            Valid            = value_amount_nBurnObject,
            Invalid            = 9, --nBurnObject+1
        }
    },
    BT_SetGPIO =
    {
        nID =        
        {
            Valid            = value_amount_nBurnObject,
            Invalid            = 9, --nBurnObject+1
        },
        GpioParam =
        {
            Valid            = 999, --RunTimepointer,
            Invalid            = 0, --null_pointer
        },        
        num =
        {
            Valid        = 47, --chip_GPIO_number
        },
        dir =
        {
            Ouput        = 0,
            Input        = 1,
        },
        level =
        {
            Highlevel    = 2,
            Lowlevel    = 3,
        },
        Pullup =
        {
            Valid        = 4,
            Invalid        = 5,
        },
        Pulldown =
        {
            Valid        = 4,
            Invalid        = 5,
        }
    },
    BT_UploadFile =
    {        
        nID =
        {
            Valid            = value_amount_nBurnObject,
            Invalid            = 9, --nBurnObject+1
        },
        strFilePath =
        {
            Valid            = "A:\\text.txt", --RunTimepointer,
            Invalid            = "", --null_pointer
        },
        strPCPath =
        {
            Valid            = "f:\\temp\\text.txt", --RunTimepointer,
            Invalid            = "", --null_pointer
        }
    },
    BT_UploadBin =
    {
        nID =
        {
            Valid            = value_amount_nBurnObject,
            Invalid            = 9, --nBurnObject+1
        },
        pUploadBin =
        {
            Valid            = 999, --RunTimepointer,
            Invalid            = 0, --null_pointer
        },
        file_name =
        {
            Valid            = "Spring_bios.bin", --RunTimepointer,
            Invalid            = "", --null_pointer
        },
        pc_path =
        {
            Valid            = "D:\\temp\\Spring_bios.bin", --RunTimepointer,
            Invalid            = "", --null_pointer
        }

    },
    BT_ResetDevice =
    {
        nID =
        {
            Valid            = value_amount_nBurnObject,
            Invalid            = 9, --nBurnObject+1
        }
    },
    BT_GetRegValue =
    {
        nID =
        {
            Valid            = value_amount_nBurnObject,
            Invalid            = 9, --nBurnObject+1
        },
        regAddr =
        {
            SundanceIIA        = 536870928,  --AK3671 chip ID Address "0x20000010",
            Aspen3            = 134217728,  --AK8801 chip ID Address "0x08000000",
            Snowbird        = 67108864,   --AK1080 chip ID Address "0x04000000",
        },
        regValue = 
        {
            Valid            = 999, --RunTimepointer,
            Invalid            = 0, --null_pointer            
        }
    },    
    BT_UploadBoot =
    {
        nID =
        {
            Valid            = value_amount_nBurnObject,
            Invalid            = 9, --nBurnObject+1
        },
        pstrPath =
        {
            Valid            = "D:\\temp\\nandboot.bin", --RunTimepointer,
            Invalid            = "", --null_pointer            
        },
        fileLen =
        {
            Valid            = 10240, --RunTimepointer,
            Invalid            = 0, --null_pointer        
        }
    },
    BT_GetDiskInfo =
    {
        nID =
        {
            Valid            = value_amount_nBurnObject,
            Invalid            = 9, --nBurnObject+1
        },
        DriverNum =
        {
            Valid            = 999, --RunTimepointer,
            Invalid            = 0, --null_pointer    
        },
        pDriverInfo =
        {
            Valid            = 999, --RunTimepointer,
            Invalid            = 0, --null_pointer    
        }
    },
    BT_WriteASAFile =
    {
        nID =
        {
            Valid            = value_amount_nBurnObject,
            Invalid            = 9, --nBurnObject+1
        },
        fileName =
        {
            Valid            = "SaveFile", --RunTimepointer,
            Empty_Name        = "",--Empty name
            OverMaxchar        = "SaveFilea",
        },
        pBuf =
        {
            Valid            = 999, --RunTimepointer,
            Invalid            = 0, --null_pointer    
        },
        Bufsize =
        {
            Valid                = 256,
            Over_ResvAreaSize    = 5*1024*1024,--大于nSize的�??4M
            Invalid                = 4096,
        },
        Mode =
        {
            ASA_MODE_OPEN        = 0,
            ASA_MODE_CREATE        = 1
        }
    },
    BT_WriteMobileDeviceCode =
    {
        nID =
        {
            Valid            = value_amount_nBurnObject,
            Invalid            = 9, --nBurnObject+1
        }
    }
            
}


-- All API output values defined below
g_tblRetVal = 
{
    BT_FAIL = 0,
    BT_SUCCESS = 1,
    BT_DL_FILE_OPEN_FAIL = 2,
    BT_DL_FILE_READ_FAIL = 3,
    BT_DL_FILE_DOWNLOAD_FAIL = 4,
    BT_SECAREA_FORMAT_ERR = 5,
    BT_SECAREA_MOUNT_ERR = 6,
    BT_DL_COMPARE_FAIL = 7,
    BT_DL_UPDATE_BIN_OVER = 8,
    BT_PARTION_PARAM_ERR = 9,
    BT_PARTION_MEDIUM_ERR = 10,
    BT_IMG_MATCH_ERR = 11,
    BT_IMG_WRITE_ERR = 12,
    BT_FILE_CREATE_FAIL = 13,
    BT_FILE_WRITE_FAIL = 14 ,
    BT_UPDATE_BIN_OVER_RANGE = 15,    
}


-- test data function
-- SetPartitionInfo set identical partition information for given partition count
function SetPartitionInfo(PartitionCnt)
    local tbl = {}

    for i=1, PartitionCnt do     
        tbl[(i - 1) * 5 + 1] = g_tblTestInputData.BT_CreatePartition.Disk_Name.Valid
        tbl[(i - 1) * 5 + 2] = g_tblTestInputData.BT_CreatePartition.bOpenZone.TRUE
        tbl[(i - 1) * 5 + 3] = g_tblTestInputData.BT_CreatePartition.ProtectType.Valid
        tbl[(i - 1) * 5 + 4] = g_tblTestInputData.BT_CreatePartition.ZoneType.Valid
        tbl[(i - 1) * 5 + 5] = g_tblTestInputData.BT_CreatePartition.Size.Valid
    end

    return tbl
end

-- Test case data table
-- Test case data table format must be defined as below
-- Usage:
-- g_tblCaseNC001 = -- test case ID
-- {
--     { -- Every test step data defined by "{}"
--         Test_XX_Init, -- atom test function for this test step
--         -- test input data defined here
--         InputData = 
--         {
--             para1,
--             para2,
--         },
--         -- Test output data defined here
--         -- There are 2 different types of data, string defined as output data type, number defined as the 
--         -- position of output data to store.
--         -- There are 5 of output types, 
--         -- "Temporal": output will only be used for step result comparison, and no position data is needed.
--         -- "Next": output will be used for step result comparison and input data of next step, a position data is needed in next data.
--         -- "CaseLong" output will be used for step result comparison and input data for rest of steps, a position data is needed in next data.
--         -- "MultiThread" output will be used for multithread step input data only, a position data is needed in next data.
--         -- "LaunchMultiThread" indicates that multithread must be created and launched in this step, and no position data is needed.
--         OutputData = 
--         { --  There are 2 output data, first one is for result comparison only, second one is for next step second input parameter.
--             "Temporal",    
--             "Next",
--             2,
--         },
--         -- Reference data defined here
--         -- Comparison condition can be "Equal" or " Not Equal", and a reference data must be defined in next data.
--         RefData = 
--         {
--             "Equal",
--             g_tblRetVal.BT_SUCCESS,   
--         },
--     }, -- end of step 1 data
--     { -- every test step data defined by "{}"
--         ...
--     }, -- end of step 2 data
--     ...
-- } -- end of test case data

-- Normal Test Case


-- BT_API_NC_1000
g_tblCaseNC1000 =
{
	[1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
	[2]=
    {
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
	[4]=
    {
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[5]=
    {
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[6]=
	{
		Test_BT_SetMode,
		InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetMode.mode.MODE_SPIFLASH,   -- Primary test point
        },
		OutputData = 
        {
            "Temporal",        
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },		
	},
	[7]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[8]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[9]=
    {
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[10]=
    {
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}
-- BT_API_NC_1010
g_tblCaseNC1010=
{
	[1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
	[2]=
    {
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
	[4]=
    {
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[5]=
    {
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[6]=
	{
		Test_BT_SwitchUSBHighSpeed,
		InputData =
        {
            0, -- nID returned from BT_AttachUSB
        },
		OutputData = 
        {
            "Temporal",        
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },		
	},
	[7]=
	{
		Test_BT_SetMode,
		InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetMode.mode.MODE_SPIFLASH,   -- Primary test point
        },
		OutputData = 
        {
            "Temporal",        
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },		
	},
	[8]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[9]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[10]=
    {
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[11]=
    {
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}
-- BT_API_NC_1100
g_tblCaseNC1100 =
{
	[1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
	[2]=
    {
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
	[4]=
    {
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[5]=
	{
		Test_BT_SetMode,
		InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetMode.mode.MODE_SPIFLASH,   -- Primary test point
        },
		OutputData = 
        {
            "Temporal",        
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },		
	},
	[6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[7]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[8]=
    {
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[9]=
    {
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}

-- BT_API_NC_2000
g_tblCaseNC2000 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[8]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
   [9]=
    {
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[10]=
    {
        Test_BT_CreatePartition,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            SetPartitionInfo(1), --tblPartitionInfo,
            g_tblTestInputData.BT_CreatePartition.PartitionInfo.Valid,
            g_tblTestInputData.BT_CreatePartition.nNumPartition.Valid,
            g_tblTestInputData.BT_CreatePartition.resvSize.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[11]=
    {
        Test_BT_FormatDriver,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_FormatDriver.nSize_enlarge.Zero,
            g_tblTestInputData.BT_FormatDriver.driverName.Valid,
            g_tblTestInputData.BT_FormatDriver.pstrVolumeLable.Valid,
            g_tblTestInputData.BT_FormatDriver.formatDriver.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[12]=
    {
        Test_BT_DownloadBoot,    
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBoot.pstrPath.Valid, 
            g_tblTestInputData.BT_DownloadBoot.ChipType.CHIP_3631,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[13]=
    {
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}

--BT_API_NC_2001
g_tblCaseNC2001 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "MultiThread",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "MultiThread",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },    
    [4]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
            "LaunchMultiThread",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [5]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [7]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [8]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [9]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [10]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [11]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
    [12]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
    [13]=
	{
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
    [14]=
	{
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
    [15]=
	{
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
    [16]=
	{
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
    [17]=
	{
        Test_BT_CreatePartition,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            SetPartitionInfo(1), --tblPartitionInfo,
            g_tblTestInputData.BT_CreatePartition.PartitionInfo.Valid,
            g_tblTestInputData.BT_CreatePartition.nNumPartition.Valid,
            g_tblTestInputData.BT_CreatePartition.resvSize.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
    [18]=
	{
        Test_BT_CreatePartition,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            SetPartitionInfo(1), --tblPartitionInfo,
            g_tblTestInputData.BT_CreatePartition.PartitionInfo.Valid,
            g_tblTestInputData.BT_CreatePartition.nNumPartition.Valid,
            g_tblTestInputData.BT_CreatePartition.resvSize.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
    [19]=
	{
        Test_BT_FormatDriver,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_FormatDriver.nSize_enlarge.Zero,
            g_tblTestInputData.BT_FormatDriver.driverName.Valid,
            g_tblTestInputData.BT_FormatDriver.pstrVolumeLable.Valid,
            g_tblTestInputData.BT_FormatDriver.formatDriver.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
    [20]=
	{
        Test_BT_FormatDriver,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_FormatDriver.nSize_enlarge.Zero,
            g_tblTestInputData.BT_FormatDriver.driverName.Valid,
            g_tblTestInputData.BT_FormatDriver.pstrVolumeLable.Valid,
            g_tblTestInputData.BT_FormatDriver.formatDriver.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
    [21]=
	{
        Test_BT_DownloadFile,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadFile.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadFile.pc_path.Valid,
            g_tblTestInputData.BT_DownloadFile.udisk_path.Valid,
            g_tblTestInputData.BT_DownloadFile.pDownloadFile.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [22]=
	{
        Test_BT_DownloadFile,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadFile.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadFile.pc_path.Valid,
            g_tblTestInputData.BT_DownloadFile.udisk_path.Valid,
            g_tblTestInputData.BT_DownloadFile.pDownloadFile.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [23]=
	{
        Test_BT_DownloadBoot,    
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBoot.pstrPath.Valid, 
            g_tblTestInputData.BT_DownloadBoot.ChipType.CHIP_3631,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [24]=
	{
        Test_BT_DownloadBoot,    
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBoot.pstrPath.Valid, 
            g_tblTestInputData.BT_DownloadBoot.ChipType.CHIP_3631,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [25]=
	{
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [26]=
	{
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}
--BT_API_NC_2002
g_tblCaseNC2002 =
{
}

-- BT_API_NC_2003
g_tblCaseNC2003 =
{
	[1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
	[2]=
    {
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
	[4]=
    {
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[5]=
    {
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[6]=
	{
		Test_BT_SwitchUSBHighSpeed,
		InputData =
        {
            0, -- nID returned from BT_AttachUSB
        },
		OutputData = 
        {
            "Temporal",        
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },		
	},
	[7]=
	{
		Test_BT_TestConnection,
		InputData =
        {
            0, -- nID returned from BT_AttachUSB
        },
		OutputData = 
        {
            "Temporal",        
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },		
	},
	[8]=
	{
		Test_BT_SetMode,
		InputData =
        {
            0, -- nID returned from BT_AttachUSB
			g_tblTestInputData.BT_SetMode.mode.MODE_NEWBURN,
        },
		OutputData = 
        {
            "Temporal",        
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },			
	},
	[9]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [10]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[11]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[12]=
    {
        Test_BT_SetResvAreaSize,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB    
            g_tblTestInputData.BT_SetResvAreaSize.nSize.Zero,
            g_tblTestInputData.BT_SetResvAreaSize.bErase.FALSE,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[13]=
    {
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.TRUE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[14]=
    {
        Test_BT_CreatePartition,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            SetPartitionInfo(1), --tblPartitionInfo,
            g_tblTestInputData.BT_CreatePartition.PartitionInfo.Valid,
            g_tblTestInputData.BT_CreatePartition.nNumPartition.Valid,
            g_tblTestInputData.BT_CreatePartition.resvSize.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[15]=
    {
        Test_BT_FormatDriver,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_FormatDriver.nSize_enlarge.Zero,
            g_tblTestInputData.BT_FormatDriver.driverName.Valid,
            g_tblTestInputData.BT_FormatDriver.pstrVolumeLable.Valid,
            g_tblTestInputData.BT_FormatDriver.formatDriver.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[16]=
	{
        Test_BT_DownloadImg,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadImg.pDownloadImg.Valid,
            g_tblTestInputData.BT_DownloadImg.bCompare.TRUE,
            g_tblTestInputData.BT_DownloadImg.pc_path.Valid,
            g_tblTestInputData.BT_DownloadImg.driver_name.Valid,
        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },	
	[17]=
	{
        Test_BT_DownloadFile,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadFile.bCompare.TRUE,
            g_tblTestInputData.BT_DownloadFile.pc_path.Spring,
            g_tblTestInputData.BT_DownloadFile.udisk_path.SpringValid,
            g_tblTestInputData.BT_DownloadFile.pDownloadFile.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [18]=
	{
        Test_BT_DownloadFile,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadFile.bCompare.TRUE,
            g_tblTestInputData.BT_DownloadFile.pc_path.AkResData,
            g_tblTestInputData.BT_DownloadFile.udisk_path.AkResDataValid,
            g_tblTestInputData.BT_DownloadFile.pDownloadFile.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[19]=
	{
        Test_BT_DownloadFile,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadFile.bCompare.TRUE,
            g_tblTestInputData.BT_DownloadFile.pc_path.LangCodepage,
            g_tblTestInputData.BT_DownloadFile.udisk_path.LangCodepageValid,
            g_tblTestInputData.BT_DownloadFile.pDownloadFile.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[20]=
	{
        Test_BT_DownloadFile,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadFile.bCompare.TRUE,
            g_tblTestInputData.BT_DownloadFile.pc_path.DynamicFont,
            g_tblTestInputData.BT_DownloadFile.udisk_path.DynamicFontValid,
            g_tblTestInputData.BT_DownloadFile.pDownloadFile.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[21]=
    {
        Test_BT_DownloadBoot,    
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBoot.pstrPath.Valid, 
            g_tblTestInputData.BT_DownloadBoot.ChipType.CHIP_3631,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[22]=
    {
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}	
g_tblCaseNC2004 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
     [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[6]=
    {
        Test_BT_ResetDevice,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}	
	
g_tblCaseNC2005 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[8]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[9]=
    {
        Test_BT_DownloadBoot,    
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBoot.pstrPath.Valid, 
            g_tblTestInputData.BT_DownloadBoot.ChipType.CHIP_3631,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
   [10]=
    {
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[11]=
    {
        Test_BT_CreatePartition,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            SetPartitionInfo(1), --tblPartitionInfo,
            g_tblTestInputData.BT_CreatePartition.PartitionInfo.Valid,
            g_tblTestInputData.BT_CreatePartition.nNumPartition.Valid,
            g_tblTestInputData.BT_CreatePartition.resvSize.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[12]=
    {
        Test_BT_FormatDriver,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_FormatDriver.nSize_enlarge.Zero,
            g_tblTestInputData.BT_FormatDriver.driverName.Valid,
            g_tblTestInputData.BT_FormatDriver.pstrVolumeLable.Valid,
            g_tblTestInputData.BT_FormatDriver.formatDriver.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[13]=
	{
        Test_BT_DownloadFile,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadFile.bCompare.TRUE,
            g_tblTestInputData.BT_DownloadFile.pc_path.Valid,
            g_tblTestInputData.BT_DownloadFile.udisk_path.Valid,
            g_tblTestInputData.BT_DownloadFile.pDownloadFile.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[14]=
    {
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}

-- BT_API_NC_2010
g_tblCaseNC2010 =
{
	[1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
	[2]=
    {
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
	[4]=
    {
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[5]=
    {
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[6]=
	{
		Test_BT_SwitchUSBHighSpeed,
		InputData =
        {
            0, -- nID returned from BT_AttachUSB
        },
		OutputData = 
        {
            "Temporal",        
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },		
	},
	[7]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [8]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[9]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
   [10]=
    {
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[11]=
    {
        Test_BT_CreatePartition,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            SetPartitionInfo(1), --tblPartitionInfo,
            g_tblTestInputData.BT_CreatePartition.PartitionInfo.Valid,
            g_tblTestInputData.BT_CreatePartition.nNumPartition.Valid,
            g_tblTestInputData.BT_CreatePartition.resvSize.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[12]=
    {
        Test_BT_FormatDriver,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_FormatDriver.nSize_enlarge.Zero,
            g_tblTestInputData.BT_FormatDriver.driverName.Valid,
            g_tblTestInputData.BT_FormatDriver.pstrVolumeLable.Valid,
            g_tblTestInputData.BT_FormatDriver.formatDriver.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[13]=
    {
        Test_BT_DownloadBoot,    
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBoot.pstrPath.Valid, 
            g_tblTestInputData.BT_DownloadBoot.ChipType.CHIP_3631,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[14]=
    {
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}	
-- BT_API_NC_2020
g_tblCaseNC2020 =
{
	[1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
	[2]=
    {
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
	[4]=
    {
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[5]=
    {
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[6]=
	{
		Test_BT_SetMode,
		InputData =
        {
            0, -- nID returned from BT_AttachUSB
			g_tblTestInputData.BT_SetMode.mode.MODE_NEWBURN,
        },
		OutputData = 
        {
            "Temporal",        
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },		
	},
	[7]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [8]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[9]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
   [10]=
    {
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[11]=
    {
        Test_BT_CreatePartition,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            SetPartitionInfo(1), --tblPartitionInfo,
            g_tblTestInputData.BT_CreatePartition.PartitionInfo.Valid,
            g_tblTestInputData.BT_CreatePartition.nNumPartition.Valid,
            g_tblTestInputData.BT_CreatePartition.resvSize.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[12]=
    {
        Test_BT_FormatDriver,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_FormatDriver.nSize_enlarge.Zero,
            g_tblTestInputData.BT_FormatDriver.driverName.Valid,
            g_tblTestInputData.BT_FormatDriver.pstrVolumeLable.Valid,
            g_tblTestInputData.BT_FormatDriver.formatDriver.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[13]=
    {
        Test_BT_DownloadBoot,    
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBoot.pstrPath.Valid, 
            g_tblTestInputData.BT_DownloadBoot.ChipType.CHIP_3631,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[14]=
    {
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}	

--BT_API_NC_2030
g_tblCaseNC2030 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[5]=
    {
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[6]=
    {        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
    [8]=
	{
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[9]=
    {
        Test_BT_SetResvAreaSize,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB    
            g_tblTestInputData.BT_SetResvAreaSize.nSize.Zero,
            g_tblTestInputData.BT_SetResvAreaSize.bErase.FALSE,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[10]=
    {
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.TRUE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[11]=
    {
        Test_BT_CreatePartition,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            SetPartitionInfo(1), --tblPartitionInfo,
            g_tblTestInputData.BT_CreatePartition.PartitionInfo.Valid,
            g_tblTestInputData.BT_CreatePartition.nNumPartition.Valid,
            g_tblTestInputData.BT_CreatePartition.resvSize.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[12]=
    {
        Test_BT_FormatDriver,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_FormatDriver.nSize_enlarge.Zero,
            g_tblTestInputData.BT_FormatDriver.driverName.Valid,
            g_tblTestInputData.BT_FormatDriver.pstrVolumeLable.Valid,
            g_tblTestInputData.BT_FormatDriver.formatDriver.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[13]=
    {
        Test_BT_DownloadBoot,    
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBoot.pstrPath.Valid, 
            g_tblTestInputData.BT_DownloadBoot.ChipType.CHIP_3631,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[14]=
    {
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}

--BT_API_NC_2031
g_tblCaseNC2031 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[5]=
    {
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[6]=
    {        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
    [8]=
	{
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[9]=
    {
        Test_BT_SetResvAreaSize,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB    
            g_tblTestInputData.BT_SetResvAreaSize.nSize.Valid,
            g_tblTestInputData.BT_SetResvAreaSize.bErase.FALSE,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[10]=
    {
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.TRUE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[11]=
    {
        Test_BT_CreatePartition,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            SetPartitionInfo(1), --tblPartitionInfo,
            g_tblTestInputData.BT_CreatePartition.PartitionInfo.Valid,
            g_tblTestInputData.BT_CreatePartition.nNumPartition.Valid,
            g_tblTestInputData.BT_CreatePartition.resvSize.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[12]=
    {
        Test_BT_FormatDriver,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_FormatDriver.nSize_enlarge.Zero,
            g_tblTestInputData.BT_FormatDriver.driverName.Valid,
            g_tblTestInputData.BT_FormatDriver.pstrVolumeLable.Valid,
            g_tblTestInputData.BT_FormatDriver.formatDriver.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[13]=
    {
        Test_BT_DownloadBoot,    
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBoot.pstrPath.Valid, 
            g_tblTestInputData.BT_DownloadBoot.ChipType.CHIP_3631,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[14]=
    {
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}

--BT_API_NC_2032
g_tblCaseNC2032 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[5]=
    {
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[6]=
    {        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
    [8]=
	{
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[9]=
    {
        Test_BT_SetResvAreaSize,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB    
            g_tblTestInputData.BT_SetResvAreaSize.nSize.Valid,
            g_tblTestInputData.BT_SetResvAreaSize.bErase.TRUE,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[10]=
    {
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.TRUE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[11]=
    {
        Test_BT_CreatePartition,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            SetPartitionInfo(1), --tblPartitionInfo,
            g_tblTestInputData.BT_CreatePartition.PartitionInfo.Valid,
            g_tblTestInputData.BT_CreatePartition.nNumPartition.Valid,
            g_tblTestInputData.BT_CreatePartition.resvSize.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[12]=
    {
        Test_BT_FormatDriver,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_FormatDriver.nSize_enlarge.Zero,
            g_tblTestInputData.BT_FormatDriver.driverName.Valid,
            g_tblTestInputData.BT_FormatDriver.pstrVolumeLable.Valid,
            g_tblTestInputData.BT_FormatDriver.formatDriver.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[13]=
    {
        Test_BT_DownloadBoot,    
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBoot.pstrPath.Valid, 
            g_tblTestInputData.BT_DownloadBoot.ChipType.CHIP_3631,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[14]=
    {
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}
--BT_API_NC_2040
g_tblCaseNC2040 =
{
   [1]=
   {
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
    [8]=
	{
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
    [9]=
	{
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.TRUE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
    [10]=
	{
        Test_BT_CreatePartition,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            SetPartitionInfo(1), --tblPartitionInfo,
            g_tblTestInputData.BT_CreatePartition.PartitionInfo.Valid,
            g_tblTestInputData.BT_CreatePartition.nNumPartition.Valid,
            g_tblTestInputData.BT_CreatePartition.resvSize.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
    [11]=
	{
        Test_BT_FormatDriver,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_FormatDriver.nSize_enlarge.Zero,
            g_tblTestInputData.BT_FormatDriver.driverName.Valid,
            g_tblTestInputData.BT_FormatDriver.pstrVolumeLable.Valid,
            g_tblTestInputData.BT_FormatDriver.formatDriver.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[12]=
	{
        Test_BT_DownloadImg,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadImg.pDownloadImg.Valid,
            g_tblTestInputData.BT_DownloadImg.bCompare.TRUE,
            g_tblTestInputData.BT_DownloadImg.pc_path.Valid,
            g_tblTestInputData.BT_DownloadImg.driver_name.Valid,
        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },	
    [13]=
	{
        Test_BT_DownloadBoot,    
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBoot.pstrPath.Valid, 
            g_tblTestInputData.BT_DownloadBoot.ChipType.CHIP_3631,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [14]=
	{
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}

--BT_API_NC_2041
g_tblCaseNC2041 =
{
   [1]=
   {
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
    [8]=
	{
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
    [9]=
	{
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.TRUE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
    [10]=
	{
        Test_BT_CreatePartition,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            SetPartitionInfo(1), --tblPartitionInfo,
            g_tblTestInputData.BT_CreatePartition.PartitionInfo.Valid,
            g_tblTestInputData.BT_CreatePartition.nNumPartition.Valid,
            g_tblTestInputData.BT_CreatePartition.resvSize.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
    [11]=
	{
        Test_BT_FormatDriver,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_FormatDriver.nSize_enlarge.Zero,
            g_tblTestInputData.BT_FormatDriver.driverName.Valid,
            g_tblTestInputData.BT_FormatDriver.pstrVolumeLable.Valid,
            g_tblTestInputData.BT_FormatDriver.formatDriver.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[12]=
	{
        Test_BT_DownloadImg,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadImg.pDownloadImg.Valid,
            g_tblTestInputData.BT_DownloadImg.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadImg.pc_path.Valid,
            g_tblTestInputData.BT_DownloadImg.driver_name.Valid,
        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [13]=
	{
        Test_BT_DownloadBoot,    
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBoot.pstrPath.Valid, 
            g_tblTestInputData.BT_DownloadBoot.ChipType.CHIP_3631,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [143]=
	{
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}
-- BT_API_NC_2050
g_tblCaseNC2050 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
    [8]=
	{
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
    [9]=
	{
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
    [10]=
	{
        Test_BT_CreatePartition,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            SetPartitionInfo(1), --tblPartitionInfo,
            g_tblTestInputData.BT_CreatePartition.PartitionInfo.Valid,
            g_tblTestInputData.BT_CreatePartition.nNumPartition.Valid,
            g_tblTestInputData.BT_CreatePartition.resvSize.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
    [11]=
	{
        Test_BT_FormatDriver,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_FormatDriver.nSize_enlarge.Zero,
            g_tblTestInputData.BT_FormatDriver.driverName.Valid,
            g_tblTestInputData.BT_FormatDriver.pstrVolumeLable.Valid,
            g_tblTestInputData.BT_FormatDriver.formatDriver.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
    [12]=
	{
        Test_BT_DownloadFile,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadFile.bCompare.TRUE,
            g_tblTestInputData.BT_DownloadFile.pc_path.Valid,
            g_tblTestInputData.BT_DownloadFile.udisk_path.Valid,
            g_tblTestInputData.BT_DownloadFile.pDownloadFile.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [13]=
	{
        Test_BT_DownloadBoot,    
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBoot.pstrPath.Valid, 
            g_tblTestInputData.BT_DownloadBoot.ChipType.CHIP_3631,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [14]=
	{
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}

-- BT_API_NC_2051
g_tblCaseNC2051 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
    [8]=
	{
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
    [9]=
	{
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
    [10]=
	{
        Test_BT_CreatePartition,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            SetPartitionInfo(1), --tblPartitionInfo,
            g_tblTestInputData.BT_CreatePartition.PartitionInfo.Valid,
            g_tblTestInputData.BT_CreatePartition.nNumPartition.Valid,
            g_tblTestInputData.BT_CreatePartition.resvSize.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
    [11]=
	{
        Test_BT_FormatDriver,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_FormatDriver.nSize_enlarge.Zero,
            g_tblTestInputData.BT_FormatDriver.driverName.Valid,
            g_tblTestInputData.BT_FormatDriver.pstrVolumeLable.Valid,
            g_tblTestInputData.BT_FormatDriver.formatDriver.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
    [12]=
	{
        Test_BT_DownloadFile,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadFile.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadFile.pc_path.Valid,
            g_tblTestInputData.BT_DownloadFile.udisk_path.Valid,
            g_tblTestInputData.BT_DownloadFile.pDownloadFile.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [13]=
	{
        Test_BT_DownloadBoot,    
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBoot.pstrPath.Valid, 
            g_tblTestInputData.BT_DownloadBoot.ChipType.CHIP_3631,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [14]=
	{
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}

-- BT_API_NC_2052
g_tblCaseNC2052 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
    [8]=
	{
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
    [9]=
	{
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
    [10]=
	{
        Test_BT_CreatePartition,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            SetPartitionInfo(1), --tblPartitionInfo,
            g_tblTestInputData.BT_CreatePartition.PartitionInfo.Valid,
            g_tblTestInputData.BT_CreatePartition.nNumPartition.Valid,
            g_tblTestInputData.BT_CreatePartition.resvSize.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
    [11]=
	{
        Test_BT_FormatDriver,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_FormatDriver.nSize_enlarge.Zero,
            g_tblTestInputData.BT_FormatDriver.driverName.Valid,
            g_tblTestInputData.BT_FormatDriver.pstrVolumeLable.Valid,
            g_tblTestInputData.BT_FormatDriver.formatDriver.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
    [12]=
	{
        Test_BT_DownloadImg,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadImg.pDownloadImg.Valid,
            g_tblTestInputData.BT_DownloadImg.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadImg.pc_path.Valid,
            g_tblTestInputData.BT_DownloadImg.driver_name.Valid,
        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[13]=
	{
        Test_BT_DownloadFile,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadFile.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadFile.pc_path.Valid,
            g_tblTestInputData.BT_DownloadFile.udisk_path.Valid,
            g_tblTestInputData.BT_DownloadFile.pDownloadFile.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [14]=
	{
        Test_BT_DownloadBoot,    
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBoot.pstrPath.Valid, 
            g_tblTestInputData.BT_DownloadBoot.ChipType.CHIP_3631,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [15]=
	{
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}
-- BT_API_NC_2060
g_tblCaseNC2060 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[8]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
   [9]=
    {
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[10]=
    {
        Test_BT_CreatePartition,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            SetPartitionInfo(1), --tblPartitionInfo,
            g_tblTestInputData.BT_CreatePartition.PartitionInfo.Valid,
            g_tblTestInputData.BT_CreatePartition.nNumPartition.Valid,
            g_tblTestInputData.BT_CreatePartition.resvSize.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[11]=
    {
        Test_BT_FormatDriver,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_FormatDriver.nSize_enlarge.Zero,
            g_tblTestInputData.BT_FormatDriver.driverName.Valid,
            g_tblTestInputData.BT_FormatDriver.pstrVolumeLable.Valid,
            g_tblTestInputData.BT_FormatDriver.formatDriver.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[12]=
    {
        Test_BT_DownloadBoot,    
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBoot.pstrPath.Valid, 
            g_tblTestInputData.BT_DownloadBoot.ChipType.CHIP_3631,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[13]=
    {
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[14]=
    {
        Test_BT_ResetDevice,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}

-- BT_API_NC_2070
g_tblCaseNC2070 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Valid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Valid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[8]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
   [9]=
    {
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[10]=
    {
        Test_BT_CreatePartition,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            SetPartitionInfo(1), --tblPartitionInfo,
            g_tblTestInputData.BT_CreatePartition.PartitionInfo.Valid,
            g_tblTestInputData.BT_CreatePartition.nNumPartition.Valid,
            g_tblTestInputData.BT_CreatePartition.resvSize.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[11]=
    {
        Test_BT_FormatDriver,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_FormatDriver.nSize_enlarge.Zero,
            g_tblTestInputData.BT_FormatDriver.driverName.Valid,
            g_tblTestInputData.BT_FormatDriver.pstrVolumeLable.Valid,
            g_tblTestInputData.BT_FormatDriver.formatDriver.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[12]=
    {
        Test_BT_DownloadBoot,    
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBoot.pstrPath.Valid, 
            g_tblTestInputData.BT_DownloadBoot.ChipType.CHIP_3631,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[13]=
    {
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}

-- BT_API_NC_2080
g_tblCaseNC2080 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[8]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
   [9]=
    {
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[10]=
    {
        Test_BT_CreatePartition,
		InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            SetPartitionInfo(1), --tblPartitionInfo,
            g_tblTestInputData.BT_CreatePartition.PartitionInfo.Valid,
            g_tblTestInputData.BT_CreatePartition.nNumPartition.Maximum,
            g_tblTestInputData.BT_CreatePartition.resvSize.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[11]=
    {
        Test_BT_FormatDriver,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_FormatDriver.nSize_enlarge.Zero,
            g_tblTestInputData.BT_FormatDriver.driverName.Valid,
            g_tblTestInputData.BT_FormatDriver.pstrVolumeLable.Valid,
            g_tblTestInputData.BT_FormatDriver.formatDriver.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[12]=
    {
        Test_BT_DownloadBoot,    
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBoot.pstrPath.Valid, 
            g_tblTestInputData.BT_DownloadBoot.ChipType.CHIP_3631,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[13]=
    {
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}

-- BT_API_NC_2081
g_tblCaseNC2081 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[8]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
   [9]=
    {
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[10]=
    {
        Test_BT_CreatePartition,
		InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            SetPartitionInfo(1), --tblPartitionInfo,
            g_tblTestInputData.BT_CreatePartition.PartitionInfo.Valid,
            g_tblTestInputData.BT_CreatePartition.nNumPartition.Valid,
            g_tblTestInputData.BT_CreatePartition.resvSize.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[11]=
    {
        Test_BT_FormatDriver,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_FormatDriver.nSize_enlarge.Zero,
            g_tblTestInputData.BT_FormatDriver.driverName.Valid,
            g_tblTestInputData.BT_FormatDriver.pstrVolumeLable.Valid,
            g_tblTestInputData.BT_FormatDriver.formatDriver.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[12]=
    {
        Test_BT_DownloadBoot,    
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBoot.pstrPath.Valid, 
            g_tblTestInputData.BT_DownloadBoot.ChipType.CHIP_3631,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[13]=
    {
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}

-- BT_API_NC_2082
g_tblCaseNC2082 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[8]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
   [9]=
    {
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[10]=
    {
        Test_BT_CreatePartition,
		InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            SetPartitionInfo(1), --tblPartitionInfo,
            g_tblTestInputData.BT_CreatePartition.PartitionInfo.Valid,
            g_tblTestInputData.BT_CreatePartition.nNumPartition.Valid,
            g_tblTestInputData.BT_CreatePartition.resvSize.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[11]=
    {
        Test_BT_FormatDriver,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_FormatDriver.nSize_enlarge.Maximum,
            g_tblTestInputData.BT_FormatDriver.driverName.Valid,
            g_tblTestInputData.BT_FormatDriver.pstrVolumeLable.Valid,
            g_tblTestInputData.BT_FormatDriver.formatDriver.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[12]=
    {
        Test_BT_DownloadBoot,    
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBoot.pstrPath.Valid, 
            g_tblTestInputData.BT_DownloadBoot.ChipType.CHIP_3631,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[13]=
    {
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}

-- BT_API_NC_2090
g_tblCaseNC2090 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[6]=
	{
		Test_BT_TestConnection,
		InputData =
        {
            0, -- nID returned from BT_AttachUSB
        },
		OutputData = 
        {
            "Temporal",        
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },		
	},
	
    [7]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [8]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[9]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
   [10]=
    {
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[11]=
    {
        Test_BT_CreatePartition,
		InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            SetPartitionInfo(1), --tblPartitionInfo,
            g_tblTestInputData.BT_CreatePartition.PartitionInfo.Valid,
            g_tblTestInputData.BT_CreatePartition.nNumPartition.Valid,
            g_tblTestInputData.BT_CreatePartition.resvSize.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[12]=
    {
        Test_BT_FormatDriver,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_FormatDriver.nSize_enlarge.Valid,
            g_tblTestInputData.BT_FormatDriver.driverName.Valid,
            g_tblTestInputData.BT_FormatDriver.pstrVolumeLable.Valid,
            g_tblTestInputData.BT_FormatDriver.formatDriver.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[13]=
    {
        Test_BT_DownloadBoot,    
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBoot.pstrPath.Valid, 
            g_tblTestInputData.BT_DownloadBoot.ChipType.CHIP_3631,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[14]=
    {
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}
-- BT_API_NC_2100
g_tblCaseNC2100 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [6]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[7]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
   	[8]=
    {
        Test_BT_SetResvAreaSize,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB    
            g_tblTestInputData.BT_SetResvAreaSize.nSize.Valid,
            g_tblTestInputData.BT_SetResvAreaSize.bErase.TRUE,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
   [9]=
    {
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[10]=
    {
        Test_BT_CreatePartition,
		InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            SetPartitionInfo(1), --tblPartitionInfo,
            g_tblTestInputData.BT_CreatePartition.PartitionInfo.Valid,
            g_tblTestInputData.BT_CreatePartition.nNumPartition.Valid,
            g_tblTestInputData.BT_CreatePartition.resvSize.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[11]=
    {
        Test_BT_FormatDriver,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_FormatDriver.nSize_enlarge.Valid,
            g_tblTestInputData.BT_FormatDriver.driverName.Valid,
            g_tblTestInputData.BT_FormatDriver.pstrVolumeLable.Valid,
            g_tblTestInputData.BT_FormatDriver.formatDriver.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[12]=
    {
        Test_BT_DownloadBoot,    
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBoot.pstrPath.Valid, 
            g_tblTestInputData.BT_DownloadBoot.ChipType.CHIP_10X6,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[13]=
    {
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}
-- BT_API_NC_2101
g_tblCaseNC2101 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [6]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[7]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
   	[8]=
    {
        Test_BT_SetResvAreaSize,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB    
            g_tblTestInputData.BT_SetResvAreaSize.nSize.Zero,
            g_tblTestInputData.BT_SetResvAreaSize.bErase.TRUE,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
   [9]=
    {
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[10]=
    {
        Test_BT_CreatePartition,
		InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            SetPartitionInfo(1), --tblPartitionInfo,
            g_tblTestInputData.BT_CreatePartition.PartitionInfo.Valid,
            g_tblTestInputData.BT_CreatePartition.nNumPartition.Valid,
            g_tblTestInputData.BT_CreatePartition.resvSize.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[11]=
    {
        Test_BT_FormatDriver,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_FormatDriver.nSize_enlarge.Valid,
            g_tblTestInputData.BT_FormatDriver.driverName.Valid,
            g_tblTestInputData.BT_FormatDriver.pstrVolumeLable.Valid,
            g_tblTestInputData.BT_FormatDriver.formatDriver.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[12]=
    {
        Test_BT_DownloadBoot,    
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBoot.pstrPath.Valid, 
            g_tblTestInputData.BT_DownloadBoot.ChipType.CHIP_10X6,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[13]=
    {
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}

-- BT_API_NC_2200
g_tblCaseNC2200 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[6]=
    {
        Test_BT_SetGPIO,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB  
			g_tblTestInputData.BT_SetGPIO.num.Valid,
            g_tblTestInputData.BT_SetGPIO.dir.Input,
            g_tblTestInputData.BT_SetGPIO.level.Lowlevel,
            g_tblTestInputData.BT_SetGPIO.Pullup.Valid,
            g_tblTestInputData.BT_SetGPIO.Pulldown.Invalid,      
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[7]=
    {
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}
-- BT_API_NC_2201
g_tblCaseNC2201 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[6]=
    {
        Test_BT_SetGPIO,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB  
			g_tblTestInputData.BT_SetGPIO.num.Valid,
            g_tblTestInputData.BT_SetGPIO.dir.Output,
            g_tblTestInputData.BT_SetGPIO.level.Highlevel,
            g_tblTestInputData.BT_SetGPIO.Pullup.Invalid,
            g_tblTestInputData.BT_SetGPIO.Pulldown.Valid,      
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[7]=
    {
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}
-- BT_API_NC_2210
g_tblCaseNC2210=
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_GetRegValue,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetRegValue.regAddr.Aspen3,
            g_tblTestInputData.BT_GetRegValue.regValue.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
}

-- BT_API_NC_2211
g_tblCaseNC2211=
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_GetRegValue,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetRegValue.regAddr.Snowbird,
            g_tblTestInputData.BT_GetRegValue.regValue.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
}

-- BT_API_NC_2212
g_tblCaseNC2212=
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_GetRegValue,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetRegValue.regAddr.SundanceIIA,
            g_tblTestInputData.BT_GetRegValue.regValue.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
}

-- BT_API_NC_2213
g_tblCaseNC2213=
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
	[4]=
	{
        Test_BT_GetRegValue,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetRegValue.regAddr.SundanceIIA,
            g_tblTestInputData.BT_GetRegValue.regValue.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    
}

-- BT_API_NC_2220
g_tblCaseNC2220 =
{
     [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Valid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Valid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	 [7]=
	{ 
		Test_BT_DetectNandParam,
		InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DetectNandParam.pNandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[8]=
    {
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}	
	
-- BT_API_NC_2230
g_tblCaseNC2230 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Valid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Valid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[8]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
   [9]=
    {
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[10]=
    {
        Test_BT_CreatePartition,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            SetPartitionInfo(1), --tblPartitionInfo,
            g_tblTestInputData.BT_CreatePartition.PartitionInfo.Valid,
            g_tblTestInputData.BT_CreatePartition.nNumPartition.Valid,
            g_tblTestInputData.BT_CreatePartition.resvSize.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[11]=
    {
        Test_BT_GetDiskInfo,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_GetDiskInfo.DriverNum.Valid,
            g_tblTestInputData.BT_GetDiskInfo.pDriverInfo.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[13]=
    {
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}

-- BT_API_NC_2231
g_tblCaseNC2231 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[8]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
   [9]=
    {
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[10]=
    {
        Test_BT_CreatePartition,
		InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            SetPartitionInfo(1), --tblPartitionInfo,
            g_tblTestInputData.BT_CreatePartition.PartitionInfo.Valid,
            g_tblTestInputData.BT_CreatePartition.nNumPartition.Maximum,
            g_tblTestInputData.BT_CreatePartition.resvSize.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[11]=
    {
        Test_BT_GetDiskInfo,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_GetDiskInfo.DriverNum.Valid,
            g_tblTestInputData.BT_GetDiskInfo.pDriverInfo.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[13]=
    {
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}
	
-- BT_API_NC_2240
g_tblCaseNC2240 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[8]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[9]=
    {
        Test_BT_WriteMobileDeviceCode,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[10]=
    {
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}
-- BT_API_NC_2241
g_tblCaseNC2241 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[8]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[9]=
    {
        Test_BT_WriteASAFile,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB 
			g_tblTestInputData.BT_WriteASAFile.fileName.Valid,
            g_tblTestInputData.BT_WriteASAFile.pBuf.Valid,
            g_tblTestInputData.BT_WriteASAFile.Bufsize.Valid,
            g_tblTestInputData.BT_WriteASAFile.Mode.ASA_MODE_OPEN,       
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[10]=
    {
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}

-- BT_API_NC_2243
g_tblCaseNC2243 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,           
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	
	[8]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[9]=
    {
        Test_BT_WriteASAFile,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB 
			g_tblTestInputData.BT_WriteASAFile.fileName.Valid,
            g_tblTestInputData.BT_WriteASAFile.pBuf.Valid,
            g_tblTestInputData.BT_WriteASAFile.Bufsize.Valid,
            g_tblTestInputData.BT_WriteASAFile.Mode.ASA_MODE_CREATE,       
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[10]=
    {
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}


-- BT_API_NC_2242
g_tblCaseNC2242 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[8]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[9]=
    {
        Test_BT_WriteASAFile,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB 
			g_tblTestInputData.BT_WriteASAFile.fileName.Valid,
            g_tblTestInputData.BT_WriteASAFile.pBuf.Valid,
            g_tblTestInputData.BT_WriteASAFile.Bufsize.Valid,
            g_tblTestInputData.BT_WriteASAFile.Mode.ASA_MODE_OPEN,       
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[10]=
    {
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}

-- BT_API_NC_2250
g_tblCaseNC2250 =
{
    [1]=
	{
        Test_BT_GetVersion,
        InputData = 
        {
            g_tblTestInputData.BT_GetVersion.MainVersion.Valid,
            g_tblTestInputData.BT_GetVersion.SubVersion.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },
	 },
}
-- BT_API_NC_3000
g_tblCaseNC3000 =
{
	[1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
	[2]=
    {
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
	[4]=
    {
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[5]=
    {
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[6]=
	{
		Test_BT_SetMode,
		InputData =
        {
            0, -- nID returned from BT_AttachUSB
			g_tblTestInputData.BT_SetMode.mode.MODE_UPDATE,
        },
		OutputData = 
        {
            "Temporal",        
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },		
	},
	[7]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [8]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[9]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
   [10]=
    {
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[11]=
    {
        Test_BT_MountDriver,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_MountDriver.driverName.Valid,
            g_tblTestInputData.BT_MountDriver.nDriverNum.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[12]=
    {
        Test_BT_DownloadBoot,    
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBoot.pstrPath.Valid, 
            g_tblTestInputData.BT_DownloadBoot.ChipType.CHIP_3631,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[13]=
    {
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}

-- BT_API_NC_3010
g_tblCaseNC3010 =
{
	[1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
	[2]=
    {
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
	[4]=
    {
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[5]=
    {
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[6]=
	{
		Test_BT_SwitchUSBHighSpeed,
		InputData =
        {
            0, -- nID returned from BT_AttachUSB
        },
		OutputData = 
        {
            "Temporal",        
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },		
	},
	[7]=
	{
		Test_BT_SetMode,
		InputData =
        {
            0, -- nID returned from BT_AttachUSB
			g_tblTestInputData.BT_SetMode.mode.MODE_UPDATE,
        },
		OutputData = 
        {
            "Temporal",        
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },		
	},
	[8]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [9]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[10]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
   [11]=
    {
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[12]=
    {
        Test_BT_MountDriver,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_MountDriver.driverName.Valid,
            g_tblTestInputData.BT_MountDriver.nDriverNum.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[13]=
    {
        Test_BT_DownloadBoot,    
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBoot.pstrPath.Valid, 
            g_tblTestInputData.BT_DownloadBoot.ChipType.CHIP_3631,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[14]=
    {
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}

-- BT_API_NC_3020
g_tblCaseNC3020 =
{
	[1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
	[2]=
    {
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
	[4]=
    {
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[5]=
    {
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[6]=
	{
		Test_BT_TestConnection,
		InputData =
        {
            0, -- nID returned from BT_AttachUSB
        },
		OutputData = 
        {
            "Temporal",        
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },		
	},
	[7]=
	{
		Test_BT_SetMode,
		InputData =
        {
            0, -- nID returned from BT_AttachUSB
			g_tblTestInputData.BT_SetMode.mode.MODE_UPDATE,
        },
		OutputData = 
        {
            "Temporal",        
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },		
	},
	[8]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [9]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[10]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
   [11]=
    {
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[12]=
    {
        Test_BT_MountDriver,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_MountDriver.driverName.Valid,
            g_tblTestInputData.BT_MountDriver.nDriverNum.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[13]=
    {
        Test_BT_DownloadBoot,    
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBoot.pstrPath.Valid, 
            g_tblTestInputData.BT_DownloadBoot.ChipType.CHIP_3631,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[14]=
    {
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}

-- BT_API_NC_3030
g_tblCaseNC3030 =
{
	[1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
	[2]=
    {
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
	[4]=
    {
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[5]=
    {
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[6]=
	{
		Test_BT_SetMode,
		InputData =
        {
            0, -- nID returned from BT_AttachUSB
			g_tblTestInputData.BT_SetMode.mode.MODE_UPDATE,
        },
		OutputData = 
        {
            "Temporal",        
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },		
	},
	[7]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [8]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[9]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[10]=
    {
        Test_BT_SetResvAreaSize,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB    
            g_tblTestInputData.BT_SetResvAreaSize.nSize.Zero,
            g_tblTestInputData.BT_SetResvAreaSize.bErase.FALSE,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
   [11]=
    {
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[12]=
    {
        Test_BT_MountDriver,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_MountDriver.driverName.Valid,
            g_tblTestInputData.BT_MountDriver.nDriverNum.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[13]=
    {
        Test_BT_DownloadBoot,    
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBoot.pstrPath.Valid, 
            g_tblTestInputData.BT_DownloadBoot.ChipType.CHIP_3631,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[14]=
    {
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}
-- BT_API_NC_3031
g_tblCaseNC3031 =
{
	[1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
	[2]=
    {
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
	[4]=
    {
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[5]=
    {
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[6]=
	{
		Test_BT_SetMode,
		InputData =
        {
            0, -- nID returned from BT_AttachUSB
			g_tblTestInputData.BT_SetMode.mode.MODE_UPDATE,
        },
		OutputData = 
        {
            "Temporal",        
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },		
	},
	[7]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [8]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[9]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[10]=
    {
        Test_BT_SetResvAreaSize,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB    
            g_tblTestInputData.BT_SetResvAreaSize.nSize.Valid,
            g_tblTestInputData.BT_SetResvAreaSize.bErase.FALSE,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
   [11]=
    {
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[12]=
    {
        Test_BT_MountDriver,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_MountDriver.driverName.Valid,
            g_tblTestInputData.BT_MountDriver.nDriverNum.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[13]=
    {
        Test_BT_DownloadBoot,    
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBoot.pstrPath.Valid, 
            g_tblTestInputData.BT_DownloadBoot.ChipType.CHIP_3631,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[14]=
    {
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}

-- BT_API_NC_3032
g_tblCaseNC3032 =
{
	[1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
	[2]=
    {
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
	[4]=
    {
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[5]=
    {
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[6]=
	{
		Test_BT_SetMode,
		InputData =
        {
            0, -- nID returned from BT_AttachUSB
			g_tblTestInputData.BT_SetMode.mode.MODE_UPDATE,
        },
		OutputData = 
        {
            "Temporal",        
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },		
	},
	[7]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [8]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[9]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[10]=
    {
        Test_BT_SetResvAreaSize,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB    
            g_tblTestInputData.BT_SetResvAreaSize.nSize.Valid,
            g_tblTestInputData.BT_SetResvAreaSize.bErase.TRUE,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
   [11]=
    {
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[12]=
    {
        Test_BT_MountDriver,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_MountDriver.driverName.Valid,
            g_tblTestInputData.BT_MountDriver.nDriverNum.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[13]=
    {
        Test_BT_DownloadBoot,    
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBoot.pstrPath.Valid, 
            g_tblTestInputData.BT_DownloadBoot.ChipType.CHIP_3631,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[14]=
    {
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}

-- BT_API_NC_3040
g_tblCaseNC3040=
{
	[1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
	[2]=
    {
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
	[4]=
    {
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[5]=
    {
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[6]=
	{
		Test_BT_SetMode,
		InputData =
        {
            0, -- nID returned from BT_AttachUSB
			g_tblTestInputData.BT_SetMode.mode.MODE_UPDATE,
        },
		OutputData = 
        {
            "Temporal",        
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },		
	},
	[7]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [8]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[9]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
   [10]=
    {
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[11]=
    {
        Test_BT_MountDriver,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_MountDriver.driverName.Valid,
            g_tblTestInputData.BT_MountDriver.nDriverNum.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[12]=
	{
        Test_BT_DownloadImg,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadImg.pDownloadImg.Valid,
            g_tblTestInputData.BT_DownloadImg.bCompare.TRUE,
            g_tblTestInputData.BT_DownloadImg.pc_path.Valid,
            g_tblTestInputData.BT_DownloadImg.driver_name.Valid,
        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },	
	[13]=
    {
        Test_BT_DownloadBoot,    
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBoot.pstrPath.Valid, 
            g_tblTestInputData.BT_DownloadBoot.ChipType.CHIP_3631,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[14]=
    {
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}

-- BT_API_NC_3041
g_tblCaseNC3041 =
{
	[1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
	[2]=
    {
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
	[4]=
    {
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[5]=
    {
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[6]=
	{
		Test_BT_SetMode,
		InputData =
        {
            0, -- nID returned from BT_AttachUSB
			g_tblTestInputData.BT_SetMode.mode.MODE_UPDATE,
        },
		OutputData = 
        {
            "Temporal",        
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },		
	},
	[7]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [8]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[9]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
   [10]=
    {
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[11]=
    {
        Test_BT_MountDriver,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_MountDriver.driverName.Valid,
            g_tblTestInputData.BT_MountDriver.nDriverNum.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[12]=
	{
        Test_BT_DownloadImg,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadImg.pDownloadImg.Valid,
            g_tblTestInputData.BT_DownloadImg.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadImg.pc_path.Valid,
            g_tblTestInputData.BT_DownloadImg.driver_name.Valid,
        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },	
	[13]=
    {
        Test_BT_DownloadBoot,    
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBoot.pstrPath.Valid, 
            g_tblTestInputData.BT_DownloadBoot.ChipType.CHIP_3631,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[14]=
    {
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}

-- BT_API_NC_3050
g_tblCaseNC3050 =
{
	[1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
	[2]=
    {
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
	[4]=
    {
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[5]=
    {
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[6]=
	{
		Test_BT_SetMode,
		InputData =
        {
            0, -- nID returned from BT_AttachUSB
			g_tblTestInputData.BT_SetMode.mode.MODE_UPDATE,
        },
		OutputData = 
        {
            "Temporal",        
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },		
	},
	[7]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [8]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[9]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
   [10]=
    {
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[11]=
    {
        Test_BT_MountDriver,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_MountDriver.driverName.Valid,
            g_tblTestInputData.BT_MountDriver.nDriverNum.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[12]=
	{
        Test_BT_DownloadFile,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadFile.bCompare.TRUE,
            g_tblTestInputData.BT_DownloadFile.pc_path.Valid,
            g_tblTestInputData.BT_DownloadFile.udisk_path.Valid,
            g_tblTestInputData.BT_DownloadFile.pDownloadFile.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[13]=
    {
        Test_BT_DownloadBoot,    
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBoot.pstrPath.Valid, 
            g_tblTestInputData.BT_DownloadBoot.ChipType.CHIP_3631,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[14]=
    {
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}

-- BT_API_NC_3051
g_tblCaseNC3051 =
{
	[1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
	[2]=
    {
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
	[4]=
    {
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[5]=
    {
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[6]=
	{
		Test_BT_SetMode,
		InputData =
        {
            0, -- nID returned from BT_AttachUSB
			g_tblTestInputData.BT_SetMode.mode.MODE_UPDATE,
        },
		OutputData = 
        {
            "Temporal",        
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },		
	},
	[7]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [8]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[9]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
   [10]=
    {
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[11]=
    {
        Test_BT_MountDriver,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_MountDriver.driverName.Valid,
            g_tblTestInputData.BT_MountDriver.nDriverNum.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[12]=
	{
        Test_BT_DownloadFile,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadFile.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadFile.pc_path.Valid,
            g_tblTestInputData.BT_DownloadFile.udisk_path.Valid,
            g_tblTestInputData.BT_DownloadFile.pDownloadFile.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[13]=
    {
        Test_BT_DownloadBoot,    
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBoot.pstrPath.Valid, 
            g_tblTestInputData.BT_DownloadBoot.ChipType.CHIP_3631,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[14]=
    {
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}

-- BT_API_NC_3052
g_tblCaseNC3052 =
{
	[1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
	[2]=
    {
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
	[4]=
    {
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[5]=
    {
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[6]=
	{
		Test_BT_SetMode,
		InputData =
        {
            0, -- nID returned from BT_AttachUSB
			g_tblTestInputData.BT_SetMode.mode.MODE_UPDATE,
        },
		OutputData = 
        {
            "Temporal",        
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },		
	},
	[7]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [8]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[9]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
   [10]=
    {
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[11]=
    {
        Test_BT_MountDriver,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_MountDriver.driverName.Valid,
            g_tblTestInputData.BT_MountDriver.nDriverNum.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[12]=
	{
        Test_BT_DownloadImg,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadImg.pDownloadImg.Valid,
            g_tblTestInputData.BT_DownloadImg.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadImg.pc_path.Valid,
            g_tblTestInputData.BT_DownloadImg.driver_name.Valid,
        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },	
	[13]=
	{
        Test_BT_DownloadFile,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadFile.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadFile.pc_path.Valid,
            g_tblTestInputData.BT_DownloadFile.udisk_path.Valid,
            g_tblTestInputData.BT_DownloadFile.pDownloadFile.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[14]=
    {
        Test_BT_DownloadBoot,    
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBoot.pstrPath.Valid, 
            g_tblTestInputData.BT_DownloadBoot.ChipType.CHIP_3631,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[15]=
    {
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}


-- BT_API_NC_3100
g_tblCaseNC3100 =
{
	[1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
	[2]=
    {
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
	[4]=
    {
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[5]=
	{
		Test_BT_SetMode,
		InputData =
        {
            0, -- nID returned from BT_AttachUSB
			g_tblTestInputData.BT_SetMode.mode.MODE_UPDATE,
        },
		OutputData = 
        {
            "Temporal",        
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },		
	},
	[6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[8]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[9]=
    {
        Test_BT_SetResvAreaSize,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB    
            g_tblTestInputData.BT_SetResvAreaSize.nSize.Valid,
            g_tblTestInputData.BT_SetResvAreaSize.bErase.TRUE,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
   [10]=
    {
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[11]=
    {
        Test_BT_MountDriver,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_MountDriver.driverName.Valid,
            g_tblTestInputData.BT_MountDriver.nDriverNum.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[12]=
    {
        Test_BT_DownloadBoot,    
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBoot.pstrPath.Valid, 
            g_tblTestInputData.BT_DownloadBoot.ChipType.CHIP_10X6,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[13]=
    {
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}

-- BT_API_NC_4000
g_tblCaseNC4000 =
{
	[1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
	[2]=
    {
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
	[4]=
    {
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[5]=
    {
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[6]=
	{
		Test_BT_SetMode,
		InputData =
        {
            0, -- nID returned from BT_AttachUSB
			g_tblTestInputData.BT_SetMode.mode.MODE_DEBUG,
        },
		OutputData = 
        {
            "Temporal",        
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },		
	},
	[7]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [8]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[9]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[10]=
    {
        Test_BT_UploadBin,
        InputData = 
        {
            0, 
			g_tblTestInputData.BT_UploadBin.file_name.Valid,
            g_tblTestInputData.BT_UploadBin.pc_path.Valid,
            g_tblTestInputData.BT_UploadBin.pUploadBin.Valid,-- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[11]=
    {
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}

-- BT_API_NC_4001
g_tblCaseNC4001 =
{
	[1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
	[2]=
    {
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
	[4]=
    {
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[5]=
    {
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[6]=
	{
		Test_BT_SetMode,
		InputData =
        {
            0, -- nID returned from BT_AttachUSB
			g_tblTestInputData.BT_SetMode.mode.MODE_DEBUG,
        },
		OutputData = 
        {
            "Temporal",        
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },		
	},
	[7]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [8]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[9]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[10]=
    {
        Test_BT_UploadBoot,
        InputData = 
        {
            0, 
			g_tblTestInputData.BT_UploadBoot.pstrPath.Valid,
            g_tblTestInputData.BT_UploadBoot.fileLen.Valid,-- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[11]=
    {
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}

-- BT_API_NC_4002
g_tblCaseNC4002 =
{
	[1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
	[2]=
    {
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
	[4]=
    {
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[5]=
    {
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[6]=
	{
		Test_BT_SetMode,
		InputData =
        {
            0, -- nID returned from BT_AttachUSB
			g_tblTestInputData.BT_SetMode.mode.MODE_DEBUG,
        },
		OutputData = 
        {
            "Temporal",        
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },		
	},
	[7]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [8]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[9]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[10]=
    {
        Test_BT_UploadBin,
        InputData = 
        {
            0, 
			g_tblTestInputData.BT_UploadBin.file_name.Valid,
            g_tblTestInputData.BT_UploadBin.pc_path.Valid,
            g_tblTestInputData.BT_UploadBin.pUploadBin.Valid,-- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[11]=
    {
        Test_BT_UploadBoot,
        InputData = 
        {
            0, 
			g_tblTestInputData.BT_UploadBoot.pstrPath.Valid,
            g_tblTestInputData.BT_UploadBoot.fileLen.Valid,-- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[12]=
    {
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}

-- BT_API_NC_4010
g_tblCaseNC4010 =
{
	[1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
	[2]=
    {
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
	[4]=
    {
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[5]=
    {
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[6]=
	{
		Test_BT_SwitchUSBHighSpeed,
		InputData =
        {
            0, -- nID returned from BT_AttachUSB
        },
		OutputData = 
        {
            "Temporal",        
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },		
	},
	[7]=
	{
		Test_BT_SetMode,
		InputData =
        {
            0, -- nID returned from BT_AttachUSB
			g_tblTestInputData.BT_SetMode.mode.MODE_DEBUG,
        },
		OutputData = 
        {
            "Temporal",        
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },		
	},
	[8]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [9]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[10]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[11]=
    {
        Test_BT_UploadBin,
        InputData = 
        {
            0, 
			g_tblTestInputData.BT_UploadBin.file_name.Valid,
            g_tblTestInputData.BT_UploadBin.pc_path.Valid,
            g_tblTestInputData.BT_UploadBin.pUploadBin.Valid,-- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[12]=
    {
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}

-- BT_API_NC_4011
g_tblCaseNC4011 =
{
	[1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
	[2]=
    {
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
	[4]=
    {
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[5]=
    {
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[6]=
	{
		Test_BT_SwitchUSBHighSpeed,
		InputData =
        {
            0, -- nID returned from BT_AttachUSB
        },
		OutputData = 
        {
            "Temporal",        
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },		
	},
	[7]=
	{
		Test_BT_SetMode,
		InputData =
        {
            0, -- nID returned from BT_AttachUSB
			g_tblTestInputData.BT_SetMode.mode.MODE_DEBUG,
        },
		OutputData = 
        {
            "Temporal",        
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },		
	},
	[8]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [9]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[10]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[11]=
    {
        Test_BT_UploadBoot,
        InputData = 
        {
            0, 
			g_tblTestInputData.BT_UploadBoot.pstrPath.Valid,
            g_tblTestInputData.BT_UploadBoot.fileLen.Valid,-- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[12]=
    {
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}

-- BT_API_NC_4012
g_tblCaseNC4012 =
{
	[1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
	[2]=
    {
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
	[4]=
    {
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[5]=
    {
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[6]=
	{
		Test_BT_SwitchUSBHighSpeed,
		InputData =
        {
            0, -- nID returned from BT_AttachUSB
        },
		OutputData = 
        {
            "Temporal",        
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },		
	},
	[7]=
	{
		Test_BT_SetMode,
		InputData =
        {
            0, -- nID returned from BT_AttachUSB
			g_tblTestInputData.BT_SetMode.mode.MODE_DEBUG,
        },
		OutputData = 
        {
            "Temporal",        
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },		
	},
	[8]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [9]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[10]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[11]=
    {
        Test_BT_UploadBoot,
        InputData = 
        {
            0, 
			g_tblTestInputData.BT_UploadBoot.pstrPath.Valid,
            g_tblTestInputData.BT_UploadBoot.fileLen.Valid,-- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[12]=
    {
        Test_BT_UploadBin,
        InputData = 
        {
            0, 
			g_tblTestInputData.BT_UploadBin.file_name.Valid,
            g_tblTestInputData.BT_UploadBin.pc_path.Valid,
            g_tblTestInputData.BT_UploadBin.pUploadBin.Valid,-- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[13]=
    {
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}

-- BT_API_NC_4100
g_tblCaseNC4100 =
{
	[1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
	[2]=
    {
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
	[4]=
    {
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[5]=
	{
		Test_BT_SetMode,
		InputData =
        {
            0, -- nID returned from BT_AttachUSB
			g_tblTestInputData.BT_SetMode.mode.MODE_DEBUG,
        },
		OutputData = 
        {
            "Temporal",        
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },		
	},
	[6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[8]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[9]=
    {
        Test_BT_UploadBoot,
        InputData = 
        {
            0, 
			g_tblTestInputData.BT_UploadBoot.pstrPath.Valid,
            g_tblTestInputData.BT_UploadBoot.fileLen.Valid,-- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[10]=
    {
        Test_BT_UploadBin,
        InputData = 
        {
            0, 
			g_tblTestInputData.BT_UploadBin.file_name.Valid,
            g_tblTestInputData.BT_UploadBin.pc_path.Valid,
            g_tblTestInputData.BT_UploadBin.pUploadBin.Valid,-- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[11]=
    {
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}

-- BT_API_NC_5000
g_tblCaseNC5000 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{
		Test_BT_SetMode,
		InputData =
        {
            0, -- nID returned from BT_AttachUSB
			g_tblTestInputData.BT_SetMode.mode.MODE_ERASE,
        },
		OutputData = 
        {
            "Temporal",        
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },		
	},
	[7]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [8]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[9]=
    {
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}

-- BT_API_NC_5010
g_tblCaseNC5010 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[6]=
	{
		Test_BT_SwitchUSBHighSpeed,
		InputData =
        {
            0, -- nID returned from BT_AttachUSB
        },
		OutputData = 
        {
            "Temporal",        
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },		
	},
    [7]=
	{
		Test_BT_SetMode,
		InputData =
        {
            0, -- nID returned from BT_AttachUSB
			g_tblTestInputData.BT_SetMode.mode.MODE_ERASE,
        },
		OutputData = 
        {
            "Temporal",        
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },		
	},
	[8]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [9]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[10]=
    {
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}

-- BT_API_NC_5100
g_tblCaseNC5100 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
		Test_BT_SetMode,
		InputData =
        {
            0, -- nID returned from BT_AttachUSB
			g_tblTestInputData.BT_SetMode.mode.MODE_ERASE,
        },
		OutputData = 
        {
            "Temporal",        
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },		
	},
	[6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[8]=
    {
        Test_BT_Close,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
}
	
--Abnormal case
--BT_API_AC_1000
g_tblCaseAC1000 =
{
    {
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.BelowMinimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_FAIL,    
        },        
    },
}
--BT_API_AC_1001
g_tblCaseAC1001 =
{
    {
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.OverMaximum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_FAIL,    
        },        
    },
}

--BT_API_AC_1002
g_tblCaseAC1002 =
{
   [1]=
    {
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Invalid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_FAIL,    
        },        
    },
}
--BT_API_AC_1003
g_tblCaseAC1003 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Invalid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_FAIL,    
        },        
    },
}
-- BT_API_AC_1010
g_tblCaseAC1010 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Invalid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_FAIL, 
        },    
    },
}

-- BT_API_AC_1011
g_tblCaseAC1011 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USb_NULL,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_FAIL, 
        },    
    },
}

-- BT_API_AC_1012
g_tblCaseAC1012 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_FAIL,     
        },    
    },
}
-- BT_API_AC_1020
g_tblCaseAC1020 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            g_tblTestInputData.BT_SetRamParam.nID.Invalid, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_FAIL,        
        },
    },
}
-- BT_API_AC_1021
g_tblCaseAC1021=
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Invalid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_FAIL,        
        },
    },
}
-- BT_API_AC_1022
g_tblCaseAC1022=
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Zero,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_FAIL,        
        },
    },
}

-- BT_API_AC_1030
g_tblCaseAC1030=
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            g_tblTestInputData.BT_DownloadProducer.nID.Invalid, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_DL_FILE_DOWNLOAD_FAIL,        
        },
    },
}
-- BT_API_AC_1031
g_tblCaseAC1031=
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Invalid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_DL_FILE_OPEN_FAIL,        
        },
    },
}
-- BT_API_AC_1032
g_tblCaseAC1032=
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_DL_FILE_DOWNLOAD_FAIL,        
        },
    },
}

-- BT_API_AC_1040
g_tblCaseAC1040 =
{
	[1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
	[2]=
    {
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
	[4]=
    {
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[5]=
    {
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[6]=
	{
		Test_BT_SwitchUSBHighSpeed,
		InputData =
        {
            g_tblTestInputData.BT_SwitchUSBHighSpeed.nID.Invalid-- nID returned from BT_AttachUSB
        },
		OutputData = 
        {
            "Temporal",        
        },
        RefData =
        {
           "Equal",
            g_tblRetVal.BT_FAIL,                
        },		
	},
}

-- BT_API_AC_1050
g_tblCaseAC1050 =
{
	[1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
	[2]=
    {
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
	[4]=
    {
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[5]=
    {
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[6]=
	{
		Test_BT_TestConnection,
		InputData =
        {
            g_tblTestInputData.BT_TestConnection.nID.Invalid,-- nID returned from BT_AttachUSB
        },
		OutputData = 
        {
            "Temporal",        
        },
        RefData =
        {
           "Equal",
            g_tblRetVal.BT_FAIL,                
        },		
	},
}

-- BT_API_AC_1060
g_tblCaseAC1060 =
{
	[1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
	[2]=
    {
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
	[4]=
    {
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[5]=
    {
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[6]=
	{
		Test_BT_SetMode,
		InputData =
        {
            g_tblTestInputData.BT_SetMode.nID.Invalid,-- nID returned from BT_AttachUSB
			g_tblTestInputData.BT_SetMode.mode.MODE_UPDATE,
		},
		OutputData = 
        {
            "Temporal",        
        },
        RefData =
        {
           "Equal",
            g_tblRetVal.BT_FAIL,                
        },		
	},
}

-- BT_API_AC_1070
g_tblCaseAC1070 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            g_tblTestInputData.BT_GetFlashID.nID.Invalid, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_FAIL,               
        },
    },
}

-- BT_API_AC_1071
g_tblCaseAC1071 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Invalid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_FAIL,               
        },
    },
}
-- BT_API_AC_1072
g_tblCaseAC1072 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Invalid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_FAIL,               
        },
    },
}

-- BT_API_AC_1080
g_tblCaseAC1080 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
             "Equal",
            g_tblRetVal.BT_SUCCESS,                 
        },
    },
	[7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            g_tblTestInputData.BT_SetNandParam.nID.Invalid, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
             "Equal",
            g_tblRetVal.BT_FAIL,                 
        },    
    },
}

-- BT_API_AC_1081
g_tblCaseAC1081 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
             "Equal",
            g_tblRetVal.BT_SUCCESS,                 
        },
    },
	[7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Invalid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
             "Equal",
            g_tblRetVal.BT_FAIL,                 
        },    
    },
}
-- BT_API_AC_1090
g_tblCaseAC1090 =
{
     [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Valid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Valid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	 [7]=
	{ 
		Test_BT_DetectNandParam,
		InputData = 
        {
            g_tblTestInputData.BT_DetectNandParam.nID.Invalid, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DetectNandParam.pNandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_FAIL,                
        },
    },
}	

-- BT_API_AC_1091
g_tblCaseAC1091 =
{
     [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Valid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Valid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	 [7]=
	{ 
		Test_BT_DetectNandParam,
		InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DetectNandParam.pNandPhyInfo.Invalid,
        },
        OutputData = 
        {
            "Temporal",    
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_FAIL,                
        },
    },
}	
-- BT_API_AC_1100
g_tblCaseAC1100 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[8]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            g_tblTestInputData.BT_InitSecArea.nID.Invalid, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_FAIL,                
        },        
    },
}

-- BT_API_AC_1110
g_tblCaseAC1110 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[8]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[9]=
    {
        Test_BT_SetResvAreaSize,
        InputData = 
        {
            g_tblTestInputData.BT_SetResvAreaSize.nID.Invalid, -- nID returned from BT_AttachUSB    
            g_tblTestInputData.BT_SetResvAreaSize.nSize.Zero,
            g_tblTestInputData.BT_SetResvAreaSize.bErase.FALSE,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_FAIL,                
        },        
    },
}

-- BT_API_AC_1111
g_tblCaseAC1111 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[8]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[9]=
    {
        Test_BT_SetResvAreaSize,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB    
            g_tblTestInputData.BT_SetResvAreaSize.nSize.Overmax,
            g_tblTestInputData.BT_SetResvAreaSize.bErase.FALSE,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_FAIL,                
        },        
    },
}

-- BT_API_AC_1120
g_tblCaseAC1120 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[8]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[9]=
    {
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.TRUE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Invalid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_FAIL,                
        },        
    },
}

-- BT_API_AC_1121
g_tblCaseAC1121 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[8]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[9]=
    {
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.TRUE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.EmptyPath,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_FAIL,                
        },        
    },
}

-- BT_API_AC_1122
g_tblCaseAC1122 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[8]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[9]=
    {
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.TRUE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.EmptyPath,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_DL_FILE_DOWNLOAD_FAIL,                
        },        
    },
}

-- BT_API_AC_1123
g_tblCaseAC1123 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[8]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[9]=
    {
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.TRUE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_DL_FILE_DOWNLOAD_FAIL,                
        },        
    },
}

-- BT_API_AC_1124
g_tblCaseAC1124 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[8]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[9]=
    {
        Test_BT_SetResvAreaSize,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB    
            g_tblTestInputData.BT_SetResvAreaSize.nSize.Maximum,
            g_tblTestInputData.BT_SetResvAreaSize.bErase.FALSE,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[10]=
    {
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.TRUE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_DL_FILE_DOWNLOAD_FAIL,                
        },        
    },
}
-- BT_API_AC_1130
g_tblCaseAC1130 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[8]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
   [9]=
    {
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[10]=
    {
        Test_BT_CreatePartition,
        InputData = 
        {
          g_tblTestInputData.BT_CreatePartition.nID.Invalid, -- nID returned from BT_AttachUSB        
            SetPartitionInfo(1), --tblPartitionInfo,
            g_tblTestInputData.BT_CreatePartition.PartitionInfo.Valid,
            g_tblTestInputData.BT_CreatePartition.nNumPartition.Valid,
            g_tblTestInputData.BT_CreatePartition.resvSize.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_FAIL,                
        },    
    },
}

-- BT_API_AC_1131
g_tblCaseAC1131 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[8]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
   [9]=
    {
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[10]=
    {
        Test_BT_CreatePartition,
        InputData = 
        {
			0, -- nID returned from BT_AttachUSB        
            SetPartitionInfo(1), --tblPartitionInfo,
            g_tblTestInputData.BT_CreatePartition.PartitionInfo.Invalid,
            g_tblTestInputData.BT_CreatePartition.nNumPartition.Valid,
            g_tblTestInputData.BT_CreatePartition.resvSize.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_FAIL,                
        },    
    },
}

-- BT_API_AC_1132
g_tblCaseAC1132 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[8]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
   [9]=
    {
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[10]=
    {
        Test_BT_CreatePartition,
        InputData = 
        {
			0, -- nID returned from BT_AttachUSB        
            SetPartitionInfo(1), --tblPartitionInfo,
            g_tblTestInputData.BT_CreatePartition.PartitionInfo.Valid,
            g_tblTestInputData.BT_CreatePartition.nNumPartition.Zero,
            g_tblTestInputData.BT_CreatePartition.resvSize.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_FAIL,                
        },    
    },
}

-- BT_API_AC_1133
g_tblCaseAC1133 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[8]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
   [9]=
    {
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[10]=
    {
        Test_BT_CreatePartition,
        InputData = 
        {
			0, -- nID returned from BT_AttachUSB        
            SetPartitionInfo(1), --tblPartitionInfo,
            g_tblTestInputData.BT_CreatePartition.PartitionInfo.Valid,
            g_tblTestInputData.BT_CreatePartition.nNumPartition.Over,
            g_tblTestInputData.BT_CreatePartition.resvSize.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_FAIL,                
        },    
    },
}

-- BT_API_AC_1134
g_tblCaseAC1134 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[8]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
   [9]=
    {
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[10]=
    {
        Test_BT_CreatePartition,
        InputData = 
        {
			0, -- nID returned from BT_AttachUSB        
            SetPartitionInfo(1), --tblPartitionInfo,
            g_tblTestInputData.BT_CreatePartition.PartitionInfo.Valid,
            g_tblTestInputData.BT_CreatePartition.nNumPartition.IdenticalTwo,
            g_tblTestInputData.BT_CreatePartition.resvSize.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_FAIL,                
        },    
    },
}

-- BT_API_AC_1140
g_tblCaseAC1140 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[8]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
   [9]=
    {
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[10]=
    {
        Test_BT_CreatePartition,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            SetPartitionInfo(1), --tblPartitionInfo,
            g_tblTestInputData.BT_CreatePartition.PartitionInfo.Valid,
            g_tblTestInputData.BT_CreatePartition.nNumPartition.Valid,
            g_tblTestInputData.BT_CreatePartition.resvSize.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[11]=
    {
        Test_BT_FormatDriver,
        InputData = 
        {
            g_tblTestInputData.BT_FormatDriver.nID.Invalid,-- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_FormatDriver.nSize_enlarge.Zero,
            g_tblTestInputData.BT_FormatDriver.driverName.Valid,
            g_tblTestInputData.BT_FormatDriver.pstrVolumeLable.Valid,
            g_tblTestInputData.BT_FormatDriver.formatDriver.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_FAIL,                
        },    
    },
}

-- BT_API_AC_1141
g_tblCaseAC1141 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[8]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
   [9]=
    {
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[10]=
    {
        Test_BT_CreatePartition,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            SetPartitionInfo(1), --tblPartitionInfo,
            g_tblTestInputData.BT_CreatePartition.PartitionInfo.Valid,
            g_tblTestInputData.BT_CreatePartition.nNumPartition.Valid,
            g_tblTestInputData.BT_CreatePartition.resvSize.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[11]=
    {
        Test_BT_FormatDriver,
        InputData = 
        {
            0,-- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_FormatDriver.nSize_enlarge.Zero,
            g_tblTestInputData.BT_FormatDriver.driverName.Invalid,
            g_tblTestInputData.BT_FormatDriver.pstrVolumeLable.Valid,
            g_tblTestInputData.BT_FormatDriver.formatDriver.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_FAIL,                
        },    
    },
}
-- BT_API_AC_1150
g_tblCaseAC1150 =
{
	[1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
	[2]=
    {
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
	[4]=
    {
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[5]=
    {
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[6]=
	{
		Test_BT_SetMode,
		InputData =
        {
            0, -- nID returned from BT_AttachUSB
			g_tblTestInputData.BT_SetMode.mode.MODE_UPDATE,
        },
		OutputData = 
        {
            "Temporal",        
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },		
	},
	[7]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [8]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[9]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
   [10]=
    {
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[11]=
    {
        Test_BT_MountDriver,
        InputData = 
        {
            g_tblTestInputData.BT_MountDriver.nID.Invalid, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_MountDriver.driverName.Valid,
            g_tblTestInputData.BT_MountDriver.nDriverNum.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_FAIL,                
        },        
    },
}

-- BT_API_AC_1151
g_tblCaseAC1151 =
{
	[1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
	[2]=
    {
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
	[4]=
    {
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[5]=
    {
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[6]=
	{
		Test_BT_SetMode,
		InputData =
        {
            0, -- nID returned from BT_AttachUSB
			g_tblTestInputData.BT_SetMode.mode.MODE_UPDATE,
        },
		OutputData = 
        {
            "Temporal",        
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },		
	},
	[7]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [8]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[9]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
   [10]=
    {
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[11]=
    {
        Test_BT_MountDriver,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_MountDriver.driverName.Invalid,
            g_tblTestInputData.BT_MountDriver.nDriverNum.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_FAIL,                
        },        
    },
}

-- BT_API_AC_1152
g_tblCaseAC1152 =
{
	[1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
	[2]=
    {
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
	[4]=
    {
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[5]=
    {
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[6]=
	{
		Test_BT_SetMode,
		InputData =
        {
            0, -- nID returned from BT_AttachUSB
			g_tblTestInputData.BT_SetMode.mode.MODE_UPDATE,
        },
		OutputData = 
        {
            "Temporal",        
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },		
	},
	[7]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [8]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[9]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
   [10]=
    {
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[11]=
    {
        Test_BT_MountDriver,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_MountDriver.driverName.Null,
            g_tblTestInputData.BT_MountDriver.nDriverNum.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_FAIL,                
        },        
    },
}

-- BT_API_AC_1153
g_tblCaseAC1153 =
{
	[1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
	[2]=
    {
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
	[4]=
    {
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[5]=
    {
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[6]=
	{
		Test_BT_SetMode,
		InputData =
        {
            0, -- nID returned from BT_AttachUSB
			g_tblTestInputData.BT_SetMode.mode.MODE_UPDATE,
        },
		OutputData = 
        {
            "Temporal",        
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },		
	},
	[7]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [8]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[9]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
   [10]=
    {
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[11]=
    {
        Test_BT_MountDriver,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_MountDriver.driverName.Valid,
            g_tblTestInputData.BT_MountDriver.nDriverNum.Zero,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_FAIL,                
        },        
    },
}
-- BT_API_AC_1154
g_tblCaseAC1154 =
{
	[1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
	[2]=
    {
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
	[4]=
    {
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[5]=
    {
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[6]=
	{
		Test_BT_SetMode,
		InputData =
        {
            0, -- nID returned from BT_AttachUSB
			g_tblTestInputData.BT_SetMode.mode.MODE_UPDATE,
        },
		OutputData = 
        {
            "Temporal",        
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },		
	},
	[7]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [8]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[9]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
   [10]=
    {
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[11]=
    {
        Test_BT_MountDriver,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_MountDriver.driverName.Valid,
            g_tblTestInputData.BT_MountDriver.nDriverNum.Over,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_FAIL,                
        },        
    },
}
-- BT_API_AC_1160
g_tblCaseAC1160 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[8]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[9]=
    {
        Test_BT_DownloadBoot,    
        InputData = 
        {
            g_tblTestInputData.BT_DownloadBoot.nID.Invalid,  -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBoot.pstrPath.Valid, 
            g_tblTestInputData.BT_DownloadBoot.ChipType.CHIP_3631,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_FAIL,                
        },
    },
}

-- BT_API_AC_1161
g_tblCaseAC1161 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[8]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[9]=
    {
        Test_BT_DownloadBoot,    
        InputData = 
        {
            0,  -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBoot.pstrPath.Invalid, 
            g_tblTestInputData.BT_DownloadBoot.ChipType.CHIP_3631,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_DL_FILE_OPEN_FAIL,                
        },
    },
}

-- BT_API_AC_1162
g_tblCaseAC1162 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[8]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[9]=
    {
        Test_BT_DownloadBoot,    
        InputData = 
        {
            0,  -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBoot.pstrPath.Valid, 
            g_tblTestInputData.BT_DownloadBoot.ChipType.CHIP_3631,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_DL_FILE_DOWNLOAD_FAIL,                
        },
    },
}
--BT_API_AC_1170
g_tblCaseAC1170 =
{
   [1]=
   {
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
    [8]=
	{
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
    [9]=
	{
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.TRUE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
    [10]=
	{
        Test_BT_CreatePartition,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            SetPartitionInfo(1), --tblPartitionInfo,
            g_tblTestInputData.BT_CreatePartition.PartitionInfo.Valid,
            g_tblTestInputData.BT_CreatePartition.nNumPartition.Valid,
            g_tblTestInputData.BT_CreatePartition.resvSize.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
    [11]=
	{
        Test_BT_FormatDriver,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_FormatDriver.nSize_enlarge.Zero,
            g_tblTestInputData.BT_FormatDriver.driverName.Valid,
            g_tblTestInputData.BT_FormatDriver.pstrVolumeLable.Valid,
            g_tblTestInputData.BT_FormatDriver.formatDriver.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[12]=
	{
        Test_BT_DownloadImg,
        InputData = 
        {
            g_tblTestInputData.BT_DownloadImg.nID.Invalid, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadImg.pDownloadImg.Valid,
            g_tblTestInputData.BT_DownloadImg.bCompare.TRUE,
            g_tblTestInputData.BT_DownloadImg.pc_path.Valid,
            g_tblTestInputData.BT_DownloadImg.driver_name.Valid,
        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_FAIL,                
        },
    },	
}

--BT_API_AC_1171
g_tblCaseAC1171 =
{
   [1]=
   {
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
    [8]=
	{
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
    [9]=
	{
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.TRUE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
    [10]=
	{
        Test_BT_CreatePartition,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            SetPartitionInfo(1), --tblPartitionInfo,
            g_tblTestInputData.BT_CreatePartition.PartitionInfo.Valid,
            g_tblTestInputData.BT_CreatePartition.nNumPartition.Valid,
            g_tblTestInputData.BT_CreatePartition.resvSize.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
    [11]=
	{
        Test_BT_FormatDriver,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_FormatDriver.nSize_enlarge.Zero,
            g_tblTestInputData.BT_FormatDriver.driverName.Valid,
            g_tblTestInputData.BT_FormatDriver.pstrVolumeLable.Valid,
            g_tblTestInputData.BT_FormatDriver.formatDriver.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[12]=
	{
        Test_BT_DownloadImg,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadImg.pDownloadImg.Invalid,
            g_tblTestInputData.BT_DownloadImg.bCompare.TRUE,
            g_tblTestInputData.BT_DownloadImg.pc_path.Valid,
            g_tblTestInputData.BT_DownloadImg.driver_name.Valid,
        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_FAIL,                
        },
    },	
}

--BT_API_AC_1172
g_tblCaseAC1172 =
{
   [1]=
   {
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
    [8]=
	{
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
    [9]=
	{
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.TRUE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
    [10]=
	{
        Test_BT_CreatePartition,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            SetPartitionInfo(1), --tblPartitionInfo,
            g_tblTestInputData.BT_CreatePartition.PartitionInfo.Valid,
            g_tblTestInputData.BT_CreatePartition.nNumPartition.Valid,
            g_tblTestInputData.BT_CreatePartition.resvSize.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
    [11]=
	{
        Test_BT_FormatDriver,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_FormatDriver.nSize_enlarge.Zero,
            g_tblTestInputData.BT_FormatDriver.driverName.Valid,
            g_tblTestInputData.BT_FormatDriver.pstrVolumeLable.Valid,
            g_tblTestInputData.BT_FormatDriver.formatDriver.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[12]=
	{
        Test_BT_DownloadImg,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadImg.pDownloadImg.Valid,
            g_tblTestInputData.BT_DownloadImg.bCompare.TRUE,
            g_tblTestInputData.BT_DownloadImg.pc_path.EmptyPath,
            g_tblTestInputData.BT_DownloadImg.driver_name.Valid,
        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_FAIL,                
        },
    },	
}

--BT_API_AC_1173
g_tblCaseAC1173 =
{
   [1]=
   {
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
    [8]=
	{
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
    [9]=
	{
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.TRUE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
    [10]=
	{
        Test_BT_CreatePartition,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            SetPartitionInfo(1), --tblPartitionInfo,
            g_tblTestInputData.BT_CreatePartition.PartitionInfo.Valid,
            g_tblTestInputData.BT_CreatePartition.nNumPartition.Valid,
            g_tblTestInputData.BT_CreatePartition.resvSize.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
    [11]=
	{
        Test_BT_FormatDriver,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_FormatDriver.nSize_enlarge.Zero,
            g_tblTestInputData.BT_FormatDriver.driverName.Valid,
            g_tblTestInputData.BT_FormatDriver.pstrVolumeLable.Valid,
            g_tblTestInputData.BT_FormatDriver.formatDriver.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[12]=
	{
        Test_BT_DownloadImg,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadImg.pDownloadImg.Valid,
            g_tblTestInputData.BT_DownloadImg.bCompare.TRUE,
            g_tblTestInputData.BT_DownloadImg.pc_path.Valid,
            g_tblTestInputData.BT_DownloadImg.driver_name.Invalid,
        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_FAIL,                
        },
    },	
}

--BT_API_AC_1174
g_tblCaseAC1174 =
{
   [1]=
   {
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
    [8]=
	{
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
    [9]=
	{
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.TRUE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
    [10]=
	{
        Test_BT_CreatePartition,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            SetPartitionInfo(1), --tblPartitionInfo,
            g_tblTestInputData.BT_CreatePartition.PartitionInfo.Valid,
            g_tblTestInputData.BT_CreatePartition.nNumPartition.Valid,
            g_tblTestInputData.BT_CreatePartition.resvSize.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
    [11]=
	{
        Test_BT_FormatDriver,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_FormatDriver.nSize_enlarge.Zero,
            g_tblTestInputData.BT_FormatDriver.driverName.Valid,
            g_tblTestInputData.BT_FormatDriver.pstrVolumeLable.Valid,
            g_tblTestInputData.BT_FormatDriver.formatDriver.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[12]=
	{
        Test_BT_DownloadImg,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadImg.pDownloadImg.Valid,
            g_tblTestInputData.BT_DownloadImg.bCompare.TRUE,
            g_tblTestInputData.BT_DownloadImg.pc_path.Valid,
            g_tblTestInputData.BT_DownloadImg.driver_name.Valid,
        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_DL_FILE_DOWNLOAD_FAIL,                
        },
    },	
}
-- BT_API_AC_1180
g_tblCaseAC1180 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
    [8]=
	{
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
    [9]=
	{
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
    [10]=
	{
        Test_BT_CreatePartition,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            SetPartitionInfo(1), --tblPartitionInfo,
            g_tblTestInputData.BT_CreatePartition.PartitionInfo.Valid,
            g_tblTestInputData.BT_CreatePartition.nNumPartition.Valid,
            g_tblTestInputData.BT_CreatePartition.resvSize.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
    [11]=
	{
        Test_BT_FormatDriver,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_FormatDriver.nSize_enlarge.Zero,
            g_tblTestInputData.BT_FormatDriver.driverName.Valid,
            g_tblTestInputData.BT_FormatDriver.pstrVolumeLable.Valid,
            g_tblTestInputData.BT_FormatDriver.formatDriver.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
    [12]=
	{
        Test_BT_DownloadFile,
        InputData = 
        {
            g_tblTestInputData.BT_DownloadFile.nID.Invalid, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadFile.bCompare.TRUE,
            g_tblTestInputData.BT_DownloadFile.pc_path.Valid,
            g_tblTestInputData.BT_DownloadFile.udisk_path.Valid,
            g_tblTestInputData.BT_DownloadFile.pDownloadFile.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_FAIL,                
        },
    },
}

-- BT_API_AC_1181
g_tblCaseAC1181 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
    [8]=
	{
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
    [9]=
	{
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
    [10]=
	{
        Test_BT_CreatePartition,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            SetPartitionInfo(1), --tblPartitionInfo,
            g_tblTestInputData.BT_CreatePartition.PartitionInfo.Valid,
            g_tblTestInputData.BT_CreatePartition.nNumPartition.Valid,
            g_tblTestInputData.BT_CreatePartition.resvSize.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
    [11]=
	{
        Test_BT_FormatDriver,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_FormatDriver.nSize_enlarge.Zero,
            g_tblTestInputData.BT_FormatDriver.driverName.Valid,
            g_tblTestInputData.BT_FormatDriver.pstrVolumeLable.Valid,
            g_tblTestInputData.BT_FormatDriver.formatDriver.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
    [12]=
	{
        Test_BT_DownloadFile,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadFile.bCompare.TRUE,
            g_tblTestInputData.BT_DownloadFile.pc_path.Valid,
            g_tblTestInputData.BT_DownloadFile.udisk_path.Valid,
            g_tblTestInputData.BT_DownloadFile.pDownloadFile.Invalid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_DL_FILE_OPEN_FAIL,                
        },
    },
}

-- BT_API_AC_1182
g_tblCaseAC1182 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
    [8]=
	{
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
    [9]=
	{
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
    [10]=
	{
        Test_BT_CreatePartition,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            SetPartitionInfo(1), --tblPartitionInfo,
            g_tblTestInputData.BT_CreatePartition.PartitionInfo.Valid,
            g_tblTestInputData.BT_CreatePartition.nNumPartition.Valid,
            g_tblTestInputData.BT_CreatePartition.resvSize.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
    [11]=
	{
        Test_BT_FormatDriver,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_FormatDriver.nSize_enlarge.Zero,
            g_tblTestInputData.BT_FormatDriver.driverName.Valid,
            g_tblTestInputData.BT_FormatDriver.pstrVolumeLable.Valid,
            g_tblTestInputData.BT_FormatDriver.formatDriver.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
    [12]=
	{
        Test_BT_DownloadFile,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadFile.bCompare.TRUE,
            g_tblTestInputData.BT_DownloadFile.pc_path.Invalid,
            g_tblTestInputData.BT_DownloadFile.udisk_path.Valid,
            g_tblTestInputData.BT_DownloadFile.pDownloadFile.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_DL_FILE_OPEN_FAIL,                
        },
    },
}

-- BT_API_AC_1183
g_tblCaseAC1183 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
    [8]=
	{
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
    [9]=
	{
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
    [10]=
	{
        Test_BT_CreatePartition,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            SetPartitionInfo(1), --tblPartitionInfo,
            g_tblTestInputData.BT_CreatePartition.PartitionInfo.Valid,
            g_tblTestInputData.BT_CreatePartition.nNumPartition.Valid,
            g_tblTestInputData.BT_CreatePartition.resvSize.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
    [11]=
	{
        Test_BT_FormatDriver,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_FormatDriver.nSize_enlarge.Zero,
            g_tblTestInputData.BT_FormatDriver.driverName.Valid,
            g_tblTestInputData.BT_FormatDriver.pstrVolumeLable.Valid,
            g_tblTestInputData.BT_FormatDriver.formatDriver.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
    [12]=
	{
        Test_BT_DownloadFile,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadFile.bCompare.TRUE,
            g_tblTestInputData.BT_DownloadFile.pc_path.Valid,
            g_tblTestInputData.BT_DownloadFile.udisk_path.Invalid,
            g_tblTestInputData.BT_DownloadFile.pDownloadFile.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_FILE_CREATE_FAIL,                
        },
    },
}

-- BT_API_AC_1184
g_tblCaseAC1184 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
    [8]=
	{
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
    [9]=
	{
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
    [10]=
	{
        Test_BT_CreatePartition,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            SetPartitionInfo(1), --tblPartitionInfo,
            g_tblTestInputData.BT_CreatePartition.PartitionInfo.Valid,
            g_tblTestInputData.BT_CreatePartition.nNumPartition.Valid,
            g_tblTestInputData.BT_CreatePartition.resvSize.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
    [11]=
	{
        Test_BT_FormatDriver,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_FormatDriver.nSize_enlarge.Zero,
            g_tblTestInputData.BT_FormatDriver.driverName.Valid,
            g_tblTestInputData.BT_FormatDriver.pstrVolumeLable.Valid,
            g_tblTestInputData.BT_FormatDriver.formatDriver.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
    [12]=
	{
        Test_BT_DownloadFile,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadFile.bCompare.TRUE,
            g_tblTestInputData.BT_DownloadFile.pc_path.Valid,
            g_tblTestInputData.BT_DownloadFile.udisk_path.Valid,
            g_tblTestInputData.BT_DownloadFile.pDownloadFile.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_DL_FILE_DOWNLOAD_FAIL,                
        },
    },
}

-- BT_API_AC_1190
g_tblCaseAC1190 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[8]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
   [9]=
    {
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[10]=
    {
        Test_BT_CreatePartition,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            SetPartitionInfo(1), --tblPartitionInfo,
            g_tblTestInputData.BT_CreatePartition.PartitionInfo.Valid,
            g_tblTestInputData.BT_CreatePartition.nNumPartition.Valid,
            g_tblTestInputData.BT_CreatePartition.resvSize.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[11]=
    {
        Test_BT_FormatDriver,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_FormatDriver.nSize_enlarge.Zero,
            g_tblTestInputData.BT_FormatDriver.driverName.Valid,
            g_tblTestInputData.BT_FormatDriver.pstrVolumeLable.Valid,
            g_tblTestInputData.BT_FormatDriver.formatDriver.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[12]=
    {
        Test_BT_DownloadBoot,    
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBoot.pstrPath.Valid, 
            g_tblTestInputData.BT_DownloadBoot.ChipType.CHIP_3631,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
	[13]=
    {
        Test_BT_Close,
        InputData = 
        {
            g_tblTestInputData.BT_Close.nID.Invalid,  -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_FAIL,                
        },
    },
}
-- BT_API_AC_1200
g_tblCaseAC1200 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[6]=
    {
        Test_BT_SetGPIO,
        InputData = 
        {
           g_tblTestInputData.BT_SetGPIO.nID.Invalid, -- nID returned from BT_AttachUSB  
			g_tblTestInputData.BT_SetGPIO.num.Valid,
            g_tblTestInputData.BT_SetGPIO.dir.Input,
            g_tblTestInputData.BT_SetGPIO.level.Lowlevel,
            g_tblTestInputData.BT_SetGPIO.Pullup.Valid,
            g_tblTestInputData.BT_SetGPIO.Pulldown.Invalid,      
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_FAIL,                
        },
    },
}
-- BT_API_AC_1210
g_tblCaseAC1210 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	 [5]=
	{
        Test_BT_ResetDevice,
        InputData =
        {
            g_tblTestInputData.BT_ResetDevice.nID.Invalid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_FAIL,        
        },
    },
}
-- BT_API_AC_1220
g_tblCaseAC1220=
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_GetRegValue,
        InputData =
        {
            g_tblTestInputData.BT_GetRegValue.nID.Invalid, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetRegValue.regAddr.SundanceIIA,
            g_tblTestInputData.BT_GetRegValue.regValue.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_FAIL,        
        },
    },
}

-- BT_API_AC_1221
g_tblCaseAC1221=
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_GetRegValue,
        InputData =
        {
            g_tblTestInputData.BT_GetRegValue.nID.Invalid, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetRegValue.regAddr.Aspen3,
            g_tblTestInputData.BT_GetRegValue.regValue.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_FAIL,        
        },
    },
}

-- BT_API_AC_1222
g_tblCaseAC1222=
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_GetRegValue,
        InputData =
        {
            g_tblTestInputData.BT_GetRegValue.nID.Invalid, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetRegValue.regAddr.Snowbird,
            g_tblTestInputData.BT_GetRegValue.regValue.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_FAIL,        
        },
    },
}
-- BT_API_AC_1230
g_tblCaseAC1230 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[8]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[9]=
    {
        Test_BT_WriteMobileDeviceCode,
        InputData = 
        {
             g_tblTestInputData.BT_WriteMobileDeviceCode.nID.Invalid, -- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_FAIL,                
        },
    },
} 

-- BT_API_AC_1240
g_tblCaseAC1240 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[8]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[9]=
    {
        Test_BT_WriteASAFile,
        InputData = 
        {
            g_tblTestInputData.BT_WriteASAFile.nID.Invalid, -- nID returned from BT_AttachUSB 
			g_tblTestInputData.BT_WriteASAFile.fileName.Valid,
            g_tblTestInputData.BT_WriteASAFile.pBuf.Valid,
            g_tblTestInputData.BT_WriteASAFile.Bufsize.Valid,
            g_tblTestInputData.BT_WriteASAFile.Mode.ASA_MODE_OPEN,       
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_FAIL,                
        },
    },
}

-- BT_API_AC_1241
g_tblCaseAC1241 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[8]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[9]=
    {
        Test_BT_WriteASAFile,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB 
			g_tblTestInputData.BT_WriteASAFile.fileName.Valid,
            g_tblTestInputData.BT_WriteASAFile.pBuf.Valid,
            g_tblTestInputData.BT_WriteASAFile.Bufsize.Invalid,
            g_tblTestInputData.BT_WriteASAFile.Mode.ASA_MODE_CREATE,       
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_FAIL,                
        },
    },
}

-- BT_API_AC_1242
g_tblCaseAC1242 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[8]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[9]=
    {
        Test_BT_WriteASAFile,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB 
			g_tblTestInputData.BT_WriteASAFile.fileName.OverMaxchar,
            g_tblTestInputData.BT_WriteASAFile.pBuf.Valid,
            g_tblTestInputData.BT_WriteASAFile.Bufsize.Valid,
            g_tblTestInputData.BT_WriteASAFile.Mode.ASA_MODE_CREATE,       
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_FAIL,                
        },
    },
}

-- BT_API_AC_1243
g_tblCaseAC1243 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[8]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[9]=
    {
        Test_BT_WriteASAFile,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB 
			g_tblTestInputData.BT_WriteASAFile.fileName.Empty_Name,
            g_tblTestInputData.BT_WriteASAFile.pBuf.Valid,
            g_tblTestInputData.BT_WriteASAFile.Bufsize.Valid,
            g_tblTestInputData.BT_WriteASAFile.Mode.ASA_MODE_CREATE,       
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_FAIL,                
        },
    },
}

-- BT_API_AC_1250
g_tblCaseAC1250 =
{
	[1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
	[2]=
    {
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
	[4]=
    {
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[5]=
    {
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[6]=
	{
		Test_BT_SetMode,
		InputData =
        {
            0, -- nID returned from BT_AttachUSB
			g_tblTestInputData.BT_SetMode.mode.MODE_DEBUG,
        },
		OutputData = 
        {
            "Temporal",        
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },		
	},
	[7]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [8]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[9]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[10]=
    {
        Test_BT_UploadBoot,
        InputData = 
        {
            g_tblTestInputData.BT_UploadBoot.nID.Invalid, 
			g_tblTestInputData.BT_UploadBoot.pstrPath.Valid,
            g_tblTestInputData.BT_UploadBoot.fileLen.Valid,-- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_FAIL,                
        },
    },
}

-- BT_API_AC_1251
g_tblCaseAC1251 =
{
	[1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
	[2]=
    {
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
	[4]=
    {
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[5]=
    {
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[6]=
	{
		Test_BT_SetMode,
		InputData =
        {
            0, -- nID returned from BT_AttachUSB
			g_tblTestInputData.BT_SetMode.mode.MODE_DEBUG,
        },
		OutputData = 
        {
            "Temporal",        
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },		
	},
	[7]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [8]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[9]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[10]=
    {
        Test_BT_UploadBoot,
        InputData = 
        {
            0, 
			g_tblTestInputData.BT_UploadBoot.pstrPath.Valid,
            g_tblTestInputData.BT_UploadBoot.fileLen.Invalid,-- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_FAIL,                
        },
    },
}

-- BT_API_AC_1252
g_tblCaseAC1252 =
{
	[1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
	[2]=
    {
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
	[4]=
    {
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[5]=
    {
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[6]=
	{
		Test_BT_SetMode,
		InputData =
        {
            0, -- nID returned from BT_AttachUSB
			g_tblTestInputData.BT_SetMode.mode.MODE_DEBUG,
        },
		OutputData = 
        {
            "Temporal",        
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },		
	},
	[7]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [8]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[9]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[10]=
    {
        Test_BT_UploadBoot,
        InputData = 
        {
            0, 
			g_tblTestInputData.BT_UploadBoot.pstrPath.Invalid,
            g_tblTestInputData.BT_UploadBoot.fileLen.Valid,-- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_FAIL,                
        },
    },
}

-- BT_API_AC_1253
g_tblCaseAC1253 =
{
	[1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
	[2]=
    {
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
	[4]=
    {
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[5]=
    {
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[8]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[9]=
    {
        Test_BT_UploadBoot,
        InputData = 
        {
            0, 
			g_tblTestInputData.BT_UploadBoot.pstrPath.Valid,
            g_tblTestInputData.BT_UploadBoot.fileLen.Valid,-- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_FAIL,                
        },
    },
}
-- BT_API_AC_1260
g_tblCaseAC1260 =
{
	[1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
	[2]=
    {
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
	[4]=
    {
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[5]=
    {
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[6]=
	{
		Test_BT_SetMode,
		InputData =
        {
            0, -- nID returned from BT_AttachUSB
			g_tblTestInputData.BT_SetMode.mode.MODE_DEBUG,
        },
		OutputData = 
        {
            "Temporal",        
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },		
	},
	[7]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [8]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[9]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[10]=
    {
        Test_BT_UploadBin,
        InputData = 
        {
            g_tblTestInputData.BT_UploadBin.nID.Invalid,
			g_tblTestInputData.BT_UploadBin.file_name.Valid,
            g_tblTestInputData.BT_UploadBin.pc_path.Valid,
            g_tblTestInputData.BT_UploadBin.pUploadBin.Valid,-- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_FAIL,                
        },
    },
}

-- BT_API_AC_1261
g_tblCaseAC1261=
{
	[1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
	[2]=
    {
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
	[4]=
    {
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[5]=
    {
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[6]=
	{
		Test_BT_SetMode,
		InputData =
        {
            0, -- nID returned from BT_AttachUSB
			g_tblTestInputData.BT_SetMode.mode.MODE_DEBUG,
        },
		OutputData = 
        {
            "Temporal",        
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },		
	},
	[7]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [8]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[9]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[10]=
    {
        Test_BT_UploadBin,
        InputData = 
        {
            0,
			g_tblTestInputData.BT_UploadBin.file_name.Valid,
            g_tblTestInputData.BT_UploadBin.pc_path.Valid,
            g_tblTestInputData.BT_UploadBin.pUploadBin.Invalid,-- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_FAIL,                
        },
    },
}

-- BT_API_AC_1262
g_tblCaseAC1262=
{
	[1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
	[2]=
    {
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
	[4]=
    {
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[5]=
    {
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
	[6]=
	{
		Test_BT_SetMode,
		InputData =
        {
            0, -- nID returned from BT_AttachUSB
			g_tblTestInputData.BT_SetMode.mode.MODE_DEBUG,
        },
		OutputData = 
        {
            "Temporal",        
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },		
	},
	[7]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [8]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[9]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[10]=
    {
        Test_BT_UploadBin,
        InputData = 
        {
            0,
			g_tblTestInputData.BT_UploadBin.file_name.Valid,
            g_tblTestInputData.BT_UploadBin.pc_path.Valid,
            g_tblTestInputData.BT_UploadBin.pUploadBin.Valid,-- nID returned from BT_AttachUSB        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_FAIL,                
        },
    },
}
-- BT_API_AC_1270
g_tblCaseAC1270 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Valid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Valid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[8]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
   [9]=
    {
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[10]=
    {
        Test_BT_CreatePartition,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            SetPartitionInfo(1), --tblPartitionInfo,
            g_tblTestInputData.BT_CreatePartition.PartitionInfo.Valid,
            g_tblTestInputData.BT_CreatePartition.nNumPartition.Valid,
            g_tblTestInputData.BT_CreatePartition.resvSize.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[11]=
    {
        Test_BT_GetDiskInfo,
        InputData = 
        {
            g_tblTestInputData.BT_GetDiskInfo.nID.Invalid,-- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_GetDiskInfo.DriverNum.Valid,
            g_tblTestInputData.BT_GetDiskInfo.pDriverInfo.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_FAIL,                
        },    
    },
}

-- BT_API_AC_1271
g_tblCaseAC1271 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Valid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Valid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[8]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
   [9]=
    {
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[10]=
    {
        Test_BT_CreatePartition,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            SetPartitionInfo(1), --tblPartitionInfo,
            g_tblTestInputData.BT_CreatePartition.PartitionInfo.Valid,
            g_tblTestInputData.BT_CreatePartition.nNumPartition.Valid,
            g_tblTestInputData.BT_CreatePartition.resvSize.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[11]=
    {
        Test_BT_GetDiskInfo,
        InputData = 
        {
            0,-- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_GetDiskInfo.DriverNum.Invalid,
            g_tblTestInputData.BT_GetDiskInfo.pDriverInfo.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_FAIL,                
        },    
    },
}

-- BT_API_AC_1272
g_tblCaseAC1272 =
{
    [1]=
	{
        Test_BT_Init,
        InputData = 
        {
            g_tblTestInputData.BT_Init.nBurnObject.Minimum,
            g_tblTestInputData.BT_Init.BurnProcess.Valid,
            g_tblTestInputData.BT_Init.BurnProgress.Valid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },        
    },
    [2]=
	{
        Test_BT_AttachUSB,
        InputData = 
        {
            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB,
        },
        OutputData = 
        {
            "CaseLong",
            1,
        },
        RefData = 
        {
            "Not Equal",
            0,
        },    
    },
    [3]=
	{
        Test_BT_Start,
        InputData = 
        {
            nil,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,    
        },    
    },
    [4]=
	{
        Test_BT_SetRamParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
            g_tblTestInputData.BT_SetRamParam.nNumReg.Valid,        
        },
        OutputData = 
        {
            "Temporal",        
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [5]=
	{
        Test_BT_DownloadProducer,
        InputData =
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
            g_tblTestInputData.BT_DownloadProducer.runAddr.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,        
        },
    },
    [6]=
	{        
        Test_BT_GetFlashID,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Valid,
            g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Valid,
            g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
            g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid,
        },
        OutputData = 
        {
            "Temporal",    
            "Next",
            2,
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },
    },
    [7]=
	{
        Test_BT_SetNandParam,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            0, -- FlashID returned from BT_GetFlashID
            g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[8]=
    {
        Test_BT_InitSecArea,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB
            g_tblTestInputData.BT_InitSecArea.Type.Zero,
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
   [9]=
    {
        Test_BT_DownloadBin,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
            g_tblTestInputData.BT_DownloadBin.bBackup.TRUE,                                            
            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.TRUE,
            g_tblTestInputData.BT_DownloadBin.pc_path.Valid,
            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid,            
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },        
    },
	[10]=
    {
        Test_BT_CreatePartition,
        InputData = 
        {
            0, -- nID returned from BT_AttachUSB        
            SetPartitionInfo(1), --tblPartitionInfo,
            g_tblTestInputData.BT_CreatePartition.PartitionInfo.Valid,
            g_tblTestInputData.BT_CreatePartition.nNumPartition.Valid,
            g_tblTestInputData.BT_CreatePartition.resvSize.Valid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_SUCCESS,                
        },    
    },
	[11]=
    {
        Test_BT_GetDiskInfo,
        InputData = 
        {
            0,-- nID returned from BT_AttachUSB        
            g_tblTestInputData.BT_GetDiskInfo.DriverNum.Valid,
            g_tblTestInputData.BT_GetDiskInfo.pDriverInfo.Invalid,        
        },
        OutputData = 
        {
            "Temporal",    
        },
        RefData =
        {
            "Equal",
            g_tblRetVal.BT_FAIL,                
        },    
    },
}
-- BT_API_AC_1280
g_tblCaseAC1280 =
{
    [1]=
	{
        Test_BT_GetVersion,
        InputData = 
        {
            g_tblTestInputData.BT_GetVersion.MainVersion.Invalid,
            g_tblTestInputData.BT_GetVersion.SubVersion.Invalid,
        },
        OutputData = 
        {
            "Temporal",
        },
        RefData = 
        {
            "Equal",
            g_tblRetVal.BT_FAIL,    
        },
	 },
}
