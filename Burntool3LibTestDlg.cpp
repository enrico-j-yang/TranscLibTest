// Burntool3LibTestDlg.cpp : implementation file
//

#include "stdafx.h"
#include "Burntool3LibTest.h"
#include "Burntool3LibTestDlg.h"
#include <process.h>

#include "dbt.h"
#include <stdlib.h>
#include "transc.h"
#include "BTTestCode.h"
#include <initguid.h>
#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

DEFINE_GUID(M3USB_GUID, 0x6e7ac6a7, 0x1a4c, 0x4a72, 0x83, 0x54, 0x89, 0x95, 0x11, 0xf8, 0x13, 0x51);

extern T_TEST_CASE_LIST *g_ptTestCaseList;
extern HANDLE g_EvtAttachUSB;
extern HANDLE g_EvtAttachUSBEnd;
extern HANDLE g_EvtDetachUSB;
extern HANDLE g_EvtDetachUSBEnd;
extern HANDLE g_EvtBurnCmd[SWITCH_USB_HIGH_SPEED];
extern t_TestData tTestData;
extern T_U32 g_ulTestCaseCnt;

T_U32 ulUSBNameLen;
HWND g_DlghWnd;

/////////////////////////////////////////////////////////////////////////////
// CAboutDlg dialog used for App About

class CAboutDlg : public CDialog
{
public:
	CAboutDlg();

// Dialog Data
	//{{AFX_DATA(CAboutDlg)
	enum { IDD = IDD_ABOUTBOX };
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CAboutDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	//{{AFX_MSG(CAboutDlg)
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

CAboutDlg::CAboutDlg() : CDialog(CAboutDlg::IDD)
{
	//{{AFX_DATA_INIT(CAboutDlg)
	//}}AFX_DATA_INIT
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CAboutDlg)
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialog)
	//{{AFX_MSG_MAP(CAboutDlg)
		// No message handlers
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CBurntool3LibTestDlg dialog

CBurntool3LibTestDlg::CBurntool3LibTestDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CBurntool3LibTestDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CBurntool3LibTestDlg)
	m_StrTitle = _T("Log On");

	m_bScriptLoaded = FALSE;
	//memset(&m_tTestMsg, 0, sizeof(m_tTestMsg));

	m_hTestEngineThread = INVALID_HANDLE_VALUE;

	m_eCurState = LOGON;
	m_ePreState = LOGON;

	m_eTestType = ALL;	
	m_StrVersion = _T("");
	m_StrReportPath = _T("");
	m_StrTester = _T("");
	m_StrTestMethod = _T("");
	m_StrScriptPath = _T("");
	m_StrModuleName = _T("");
	m_StrLogPath = _T("");
	m_ulPassCnt = 0;
	m_ulFailCnt = 0;
	m_ulNACnt = 0;
	m_StrPassCnt = _T("0");
	m_StrFailCnt = _T("0");
	m_StrNACnt = _T("0");
	m_StrCurCaseID = _T("");
	m_StrCurCaseStep = _T("");
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CBurntool3LibTestDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CBurntool3LibTestDlg)
	DDX_Control(pDX, IDC_CASE_PROGRESS, m_CaseProgress);
	DDX_Control(pDX, IDC_RADIO_SINGLE, m_RadSingle);
	DDX_Control(pDX, IDC_RADIO_MULTI, m_RadMulti);
	DDX_Control(pDX, IDC_RADIO_ALL, m_RadAll);
	DDX_Control(pDX, IDC_STATIC_TO, m_StcTo);
	DDX_Control(pDX, IDC_STATIC_FROM, m_StcFrom);
	DDX_Control(pDX, IDC_STATIC_FOR, m_StcFor);
	DDX_Control(pDX, IDC_LIST_TO_CASE, m_LstToCase);
	DDX_Control(pDX, IDC_LIST_REPEAT_TIME, m_LstRepeatTime);
	DDX_Control(pDX, IDC_LIST_FROM_CASE, m_LstFromCase);
	DDX_Control(pDX, IDC_STATIC_VERSION_REPORTPATH, m_StcVersionReportPath);
	DDX_Control(pDX, IDC_STATIC_TESTER, m_StcTester);
	DDX_Control(pDX, IDC_STATIC_TESTMETHOD_SCRIPTPATH, m_StcTestMethodScriptPath);
	DDX_Control(pDX, IDC_STATIC_MODULENAME_LOGPATH, m_StcModuleNameLogPath);
	DDX_Control(pDX, IDC_STATIC_TITLE, m_StcTitle);
	DDX_Control(pDX, IDC_STATIC_PASS_CNT, m_StcPassCnt);
	DDX_Control(pDX, IDC_STATIC_NA_CNT, m_StcNACnt);
	DDX_Control(pDX, IDC_STATIC_FAIL_CNT, m_StcFailCnt);
	DDX_Control(pDX, IDC_STATIC_CUR_CASE_ID, m_StcCurCaseID);
	DDX_Control(pDX, IDC_TOTAL_TEST_PROGRESS, m_Progress);
	DDX_Control(pDX, IDC_BUTTOM_BACK, m_BtnBack);
	DDX_Control(pDX, IDC_BUTTON_EXIT, m_BtnExit);
	DDX_Control(pDX, IDC_BUTTON_OK, m_BtnOK);
	DDX_Control(pDX, IDC_BUTTON_OPEN_REPORT, m_BtnOpenReport);
	DDX_Control(pDX, IDC_BUTTON_OPEN_LOG, m_BtnOpenLog);
	DDX_Control(pDX, IDC_BUTTON_LOAD_SCRIPT, m_BtnLoadScript);
	DDX_Control(pDX, IDC_BUTTON_SETTINGS, m_BtnSettings);
	DDX_Control(pDX, IDC_EDIT_VERSION_REPORTPATH, m_EdtVersionReportPath);
	DDX_Control(pDX, IDC_EDIT_TESTER, m_EdtTester);
	DDX_Control(pDX, IDC_EDIT_TESTMETHOD_SCRIPTPATH, m_EdtTestMethodScriptPath);
	DDX_Control(pDX, IDC_EDIT_MODULENAME_LOGPATH, m_EdtModuleNameLogPath);
	DDX_Control(pDX, IDC_STATIC_DATE, m_StcDate);
	DDX_Control(pDX, IDC_STATIC_TIME, m_StcTime);
	DDX_Text(pDX, IDC_STATIC_TITLE, m_StrTitle);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CBurntool3LibTestDlg, CDialog)
	//{{AFX_MSG_MAP(CBurntool3LibTestDlg)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDC_BUTTON_OK, OnButtonOk)
	ON_BN_CLICKED(IDC_BUTTOM_BACK, OnButtomBack)
	ON_BN_CLICKED(IDC_BUTTON_EXIT, OnButtonExit)
	ON_BN_CLICKED(IDC_BUTTON_SETTINGS, OnButtonSettings)
	ON_BN_CLICKED(IDC_BUTTON_OPEN_REPORT, OnButtonOpenReport)
	ON_EN_KILLFOCUS(IDC_EDIT_MODULENAME_LOGPATH, OnKillfocusEditModuleName)
	ON_EN_KILLFOCUS(IDC_EDIT_TESTMETHOD_SCRIPTPATH, OnKillfocusEditTestMothed)
	ON_EN_KILLFOCUS(IDC_EDIT_VERSION_REPORTPATH, OnKillfocusEditVersion)
	ON_EN_KILLFOCUS(IDC_EDIT_TESTER, OnKillfocusEditTester)
	ON_BN_CLICKED(IDC_RADIO_SINGLE, OnRadioSingle)
	ON_BN_CLICKED(IDC_RADIO_MULTI, OnRadioMulti)
	ON_BN_CLICKED(IDC_RADIO_ALL, OnRadioAll)
	ON_CBN_KILLFOCUS(IDC_LIST_REPEAT_TIME, OnKillfocusListRepeatTime)
	ON_BN_CLICKED(IDC_BUTTON_OPEN_LOG, OnButtonOpenLog)
	ON_BN_CLICKED(IDC_BUTTON_LOAD_SCRIPT, OnButtonLoadScript)
	ON_MESSAGE(WM_TE_RUN_LAUNCH_RESULT, OnLaunchTestEngineResult)
	ON_MESSAGE(WM_TE_RUN_CASE_RESULT, OnTestEngineCaseResult)
	ON_MESSAGE(WM_TE_RUN_CASE_ID, OnTestEngineCaseID)
	ON_MESSAGE(WM_TE_RUN_CASE_STEP_DATA, OnTestEngineCaseStepData)
	ON_MESSAGE(WM_TE_RUN_CASE_STEP_RESULT, OnTestEngineCaseStepResult)
	ON_MESSAGE(WM_TE_RUN_FINISHED, OnTestEngineFinished)
	ON_MESSAGE(WM_TE_LOAD_SCRIPT_RESULT, OnLoadScriptResult)
	ON_CBN_KILLFOCUS(IDC_LIST_FROM_CASE, OnKillfocusListFromCase)
	ON_CBN_KILLFOCUS(IDC_LIST_TO_CASE, OnKillfocusListToCase)
	ON_WM_TIMER()
	ON_MESSAGE(WM_UPDATE_SETTING_STATE, UpdateSettingState)
	ON_WM_DESTROY()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CBurntool3LibTestDlg message handlers

