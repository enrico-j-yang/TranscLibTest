-- Atom test functions
-- V1.0.0
--
-- Atom test function is implemented as a test step of test case.
-- Its input parameter is a lua table which contains varible parameter(s).
-- Its output return value is also a lua table which contains varible return value(s).
-- For example:
-- test case:
-- step1:Init
-- step2:Deinit
--
-- atom test function
--
-- function Test_XX_Init(tblArgTable)
--     local para1 = tblArgTable[1]  -- first parameter
--     local para2 = tblArgTable[2]  -- second parameter
--     local tblRetVal = {}          -- return value table
--
--     printlog("Running step -- Test_XX_Init")
--     tblRetVal[1] = testobject.Init(para1, para2) -- call test object lua API and get its return value
--     return tblRetVal
-- end
--
-- function Test_XX_Deinit(tblArgTable)
--     local tblRetVal = {}          -- return value table
--
--     printlog("Running step -- Test_XX_Deinit")
--     tblRetVal[1] = testobject.Deinit() -- call test object lua API and get its return value
--     return tblRetVal
-- end

function Test_BT_GetVersion(tblArgTable)
    local MainVersion = tblArgTable[1]
    local SubVersion = tblArgTable[2]
    local tblRetVal = {}
    
    printlog("Running step -- Test_BT_GetVersion")
    --     Pointer parameter that would be allocated before API invoking must
    --    be validated. Regular pointer would be allocated while null pointer 
    --    should be set zero. 
    if (MainVersion ~= 0) then
        MainVersion = burntool3lib.AllocMainVersion()
    else
        MainVersion = 0
    end

    if (SubVersion ~= 0) then
        SubVersion = burntool3lib.AllocSubVersion()
    else
        SubVersion = 0
    end
    
    tblRetVal[1] = burntool3lib.GetVersion(MainVersion, SubVersion)

    return tblRetVal
end

function Test_BT_Init(tblArgTable)    
    local nBurnObject = tblArgTable[1]
    local BurnProcess = tblArgTable[2]
    local BurnProgress = tblArgTable[3]
    local tblRetVal = {}
    
    printlog("Running step -- Test_BT_Init")
    --     Pointer parameter that would be allocated before API invoking must
    --    be validated. Regular pointer would be allocated while null pointer 
    --    should be set zero. 
    if (BurnProcess ~= 0) then
        BurnProcess = burntool3lib.GetBurnProcess()    
    else
        BurnProcess = 0
    end

    if (BurnProgress ~= 0) then
        BurnProgress = burntool3lib.GetBurnProgress()     
    else
        BurnProgress = 0
    end    

    tblRetVal[1] = burntool3lib.Init(nBurnObject, BurnProcess, BurnProgress)        
    return tblRetVal
end

function Test_BT_AttachUSB(tblArgTable)
    local pstrUSBName = tblArgTable[1]
    local usbType = tblArgTable[2]
    local tblRetVal = {}
    
    printlog("Running step -- Test_BT_AttachUSB")
    
    --     Pointer parameter that would be allocated before API invoking must
    --    be validated. Regular pointer would be allocated while null pointer 
    --    should be set zero. 
    if (USBName ~= 0) then
        USBName = burntool3lib.GetUSBName()
    else
        USBName = 0
    end                

    tblRetVal[1] = burntool3lib.AttachUSB(USBName, usbType)        
    return tblRetVal
end 

function Test_BT_DetachUSB(tblArgTable)
    local USBName = tblArgTable[1]
    local usbType = tblArgTable[2]
    local tblRetVal = {}
    
    printlog("Running step -- Test_BT_DetachUSB")
    --     Pointer parameter that would be allocated before API invoking must
    --    be validated. Regular pointer would be allocated while null pointer 
    --    should be set zero. 
    if (USBName ~= 0) then
        USBName = burntool3lib.GetUSBName()
    else
        USBName = 0
    end    
    
    tblRetVal[1] = burntool3lib.BT_DetachUSB(USBName, usbType)
    return tblRetVal
end

function Test_BT_Start(tblArgTable)
    local tblRetVal = {}
    
    printlog("Running step -- Test_BT_Start")    
    tblRetVal[1] = burntool3lib.Start()
    return tblRetVal
