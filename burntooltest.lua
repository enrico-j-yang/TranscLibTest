--burntool3lib test script

--V1.0.0

g_testCaseCnt = 0
g_logFileName = "LogFile.log"

--
function printlog(str)
    --print(str)
    log.msg("Script : "..str.."\n")
end
--

--load atom test functions
dofile("AtomTestFunc.lua")

--load test data 
dofile("TestData.lua")

g_tblCaseRet = 
{
    TC_PASS    = 1,
    TC_FAIL    = 0,
    TC_NA    = -1,
}

-- Judge result according to reference condition.
-- nRetVal: value to be judged.
-- tblExpTbl: expectation data table, first data is comparison condition
-- ("Equal" or "Not Equal", other condition can also be implemented), rest of the data is condition value.
function AssertRetVal(nRetVal, tblExpTbl)
    local nTestResult
    
    if (tblExpTbl[1] == "Equal") then
        printlog("Returned :"..nRetVal.." Expected = "..tblExpTbl[2])
        
        if (nRetVal ~= tblExpTbl[2]) then
            nTestResult = g_tblCaseRet.TC_FAIL
            printlog("Step failed")
            return nTestResult
        else
            nTestResult = g_tblCaseRet.TC_PASS
            printlog("Step passed")
            return nTestResult        
        end
    elseif tblExpTbl[1] == "Not Equal" then
        printlog("Returned :"..nRetVal.." Expected not = "..tblExpTbl[2])
        
        if (nRetVal == tblExpTbl[2]) then
            nTestResult = g_tblCaseRet.TC_FAIL
            printlog("Step failed")
            return nTestResult
        else
            nTestResult = g_tblCaseRet.TC_PASS
            printlog("Step passed")
            return nTestResult        
        end    
    end    
end

-- burn process function
-- nTestResult: current step test result
-- nStep: current step count
-- tblTestData: test data table
-- nEndIndex: test step to exit this function
-- nIndexStep: test step index step
-- nID: nID for this process
function fnBurnProcess(nTestResult, nStep, tblTestData, nEndIndex, nIndexStep, nID)
    -- Define a input data parameter table for atom fucntion.
    local tblInParam = {}
    -- Define 3 table to store temporal test data for different output data types.
    -- tblNextParamList stores test data for next step input data only.
    -- tblCaseLongParamList stores test data for rest of the steps.
    local tblNextParamList = {}
    local tblCaseLongParamList = {}  
    -- Define 4 flags to control data parsing process.
    -- bNext indicates there is a output data that will be used in next step.
    -- bCaseLong indicates there is a output data that will be used in rest of the step.
    local bNext = false
    local bCaseLong = false    
    -- Initial varibles for main loop. 
    local nLimit = nEndIndex
    local tblStepData = {}
    local nLoopStep = nIndexStep
    
    tblCaseLongParamList[1] = nID
    
    while nStep<=nLimit do   
        tblStepData = tblTestData[nStep]
        -- 

        -- Get input parameter(s) for test step table
        -- 取一步骤的测试输入数据    
        printlog("Coroutine Running step "..nStep)
        result.ReportStepData(nStep)
        -- 清空输入参数表
        tblInParam = {}    
        
        if table.getn(tblStepData.InputData) ~= 0 then
            for k, u in pairs(tblStepData.InputData) do
                tblInParam[k] = u          
            end        
        end -- end of if table.getn(tblStepData.InputData) ~= 0 then
                
        -- Pass output data for previous step to current input parameter
        -- according to parameter number.
        -- 检查是否存在临时变量作为输入
        -- 如果存在，则取临时数据到指定输入数据中
        -- 例如临时变量的值为1，表示输出数据作为以后的第1个输入数据
--      printlog("Pass output data for previous step")    
        for k, u in pairs(tblNextParamList) do
            tblInParam[k] = u
        end -- for k, u in pairs(tblNextParamList) do
        
        tblNextParamList = {}        

        for k, u in pairs(tblCaseLongParamList) do
            tblInParam[k] = u
        end -- for k, u in pairs(tblCaseLongParamList) do                 

        -- 运行一个测试步骤
--      printlog("Run a test step")
        tblRetVal = {}
        tblRetVal = tblStepData[1](tblInParam)    
    
        -- Output data handling. 
        -- "Temporal": output will only be used for step result comparison. 
        -- "Next": output will be used for step result comparison and input data of next step.
        -- "CaseLong" output will be used for step result comparison and input data for rest of steps.
        -- 检查输出数据类型与数量
        -- 输出数据是否需要储存，如果是则保存临时或线程数据
        local nOutputDataIndex = 0
        
        for k, u in ipairs(tblStepData.OutputData) do             
            if u == "Temporal" then
                nOutputDataIndex = nOutputDataIndex + 1                
            elseif u == "Next" then
                nOutputDataIndex = nOutputDataIndex + 1                
                bNext = true                
            elseif u == "CaseLong" then
                nOutputDataIndex = nOutputDataIndex + 1                  
                bCaseLong = true
            else
                if (bNext == true) then
                    tblNextParamList[u] = tblRetVal[nOutputDataIndex]
                    bNext = false
                end
                
                if (bCaseLong == true) then                
                    tblCaseLongParamList[u] = tblRetVal[nOutputDataIndex]
                    bCaseLong = false
                end
                
                nOutputDataIndex = nOutputDataIndex + 1                            
            end -- end of if u == "Temporal" then
        end -- end of for k, u in ipairs(tblStepData.OutputData) do      
        
        nStep = nStep + nLoopStep                    
        --  判定输出
--        printlog("Check output")
        nTestResult = AssertRetVal(tblRetVal[1], tblStepData.RefData)
        
        if (nTestResult ~= g_tblCaseRet.TC_PASS) then
            break            
        end -- end of if (nTestResult ~= g_tblCaseRet.TC_PASS) then           
        
        nTestResult, nStep = coroutine.yield(nTestResult, nStep)
    end -- end of while nStep<=nLimit do    
    
    return nTestResult, nStep
end


-- TestDataDriver parses single test case table(tblCaseTestData) to get atom test function, 
-- test input data, output data type and reference output for every step.
-- It would launch lua coroutine(TestCoRoutine) to test multi-thread case, depends on
-- output data type.
-- CaseName will be recorded in log file.