BOOL CBurntool3LibTestDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// Add "About..." menu item to system menu.

	// IDM_ABOUTBOX must be in the system command range.
	ASSERT((IDM_ABOUTBOX & 0xFFF0) == IDM_ABOUTBOX);
	ASSERT(IDM_ABOUTBOX < 0xF000);

	CMenu* pSysMenu = GetSystemMenu(FALSE);
	if (pSysMenu != NULL)
	{
		CString strAboutMenu;
		strAboutMenu.LoadString(IDS_ABOUTBOX);
		if (!strAboutMenu.IsEmpty())
		{
			pSysMenu->AppendMenu(MF_SEPARATOR);
			pSysMenu->AppendMenu(MF_STRING, IDM_ABOUTBOX, strAboutMenu);
		}
	}

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	
	// TODO: Add extra initialization here
	// Initial USB
	BOOL ret;
	
	ret = BT_RegisterDevice(GetSafeHwnd(), USB_M3USB);
	// Initial timer
	SetTimer(10, 1000, NULL); // Initial a 1 second timer
	// Initial clock
	CString StrDate;
	CString StrTime;
	SYSTEMTIME stSysTime;
	
	GetSystemTime(&stSysTime);	
	// Time zone GMT+08:00
	if (stSysTime.wHour + 8 >= 24)
	{
		stSysTime.wHour = stSysTime.wHour + 8 - 24;
	}
	else
	{
		stSysTime.wHour = stSysTime.wHour + 8;
	}	

	StrDate.Format(_T("Data: %d-%d-%d"), 
		stSysTime.wYear,
		stSysTime.wMonth,
		stSysTime.wDay);
	StrTime.Format(_T("Time: %d-%d-%d"),
		stSysTime.wHour,
		stSysTime.wMinute,
		stSysTime.wSecond);
	
	m_StcDate.SetWindowText(StrDate);
	m_StcTime.SetWindowText(StrTime);

	// Initial test type to ALL test mode.
	CheckRadioButton(IDC_RADIO_SINGLE, IDC_RADIO_ALL, IDC_RADIO_ALL);	
	m_eTestType = ALL;

	m_StrPassCnt.Format(_T("Pass:%d"), m_ulPassCnt);
	m_StcPassCnt.SetWindowText(m_StrPassCnt);
	m_StrFailCnt.Format(_T("Fail:%d"), m_ulFailCnt);
	m_StcFailCnt.SetWindowText(m_StrFailCnt);
	m_StrNACnt.Format(_T("N/A:%d"), m_ulNACnt);
	m_StcNACnt.SetWindowText(m_StrNACnt);

	// Initial settings from ini file
	TCHAR appPath[MAX_PATH] = {0};
	TCHAR tcTemp[MAX_INFO_LEN] = {0};
	CString FilePath;
	CString	strSection					= "LogOnInfo";
	const CString	strModuleNameSectionKey		= "ModuleName";
	const CString	strVersionSectionKey		= "Version";
	const CString	strTestMethodSectionKey		= "TestMethod";
	const CString	strTesterSectionKey			= "Tester";
	const CString	strLogPath					= "strLogPath";
	const CString	strReportPath				= "ReportPath";
	const CString	strScriptPath				= "ScriptPath";

	GetCurrentDirectory(MAX_PATH, appPath);// Get current working directory.
	FilePath = appPath;
	FilePath += "\\Settings.ini";
	
	memcpy(tcTemp, m_StrModuleName.GetBuffer(MAX_INFO_LEN), sizeof(TCHAR) * MAX_INFO_LEN);

	GetPrivateProfileString(strSection, 
							strModuleNameSectionKey, 
							_T("Module Name"), // default
							tcTemp, 
							MAX_INFO_LEN,
							FilePath);

	m_StrModuleName = tcTemp;

	memset(tcTemp, 0, sizeof(TCHAR) * MAX_INFO_LEN);

	memcpy(tcTemp, m_StrVersion.GetBuffer(MAX_INFO_LEN), sizeof(TCHAR) * MAX_INFO_LEN);
	
	GetPrivateProfileString(strSection, 
							strVersionSectionKey, 
							_T("Test Object Version"), // default
							tcTemp, 
							MAX_INFO_LEN,
							FilePath);

	m_StrVersion = tcTemp;
	
	memset(tcTemp, 0, sizeof(TCHAR) * MAX_INFO_LEN);

	memcpy(tcTemp, m_StrTestMethod.GetBuffer(MAX_INFO_LEN), sizeof(TCHAR) * MAX_INFO_LEN);
	
	GetPrivateProfileString(strSection, 
							strTestMethodSectionKey, 
							_T("Test Method"), // default
							tcTemp, 
							MAX_INFO_LEN,
							FilePath);

	 m_StrTestMethod = tcTemp;
	
	memset(tcTemp, 0, sizeof(TCHAR) * MAX_INFO_LEN);

	memcpy(tcTemp, m_StrTester.GetBuffer(MAX_INFO_LEN), sizeof(TCHAR) * MAX_INFO_LEN);
	
	GetPrivateProfileString(strSection, 
							strTesterSectionKey, 
							_T("Tester"), // default
							tcTemp, 
							MAX_INFO_LEN,
							FilePath);

	m_StrTester = tcTemp;
	
	memset(tcTemp, 0, sizeof(TCHAR) * MAX_INFO_LEN);

	strSection					= "Settings";

	memcpy(tcTemp, m_StrLogPath.GetBuffer(MAX_INFO_LEN), sizeof(TCHAR) * MAX_INFO_LEN);
	
	GetPrivateProfileString(strSection, 
							strLogPath, 
							_T("Log Path"), // default
							tcTemp, 
							MAX_INFO_LEN,
							FilePath);

	m_StrLogPath = tcTemp;
	
	memset(tcTemp, 0, sizeof(TCHAR) * MAX_INFO_LEN);

	memcpy(tcTemp, m_StrReportPath.GetBuffer(MAX_INFO_LEN), sizeof(TCHAR) * MAX_INFO_LEN);
	
	GetPrivateProfileString(strSection, 
							strReportPath, 
							_T("Report Path"), // default
							tcTemp, 
							MAX_INFO_LEN,
							FilePath);

	m_StrReportPath = tcTemp;
	
	memset(tcTemp, 0, sizeof(TCHAR) * MAX_INFO_LEN);

	memcpy(tcTemp, m_StrScriptPath.GetBuffer(MAX_INFO_LEN), sizeof(TCHAR) * MAX_INFO_LEN);
	
	GetPrivateProfileString(strSection, 
							strScriptPath, 
							_T("Script Path"), // default
							tcTemp, 
							MAX_INFO_LEN,
							FilePath);

	m_StrScriptPath = tcTemp;
	
	memset(tcTemp, 0, sizeof(TCHAR) * MAX_INFO_LEN);
	
	m_EdtModuleNameLogPath.SetWindowText(m_StrModuleName);
	m_EdtVersionReportPath.SetWindowText(m_StrVersion);
	m_EdtTestMethodScriptPath.SetWindowText(m_StrTestMethod);
	m_EdtTester.SetWindowText(m_StrTester);

	SetState(LOGON);
	HandleState();

	return TRUE;  // return TRUE  unless you set the focus to a control
}