end

function Test_BT_SetRamParam(tblArgTable)    
    local nID = tblArgTable[1]
    local RamReg = tblArgTable[2]
    local RegNum = tblArgTable[3]
    local tblRetVal = {}
    
    printlog("Running step -- Test_BT_SetRamParam")
    
    --     Pointer parameter that would be allocated before API invoking must
    --    be validated. Regular pointer would be allocated while null pointer 
    --    should be set zero. 
    if (RamReg ~= 0) then
        RamReg = burntool3lib.SetRamReg()
    else
        RamReg = 0
    end    
        
    if (RegNum ~= 0) then
        RegNum = burntool3lib.SetRegNum()
    else
        RegNum = 0
    end    

    tblRetVal[1] = burntool3lib.SetRamParam(nID, RamReg, RegNum)    
    return tblRetVal
end

function Test_BT_DownloadProducer(tblArgTable)
    local nID = tblArgTable[1]
    local pstrPath = tblArgTable[2]
    local runAddr = tblArgTable[3]
    local tblRetVal = {}
        
    printlog("Running step -- Test_BT_DownloadProducer")
    tblRetVal[1] = burntool3lib.DownloadProducer(nID, pstrPath, runAddr)
    return tblRetVal
end

function Test_BT_SwitchUSBHighSpeed(tblArgTable)
    local nID = tblArgTable[1]
    local tblRetVal = {}
    
    printlog("Running step -- Test_BT_SwitchUSBHighSpeed")
    
    tblRetVal[1] = burntool3lib.SwitchUSBHighSpeed(nID)
    return tblRetVal
end

function Test_BT_TestConnection(tblArgTable)
    local nID = tblArgTable[1]
    local tblRetVal = {}
    
    printlog("Running step -- Test_BT_TestConnection")
    
    tblRetVal[1] = burntool3lib.TestConnection(nID)
    return tblRetVal
end

function Test_BT_SetMode(tblArgTable)
    local nID = tblArgTable[1]
    local tblRetVal = {}
    
    printlog("Running step -- Test_BT_SetMode")
    
    tblRetVal[1] = burntool3lib.SetMode(nID, mode)
    return tblRetVal    
end


function Test_BT_GetFlashID(tblArgTable)
    local nID = tblArgTable[1]
    local Ce2_gpio = tblArgTable[2]
    local Ce3_gpio = tblArgTable[3]
    local FlashID = tblArgTable[4]
    local nChipCnt = tblArgTable[5]
    local tblRetVal = {}
    
    printlog("Running step -- Test_BT_GetFlashID")
    
    --     Pointer parameter that would be allocated before API invoking must
    --    be validated. Regular pointer would be allocated while null pointer 
    --    should be set zero. 
    if (FlashID ~= 0) then
        FlashID = burntool3lib.AllocFlashID()
    else
        FlashID = 0
    end    
        
    if (nChipCnt ~= 0) then
        nChipCnt = burntool3lib.AllocnChipCnt()    
    else
        nChipCnt = 0
    end    
        
    tblRetVal[1] = burntool3lib.GetFlashID(nID, Ce2_gpio, Ce3_gpio, FlashID, nChipCnt)
    tblRetVal[2] = FlashID
    tblRetVal[3] = nChipCnt    
    return tblRetVal
end

function Test_BT_SetNandParam(tblArgTable)
    local nID = tblArgTable[1]
    local FlashID = tblArgTable[2]
    local NandPhyInfo = tblArgTable[3]
    local tblRetVal = {}
        
    printlog("Running step -- Test_BT_SetNandParam")

    --     Pointer parameter that would be allocated before API invoking must
    --    be validated. Regular pointer would be allocated while null pointer 
    --    should be set zero. 
    if (NandPhyInfo ~= 0) then
        NandPhyInfo = burntool3lib.SetNandInfo(FlashID)    
    else
        NandPhyInfo = 0
    end    
        
    tblRetVal[1] = burntool3lib.SetNandParam(nID, NandPhyInfo)    
    return tblRetVal
end