function fnTestDataDriver(strCaseName, tblCaseTestData)
--
    local nTestResult = g_tblCaseRet.TC_NA  
    -- Define a input data parameter table for atom fucntion.
    local tblInParam = {}
    -- Define 3 table to store temporal test data for different output data types.
    -- tblNextParamList stores test data for next step input data only.
    -- tblCaseLongParamList stores test data for rest of the steps.
    -- tblMultiThreadParamList stores test data for multi-thread(implemented as coroutine in lua).
    local tblNextParamList = {}
    local tblCaseLongParamList = {}
    local tblMultiThreadParamList = {}    
    -- Define 4 flags to control data parsing process.
    -- bNext indicates there is a output data that will be used in next step.
    -- bCaseLong indicates there is a output data that will be used in rest of the step.
    -- bMultiThread indicates there is a output data that will be used in multi-thread.
    -- bLaunchThread indicates this step must create coroutine to run multi-thread step.
    local bNext = false
    local bCaseLong = false        
    local bMultiThread = false
    local bLaunchThread = false   
    -- Initial varibles for main loop. 
    local nStep = 1
    local nLimit = table.getn(tblCaseTestData)
    local tblStepData = {}
    local nLoopStep = 1
    
    printlog("case "..strCaseName.." Begin")
    -- 开始测试
    burntool3lib.BeginTest()

    while nStep<=nLimit do        
        tblStepData = tblCaseTestData[nStep]
        -- 
        coBurnProcess = {}
        
        -- 检查是否存在线程测试数据，如果存在则创建线程
        if bLaunchThread == true then
            local nRoutineCnt = 0
            local bCRRetVal = true  
            
            for k, u in ipairs(tblMultiThreadParamList) do
                coBurnProcess[k] = coroutine.create(fnBurnProcess)
                nRoutineCnt = nRoutineCnt + 1                
                bLaunchThread = false
            end -- end of for k, u in ipairs(tblMultiThreadParamList) do            

            -- 启动线程
            -- 轮流运行每个协程的一个测试步骤
            local nRoutineIndex = 1    
            
            while (nStep<=nLimit) do                              
                
                if nRoutineIndex<=nRoutineCnt then
                    -- When a error occurs in coroutine, nTestResult and nStep will not return a value, nil value instead.
                    -- Define 2 temporal varibles to store nStep and nTestResult for function return.
                    local nTempStep = nStep              
                    local nTempTestResult = nTestResult
                    bCRRetVal, nTestResult, nStep = coroutine.resume(coBurnProcess[nRoutineIndex], 
                                                                     nTestResult, 
                                                                     nStep, 
                                                                     tblCaseTestData, 
                                                                     nLimit - (nRoutineCnt - nRoutineIndex), 
                                                                     1, 
                                                                     tblMultiThreadParamList[nRoutineIndex])     

                    if (bCRRetVal ~= true) then
                        nStep = nTempStep
                        nTestResult = nTempTestResult
                        break
                    end -- end of if (bCRRetVal ~= true) then                 

                    nRoutineIndex = nRoutineIndex + 1
                else
                    nRoutineIndex = 1
                end -- end of if nRoutineIndex<=nRoutineCnt then
            end  -- end of while (nStep<=nLimit) do        
        end -- if bLaunchThread == true then
        
        if (nStep>nLimit) then
            break
        end -- end of if (nStep>nLimit) then

        -- Get input parameter(s) for test step table
        -- 取一步骤的测试输入数据    
        printlog("Running step "..nStep)
        result.ReportStepData(nStep)
        -- 清空输入参数表
        tblInParam = {}    
        
        if table.getn(tblStepData.InputData) ~= 0 then
            for k, u in pairs(tblStepData.InputData) do
                tblInParam[k] = u          
            end        
        end -- end of if table.getn(tblStepData.InputData) ~= 0 then
                
        -- Pass output data for previous step to current input parameter
        -- according to parameter number.
        -- 检查是否存在临时变量作为输入
        -- 如果存在，则取临时数据到指定输入数据中
        -- 例如临时变量的值为1，表示输出数据作为以后的第1个输入数据
--      printlog("Pass output data for previous step")    
        for k, u in pairs(tblNextParamList) do
            tblInParam[k] = u
        end -- for k, u in pairs(tblNextParamList) do
        
        tblNextParamList = {}        
        
        for k, u in pairs(tblCaseLongParamList) do
            tblInParam[k] = u
        end -- for k, u in pairs(tblCaseLongParamList) do                 
        
        -- 运行一个测试步骤
--      printlog("Run a test step")
        tblRetVal = {}
        tblRetVal = tblStepData[1](tblInParam)    
    
        -- Output data handling. 
        -- "Temporal": output will only be used for step result comparison. 
        -- "Next": output will be used for step result comparison and input data of next step.
        -- "CaseLong" output will be used for step result comparison and input data for rest of steps.
        -- "MultiThread"
        -- "LaunchMultiThread"
        -- 检查输出数据类型与数量
        -- 输出数据是否需要储存，如果是则保存临时或线程数据
        local nOutputDataIndex = 0
        
        for k, u in ipairs(tblStepData.OutputData) do             
            if u == "Temporal" then
                nOutputDataIndex = nOutputDataIndex + 1                
            elseif u == "Next" then
                nOutputDataIndex = nOutputDataIndex + 1                
                bNext = true                
            elseif u == "CaseLong" then
                nOutputDataIndex = nOutputDataIndex + 1                  
                bCaseLong = true
            elseif u == "MultiThread" then
                nOutputDataIndex = nOutputDataIndex + 1                
                bMultiThread = true         
            elseif u == "LaunchMultiThread" then
                bLaunchThread = true
            else
                if (bNext == true) then
                    tblNextParamList[u] = tblRetVal[nOutputDataIndex]
                    bNext = false
                end
                
                if (bCaseLong == true) then                
                    tblCaseLongParamList[u] = tblRetVal[nOutputDataIndex]
                    bCaseLong = false
                end
                
                if (bMultiThread == true) then
                    tblMultiThreadParamList[table.getn(tblMultiThreadParamList) + 1] = tblRetVal[nOutputDataIndex]  
                    bMultiThread = false                                 
                end
                
                nOutputDataIndex = nOutputDataIndex + 1                            
            end -- end of if u == "Temporal" then
        end -- end of for k, u in ipairs(tblStepData.OutputData) do      
        
        nStep = nStep + nLoopStep
                    
        --  判定输出
--        printlog("Check output")
        nTestResult = AssertRetVal(tblRetVal[1], tblStepData.RefData)
        
        if (nTestResult ~= g_tblCaseRet.TC_PASS) then
            break            
        end -- end of if (nTestResult ~= g_tblCaseRet.TC_PASS) then        
        
    end -- end of while nStep<=nLimit do
--    
    printlog("case "..strCaseName.." returned: "..nTestResult)
    
    burntool3lib.EndTest();

    return nTestResult
end -- end of function fnTestDataDriver(CaseName, tblCaseTestData)
--

-- test data from 512bytes to 2048k bytes
--BT_API_PT_011_015
function Case_BT_API_PT_011_015(CaseName)

--
    local Ret = 0
    local PassFlag = g_tblCaseRet.TC_NA
    local nID = 0
    local FlashID = 0
    local nChipCnt = 0
    local nStep = 0
    local tblPartitionInfo = {}
    
    printlog("case "..CaseName.." Begin")
    
    burntool3lib.BeginTest()
    
    nStep = nStep + 1
    Ret = Test_BT_Init(nStep, 
                    g_tblTestInputData.BT_Init.nBurnObject.Minimum,
                    g_tblTestInputData.BT_Init.BurnProcess.Valid,
                    g_tblTestInputData.BT_Init.BurnProgress.Valid)
    
    PassFlag = AssertRetVal(Ret, OutputData.BT_Init.BT_SUCCESS)    
                
    if (PassFlag ~= g_tblCaseRet.TC_PASS) then
        burntool3lib.EndTest();
        return nStep
    end
    
    nStep = nStep + 1    
    nID = Test_BT_AttachUSB(nStep, 
                            g_tblTestInputData.BT_AttachUSB.pstrUSBName.Valid,
                            g_tblTestInputData.BT_AttachUSB.usbType.USB_M3USB)
                                                             
    if (nID ~= 0) then 
        PassFlag = g_tblCaseRet.TC_PASS
    else
        PassFlag = g_tblCaseRet.TC_FAIL    
        burntool3lib.EndTest();
        return nStep    
    end    
    
    nStep = nStep + 1
    Ret = Test_BT_Start(nStep)    
    
    PassFlag = AssertRetVal(Ret, OutputData.BT_Start.BT_SUCCESS)

    if (PassFlag ~= g_tblCaseRet.TC_PASS) then
        burntool3lib.EndTest();
        return nStep
    end
    