void CBurntool3LibTestDlg::OnSysCommand(UINT nID, LPARAM lParam)
{
	if ((nID & 0xFFF0) == IDM_ABOUTBOX)
	{
		CAboutDlg dlgAbout;
		dlgAbout.DoModal();
	}
	else
	{
		CDialog::OnSysCommand(nID, lParam);
	}
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CBurntool3LibTestDlg::OnPaint() 
{
	if (IsIconic())
	{
		CPaintDC dc(this); // device context for painting

		SendMessage(WM_ICONERASEBKGND, (WPARAM) dc.GetSafeHdc(), 0);

		// Center icon in client rectangle
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// Draw the icon
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialog::OnPaint();
	}
}

// The system calls this to obtain the cursor to display while the user drags
//  the minimized window.
HCURSOR CBurntool3LibTestDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

// Set state to eState
VOID CBurntool3LibTestDlg::SetState(T_STATE eState)
{
	m_ePreState = m_eCurState;
	m_eCurState = eState;
}

// Handling state transform
void CBurntool3LibTestDlg::HandleState(void)
{	
	switch (m_eCurState)
	{
	case LOGON:
		// Log on state
		Switch2LogonState();
		m_EdtModuleNameLogPath.SetWindowText(m_StrModuleName);
		m_EdtVersionReportPath.SetWindowText(m_StrVersion);
		m_EdtTestMethodScriptPath.SetWindowText(m_StrTestMethod);
		m_EdtTester.SetWindowText(m_StrTester);
		break;
	case SETTING:
		// setting state
		Switch2SettingState();	
		m_EdtModuleNameLogPath.SetWindowText(m_StrLogPath);
		m_EdtVersionReportPath.SetWindowText(m_StrReportPath);
		m_EdtTestMethodScriptPath.SetWindowText(m_StrScriptPath);	
		UpdateSettingState();	
		break;
	case PRETEST:
		{
			// pretest state
			// Initial first and last test case id to dialog.
			CString temp;
			unsigned int i;

			if (m_LstFromCase.GetCount() == 0)
			{
				for (i=0; i<g_ulTestCaseCnt; i++)
				{
					temp = g_ptTestCaseList[i].pszID;
					m_LstFromCase.AddString(temp);
				}
				
				m_LstFromCase.SetCurSel(0);
				m_tTestMsg.eStartID = 0;
				
				for (i=0; i<g_ulTestCaseCnt; i++)
				{
					temp = g_ptTestCaseList[i].pszID;
					m_LstToCase.AddString(temp);
				}
				
				m_LstToCase.SetCurSel(g_ulTestCaseCnt - 1);
				m_tTestMsg.eEndID = (g_ulTestCaseCnt - 1);
				
				m_LstRepeatTime.SetCurSel(0);
				m_tTestMsg.ulRepeatTime = 1;
			}
			
			Switch2PreTestState();	
			UpdatePreTestState();
			break;

		}
	case TESTING:
		// testing state
		Switch2TestingState();
		
		switch(GetCheckedRadioButton(IDC_RADIO_SINGLE, IDC_RADIO_ALL))
		{			
		case IDC_RADIO_SINGLE:
			{
				CString temp;
				m_LstRepeatTime.GetWindowText(temp);
				m_tTestMsg.eMsg = TE_RUNNING_TEST;
				m_tTestMsg.eStartID = m_LstFromCase.GetCurSel();
				m_tTestMsg.eEndID = m_tTestMsg.eStartID;
				m_tTestMsg.ulRepeatTime = _wtoi(temp);	
			}
		
			break;
		case IDC_RADIO_MULTI:
			{
				CString temp;
				m_LstRepeatTime.GetWindowText(temp);
				m_tTestMsg.eMsg = TE_RUNNING_TEST;
				m_tTestMsg.eStartID = m_LstFromCase.GetCurSel();
				m_tTestMsg.eEndID = m_LstToCase.GetCurSel();
				m_tTestMsg.ulRepeatTime = _wtoi(temp);			
			}
			break;
		case IDC_RADIO_ALL:
		default:
			m_tTestMsg.eMsg = TE_RUNNING_TEST;
			m_tTestMsg.eStartID = 0;
			m_tTestMsg.eEndID = g_ulTestCaseCnt - 1;
			m_tTestMsg.ulRepeatTime = 1;
			break;
		}

		m_hTestEngineThread = (HANDLE)_beginthread(TestMain, NULL, this);
		m_ulPassCnt = 0;
		m_ulFailCnt = 0;
		m_ulNACnt = 0;
		m_StrPassCnt.Format(_T("Pass:%d"), m_ulPassCnt);
		m_StcPassCnt.SetWindowText(m_StrPassCnt);
		m_StrFailCnt.Format(_T("Fail:%d"), m_ulFailCnt);
		m_StcFailCnt.SetWindowText(m_StrFailCnt);
		m_StrNACnt.Format(_T("N/A:%d"), m_ulNACnt);
		m_StcNACnt.SetWindowText(m_StrNACnt);

		m_Progress.SetStep(1);
		m_Progress.SetPos(0);
		
		switch(m_eTestType)
		{
		default:
			break;
		case SINGLE:
			m_Progress.SetRange(0, g_ptTestCaseList[m_tTestMsg.eStartID].ulCaseStep * m_tTestMsg.ulRepeatTime);
			break;
		case MULTI:
			{
				UINT totalCaseStep = 0;

				for (UINT i=m_tTestMsg.eStartID;i<(m_tTestMsg.eEndID + 1);i++)
				{
					totalCaseStep += g_ptTestCaseList[i].ulCaseStep;	
				}

				m_Progress.SetRange(0, totalCaseStep * m_tTestMsg.ulRepeatTime);
			}
			break;
		case ALL:
			{
				UINT totalCaseStep = 0;
				
				for (UINT i=0;i<g_ulTestCaseCnt;i++)
				{
					totalCaseStep += g_ptTestCaseList[i].ulCaseStep;	
				}
				
				m_Progress.SetRange(0, totalCaseStep * m_tTestMsg.ulRepeatTime);
			}
			break;
		}

		break;
	default:
		// treat as pretest state
		Switch2SettingState();
		break;
	}
}

void CBurntool3LibTestDlg::OnButtonOk() 
{
	// TODO: Add your control notification handler code here
	switch (m_eCurState)
	{
	default:
		break;
	case LOGON:
		SetState(SETTING);
		HandleState();
		break;
	case SETTING:
		SetState(PRETEST);
		HandleState();
		break;
	case PRETEST:
		SetState(TESTING);
		HandleState();		
		break;
	case TESTING:
		SetState(PRETEST);
		HandleState();
		break;
	}
}

void CBurntool3LibTestDlg::OnButtomBack() 
{
	// TODO: Add your control notification handler code here
	SetState(m_ePreState);
	HandleState();
}

void CBurntool3LibTestDlg::OnButtonSettings() 
{
	// TODO: Add your control notification handler code here
	SetState(SETTING);
	HandleState();	
}

void CBurntool3LibTestDlg::OnButtonOpenLog() 
{
	// TODO: Add your control notification handler code here
	ShellExecute(AfxGetMainWnd()->GetSafeHwnd(), 
				_T("open"), 
				m_StrLogPath, 
				NULL, 
				NULL, 
				SW_SHOWDEFAULT);	
}

void CBurntool3LibTestDlg::OnButtonOpenReport() 
{	
	// TODO: Add your control notification handler code here
	ShellExecute(AfxGetMainWnd()->GetSafeHwnd(), 
				_T("open"), 
				m_StrReportPath, 
				NULL, 
				NULL, 
				SW_SHOWDEFAULT);	
}

void CBurntool3LibTestDlg::OnButtonLoadScript() 
{
	// TODO: Add your control notification handler code here
	t_TestProgressCBFuncs tCBFuncs;
	// set log file name to script
	// Set test module name to script
	// set test script file name to script
	if (SetLogFileNameToLua() && SetModuleNameToLua() && SetScriptFileNameToLua() &&
		SetReportFileName() && SetTestObjectVersion() && SetTestType() && SetTester())
	{
		//m_ScriptInitializedEvent.SetEvent();
		// Initial test engine
		
		m_tTestMsg.eMsg = TE_INIT;
		tCBFuncs.pfnReportCurCaseID = UpdateCaseID;
		tCBFuncs.pfnReportCaseResult = UpdateCaseResult;
		tCBFuncs.pfnReportTestStepData = UpdateTestStepData;
		tCBFuncs.pfnReportTestStepResult = UpdateTestStepResult;

		if (TE_InitEnvironment(m_tTestMsg, tCBFuncs) != TM_SUCCESS)
		{
			MessageBox(_T("Load script failed!"));		
		}
		else
		{
			PostMessage(WM_TE_LOAD_SCRIPT_RESULT, TRUE, NULL);
			PostMessage(WM_UPDATE_SETTING_STATE, NULL, NULL);
		}
		
	}	
	else
	{
		MessageBox(_T("Load script failed!"));
	}

	m_ScriptInitializedEvent.ResetEvent();
}

void CBurntool3LibTestDlg::OnButtonExit() 
{
	// TODO: Add your control notification handler code here
	TE_EndCase();
	m_tTestMsg.eMsg = TE_DEINIT;
	TE_DeInit(m_tTestMsg);
	
	CDialog::OnCancel();	
}

void CBurntool3LibTestDlg::OnKillfocusEditModuleName() 
{
	// TODO: Add your control notification handler code here
	switch(m_eCurState)
	{
	default:// treat as setting
		m_EdtModuleNameLogPath.GetWindowText(m_StrLogPath);
		break;
	case LOGON:
		m_EdtModuleNameLogPath.GetWindowText(m_StrModuleName);
		break;
	case SETTING:
		m_EdtModuleNameLogPath.GetWindowText(m_StrLogPath);
		break;
	}
}

void CBurntool3LibTestDlg::OnKillfocusEditTestMothed() 
{
	// TODO: Add your control notification handler code here
	switch(m_eCurState)
	{
	default:// treat as setting
		m_EdtTestMethodScriptPath.GetWindowText(m_StrScriptPath);
		break;
	case LOGON:
		m_EdtTestMethodScriptPath.GetWindowText(m_StrTestMethod);
		break;
	case SETTING:
		CString StrPrePath = m_StrScriptPath;
		m_EdtTestMethodScriptPath.GetWindowText(m_StrScriptPath);
		if (m_StrScriptPath != StrPrePath)
		{
			m_bScriptLoaded = FALSE;	
			UpdateSettingState();
		}		
		break;
	}	
}

void CBurntool3LibTestDlg::OnKillfocusEditVersion() 
{
	// TODO: Add your control notification handler code here
	switch(m_eCurState)
	{
	default:// treat as setting
		m_EdtVersionReportPath.GetWindowText(m_StrReportPath);
		break;
	case LOGON:
		m_EdtVersionReportPath.GetWindowText(m_StrVersion);
		break;
	case SETTING:
		m_EdtVersionReportPath.GetWindowText(m_StrReportPath);
		break;
	}	
}

void CBurntool3LibTestDlg::OnKillfocusEditTester() 
{
	// TODO: Add your control notification handler code here
	m_EdtTester.GetWindowText(m_StrTester);	
}

LRESULT CBurntool3LibTestDlg::WindowProc(UINT message, WPARAM wParam, LPARAM lParam) 
{
	//插入设备都在这里
	// TODO: Add your specialized code here and/or call the base class
	PDEV_BROADCAST_DEVICEINTERFACE hDev_Broadcast_Deviceinterface;
	
    if(message == WM_DEVICECHANGE)
    {
        if(wParam == DBT_DEVICEARRIVAL)
		{
            PDEV_BROADCAST_HDR hDev_Broadcast_HDR = (PDEV_BROADCAST_HDR)lParam;
			
            switch(hDev_Broadcast_HDR->dbch_devicetype)
            {
				
            case DBT_DEVTYP_DEVICEINTERFACE:
                
                hDev_Broadcast_Deviceinterface = 
                    (PDEV_BROADCAST_DEVICEINTERFACE)lParam;
				
                 if( hDev_Broadcast_Deviceinterface->dbcc_classguid == 
                     M3USB_GUID )
                 {//调bt_attach
#ifndef MASK_TEST_OBJECT

					 int dwRet = WaitForSingleObject(g_EvtBurnCmd[SWITCH_USB_HIGH_SPEED], 2000);
					 switch(dwRet)
					 {
					 case WAIT_OBJECT_0:
						 {
							 UINT index;
							 
							 index = BT_AttachUSB(hDev_Broadcast_Deviceinterface->dbcc_name, USB_M3USB);
						 
						 }
						 break;
					 case WAIT_TIMEOUT:
						 ulUSBNameLen = wcslen(hDev_Broadcast_Deviceinterface->dbcc_name) * 2 + 2;
						 SetEvent(g_EvtAttachUSB);
						 ResetEvent(g_EvtAttachUSBEnd);
						 WaitForSingleObject(g_EvtAttachUSBEnd, INFINITE);
						 
						 if (tTestData.td_AttachUSB.pstrUSBName != AK_NULL)
						 {
							 memset(tTestData.td_AttachUSB.pstrUSBName, 0, wcslen(hDev_Broadcast_Deviceinterface->dbcc_name) * 2 + 2);
							 wcscpy(tTestData.td_AttachUSB.pstrUSBName, hDev_Broadcast_Deviceinterface->dbcc_name);
							 SetEvent(g_EvtAttachUSB);
							 ResetEvent(g_EvtAttachUSBEnd);
							 //MessageBox(_T("USB detected"));
							 SetEvent(g_EvtDetachUSB);
						 }
						 break;
					 default:
						 break;
					 }
#endif	

                 }
				 break;
            default:
                break;
            }
		}
        else if(wParam == DBT_DEVICEREMOVECOMPLETE)
        {
			
            PDEV_BROADCAST_HDR hDev_Broadcast_HDR = (PDEV_BROADCAST_HDR)lParam;
			
            switch(hDev_Broadcast_HDR->dbch_devicetype)
            {
            case DBT_DEVTYP_DEVICEINTERFACE:
                
                hDev_Broadcast_Deviceinterface = 
                    (PDEV_BROADCAST_DEVICEINTERFACE)lParam;
				
				if( hDev_Broadcast_Deviceinterface->dbcc_classguid == 
					M3USB_GUID )
				{
#ifndef MASK_TEST_OBJECT
					UINT index;					
                    index = BT_DetachUSB(hDev_Broadcast_Deviceinterface->dbcc_name, USB_M3USB);
#endif
				}
                break;
            default:
                break;
            }
            
        }
    }
	
	return CDialog::WindowProc(message, wParam, lParam);
}

void CBurntool3LibTestDlg::Switch2LogonState(void)
{
	m_StcDate.ShowWindow(SW_SHOW);
	m_StcTime.ShowWindow(SW_SHOW);
	m_BtnSettings.ShowWindow(SW_HIDE);
	m_BtnOpenReport.ShowWindow(SW_HIDE);
	m_BtnOpenLog.ShowWindow(SW_HIDE);
	m_BtnLoadScript.ShowWindow(SW_HIDE);
	m_BtnExit.ShowWindow(SW_HIDE);
	m_BtnOpenReport.EnableWindow(TRUE);
	m_BtnOpenLog.EnableWindow(TRUE);
	m_BtnLoadScript.EnableWindow(TRUE);
	m_BtnExit.EnableWindow(TRUE);
	
	m_StrTitle = "Log On";
	m_StcTitle.ShowWindow(SW_SHOW);
	m_StcCurCaseID.ShowWindow(SW_HIDE);
	m_StcPassCnt.ShowWindow(SW_HIDE);
	m_StcNACnt.ShowWindow(SW_HIDE);
	m_StcFailCnt.ShowWindow(SW_HIDE);

	m_StcModuleNameLogPath.SetWindowText(_T("Module Name"));
	m_StcModuleNameLogPath.ShowWindow(SW_SHOW);
	m_StcModuleNameLogPath.EnableWindow(TRUE);
	m_EdtModuleNameLogPath.ShowWindow(SW_SHOW);	
	m_EdtModuleNameLogPath.EnableWindow(FALSE);
	m_StcVersionReportPath.SetWindowText(_T("Version"));
	m_StcVersionReportPath.ShowWindow(SW_SHOW);
	m_StcVersionReportPath.EnableWindow(TRUE);
	m_EdtVersionReportPath.ShowWindow(SW_SHOW);
	m_EdtVersionReportPath.EnableWindow(TRUE);
	m_StcTestMethodScriptPath.SetWindowText(_T("Test Method"));
	m_StcTestMethodScriptPath.ShowWindow(SW_SHOW);
	m_StcTestMethodScriptPath.EnableWindow(TRUE);
	m_EdtTestMethodScriptPath.ShowWindow(SW_SHOW);
	m_EdtTestMethodScriptPath.EnableWindow(TRUE);
	m_StcTester.SetWindowText(_T("Tester"));
	m_StcTester.ShowWindow(SW_SHOW);
	m_EdtTester.ShowWindow(SW_SHOW);
	
	m_RadSingle.ShowWindow(SW_HIDE);	
	m_RadMulti.ShowWindow(SW_HIDE);
	m_RadAll.ShowWindow(SW_HIDE);	

	m_StcFrom.ShowWindow(SW_HIDE);
	m_LstFromCase.ShowWindow(SW_HIDE);
	m_StcTo.ShowWindow(SW_HIDE);
	m_LstToCase.ShowWindow(SW_HIDE);
	m_StcFor.ShowWindow(SW_HIDE);
	m_LstRepeatTime.ShowWindow(SW_HIDE);
	
	m_BtnOK.ShowWindow(SW_SHOW);
	m_BtnOK.EnableWindow(TRUE);
	m_BtnBack.ShowWindow(SW_SHOW);
	m_BtnBack.EnableWindow(FALSE);
	m_Progress.ShowWindow(SW_HIDE);	
	m_CaseProgress.ShowWindow(SW_HIDE);	
	
	UpdateData(FALSE);
}

void CBurntool3LibTestDlg::Switch2SettingState(void)
{
	m_StcDate.ShowWindow(SW_SHOW);
	m_StcTime.ShowWindow(SW_SHOW);
	m_BtnSettings.ShowWindow(SW_SHOW);
	m_BtnOpenReport.ShowWindow(SW_SHOW);
	m_BtnOpenLog.ShowWindow(SW_SHOW);
	m_BtnLoadScript.ShowWindow(SW_SHOW);
	m_BtnExit.ShowWindow(SW_SHOW);
	m_BtnOpenReport.EnableWindow(TRUE);
	m_BtnOpenLog.EnableWindow(TRUE);
	m_BtnLoadScript.EnableWindow(TRUE);
	m_BtnExit.EnableWindow(TRUE);
	
	m_StrTitle = "Settings";
	m_StcTitle.ShowWindow(SW_SHOW);	
	m_StcCurCaseID.ShowWindow(SW_HIDE);
	m_StcPassCnt.ShowWindow(SW_HIDE);
	m_StcNACnt.ShowWindow(SW_HIDE);
	m_StcFailCnt.ShowWindow(SW_HIDE);

	m_StcModuleNameLogPath.SetWindowText(_T("Log Path"));
	m_StcModuleNameLogPath.ShowWindow(SW_SHOW);
	m_StcModuleNameLogPath.EnableWindow(TRUE);
	m_EdtModuleNameLogPath.ShowWindow(SW_SHOW);	
	m_EdtModuleNameLogPath.EnableWindow(TRUE);
	m_StcVersionReportPath.SetWindowText(_T("Test Report Path"));
	m_StcVersionReportPath.ShowWindow(SW_SHOW);
	m_StcVersionReportPath.EnableWindow(TRUE);
	m_EdtVersionReportPath.ShowWindow(SW_SHOW);
	m_EdtVersionReportPath.EnableWindow(TRUE);
	m_StcTestMethodScriptPath.SetWindowText(_T("Script Path"));
	m_StcTestMethodScriptPath.ShowWindow(SW_SHOW);
	m_StcTestMethodScriptPath.EnableWindow(TRUE);
	m_EdtTestMethodScriptPath.ShowWindow(SW_SHOW);
	m_EdtTestMethodScriptPath.EnableWindow(TRUE);
	m_StcTester.SetWindowText(_T("Test"));
	m_StcTester.ShowWindow(SW_HIDE);
	m_EdtTester.ShowWindow(SW_HIDE);
	
	m_RadSingle.ShowWindow(SW_HIDE);	
	m_RadMulti.ShowWindow(SW_HIDE);
	m_RadAll.ShowWindow(SW_HIDE);	
	
	m_StcFrom.ShowWindow(SW_HIDE);
	m_LstFromCase.ShowWindow(SW_HIDE);
	m_StcTo.ShowWindow(SW_HIDE);
	m_LstToCase.ShowWindow(SW_HIDE);
	m_StcFor.ShowWindow(SW_HIDE);
	m_LstRepeatTime.ShowWindow(SW_HIDE);
	
	m_BtnOK.ShowWindow(SW_SHOW);
	m_BtnOK.EnableWindow(TRUE);
	m_BtnBack.ShowWindow(SW_SHOW);
	m_BtnBack.EnableWindow(TRUE);
	m_Progress.ShowWindow(SW_HIDE);
	m_Progress.ShowWindow(SW_HIDE);
	m_CaseProgress.ShowWindow(SW_HIDE);
	
	UpdateData(FALSE);
}

void CBurntool3LibTestDlg::Switch2PreTestState(void)
{	
	m_StcDate.ShowWindow(SW_SHOW);
	m_StcTime.ShowWindow(SW_SHOW);
	m_BtnSettings.ShowWindow(SW_SHOW);
	m_BtnOpenReport.ShowWindow(SW_SHOW);
	m_BtnOpenLog.ShowWindow(SW_SHOW);
	m_BtnLoadScript.ShowWindow(SW_SHOW);
	m_BtnExit.ShowWindow(SW_SHOW);
	m_BtnSettings.EnableWindow(TRUE);
	m_BtnOpenReport.EnableWindow(TRUE);
	m_BtnOpenLog.EnableWindow(TRUE);
	m_BtnLoadScript.EnableWindow(FALSE);
	m_BtnExit.EnableWindow(TRUE);
	
	m_StrTitle = "Choose Test Type";
	m_StcTitle.ShowWindow(SW_SHOW);
	m_StcCurCaseID.ShowWindow(SW_HIDE);
	m_StcPassCnt.ShowWindow(SW_HIDE);
	m_StcNACnt.ShowWindow(SW_HIDE);
	m_StcFailCnt.ShowWindow(SW_HIDE);

	m_StcModuleNameLogPath.SetWindowText(_T("Log Path"));
	m_StcModuleNameLogPath.ShowWindow(SW_SHOW);
	m_StcModuleNameLogPath.EnableWindow(FALSE);
	m_EdtModuleNameLogPath.ShowWindow(SW_SHOW);
	m_EdtModuleNameLogPath.EnableWindow(FALSE);
	m_StcVersionReportPath.SetWindowText(_T("Test Report Path"));
	m_StcVersionReportPath.ShowWindow(SW_SHOW);
	m_StcVersionReportPath.EnableWindow(FALSE);
	m_EdtVersionReportPath.ShowWindow(SW_SHOW);
	m_EdtVersionReportPath.EnableWindow(FALSE);
	m_StcTestMethodScriptPath.SetWindowText(_T("Script Path"));
	m_StcTestMethodScriptPath.ShowWindow(SW_SHOW);
	m_StcTestMethodScriptPath.EnableWindow(FALSE);
	m_EdtTestMethodScriptPath.ShowWindow(SW_SHOW);
	m_EdtTestMethodScriptPath.EnableWindow(FALSE);
	m_StcTester.SetWindowText(_T("Test"));
	m_StcTester.ShowWindow(SW_HIDE);
	m_EdtTester.ShowWindow(SW_HIDE);
			
	m_RadSingle.ShowWindow(SW_SHOW);	
	m_RadMulti.ShowWindow(SW_SHOW);
	m_RadAll.ShowWindow(SW_SHOW);	
	m_RadSingle.EnableWindow(TRUE);
	m_RadMulti.EnableWindow(TRUE);
	m_RadAll.EnableWindow(TRUE);
	
	m_StcFrom.ShowWindow(SW_SHOW);
	m_LstFromCase.ShowWindow(SW_SHOW);
	m_StcTo.ShowWindow(SW_SHOW);
	m_LstToCase.ShowWindow(SW_SHOW);
	m_StcFor.ShowWindow(SW_SHOW);
	m_LstRepeatTime.ShowWindow(SW_SHOW);
	
	m_BtnOK.ShowWindow(SW_SHOW);
	m_BtnOK.EnableWindow(TRUE);
	m_BtnBack.ShowWindow(SW_SHOW);
	m_BtnBack.EnableWindow(TRUE);
	m_Progress.ShowWindow(SW_HIDE);	
	m_CaseProgress.ShowWindow(SW_HIDE);	
	
	UpdateData(FALSE);
}

void CBurntool3LibTestDlg::Switch2TestingState(void)
{		
	m_StcDate.ShowWindow(SW_SHOW);
	m_StcTime.ShowWindow(SW_SHOW);
	m_BtnSettings.ShowWindow(SW_SHOW);
	m_BtnOpenReport.ShowWindow(SW_SHOW);
	m_BtnOpenLog.ShowWindow(SW_SHOW);
	m_BtnLoadScript.ShowWindow(SW_SHOW);
	m_BtnExit.ShowWindow(SW_SHOW);
	m_BtnSettings.EnableWindow(FALSE);
	m_BtnOpenReport.EnableWindow(FALSE);
	m_BtnOpenLog.EnableWindow(FALSE);
	m_BtnLoadScript.EnableWindow(FALSE);
	m_BtnExit.EnableWindow(TRUE);
	
	m_StrTitle = "Under Testing";
	m_StcTitle.ShowWindow(SW_HIDE);
	m_StcCurCaseID.ShowWindow(SW_SHOW);
	m_StcPassCnt.ShowWindow(SW_SHOW);
	m_StcNACnt.ShowWindow(SW_SHOW);
	m_StcFailCnt.ShowWindow(SW_SHOW);

	m_StcModuleNameLogPath.SetWindowText(_T("Log Path"));
	m_StcModuleNameLogPath.ShowWindow(SW_HIDE);
	m_EdtModuleNameLogPath.ShowWindow(SW_HIDE);
	m_StcVersionReportPath.SetWindowText(_T("Test Report Path"));
	m_StcVersionReportPath.ShowWindow(SW_HIDE);
	m_EdtVersionReportPath.ShowWindow(SW_HIDE);
	m_StcTestMethodScriptPath.SetWindowText(_T("Script Path"));
	m_StcTestMethodScriptPath.ShowWindow(SW_HIDE);
	m_EdtTestMethodScriptPath.ShowWindow(SW_HIDE);
	m_StcTester.SetWindowText(_T("Test"));
	m_StcTester.ShowWindow(SW_HIDE);
	m_EdtTester.ShowWindow(SW_HIDE);

	m_RadSingle.ShowWindow(SW_SHOW);	
	m_RadMulti.ShowWindow(SW_SHOW);
	m_RadAll.ShowWindow(SW_SHOW);	
	m_RadSingle.EnableWindow(FALSE);
	m_RadMulti.EnableWindow(FALSE);
	m_RadAll.EnableWindow(FALSE);
	
	m_StcFrom.ShowWindow(SW_SHOW);
	m_LstFromCase.ShowWindow(SW_SHOW);
	m_StcTo.ShowWindow(SW_SHOW);
	m_LstToCase.ShowWindow(SW_SHOW);
	m_StcFor.ShowWindow(SW_SHOW);
	m_LstRepeatTime.ShowWindow(SW_SHOW);
	
	m_StcFrom.EnableWindow(FALSE);
	m_LstFromCase.EnableWindow(FALSE);
	m_StcTo.EnableWindow(FALSE);
	m_LstToCase.EnableWindow(FALSE);
	m_StcFor.EnableWindow(FALSE);
	m_LstRepeatTime.EnableWindow(FALSE);
	
	m_BtnOK.ShowWindow(SW_SHOW);
	m_BtnOK.EnableWindow(FALSE);
	m_BtnBack.ShowWindow(SW_SHOW);
	m_BtnBack.EnableWindow(FALSE);
	m_Progress.ShowWindow(SW_SHOW);	
	m_CaseProgress.ShowWindow(SW_SHOW);	
	
	UpdateData(FALSE);	
}

void CBurntool3LibTestDlg::UpdatePreTestState(void)
{
	switch (m_eTestType)
	{
	default:// all
		m_StcFrom.EnableWindow(FALSE);
		m_LstFromCase.EnableWindow(FALSE);
		m_StcTo.EnableWindow(FALSE);
		m_LstToCase.EnableWindow(FALSE);
		m_StcFor.EnableWindow(FALSE);
		m_LstRepeatTime.EnableWindow(FALSE);
		break;
	case SINGLE:
		m_StcFrom.EnableWindow(TRUE);
		m_LstFromCase.EnableWindow(TRUE);
		m_StcTo.EnableWindow(FALSE);
		m_LstToCase.EnableWindow(FALSE);
		m_StcFor.EnableWindow(TRUE);
		m_LstRepeatTime.EnableWindow(TRUE);
		break;
	case MULTI:
		m_StcFrom.EnableWindow(TRUE);
		m_LstFromCase.EnableWindow(TRUE);
		m_StcTo.EnableWindow(TRUE);
		m_LstToCase.EnableWindow(TRUE);
		m_StcFor.EnableWindow(TRUE);
		m_LstRepeatTime.EnableWindow(TRUE);
		break;
	case ALL:
		m_StcFrom.EnableWindow(FALSE);
		m_LstFromCase.EnableWindow(FALSE);
		m_StcTo.EnableWindow(FALSE);
		m_LstToCase.EnableWindow(FALSE);
		m_StcFor.EnableWindow(FALSE);
		m_LstRepeatTime.EnableWindow(FALSE);
		break;
	}

	UpdateData(FALSE);	
}

void CBurntool3LibTestDlg::UpdateSettingState(void)
{
	if (m_bScriptLoaded)
	{	
		m_BtnOK.EnableWindow(TRUE);
		m_BtnBack.EnableWindow(TRUE);
	}
	else
	{
		m_BtnOK.EnableWindow(FALSE);
		m_BtnBack.EnableWindow(TRUE);		
	}
	
	UpdateData(FALSE);	
}

void CBurntool3LibTestDlg::OnRadioSingle() 
{
	// TODO: Add your control notification handler code here
	CheckRadioButton(IDC_RADIO_SINGLE, IDC_RADIO_ALL, IDC_RADIO_SINGLE);
 	m_eTestType = SINGLE;
// 	m_tTestMsg.eMsg = TE_SINGLE;
	UpdatePreTestState();
}

void CBurntool3LibTestDlg::OnRadioMulti() 
{
	// TODO: Add your control notification handler code here
	CheckRadioButton(IDC_RADIO_SINGLE, IDC_RADIO_ALL, IDC_RADIO_MULTI);	
 	m_eTestType = MULTI;
// 	m_tTestMsg.eMsg = TE_MULTI;
	UpdatePreTestState();
}

void CBurntool3LibTestDlg::OnRadioAll() 
{
	// TODO: Add your control notification handler code here
	CheckRadioButton(IDC_RADIO_SINGLE, IDC_RADIO_ALL, IDC_RADIO_ALL);
 	m_eTestType = ALL;
// 	m_tTestMsg.eMsg = TE_AUTO;
	UpdatePreTestState();
}

void CBurntool3LibTestDlg::OnKillfocusListRepeatTime() 
{
	// TODO: Add your control notification handler code here
	CString temp;
	m_LstRepeatTime.GetWindowText(temp);
	m_tTestMsg.ulRepeatTime = _wtoi(temp);
}

void CBurntool3LibTestDlg::OnKillfocusListFromCase() 
{
	// TODO: Add your control notification handler code here
	m_tTestMsg.eStartID = m_LstFromCase.GetCurSel();
}

void CBurntool3LibTestDlg::OnKillfocusListToCase() 
{
	// TODO: Add your control notification handler code here
	m_tTestMsg.eEndID = m_LstToCase.GetCurSel();
}

BOOL CBurntool3LibTestDlg::SetLogFileNameToLua()
{
	LPSTR lpszTemp = NULL;
	// set log file name to script
	lpszTemp = (LPSTR)malloc(m_StrLogPath.GetLength() + 1);
	
	if (NULL == lpszTemp)
	{
		return FALSE; // not enough memory
	}
	else
	{
		memset(lpszTemp, 0, m_StrLogPath.GetLength() + 1);
	}
	
	WideCharToMultiByte(CP_ACP,
						NULL,
						m_StrLogPath,
						m_StrLogPath.GetLength(),
						lpszTemp,
						m_StrLogPath.GetLength(),
						NULL,
						FALSE);
	
	TE_SetLogFileName(lpszTemp);
	
	free(lpszTemp);
	lpszTemp = NULL;
	return TRUE;
}

BOOL CBurntool3LibTestDlg::SetModuleNameToLua()
{
	LPSTR lpszTemp = NULL;

	lpszTemp = (LPSTR)malloc(m_StrModuleName.GetLength() + 1);
	
	if (NULL == lpszTemp)
	{		
		return FALSE; // not enough memory
	}
	else
	{
		memset(lpszTemp, 0, m_StrModuleName.GetLength() + 1);
	}
	
	WideCharToMultiByte(CP_ACP,
						NULL,
						m_StrModuleName,
						m_StrModuleName.GetLength(),
						lpszTemp,
						m_StrModuleName.GetLength(),
						NULL,
						FALSE);
	
	TE_SetTestModuleName(lpszTemp);
	
	free(lpszTemp);
	lpszTemp = NULL;
	return TRUE;
}

BOOL CBurntool3LibTestDlg::SetScriptFileNameToLua()
{
	LPSTR lpszTemp = NULL;

	lpszTemp = (LPSTR)malloc(m_StrScriptPath.GetLength() + 1);
	
	if (NULL == lpszTemp)
	{
		return FALSE; // not enough memory
	}
	else
	{
		memset(lpszTemp, 0, m_StrScriptPath.GetLength() + 1);
	}
	
	WideCharToMultiByte(CP_ACP,
						NULL,
						m_StrScriptPath,
						m_StrScriptPath.GetLength(),
						lpszTemp,
						m_StrScriptPath.GetLength(),
						NULL,
						FALSE);
	
	TE_SetTestScriptName(lpszTemp);
	
	free(lpszTemp);
	lpszTemp = NULL;
	return TRUE;
}


BOOL CBurntool3LibTestDlg::SetReportFileName(void)
{
	LPSTR lpszTemp = NULL;
	
	lpszTemp = (LPSTR)malloc(m_StrReportPath.GetLength() + 1);
	
	if (NULL == lpszTemp)
	{
		return FALSE; // not enough memory
	}
	else
	{
		memset(lpszTemp, 0, m_StrReportPath.GetLength() + 1);
	}
	
	WideCharToMultiByte(CP_ACP,
		NULL,
		m_StrReportPath,
		m_StrReportPath.GetLength(),
		lpszTemp,
		m_StrReportPath.GetLength(),
		NULL,
		FALSE);
	
	TE_SetReportFileName(lpszTemp);
	
	free(lpszTemp);
	lpszTemp = NULL;
	return TRUE;
}

BOOL CBurntool3LibTestDlg::SetTestObjectVersion(void)
{
	LPSTR lpszTemp = NULL;
	
	lpszTemp = (LPSTR)malloc(m_StrVersion.GetLength() + 1);
	
	if (NULL == lpszTemp)
	{
		return FALSE; // not enough memory
	}
	else
	{
		memset(lpszTemp, 0, m_StrVersion.GetLength() + 1);
	}
	
	WideCharToMultiByte(CP_ACP,
		NULL,
		m_StrVersion,
		m_StrVersion.GetLength(),
		lpszTemp,
		m_StrVersion.GetLength(),
		NULL,
		FALSE);
	
	TE_SetTestObjectVersion(lpszTemp);
	
	free(lpszTemp);
	lpszTemp = NULL;
	return TRUE;
}

BOOL CBurntool3LibTestDlg::SetTestType(void)
{
	LPSTR lpszTemp = NULL;
	
	lpszTemp = (LPSTR)malloc(m_StrTestMethod.GetLength() + 1);
	
	if (NULL == lpszTemp)
	{
		return FALSE; // not enough memory
	}
	else
	{
		memset(lpszTemp, 0, m_StrTestMethod.GetLength() + 1);
	}
	
	WideCharToMultiByte(CP_ACP,
		NULL,
		m_StrTestMethod,
		m_StrTestMethod.GetLength(),
		lpszTemp,
		m_StrTestMethod.GetLength(),
		NULL,
		FALSE);
	
	TE_SetTestType(lpszTemp);
	
	free(lpszTemp);
	lpszTemp = NULL;
	return TRUE;
}

BOOL CBurntool3LibTestDlg::SetTester(void)
{
	LPSTR lpszTemp = NULL;
	
	lpszTemp = (LPSTR)malloc(m_StrTester.GetLength() + 1);
	
	if (NULL == lpszTemp)
	{
		return FALSE; // not enough memory
	}
	else
	{
		memset(lpszTemp, 0, m_StrTester.GetLength() + 1);
	}
	
	WideCharToMultiByte(CP_ACP,
		NULL,
		m_StrTester,
		m_StrTester.GetLength(),
		lpszTemp,
		m_StrTester.GetLength(),
		NULL,
		FALSE);
	
	TE_SetTester(lpszTemp);
	
	free(lpszTemp);
	lpszTemp = NULL;
	return TRUE;
}

LRESULT CBurntool3LibTestDlg::OnLaunchTestEngineResult(WPARAM wParam, LPARAM lParam)
{
	MessageBox(_T("Launch test failed!"));
	SetState(PRETEST);
	Switch2PreTestState();	
	UpdatePreTestState();
	return NULL;
}

LRESULT CBurntool3LibTestDlg::OnTestEngineCaseResult(WPARAM wParam, LPARAM lParam)
{
	T_U32 eCaseID;
	TE_GENERAL_TEST_RESULT eResult;

	eCaseID = (T_U32)wParam;
	eResult = (TE_GENERAL_TEST_RESULT)lParam;

	switch(eResult)
	{
	case TGR_PASS:
		m_ulPassCnt++;
		m_StrPassCnt.Format(_T("Pass:%d"), m_ulPassCnt);
		m_StcPassCnt.SetWindowText(m_StrPassCnt);
		break;
	case TGR_FAIL:
		m_ulFailCnt++;
		m_StrFailCnt.Format(_T("Fail:%d"), m_ulFailCnt);
		m_StcFailCnt.SetWindowText(m_StrFailCnt);
		break;
	case TGR_NA:
	default:
		m_ulNACnt++;
		m_StrNACnt.Format(_T("N/A:%d"), m_ulNACnt);
		m_StcNACnt.SetWindowText(m_StrNACnt);
		break;
	}

//	m_Progress.StepIt();

	UpdateData(FALSE);
	return 1;
}

LRESULT CBurntool3LibTestDlg::OnTestEngineCaseID(WPARAM wParam, LPARAM lParam)
{
	T_U32 eCaseID;
	T_U32 ulStep;
	LPTSTR lpwsTemp = NULL;

	eCaseID = (T_U32)wParam;
	ulStep = (T_U32)lParam;

	lpwsTemp = (LPTSTR)malloc(strlen(g_ptTestCaseList[eCaseID].pszID) * 2 + 2);
	
	if (NULL == lpwsTemp)
	{
		return 0; // not enough memory
	}
	else
	{
		memset(lpwsTemp, 0, strlen(g_ptTestCaseList[eCaseID].pszID) * 2 + 2);
	}
	
	MultiByteToWideChar(CP_ACP,
						NULL,
						g_ptTestCaseList[eCaseID].pszID,
						strlen(g_ptTestCaseList[eCaseID].pszID) + 1,
						lpwsTemp,
						strlen(g_ptTestCaseList[eCaseID].pszID) * 2 + 2);
	
	m_StrCurCaseID.Format(_T("Current Case ID: %s		"), lpwsTemp);
	m_ulTotalCaseStep = ulStep;
	m_StrCurCaseStep.Format(_T("Current Step: 0/%d"), m_ulTotalCaseStep);
	m_StcCurCaseID.SetWindowText(m_StrCurCaseID + m_StrCurCaseStep);

	m_CaseProgress.SetRange(0, m_ulTotalCaseStep);
	m_CaseProgress.SetStep(1);
	m_CaseProgress.SetPos(0);
	
	free(lpwsTemp);
	lpwsTemp = NULL;

	return 1;
}

LRESULT CBurntool3LibTestDlg::OnTestEngineCaseStepData(WPARAM wParam, LPARAM lParam)
{
	T_U32 ulStep;

	ulStep = (T_U32)wParam;
	m_StrCurCaseStep.Format(_T("Current Step: %d/%d"), ulStep, m_ulTotalCaseStep);
	m_StcCurCaseID.SetWindowText(m_StrCurCaseID + m_StrCurCaseStep);

	m_CaseProgress.StepIt();
	m_Progress.StepIt();

	return 1;
}

LRESULT CBurntool3LibTestDlg::OnTestEngineCaseStepResult(WPARAM wParam, LPARAM lParam)
{
	TE_GENERAL_TEST_RESULT eResult;
	
	eResult = (TE_GENERAL_TEST_RESULT)wParam;

	return 1;
}

LRESULT CBurntool3LibTestDlg::OnTestEngineFinished(WPARAM wParam, LPARAM lParam)
{
	MessageBox(_T("All test cases finished"));
	SetState(PRETEST);
	Switch2PreTestState();	
	UpdatePreTestState();
	return 1;
}

LRESULT CBurntool3LibTestDlg::OnLoadScriptResult(WPARAM wParam, LPARAM lParam)
{
	if (wParam)
	{
		MessageBox(_T("Load script OK!"));
		m_bScriptLoaded = TRUE;
		UpdateSettingState();
	}
	else
	{
		MessageBox(_T("Load script failed!"));
		m_bScriptLoaded = FALSE;
	}

	return 1;
}


void CBurntool3LibTestDlg::OnTimer(UINT nIDEvent) 
{
	// TODO: Add your message handler code here and/or call default
	CString StrDate;
	CString StrTime;
	SYSTEMTIME stSysTime;

	if (nIDEvent == 10)
	{		
		GetSystemTime(&stSysTime);	
		// Time zone GMT+08:00
		if (stSysTime.wHour + 8 >= 24)
		{
			stSysTime.wHour = stSysTime.wHour + 8 - 24;
		}
		else
		{
			stSysTime.wHour = stSysTime.wHour + 8;
		}

		StrDate.Format(_T("Data: %d-%d-%d"), 
						stSysTime.wYear,
						stSysTime.wMonth,
						stSysTime.wDay);
		StrTime.Format(_T("Time: %d-%d-%d"),
						stSysTime.wHour,
						stSysTime.wMinute,
						stSysTime.wSecond);

	}

	m_StcDate.SetWindowText(StrDate);
	m_StcTime.SetWindowText(StrTime);
	UpdateData(FALSE);

	CDialog::OnTimer(nIDEvent);
}

T_BOOL UpdateCaseID(T_U32 eCaseID, 
					T_U32 ulStep)
{
	PostMessage(g_DlghWnd, WM_TE_RUN_CASE_ID, (WPARAM)eCaseID, (LPARAM)ulStep);
	return AK_TRUE;
}

T_BOOL UpdateCaseResult(T_U32 eCaseID, 
						TE_GENERAL_TEST_RESULT eResult)
{
	PostMessage(g_DlghWnd, WM_TE_RUN_CASE_RESULT, (WPARAM)eCaseID, (LPARAM)eResult);
	return AK_TRUE;
}

T_BOOL UpdateTestStepData(T_U32 ulTestStep)
{
	PostMessage(g_DlghWnd, WM_TE_RUN_CASE_STEP_DATA, (WPARAM)ulTestStep, NULL);
	return AK_TRUE;
}

T_BOOL UpdateTestStepResult(TE_GENERAL_TEST_RESULT eResult)
{
	PostMessage(g_DlghWnd, WM_TE_RUN_CASE_STEP_RESULT, (WPARAM)eResult, NULL);
	return AK_TRUE;
}

void TestMain(LPVOID param)
{

	BOOL bExit = FALSE;
	CBurntool3LibTestDlg *pBurntool3LibTestDlg = (CBurntool3LibTestDlg *)param;

	g_DlghWnd = pBurntool3LibTestDlg->GetSafeHwnd();

	TE_ResetSemEvt();

	if (TE_Launch(pBurntool3LibTestDlg->m_tTestMsg) != TM_SUCCESS)
	{
		PostMessage(pBurntool3LibTestDlg->GetSafeHwnd(), WM_TE_RUN_LAUNCH_RESULT, FALSE, NULL);		
		//WaitForSingleObject(pBurntool3LibTestDlg->m_LaunchTestEvent, INFINITE);
	}
	else
	{
		//PostMessage(pBurntool3LibTestDlg->GetSafeHwnd(), WM_TE_RUN_LAUNCH_RESULT, TRUE, NULL);				
		PostMessage(pBurntool3LibTestDlg->GetSafeHwnd(), WM_TE_RUN_FINISHED, NULL, NULL);
	}
			
	_endthreadex(1);
}

void CBurntool3LibTestDlg::OnDestroy() 
{
	CDialog::OnDestroy();
	
	// TODO: Add your message handler code here
	// Write Log On Info to ini file
	TCHAR appPath[MAX_PATH] = {0};
	TCHAR tcTemp[MAX_INFO_LEN] = {0};
	CString  FilePath;
	CString	strSection					= "LogOnInfo";
	const CString	strModuleNameSectionKey		= "ModuleName";
	const CString	strVersionSectionKey		= "Version";
	const CString	strTestMethodSectionKey		= "TestMethod";
	const CString	strTesterSectionKey			= "Tester";
	const CString	strLogPathSectionKey		= "strLogPath";
	const CString	strReportPathSectionKey		= "ReportPath";
	const CString	strScriptPathSectionKey		= "ScriptPath";
	
	GetCurrentDirectory(MAX_PATH, appPath);// Get current working directory.
	FilePath = appPath;
	FilePath += "\\Settings.ini";
	
	memcpy(tcTemp, m_StrModuleName.GetBuffer(MAX_INFO_LEN), sizeof(TCHAR) * MAX_INFO_LEN);
	
	WritePrivateProfileString(strSection, 
								strModuleNameSectionKey, 
								tcTemp, 
								FilePath);
	
	memset(tcTemp, 0, sizeof(TCHAR) * MAX_INFO_LEN);
	
	memcpy(tcTemp, m_StrVersion.GetBuffer(MAX_INFO_LEN), sizeof(TCHAR) * MAX_INFO_LEN);
	
	WritePrivateProfileString(strSection, 
								strVersionSectionKey, 
								tcTemp, 
								FilePath);
	
	memset(tcTemp, 0, sizeof(TCHAR) * MAX_INFO_LEN);
	
	memcpy(tcTemp, m_StrTestMethod.GetBuffer(MAX_INFO_LEN), sizeof(TCHAR) * MAX_INFO_LEN);
	
	WritePrivateProfileString(strSection, 
								strTestMethodSectionKey, 
								tcTemp, 
								FilePath);
	
	memset(tcTemp, 0, sizeof(TCHAR) * MAX_INFO_LEN);
	
	memcpy(tcTemp, m_StrTester.GetBuffer(MAX_INFO_LEN), sizeof(TCHAR) * MAX_INFO_LEN);
	
	WritePrivateProfileString(strSection, 
								strTesterSectionKey, 
								tcTemp, 
								FilePath);
	
	memset(tcTemp, 0, sizeof(TCHAR) * MAX_INFO_LEN);
	
	
	strSection					= "Settings";
	
	memcpy(tcTemp, m_StrLogPath.GetBuffer(MAX_INFO_LEN), sizeof(TCHAR) * MAX_INFO_LEN);
	
	WritePrivateProfileString(strSection, 
								strLogPathSectionKey, 
								tcTemp, 
								FilePath);
	
	memset(tcTemp, 0, sizeof(TCHAR) * MAX_INFO_LEN);
	
	memcpy(tcTemp, m_StrReportPath.GetBuffer(MAX_INFO_LEN), sizeof(TCHAR) * MAX_INFO_LEN);
	
	WritePrivateProfileString(strSection, 
								strReportPathSectionKey, 
								tcTemp, 
								FilePath);
	
	memset(tcTemp, 0, sizeof(TCHAR) * MAX_INFO_LEN);
	
	memcpy(tcTemp, m_StrScriptPath.GetBuffer(MAX_INFO_LEN), sizeof(TCHAR) * MAX_INFO_LEN);
	
	WritePrivateProfileString(strSection, 
								strScriptPathSectionKey, 
								tcTemp, 
								FilePath);
	
	memset(tcTemp, 0, sizeof(TCHAR) * MAX_INFO_LEN);	
}