function Test_BT_DetectNandParam(tblArgTable)
    local nID = tblArgTable[1]
    local NandPhyInfo = tblArgTable[2]
    local tblRetVal = {}
    
    printlog("Running step -- Test_BT_DetectNandParam")
    
    --     Pointer parameter that would be allocated before API invoking must
    --    be validated. Regular pointer would be allocated while null pointer 
    --    should be set zero. 
    if (NandPhyInfo ~= 0) then
        NandPhyInfo = burntool3lib.AllocNandPhyInfo()
    else
        NandPhyInfo = 0
    end        

    tblRetVal[1] = burntool3lib.DetectNandParam(nID, NandPhyInfo)
    tblRetVal[2] = NandPhyInfo
    return tblRetVal
end

function Test_BT_InitSecArea(tblArgTable)
    local nID = tblArgTable[1]
    local Type = tblArgTable[2]
    local tblRetVal = {}
    
    printlog("Running step -- Test_BT_InitSecArea")
    
    tblRetVal[1] = burntool3lib.InitSecArea(nID,Type)
    
    return tblRetVal
end

function Test_BT_SetResvAreaSize(tblArgTable)
    local nID = tblArgTable[1]
    local Size = tblArgTable[2]
    local bErase = tblArgTable[3]
    local tblRetVal = {}    
    printlog("Running step -- Test_BT_SetResvAreaSize")
    
    tblRetVal[1] = burntool3lib.SetResvAreaSize(nID, Size, bErase)
    
    return tblRetVal
end

function Test_BT_DownloadBin(tblArgTable)
    local nID = tblArgTable[1]
    local bCompare = tblArgTable[2]
    local bBackup = tblArgTable[3]
    local bUpdateSelf = tblArgTable[4]
    local pc_path = tblArgTable[5]
    local ld_addr = tblArgTable[6]
    local file_name = tblArgTable[7]
    local pDownloadBin = tblArgTable[8]
    local tblRetVal = {}                
            
    printlog("Running step -- Test_BT_DownloadBin")
    
    --     Pointer parameter that would be allocated before API invoking must
    --    be validated. Regular pointer would be allocated while null pointer 
    --    should be set zero. 
    if (pDownloadBin ~= 0) then
        pDownloadBin = burntool3lib.SetDownloadBinStruct(bCompare,
                                                    bBackup,
                                                    bUpdateSelf,
                                                    pc_path,
                                                    ld_addr,
                                                    file_name)
    else
        pDownloadBin = 0
    end        

    tblRetVal[1] = burntool3lib.DownloadBin(nID, pDownloadBin)
    return tblRetVal
end
--
function Test_BT_CreatePartition(tblArgTable)
    local nID = tblArgTable[1]
    local tblPartitionInfo = tblArgTable[2]
    local PartitionInfoStruct = tblArgTable[3]
    local PartitionCnt = tblArgTable[4]
    local resvSize = tblArgTable[5]
    local tblRetVal = {}                                
    local m_tblPartitionInfo = {}
    
    printlog("Running step -- Test_BT_CreatePartition")
    --     Pointer parameter that would be allocated before API invoking must
    --    be validated. Regular pointer would be allocated while null pointer 
    --    should be set zero. 
    if (tblPartitionInfo ~= 0) then
        if (PartitionCnt ~= 0) then 
            for i=1, PartitionCnt do
                m_tblPartitionInfo[i] = burntool3lib.SetPartitionInfo(tblPartitionInfo[i * 5 - 4],
                                                                    tblPartitionInfo[i * 5 - 3],
                                                                    tblPartitionInfo[i * 5 - 2],
                                                                    tblPartitionInfo[i * 5 - 1],
                                                                    tblPartitionInfo[i * 5 - 0])
            end
            
            PartitionInfoStruct = burntool3lib.SetPartitionInfoStruct(m_tblPartitionInfo)
            
        else
            PartitionInfoStruct = 0
        end        
    else
        PartitionInfoStruct = 0
    end        
    
    tblRetVal[1] = burntool3lib.CreatePartition(nID, PartitionInfoStruct, PartitionCnt, resvSize)

    return tblRetVal