--
    nStep = nStep + 1
    Ret = Test_BT_SetRamParam(nStep, 
                              nID,
                              g_tblTestInputData.BT_SetRamParam.RamReg.Valid,
                              g_tblTestInputData.BT_SetRamParam.nNumReg.Valid)
                                   
    PassFlag = AssertRetVal(Ret, OutputData.BT_SetRamParam.BT_SUCCESS)
    
    if (PassFlag ~= g_tblCaseRet.TC_PASS) then
        burntool3lib.EndTest();
        return nStep
    end
    
    burntool3lib.StartPerformanceTest()

    nStep = nStep + 1
    Ret = Test_BT_DownloadProducer(nStep, 
                                   nID, 
                                   g_tblTestInputData.BT_DownloadProducer.pstrPath.Valid,
                                   g_tblTestInputData.BT_DownloadProducer.runAddr.Valid)

    PassFlag = AssertRetVal(Ret, OutputData.BT_DownloadProducer.BT_SUCCESS)
    
    if (PassFlag ~= g_tblCaseRet.TC_PASS) then
        burntool3lib.EndTest();
        return nStep
    end           
            
    nStep = nStep + 1            
    Ret, 
    FlashID, 
    nChipCnt = Test_BT_GetFlashID(nStep, 
                                  nID,
                                  g_tblTestInputData.BT_GetFlashID.Ce2_gpio.Invalid,
                                  g_tblTestInputData.BT_GetFlashID.Ce3_gpio.Invalid,
                                  g_tblTestInputData.BT_GetFlashID.FlashID.Valid,
                                  g_tblTestInputData.BT_GetFlashID.nChipCnt.Valid)
                                  
    PassFlag = AssertRetVal(Ret, OutputData.BT_GetFlashID.BT_SUCCESS)
    
    if (PassFlag ~= g_tblCaseRet.TC_PASS) then
        burntool3lib.EndTest();
        return nStep
    end
                                      
    nStep = nStep + 1    
    Ret = Test_BT_SetNandParam(nStep, 
                         nID,
                         FlashID,
                         g_tblTestInputData.BT_SetNandParam.NandPhyInfo.Valid)                         
                                      
    PassFlag = AssertRetVal(Ret, OutputData.BT_SetNandParam.BT_SUCCESS)
    
    if (PassFlag ~= g_tblCaseRet.TC_PASS) then
        burntool3lib.EndTest();
        return nStep
    end

    
    nStep = nStep + 1
    Ret = Test_BT_TestConnection(nStep, nID)    
                                      
    PassFlag = AssertRetVal(Ret, OutputData.BT_TestConnection.BT_SUCCESS)
    
    if (PassFlag ~= g_tblCaseRet.TC_PASS) then
        burntool3lib.EndTest();
        return nStep
    end
        
    nStep = nStep + 1
    Ret = Test_BT_InitSecArea(nStep, nID,g_tblTestInputData.BT_InitSecArea.Type.Zero)
                                      
    PassFlag = AssertRetVal(Ret, OutputData.BT_InitSecArea.BT_SUCCESS)
    
    if (PassFlag ~= g_tblCaseRet.TC_PASS) then
        burntool3lib.EndTest();
        return nStep
    end
        
    nStep = nStep + 1
    Ret = Test_BT_SetResvAreaSize(nStep, 
                            nID, 
                            g_tblTestInputData.BT_SetResvAreaSize.nSize.Valid,
                            g_tblTestInputData.BT_SetResvAreaSize.bErase.FALSE)                        
                                      
    PassFlag = AssertRetVal(Ret, OutputData.BT_SetResvAreaSize.BT_SUCCESS)
    
    if (PassFlag ~= g_tblCaseRet.TC_PASS) then
        burntool3lib.EndTest();
        return nStep
    end

    -- test 0.5k data transferring
    nStep = nStep + 1
    Ret = Test_BT_DownloadBin(nStep,
                            nID,
                            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
                            g_tblTestInputData.BT_DownloadBin.bBackup.FALSE,                                            
                            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.FALSE,
                            g_tblTestInputData.BT_DownloadBin.pc_path.Performance500,
                            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
                            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
                            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid)
                        
    PassFlag = AssertRetVal(Ret, OutputData.BT_DownloadBin.BT_SUCCESS)
    
    if (PassFlag ~= g_tblCaseRet.TC_PASS) then
        burntool3lib.EndTest();
        return nStep
    end
    
    -- test 1k data transferring
    nStep = nStep + 1
    Ret = Test_BT_DownloadBin(nStep,
                            nID,
                            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
                            g_tblTestInputData.BT_DownloadBin.bBackup.FALSE,                                            
                            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.FALSE,
                            g_tblTestInputData.BT_DownloadBin.pc_path.Performance1k,
                            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
                            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
                            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid)
                        
    PassFlag = AssertRetVal(Ret, OutputData.BT_DownloadBin.BT_SUCCESS)
    
    if (PassFlag ~= g_tblCaseRet.TC_PASS) then
        burntool3lib.EndTest();
        return nStep
    end

    
    -- test 2k data transferring
    nStep = nStep + 1
    Ret = Test_BT_DownloadBin(nStep,
                            nID,
                            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
                            g_tblTestInputData.BT_DownloadBin.bBackup.FALSE,                                            
                            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.FALSE,
                            g_tblTestInputData.BT_DownloadBin.pc_path.Performance2k,
                            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
                            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
                            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid)
                        
    PassFlag = AssertRetVal(Ret, OutputData.BT_DownloadBin.BT_SUCCESS)
    
    if (PassFlag ~= g_tblCaseRet.TC_PASS) then
        burntool3lib.EndTest();
        return nStep
    end
    
    -- test 4k data transferring
    nStep = nStep + 1
    Ret = Test_BT_DownloadBin(nStep,
                            nID,
                            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
                            g_tblTestInputData.BT_DownloadBin.bBackup.FALSE,                                            
                            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.FALSE,
                            g_tblTestInputData.BT_DownloadBin.pc_path.Performance4k,
                            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
                            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
                            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid)
                        
    PassFlag = AssertRetVal(Ret, OutputData.BT_DownloadBin.BT_SUCCESS)
    
    if (PassFlag ~= g_tblCaseRet.TC_PASS) then
        burntool3lib.EndTest();
        return nStep
    end
    
    -- test 8k data transferring
    nStep = nStep + 1
    Ret = Test_BT_DownloadBin(nStep,
                            nID,
                            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
                            g_tblTestInputData.BT_DownloadBin.bBackup.FALSE,                                            
                            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.FALSE,
                            g_tblTestInputData.BT_DownloadBin.pc_path.Performance8k,
                            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
                            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
                            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid)
                        
    PassFlag = AssertRetVal(Ret, OutputData.BT_DownloadBin.BT_SUCCESS)
    
    if (PassFlag ~= g_tblCaseRet.TC_PASS) then
        burntool3lib.EndTest();
        return nStep
    end
    
    -- test 16k data transferring
    nStep = nStep + 1
    Ret = Test_BT_DownloadBin(nStep,
                            nID,
                            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
                            g_tblTestInputData.BT_DownloadBin.bBackup.FALSE,                                            
                            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.FALSE,
                            g_tblTestInputData.BT_DownloadBin.pc_path.Performance16k,
                            g_tblTestInputData.BT_DownloadBin.ld_addr.Valid,
                            g_tblTestInputData.BT_DownloadBin.file_name.Valid,
                            g_tblTestInputData.BT_DownloadBin.pDownloadBin.Valid)
                        
    PassFlag = AssertRetVal(Ret, OutputData.BT_DownloadBin.BT_SUCCESS)
    
    if (PassFlag ~= g_tblCaseRet.TC_PASS) then
        burntool3lib.EndTest();
        return nStep
    end
    
    -- test 32k data transferring
    nStep = nStep + 1
    Ret = Test_BT_DownloadBin(nStep,
                            nID,
                            g_tblTestInputData.BT_DownloadBin.bCompare.FALSE,
                            g_tblTestInputData.BT_DownloadBin.bBackup.FALSE,                                            
                            g_tblTestInputData.BT_DownloadBin.bUpdateSelf.FALSE,
                            TestData.BT_DownloadBin.pc_path.Performance32k,
                            TestData.BT_DownloadBin.ld_addr.Valid,
                            TestData.BT_DownloadBin.file_name.Valid,
                            TestData.BT_DownloadBin.pDownloadBin.Valid)
                        
    PassFlag = AssertRetVal(Ret, OutputData.BT_DownloadBin.BT_SUCCESS)
    
    if (PassFlag ~= g_tblCaseRet.TC_PASS) then
        burntool3lib.EndTest();
        return nStep
    end
    
    -- test 64k data transferring
    nStep = nStep + 1
    Ret = Test_BT_DownloadBin(nStep,
                            nID,
                            TestData.BT_DownloadBin.bCompare.FALSE,
                            TestData.BT_DownloadBin.bBackup.FALSE,                                            
                            TestData.BT_DownloadBin.bUpdateSelf.FALSE,
                            TestData.BT_DownloadBin.pc_path.Performance64k,
                            TestData.BT_DownloadBin.ld_addr.Valid,
                            TestData.BT_DownloadBin.file_name.Valid,
                            TestData.BT_DownloadBin.pDownloadBin.Valid)
                        
    PassFlag = AssertRetVal(Ret, OutputData.BT_DownloadBin.BT_SUCCESS)
    
    if (PassFlag ~= g_tblCaseRet.TC_PASS) then
        burntool3lib.EndTest();
        return nStep
    end
    
    -- test 128k data transferring
    nStep = nStep + 1
    Ret = Test_BT_DownloadBin(nStep,
                            nID,
                            TestData.BT_DownloadBin.bCompare.FALSE,
                            TestData.BT_DownloadBin.bBackup.FALSE,                                            
                            TestData.BT_DownloadBin.bUpdateSelf.FALSE,
                            TestData.BT_DownloadBin.pc_path.Performance128k,
                            TestData.BT_DownloadBin.ld_addr.Valid,
                            TestData.BT_DownloadBin.file_name.Valid,
                            TestData.BT_DownloadBin.pDownloadBin.Valid)
                        
    PassFlag = AssertRetVal(Ret, OutputData.BT_DownloadBin.BT_SUCCESS)
    
    if (PassFlag ~= g_tblCaseRet.TC_PASS) then
        burntool3lib.EndTest();
        return nStep
    end
    
    -- test 256k data transferring
    nStep = nStep + 1
    Ret = Test_BT_DownloadBin(nStep,
                            nID,
                            TestData.BT_DownloadBin.bCompare.FALSE,
                            TestData.BT_DownloadBin.bBackup.FALSE,                                            
                            TestData.BT_DownloadBin.bUpdateSelf.FALSE,
                            TestData.BT_DownloadBin.pc_path.Performance256k,
                            TestData.BT_DownloadBin.ld_addr.Valid,
                            TestData.BT_DownloadBin.file_name.Valid,
                            TestData.BT_DownloadBin.pDownloadBin.Valid)
                        
    PassFlag = AssertRetVal(Ret, OutputData.BT_DownloadBin.BT_SUCCESS)
    
    if (PassFlag ~= g_tblCaseRet.TC_PASS) then
        burntool3lib.EndTest();
        return nStep
    end
    
    -- test 512k data transferring
    nStep = nStep + 1
    Ret = Test_BT_DownloadBin(nStep,
                            nID,
                            TestData.BT_DownloadBin.bCompare.FALSE,
                            TestData.BT_DownloadBin.bBackup.FALSE,                                            
                            TestData.BT_DownloadBin.bUpdateSelf.FALSE,
                            TestData.BT_DownloadBin.pc_path.Performance512k,
                            TestData.BT_DownloadBin.ld_addr.Valid,
                            TestData.BT_DownloadBin.file_name.Valid,
                            TestData.BT_DownloadBin.pDownloadBin.Valid)
                        
    PassFlag = AssertRetVal(Ret, OutputData.BT_DownloadBin.BT_SUCCESS)
    
    if (PassFlag ~= g_tblCaseRet.TC_PASS) then
        burntool3lib.EndTest();
        return nStep
    end
    
    -- test 1024k data transferring
    nStep = nStep + 1
    Ret = Test_BT_DownloadBin(nStep,
                            nID,
                            TestData.BT_DownloadBin.bCompare.FALSE,
                            TestData.BT_DownloadBin.bBackup.FALSE,                                            
                            TestData.BT_DownloadBin.bUpdateSelf.FALSE,
                            TestData.BT_DownloadBin.pc_path.Performance1024,
                            TestData.BT_DownloadBin.ld_addr.Valid,
                            TestData.BT_DownloadBin.file_name.Valid,
                            TestData.BT_DownloadBin.pDownloadBin.Valid)
                        
    PassFlag = AssertRetVal(Ret, OutputData.BT_DownloadBin.BT_SUCCESS)
    
    if (PassFlag ~= g_tblCaseRet.TC_PASS) then
        burntool3lib.EndTest();
        return nStep
    end
    
    -- test 2048k data transferring
    nStep = nStep + 1
    Ret = Test_BT_DownloadBin(nStep,
                            nID,
                            TestData.BT_DownloadBin.bCompare.FALSE,
                            TestData.BT_DownloadBin.bBackup.FALSE,                                            
                            TestData.BT_DownloadBin.bUpdateSelf.FALSE,
                            TestData.BT_DownloadBin.pc_path.Performance2048,
                            TestData.BT_DownloadBin.ld_addr.Valid,
                            TestData.BT_DownloadBin.file_name.Valid,
                            TestData.BT_DownloadBin.pDownloadBin.Valid)
                        
    PassFlag = AssertRetVal(Ret, OutputData.BT_DownloadBin.BT_SUCCESS)
    
    if (PassFlag ~= g_tblCaseRet.TC_PASS) then
        burntool3lib.EndTest();
        return nStep
    end
    
    -- test 4096k data transferring
    nStep = nStep + 1
    Ret = Test_BT_DownloadBin(nStep,
                            nID,
                            TestData.BT_DownloadBin.bCompare.FALSE,
                            TestData.BT_DownloadBin.bBackup.FALSE,                                            
                            TestData.BT_DownloadBin.bUpdateSelf.FALSE,
                            TestData.BT_DownloadBin.pc_path.Performance4096,
                            TestData.BT_DownloadBin.ld_addr.Valid,
                            TestData.BT_DownloadBin.file_name.Valid,
                            TestData.BT_DownloadBin.pDownloadBin.Valid)
                        
    PassFlag = AssertRetVal(Ret, OutputData.BT_DownloadBin.BT_SUCCESS)
    
    if (PassFlag ~= g_tblCaseRet.TC_PASS) then
        burntool3lib.EndTest();
        return nStep
    end

    -- test 8192k data transferring
    nStep = nStep + 1
    Ret = Test_BT_DownloadBin(nStep,
                            nID,
                            TestData.BT_DownloadBin.bCompare.FALSE,
                            TestData.BT_DownloadBin.bBackup.FALSE,                                            
                            TestData.BT_DownloadBin.bUpdateSelf.FALSE,
                            TestData.BT_DownloadBin.pc_path.Performance8192,
                            TestData.BT_DownloadBin.ld_addr.Valid,
                            TestData.BT_DownloadBin.file_name.Valid,
                            TestData.BT_DownloadBin.pDownloadBin.Valid)
                        
    PassFlag = AssertRetVal(Ret, OutputData.BT_DownloadBin.BT_SUCCESS)
    
    if (PassFlag ~= g_tblCaseRet.TC_PASS) then
        burntool3lib.EndTest();
        return nStep
    end

    
    nStep = nStep + 1
    tblPartitionInfo =
    {
        TestData.BT_CreatePartition.Disk_Name.Valid,
        TestData.BT_CreatePartition.bOpenZone.TRUE,
        TestData.BT_CreatePartition.ProtectType.Valid,
        TestData.BT_CreatePartition.ZoneType.Valid,
        TestData.BT_CreatePartition.Size.Valid,    
    }

    Ret = Test_BT_CreatePartition(nStep, 
                                  nID, 
                                  tblPartitionInfo,
                                  TestData.BT_CreatePartition.PartitionInfo.Valid,
                                  TestData.BT_CreatePartition.nNumPartition.Valid,
                                  TestData.BT_CreatePartition.resvSize.Valid)
    
    PassFlag = AssertRetVal(Ret, OutputData.BT_CreatePartition.BT_SUCCESS)
    
    if (PassFlag ~= g_tblCaseRet.TC_PASS) then
        burntool3lib.EndTest();
        return nStep
    end
    
    nStep = nStep + 1
    Ret = Test_BT_FormatDriver(nStep, 
                        nID,
                        TestData.BT_FormatDriver.nSize_enlarge.Zero,
                        TestData.BT_FormatDriver.driverName.Valid,
                        TestData.BT_FormatDriver.pstrVolumeLable.Valid,
                        TestData.BT_FormatDriver.formatDriver.Valid)

    PassFlag = AssertRetVal(Ret, OutputData.BT_FormatDriver.BT_SUCCESS)
    
    if (PassFlag ~= g_tblCaseRet.TC_PASS) then
        burntool3lib.EndTest();
        return nStep
    end


    -- test 4k data transferring
    nStep = nStep + 1
    Ret = Test_BT_DownloadImg(nStep,
                            nID,
                            TestData.BT_DownloadImg.pDownloadImg.Valid,
                            TestData.BT_DownloadImg.bCompare.FALSE,
                            TestData.BT_DownloadImg.pc_path.Performance4k,
                            TestData.BT_DownloadImg.driver_name.Valid)    

    PassFlag = AssertRetVal(Ret, OutputData.BT_DownloadImg.BT_SUCCESS)
    
    if (PassFlag ~= g_tblCaseRet.TC_PASS) then
        burntool3lib.EndTest();
        return nStep
    end

    -- test 32k data transferring
    nStep = nStep + 1
    Ret = Test_BT_DownloadImg(nStep,
                            nID,
                            TestData.BT_DownloadImg.pDownloadImg.Valid,
                            TestData.BT_DownloadImg.bCompare.FALSE,
                            TestData.BT_DownloadImg.pc_path.Performance32k,
                            TestData.BT_DownloadImg.driver_name.Valid)    

    PassFlag = AssertRetVal(Ret, OutputData.BT_DownloadImg.BT_SUCCESS)
    
    if (PassFlag ~= g_tblCaseRet.TC_PASS) then
        burntool3lib.EndTest();
        return nStep
    end
    
    -- test 60k data transferring
    nStep = nStep + 1
    Ret = Test_BT_DownloadImg(nStep,
                            nID,
                            TestData.BT_DownloadImg.pDownloadImg.Valid,
                            TestData.BT_DownloadImg.bCompare.FALSE,
                            TestData.BT_DownloadImg.pc_path.Performance60k,
                            TestData.BT_DownloadImg.driver_name.Valid)    

    PassFlag = AssertRetVal(Ret, OutputData.BT_DownloadImg.BT_SUCCESS)
    
    if (PassFlag ~= g_tblCaseRet.TC_PASS) then
        burntool3lib.EndTest();
        return nStep
    end        

    -- test 100k data transferring
    nStep = nStep + 1
    Ret = Test_BT_DownloadImg(nStep,
                            nID,
                            TestData.BT_DownloadImg.pDownloadImg.Valid,
                            TestData.BT_DownloadImg.bCompare.FALSE,
                            TestData.BT_DownloadImg.pc_path.Performance100k,
                            TestData.BT_DownloadImg.driver_name.Valid)    

    PassFlag = AssertRetVal(Ret, OutputData.BT_DownloadImg.BT_SUCCESS)
    
    if (PassFlag ~= g_tblCaseRet.TC_PASS) then
        burntool3lib.EndTest();
        return nStep
    end    

    -- test 0.5k data transferring
    nStep = nStep + 1    
    Ret = Test_BT_DownloadFile(nStep, 
                                nID,
                                TestData.BT_DownloadFile.bCompare.FALSE,
                                TestData.BT_DownloadFile.pc_path.Performance500,
                                TestData.BT_DownloadFile.udisk_path.Valid,
                                TestData.BT_DownloadFile.pDownloadFile.Valid)                                                                                

    PassFlag = AssertRetVal(Ret, OutputData.BT_DownloadFile.BT_SUCCESS)
    
    if (PassFlag ~= g_tblCaseRet.TC_PASS) then
        burntool3lib.EndTest();
        return nStep
    end

    -- test 1k data transferring
    nStep = nStep + 1    
    Ret = Test_BT_DownloadFile(nStep, 
                                nID,
                                TestData.BT_DownloadFile.bCompare.FALSE,
                                TestData.BT_DownloadFile.pc_path.Performance1k,
                                TestData.BT_DownloadFile.udisk_path.Valid,
                                TestData.BT_DownloadFile.pDownloadFile.Valid)                                                                                

    PassFlag = AssertRetVal(Ret, OutputData.BT_DownloadFile.BT_SUCCESS)
    
    if (PassFlag ~= g_tblCaseRet.TC_PASS) then
        burntool3lib.EndTest();
        return nStep
    end
    
    -- test 2k data transferring
    nStep = nStep + 1    
    Ret = Test_BT_DownloadFile(nStep, 
                                nID,
                                TestData.BT_DownloadFile.bCompare.FALSE,
                                TestData.BT_DownloadFile.pc_path.Performance2k,
                                TestData.BT_DownloadFile.udisk_path.Valid,
                                TestData.BT_DownloadFile.pDownloadFile.Valid)                                                                                

    PassFlag = AssertRetVal(Ret, OutputData.BT_DownloadFile.BT_SUCCESS)
    
    if (PassFlag ~= g_tblCaseRet.TC_PASS) then
        burntool3lib.EndTest();
        return nStep
    end                

    -- test 4k data transferring
    nStep = nStep + 1    
    Ret = Test_BT_DownloadFile(nStep, 
                                nID,
                                TestData.BT_DownloadFile.bCompare.FALSE,
                                TestData.BT_DownloadFile.pc_path.Performance4k,
                                TestData.BT_DownloadFile.udisk_path.Valid,
                                TestData.BT_DownloadFile.pDownloadFile.Valid)                                                                                

    PassFlag = AssertRetVal(Ret, OutputData.BT_DownloadFile.BT_SUCCESS)
    
    if (PassFlag ~= g_tblCaseRet.TC_PASS) then
        burntool3lib.EndTest();
        return nStep
    end    

    -- test 8k data transferring
    nStep = nStep + 1    
    Ret = Test_BT_DownloadFile(nStep, 
                                nID,
                                TestData.BT_DownloadFile.bCompare.FALSE,
                                TestData.BT_DownloadFile.pc_path.Performance8k,
                                TestData.BT_DownloadFile.udisk_path.Valid,
                                TestData.BT_DownloadFile.pDownloadFile.Valid)                                                                                

    PassFlag = AssertRetVal(Ret, OutputData.BT_DownloadFile.BT_SUCCESS)
    
    if (PassFlag ~= g_tblCaseRet.TC_PASS) then
        burntool3lib.EndTest();
        return nStep
    end    
    
    -- test 16k data transferring
    nStep = nStep + 1    
    Ret = Test_BT_DownloadFile(nStep, 
                                nID,
                                TestData.BT_DownloadFile.bCompare.FALSE,
                                TestData.BT_DownloadFile.pc_path.Performance16k,
                                TestData.BT_DownloadFile.udisk_path.Valid,
                                TestData.BT_DownloadFile.pDownloadFile.Valid)                                                                                

    PassFlag = AssertRetVal(Ret, OutputData.BT_DownloadFile.BT_SUCCESS)
    
    if (PassFlag ~= g_tblCaseRet.TC_PASS) then
        burntool3lib.EndTest();
        return nStep
    end    
    
    -- test 32k data transferring
    nStep = nStep + 1    
    Ret = Test_BT_DownloadFile(nStep, 
                                nID,
                                TestData.BT_DownloadFile.bCompare.FALSE,
                                TestData.BT_DownloadFile.pc_path.Performance32k,
                                TestData.BT_DownloadFile.udisk_path.Valid,
                                TestData.BT_DownloadFile.pDownloadFile.Valid)                                                                                

    PassFlag = AssertRetVal(Ret, OutputData.BT_DownloadFile.BT_SUCCESS)
    
    if (PassFlag ~= g_tblCaseRet.TC_PASS) then
        burntool3lib.EndTest();
        return nStep
    end    
    
    -- test 64k data transferring
    nStep = nStep + 1    
    Ret = Test_BT_DownloadFile(nStep, 
                                nID,
                                TestData.BT_DownloadFile.bCompare.FALSE,
                                TestData.BT_DownloadFile.pc_path.Performance64k,
                                TestData.BT_DownloadFile.udisk_path.Valid,
                                TestData.BT_DownloadFile.pDownloadFile.Valid)                                                                                

    PassFlag = AssertRetVal(Ret, OutputData.BT_DownloadFile.BT_SUCCESS)
    
    if (PassFlag ~= g_tblCaseRet.TC_PASS) then
        burntool3lib.EndTest();
        return nStep
    end    
    
    -- test 128k data transferring
    nStep = nStep + 1    
    Ret = Test_BT_DownloadFile(nStep, 
                                nID,
                                TestData.BT_DownloadFile.bCompare.FALSE,
                                TestData.BT_DownloadFile.pc_path.Performance128k,
                                TestData.BT_DownloadFile.udisk_path.Valid,
                                TestData.BT_DownloadFile.pDownloadFile.Valid)                                                                                

    PassFlag = AssertRetVal(Ret, OutputData.BT_DownloadFile.BT_SUCCESS)
    
    if (PassFlag ~= g_tblCaseRet.TC_PASS) then
        burntool3lib.EndTest();
        return nStep
    end    
    
    -- test 256k data transferring
    nStep = nStep + 1    
    Ret = Test_BT_DownloadFile(nStep, 
                                nID,
                                TestData.BT_DownloadFile.bCompare.FALSE,
                                TestData.BT_DownloadFile.pc_path.Performance256k,
                                TestData.BT_DownloadFile.udisk_path.Valid,
                                TestData.BT_DownloadFile.pDownloadFile.Valid)                                                                                

    PassFlag = AssertRetVal(Ret, OutputData.BT_DownloadFile.BT_SUCCESS)
    
    if (PassFlag ~= g_tblCaseRet.TC_PASS) then
        burntool3lib.EndTest();
        return nStep
    end    
    
    -- test 512k data transferring
    nStep = nStep + 1    
    Ret = Test_BT_DownloadFile(nStep, 
                                nID,
                                TestData.BT_DownloadFile.bCompare.FALSE,
                                TestData.BT_DownloadFile.pc_path.Performance512k,
                                TestData.BT_DownloadFile.udisk_path.Valid,
                                TestData.BT_DownloadFile.pDownloadFile.Valid)                                                                                

    PassFlag = AssertRetVal(Ret, OutputData.BT_DownloadFile.BT_SUCCESS)
    
    if (PassFlag ~= g_tblCaseRet.TC_PASS) then
        burntool3lib.EndTest();
        return nStep
    end    
    
    -- test 1024k data transferring
    nStep = nStep + 1    
    Ret = Test_BT_DownloadFile(nStep, 
                                nID,
                                TestData.BT_DownloadFile.bCompare.FALSE,
                                TestData.BT_DownloadFile.pc_path.Performance1024,
                                TestData.BT_DownloadFile.udisk_path.Valid,
                                TestData.BT_DownloadFile.pDownloadFile.Valid)                                                                                

    PassFlag = AssertRetVal(Ret, OutputData.BT_DownloadFile.BT_SUCCESS)
    
    if (PassFlag ~= g_tblCaseRet.TC_PASS) then
        burntool3lib.EndTest();
        return nStep
    end    
    
    -- test 2048k data transferring
    nStep = nStep + 1    
    Ret = Test_BT_DownloadFile(nStep, 
                                nID,
                                TestData.BT_DownloadFile.bCompare.FALSE,
                                TestData.BT_DownloadFile.pc_path.Performance2048,
                                TestData.BT_DownloadFile.udisk_path.Valid,
                                TestData.BT_DownloadFile.pDownloadFile.Valid)                                                                                

    PassFlag = AssertRetVal(Ret, OutputData.BT_DownloadFile.BT_SUCCESS)
    
    if (PassFlag ~= g_tblCaseRet.TC_PASS) then
        burntool3lib.EndTest();
        return nStep
    end    
    
    -- test 4096k data transferring
    nStep = nStep + 1    
    Ret = Test_BT_DownloadFile(nStep, 
                                nID,
                                TestData.BT_DownloadFile.bCompare.FALSE,
                                TestData.BT_DownloadFile.pc_path.Performance4096,
                                TestData.BT_DownloadFile.udisk_path.Valid,
                                TestData.BT_DownloadFile.pDownloadFile.Valid)                                                                                

    PassFlag = AssertRetVal(Ret, OutputData.BT_DownloadFile.BT_SUCCESS)
    
    if (PassFlag ~= g_tblCaseRet.TC_PASS) then
        burntool3lib.EndTest();
        return nStep
    end    
    
    -- test 8192k data transferring
    nStep = nStep + 1    
    Ret = Test_BT_DownloadFile(nStep, 
                                nID,
                                TestData.BT_DownloadFile.bCompare.FALSE,
                                TestData.BT_DownloadFile.pc_path.Performance8192,
                                TestData.BT_DownloadFile.udisk_path.Valid,
                                TestData.BT_DownloadFile.pDownloadFile.Valid)                                                                                

    PassFlag = AssertRetVal(Ret, OutputData.BT_DownloadFile.BT_SUCCESS)
    
    if (PassFlag ~= g_tblCaseRet.TC_PASS) then
        burntool3lib.EndTest();
        return nStep
    end    
    
    nStep = nStep + 1
    Ret = Test_BT_DownloadBoot(nStep, 
                            nID, 
                            TestData.BT_DownloadBoot.pstrPath.Valid, 
                            TestData.BT_DownloadBoot.ChipType.CHIP_3631)
    
    PassFlag = AssertRetVal(Ret, OutputData.BT_DownloadBoot.BT_SUCCESS)
    
    if (PassFlag ~= g_tblCaseRet.TC_PASS) then
        burntool3lib.EndTest();
        return nStep
    end
    
    
    nStep = nStep + 1
    Ret = Test_BT_DownloadBoot(nStep, 
                            nID, 
                            TestData.BT_DownloadBoot.pstrPath.Valid, 
                            TestData.BT_DownloadBoot.ChipType.CHIP_3631)
    
    PassFlag = AssertRetVal(Ret, OutputData.BT_DownloadBoot.BT_SUCCESS)
    
    if (PassFlag ~= g_tblCaseRet.TC_PASS) then
        burntool3lib.EndTest();
        return nStep
    end
    
    nStep = nStep + 1
    Ret = Test_BT_DownloadBoot(nStep, 
                            nID, 
                            TestData.BT_DownloadBoot.pstrPath.Valid, 
                            TestData.BT_DownloadBoot.ChipType.CHIP_3631)
    
    PassFlag = AssertRetVal(Ret, OutputData.BT_DownloadBoot.BT_SUCCESS)
    
    if (PassFlag ~= g_tblCaseRet.TC_PASS) then
        burntool3lib.EndTest();
        return nStep
    end
    
    
    nStep = nStep + 1
    Ret = Test_BT_DownloadBoot(nStep, 
                            nID, 
                            TestData.BT_DownloadBoot.pstrPath.Valid, 
                            TestData.BT_DownloadBoot.ChipType.CHIP_3631)
    
    PassFlag = AssertRetVal(Ret, OutputData.BT_DownloadBoot.BT_SUCCESS)
    
    if (PassFlag ~= g_tblCaseRet.TC_PASS) then
        burntool3lib.EndTest();
        return nStep
    end
        
    nStep = nStep + 1
    Ret = Test_BT_DownloadBoot(nStep, 
                            nID, 
                            TestData.BT_DownloadBoot.pstrPath.Valid, 
                            TestData.BT_DownloadBoot.ChipType.CHIP_3631)
    
    PassFlag = AssertRetVal(Ret, OutputData.BT_DownloadBoot.BT_SUCCESS)
    
    if (PassFlag ~= g_tblCaseRet.TC_PASS) then
        burntool3lib.EndTest();
        return nStep
    end                