end
--
function Test_BT_FormatDriver(tblArgTable)
    local nID = tblArgTable[1]
    local nSize_enlarge = tblArgTable[2]
    local driverName = tblArgTable[3]
    local pstrVolumeLable = tblArgTable[4]
    local formatDriver = tblArgTable[5]
    local tblRetVal = {}    
              
    printlog("Running step -- Test_BT_FormatDriver")
    formatDriver = burntool3lib.SetformatDriverStruct(nSize_enlarge, 
                                                      driverName,
                                                      pstrVolumeLable)    
    tblRetVal[1] = burntool3lib.FormatDriver(nID, formatDriver)
                          
    return tblRetVal
end

function Test_BT_MountDriver(tblArgTable)
    local nID = tblArgTable[1]
    local DriverName = tblArgTable[2]
    local DriverNum = tblArgTable[3]
    local tblRetVal = {}    
              
    printlog("Running step -- Test_BT_MountDriver")
    
    tblRetVal[1] = burntool3lib.MountDriver(nID, DriverName, DriverNum)
    return tblRetVal
end

function Test_BT_DownloadBoot(tblArgTable)
    local nID = tblArgTable[1]
    local pstrPath = tblArgTable[2]
    local ChipType = tblArgTable[3]
    local tblRetVal = {}
        
    printlog("Running step -- Test_BT_DownloadBoot")
    
    tblRetVal[1] = burntool3lib.DownloadBoot(nID, pstrPath, ChipType)    
    return tblRetVal
end

function Test_BT_DownloadImg(tblArgTable)
    local nID = tblArgTable[1]
    local pDownloadImg = tblArgTable[2]
    local bCompare = tblArgTable[3]
    local pc_path = tblArgTable[4]
    local driver_name = tblArgTable[5]
    local tblRetVal = {}
    
    printlog("Running step -- Test_BT_DownloadImg")
    --     Pointer parameter that would be allocated before API invoking must
    --    be validated. Regular pointer would be allocated while null pointer 
    --    should be set zero. 
    if (pDownloadImg ~= 0) then
        pDownloadImg = burntool3lib.SetDownloadImgStruct(bCompare, pc_path,    driver_name)    
    else
        pDownloadImg = 0
    end        

    tblRetVal[1] = burntool3lib.DownloadImg(nID, pDownloadImg)
    return tblRetVal
end

function Test_BT_DownloadFile(tblArgTable)
    local nID = tblArgTable[1]
    local bCompare = tblArgTable[2]
    local pc_path = tblArgTable[3]
    local udisk_path = tblArgTable[4]
    local pDownloadFile = tblArgTable[5]
    local tblRetVal = {}
    
    printlog("Running step -- Test_BT_DownloadFile")

    --     Pointer parameter that would be allocated before API invoking must
    --    be validated. Regular pointer would be allocated while null pointer 
    --    should be set zero. 
    if (pDownloadFile ~= 0) then
        pDownloadFile = burntool3lib.SetDownloadFileStruct(bCompare, pc_path, udisk_path)
    else
        pDownloadFile = 0
    end        
    
    tblRetVal[1] = burntool3lib.DownloadFile(nID, pDownloadFile)
    return tblRetVal
end

function Test_BT_Close(tblArgTable)
    local nID = tblArgTable[1]
    local tblRetVal = {}
    
    printlog("Running step -- Test_BT_Close")
    tblRetVal[1] = burntool3lib.Close(nID)    
    return tblRetVal
end

function Test_BT_SetGPIO(tblArgTable)
    local nID = tblArgTable[1]
    local num = tblArgTable[2]
    local dir = tblArgTable[3]
    local level = tblArgTable[4]
    local Pullup = tblArgTable[5]
    local Pulldown = tblArgTable[6]
    local tblRetVal = {}
    
    local GpioParam
    printlog("Running step -- Test_BT_SetGPIO")
    
    GpioParam = burntool3lib.SetGPIOParam(num, dir, level, Pullup, Pulldown)
    
    tblRetVal[1] = burntool3lib.SetGPIO(nID, GpioParam)    
    return tblRetVal
end

function Test_BT_UploadFile(tblArgTable)
    local nID = tblArgTable[1]
    local strFilePath = tblArgTable[2]
    local strPCPath = tblArgTable[3]
    local tblRetVal = {}
    
    printlog("Running step -- Test_BT_UploadFile")
    
    tblRetVal[1] = burntool3lib.UploadFile(nID, strFilePath, strPCPath)    
    return tblRetVal
end

function Test_BT_UploadBin(tblArgTable)
    local nID = tblArgTable[1]
    local file_name = tblArgTable[2]
    local pc_path = tblArgTable[3]
    local pUploadBin = tblArgTable[4]
    local tblRetVal = {}
                            
    printlog("Running step -- Test_BT_UploadBin")
    --     Pointer parameter that would be allocated before API invoking must
    --    be validated. Regular pointer would be allocated while null pointer 
    --    should be set zero. 
    if (pUploadBin ~= 0) then
        pUploadBin = burntool3lib.SetUploadBinStruct(file_name,
                                                    pc_path)
    else
        pUploadBin = 0
    end        
    
    tblRetVal[1] = burntool3lib.UploadBin(nID, pUploadBin)

    return tblRetVal
end

function Test_BT_UploadBoot(tblArgTable)
    local nID = tblArgTable[1]
    local pstrPath = tblArgTable[2]
    local fileLen = tblArgTable[3]
    local tblRetVal = {}
    
    printlog("Running step -- Test_BT_UploadBoot")
    
    tblRetVal[1] =burntool3lib.UploadBoot(nID, pstrPath, fileLen)
    return tblRetVal
end

function Test_BT_GetDiskInfo(tblArgTable)
    local nID = tblArgTable[1]
    local DriverNum = tblArgTable[2]
    local pDriverInfo = tblArgTable[3]
    local tblRetVal = {}
    
    printlog("Running step -- Test_BT_GetDiskInfo")
    
    if (DriverNum ~= 0) then
        DriverNum = burntool3lib.SetDriverNum()
    else
        DriverNum = 0
    end    
    if (pDriverInfo ~= 0) then
        pDriverInfo = burntool3lib.SetpDriverInfo()
    else
        pDriverInfo = 0
    end        
    
    tblRetVal[1] = burntool3lib.GetDiskInfo(nID, DriverNum, pDriverInfo)
    return tblRetVal
end

function Test_BT_WriteMobileDeviceCode(tblArgTable)
    local nID = tblArgTable[1]
    local tblRetVal = {}
    
    printlog("Running step -- Test_BT_WriteMobileDeviceCode")
    tblRetVal[1] = burntool3lib.WriteMobileDeviceCode(nID)
    return tblRetVal
end

function Test_BT_WriteASAFile(tblArgTable)
    local nID = tblArgTable[1]
    local fileName = tblArgTable[2]
    local pBuf = tblArgTable[3]
    local Bufsize = tblArgTable[4]
    local Mode = tblArgTable[5]
    local tblRetVal = {}
    
    printlog("Running step -- Test_BT_WriteASAFile")
    --     Pointer parameter that would be allocated before API invoking must
    --    be validated. Regular pointer would be allocated while null pointer 
    --    should be set zero. 
    if (AllocateBuf ~= 0) then
        pBuf = burntool3lib.AllocateBuf(Bufsize)
    else
        pBuf = 0
    end    
        
    tblRetVal[1] = burntool3lib.WriteASAFile(nID,fileName,pBuf,Bufsize,Mode)
    return tblRetVal
end

function Test_BT_ResetDevice(tblArgTable)
    local nID = tblArgTable[1]
    local tblRetVal = {}
    
    printlog("Running step -- Test_BT_ResetDevice")
    tblRetVal[1] = burntool3lib.ResetDevice(nID)
    return tblRetVal
end

function Test_BT_GetRegValue(tblArgTable)
    local nID = tblArgTable[1]
    local regAddr = tblArgTable[2]
    local regValue = tblArgTable[3]
    local tblRetVal = {}
    
    printlog("Running step -- Test_BT_GetRegValue")
    result.ReportStepData(TestStep)    
    --     Pointer parameter that would be allocated before API invoking must
    --    be validated. Regular pointer would be allocated while null pointer 
    --    should be set zero. 
    if (regValue ~= 0) then
        regValue = burntool3lib.AllocRegValue()    
    else
        regValue = 0
    end    
        
    tblRetVal[1] = burntool3lib.GetRegValue(nID, regAddr, regValue)
	tblRetVal[2] = regValue
    return tblRetVal
end

-- End of atom test functions