--    
    printlog("case "..CaseName.." returned: "..PassFlag)
    
    burntool3lib.EndTest();

    return PassFlag

--    return g_tblCaseRet.TC_NA

end
--

-- test case data table
-- All test case data must be defined as below
g_tblTestCase = 
{
--Case Function            --Case Name             -- Case Test Data Table
	fnTestDataDriver, "BT_API_NC_1000", g_tblCaseNC1000,
	fnTestDataDriver, "BT_API_NC_1010", g_tblCaseNC1010,
	fnTestDataDriver, "BT_API_NC_1100", g_tblCaseNC1100,
	fnTestDataDriver, "BT_API_NC_2000", g_tblCaseNC2000,
	fnTestDataDriver, "BT_API_NC_2001", g_tblCaseNC2001,
	fnTestDataDriver, "BT_API_NC_2002", g_tblCaseNC2002,
	fnTestDataDriver, "BT_API_NC_2003", g_tblCaseNC2003,
	fnTestDataDriver, "BT_API_NC_2004", g_tblCaseNC2004,
	fnTestDataDriver, "BT_API_NC_2005", g_tblCaseNC2005,
	fnTestDataDriver, "BT_API_NC_2010", g_tblCaseNC2010,
	fnTestDataDriver, "BT_API_NC_2020", g_tblCaseNC2020,
	fnTestDataDriver, "BT_API_NC_2030", g_tblCaseNC2030,
	fnTestDataDriver, "BT_API_NC_2031", g_tblCaseNC2031,
	fnTestDataDriver, "BT_API_NC_2032", g_tblCaseNC2032,
	fnTestDataDriver, "BT_API_NC_2040", g_tblCaseNC2040,
	fnTestDataDriver, "BT_API_NC_2041", g_tblCaseNC2041,
	fnTestDataDriver, "BT_API_NC_2050", g_tblCaseNC2050,
	fnTestDataDriver, "BT_API_NC_2051", g_tblCaseNC2051,
	fnTestDataDriver, "BT_API_NC_2052", g_tblCaseNC2052,
	fnTestDataDriver, "BT_API_NC_2060", g_tblCaseNC2060,
	fnTestDataDriver, "BT_API_NC_2070", g_tblCaseNC2070,
	fnTestDataDriver, "BT_API_NC_2080", g_tblCaseNC2080,
	fnTestDataDriver, "BT_API_NC_2081", g_tblCaseNC2081,
	fnTestDataDriver, "BT_API_NC_2082", g_tblCaseNC2082,
	fnTestDataDriver, "BT_API_NC_2090", g_tblCaseNC2090,
--	fnTestDataDriver, "BT_API_NC_2100", g_tblCaseNC2100,
--	fnTestDataDriver, "BT_API_NC_2101", g_tblCaseNC2101,
	fnTestDataDriver, "BT_API_NC_2200", g_tblCaseNC2200,
	fnTestDataDriver, "BT_API_NC_2201", g_tblCaseNC2201,
--	fnTestDataDriver, "BT_API_NC_2210", g_tblCaseNC2210,
--	fnTestDataDriver, "BT_API_NC_2211", g_tblCaseNC2211,
	fnTestDataDriver, "BT_API_NC_2212", g_tblCaseNC2212,
	fnTestDataDriver, "BT_API_NC_2213", g_tblCaseNC2213,
--	fnTestDataDriver, "BT_API_NC_2220", g_tblCaseNC2220,
	fnTestDataDriver, "BT_API_NC_2230", g_tblCaseNC2230,
	fnTestDataDriver, "BT_API_NC_2231", g_tblCaseNC2231,
	fnTestDataDriver, "BT_API_NC_2240", g_tblCaseNC2240,
	fnTestDataDriver, "BT_API_NC_2241", g_tblCaseNC2241,
	fnTestDataDriver, "BT_API_NC_2242", g_tblCaseNC2242,
	fnTestDataDriver, "BT_API_NC_2243", g_tblCaseNC2243,
	fnTestDataDriver, "BT_API_NC_2250", g_tblCaseNC2250,
	fnTestDataDriver, "BT_API_NC_3000", g_tblCaseNC3000,
	fnTestDataDriver, "BT_API_NC_3010", g_tblCaseNC3010,
	fnTestDataDriver, "BT_API_NC_3020", g_tblCaseNC3020,
	fnTestDataDriver, "BT_API_NC_3030", g_tblCaseNC3030,
	fnTestDataDriver, "BT_API_NC_3031", g_tblCaseNC3031,
	fnTestDataDriver, "BT_API_NC_3032", g_tblCaseNC3032,
	fnTestDataDriver, "BT_API_NC_3040", g_tblCaseNC3040,
	fnTestDataDriver, "BT_API_NC_3041", g_tblCaseNC3041,
	fnTestDataDriver, "BT_API_NC_3050", g_tblCaseNC3050,
	fnTestDataDriver, "BT_API_NC_3051", g_tblCaseNC3051,
	fnTestDataDriver, "BT_API_NC_3052", g_tblCaseNC3052,
--	fnTestDataDriver, "BT_API_NC_3100", g_tblCaseNC3100,
	fnTestDataDriver, "BT_API_NC_4000", g_tblCaseNC4000,
	fnTestDataDriver, "BT_API_NC_4001", g_tblCaseNC4001,
	fnTestDataDriver, "BT_API_NC_4002", g_tblCaseNC4002,
	fnTestDataDriver, "BT_API_NC_4010", g_tblCaseNC4010,
	fnTestDataDriver, "BT_API_NC_4011", g_tblCaseNC4011,
	fnTestDataDriver, "BT_API_NC_4012", g_tblCaseNC4012,
--	fnTestDataDriver, "BT_API_NC_4100", g_tblCaseNC4100,
	fnTestDataDriver, "BT_API_NC_5000", g_tblCaseNC5000,
	fnTestDataDriver, "BT_API_NC_5010", g_tblCaseNC5010,
--Anormal case
	fnTestDataDriver, "BT_API_AC_1000", g_tblCaseAC1000,
	fnTestDataDriver, "BT_API_AC_1001", g_tblCaseAC1001,
	fnTestDataDriver, "BT_API_AC_1002", g_tblCaseAC1002,
	fnTestDataDriver, "BT_API_AC_1003", g_tblCaseAC1003,
	fnTestDataDriver, "BT_API_AC_1010", g_tblCaseAC1010,
	fnTestDataDriver, "BT_API_AC_1011", g_tblCaseAC1011,
	fnTestDataDriver, "BT_API_AC_1012", g_tblCaseAC1012,
	fnTestDataDriver, "BT_API_AC_1020", g_tblCaseAC1020,
	fnTestDataDriver, "BT_API_AC_1021", g_tblCaseAC1021,
	fnTestDataDriver, "BT_API_AC_1022", g_tblCaseAC1022,
	fnTestDataDriver, "BT_API_AC_1030", g_tblCaseAC1030,
	fnTestDataDriver, "BT_API_AC_1031", g_tblCaseAC1031,
	fnTestDataDriver, "BT_API_AC_1032", g_tblCaseAC1032,
	fnTestDataDriver, "BT_API_AC_1040", g_tblCaseAC1040,
	fnTestDataDriver, "BT_API_AC_1050", g_tblCaseAC1050,
	fnTestDataDriver, "BT_API_AC_1060", g_tblCaseAC1060,
	fnTestDataDriver, "BT_API_AC_1070", g_tblCaseAC1070,
	fnTestDataDriver, "BT_API_AC_1071", g_tblCaseAC1071,
	fnTestDataDriver, "BT_API_AC_1072", g_tblCaseAC1072,
	fnTestDataDriver, "BT_API_AC_1080", g_tblCaseAC1080,
	fnTestDataDriver, "BT_API_AC_1081", g_tblCaseAC1081,
--	fnTestDataDriver, "BT_API_AC_1090", g_tblCaseAC1090,
--	fnTestDataDriver, "BT_API_AC_1091", g_tblCaseAC1091,
	fnTestDataDriver, "BT_API_AC_1100", g_tblCaseAC1100,
	fnTestDataDriver, "BT_API_AC_1110", g_tblCaseAC1110,
	fnTestDataDriver, "BT_API_AC_1111", g_tblCaseAC1111,
	fnTestDataDriver, "BT_API_AC_1120", g_tblCaseAC1120,
	fnTestDataDriver, "BT_API_AC_1121", g_tblCaseAC1121,
	fnTestDataDriver, "BT_API_AC_1122", g_tblCaseAC1122,
	fnTestDataDriver, "BT_API_AC_1123", g_tblCaseAC1123,
	fnTestDataDriver, "BT_API_AC_1124", g_tblCaseAC1124,
	fnTestDataDriver, "BT_API_AC_1130", g_tblCaseAC1130,
	fnTestDataDriver, "BT_API_AC_1131", g_tblCaseAC1131,
	fnTestDataDriver, "BT_API_AC_1132", g_tblCaseAC1132,
	fnTestDataDriver, "BT_API_AC_1133", g_tblCaseAC1133,
	fnTestDataDriver, "BT_API_AC_1134", g_tblCaseAC1134,
	fnTestDataDriver, "BT_API_AC_1140", g_tblCaseAC1140,
	fnTestDataDriver, "BT_API_AC_1141", g_tblCaseAC1141,
	fnTestDataDriver, "BT_API_AC_1150", g_tblCaseAC1150,
	fnTestDataDriver, "BT_API_AC_1151", g_tblCaseAC1151,
	fnTestDataDriver, "BT_API_AC_1152", g_tblCaseAC1152,
	fnTestDataDriver, "BT_API_AC_1154", g_tblCaseAC1154,
	fnTestDataDriver, "BT_API_AC_1160", g_tblCaseAC1160,
	fnTestDataDriver, "BT_API_AC_1161", g_tblCaseAC1161,
	fnTestDataDriver, "BT_API_AC_1162", g_tblCaseAC1162,
	fnTestDataDriver, "BT_API_AC_1170", g_tblCaseAC1170,
	fnTestDataDriver, "BT_API_AC_1171", g_tblCaseAC1171,
	fnTestDataDriver, "BT_API_AC_1172", g_tblCaseAC1172,
	fnTestDataDriver, "BT_API_AC_1173", g_tblCaseAC1173,
--	fnTestDataDriver, "BT_API_AC_1174", g_tblCaseAC1174,
	fnTestDataDriver, "BT_API_AC_1180", g_tblCaseAC1180,
	fnTestDataDriver, "BT_API_AC_1181", g_tblCaseAC1181,
	fnTestDataDriver, "BT_API_AC_1182", g_tblCaseAC1182,
	fnTestDataDriver, "BT_API_AC_1183", g_tblCaseAC1183,
--	fnTestDataDriver, "BT_API_AC_1184", g_tblCaseAC1184,
	fnTestDataDriver, "BT_API_AC_1190", g_tblCaseAC1190,
	fnTestDataDriver, "BT_API_AC_1200", g_tblCaseAC1200,
	fnTestDataDriver, "BT_API_AC_1210", g_tblCaseAC1210,
	fnTestDataDriver, "BT_API_AC_1220", g_tblCaseAC1220,
--	fnTestDataDriver, "BT_API_AC_1221", g_tblCaseAC1221,
--	fnTestDataDriver, "BT_API_AC_1222", g_tblCaseAC1222,
	fnTestDataDriver, "BT_API_AC_1230", g_tblCaseAC1230,
	fnTestDataDriver, "BT_API_AC_1240", g_tblCaseAC1240,
	fnTestDataDriver, "BT_API_AC_1241", g_tblCaseAC1241,
	fnTestDataDriver, "BT_API_AC_1242", g_tblCaseAC1242,
	fnTestDataDriver, "BT_API_AC_1243", g_tblCaseAC1243,
	fnTestDataDriver, "BT_API_AC_1250", g_tblCaseAC1250,
	fnTestDataDriver, "BT_API_AC_1251", g_tblCaseAC1251,
	fnTestDataDriver, "BT_API_AC_1252", g_tblCaseAC1252,
	fnTestDataDriver, "BT_API_AC_1253", g_tblCaseAC1253,
	fnTestDataDriver, "BT_API_AC_1260", g_tblCaseAC1260,
	fnTestDataDriver, "BT_API_AC_1261", g_tblCaseAC1261,
	fnTestDataDriver, "BT_API_AC_1262", g_tblCaseAC1262,
	fnTestDataDriver, "BT_API_AC_1270", g_tblCaseAC1270,
	fnTestDataDriver, "BT_API_AC_1271", g_tblCaseAC1271,
	fnTestDataDriver, "BT_API_AC_1272", g_tblCaseAC1272,
	fnTestDataDriver, "BT_API_AC_1280", g_tblCaseAC1280,
--  Case_BT_API_PT_011_015, "BT_API_PT_011_015", 52 ,
}
-- API functions for test frame

function SetLogFileName(logFileName)
    log.open(g_logFileName)
    g_logFileName = logFileName
    printlog("SetLogFileName OK!")
    log.close();    
    return 1
end

function InitialTestCaseTable()
    
    log.open(g_logFileName)
    
    g_testCaseCnt = table.getn(g_tblTestCase)/3    
    burntool3lib.SetTestCaseCount(g_testCaseCnt)
    printlog("SetTestCaseCount OK!")
        
    for i=1, g_testCaseCnt do        
        burntool3lib.SetCaseTable(i, g_tblTestCase[i * 3 - 1], table.getn(g_tblTestCase[i * 3]))
    end
    
    printlog("Initial test case table OK!")
    
    log.close();    
end

--Test Co-ordinator run testing according to different massage.
--It will run test cases from StartID to EndID for repeatTime
function TestCoOrdinator(Msg, StartID, EndID, RepeatTime)    
--    
    log.open(g_logFileName)
    
    result.ReportStart()
    
    --run test case function according to three different test type.    
    printlog("StartID:"..g_tblTestCase[StartID * 3 - 1])
    printlog("EndID:"..g_tblTestCase[EndID * 3 - 1])
    printlog("RepeatTime:"..RepeatTime)        

    for i=1, RepeatTime do        
        for j=StartID, EndID do 
            --report test case ID and test step
            result.ReportCaseID(j, table.getn(g_tblTestCase[j * 3]))
            --report test case ID and result returned by test function
            result.ReportCaseResult(j, g_tblTestCase[j * 3 - 2](g_tblTestCase[j * 3 - 1], g_tblTestCase[j * 3]))
        end
    end

    result.ReportResultSummary()

    log.close();
--    
    return 1
end


