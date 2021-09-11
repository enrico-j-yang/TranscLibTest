// Burntool3LibTestDlg.h : header file
//

#if !defined(AFX_REQ_BURNTOOL3LIBTEST_090827DLG_H__1F70C022_0E3F_4C9C_A769_939F850D29A6__INCLUDED_)
#define AFX_REQ_BURNTOOL3LIBTEST_090827DLG_H__1F70C022_0E3F_4C9C_A769_939F850D29A6__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include "TestEngine.h"
#include <afxmt.h>

/////////////////////////////////////////////////////////////////////////////
// CBurntool3LibTestDlg dialog

#define WM_TE_RUN_LAUNCH_RESULT		(WM_USER + 100)
#define WM_TE_RUN_CASE_RESULT		(WM_USER + 101)
#define WM_TE_RUN_CASE_ID			(WM_USER + 102)
#define WM_TE_RUN_CASE_STEP_DATA	(WM_USER + 103)
#define WM_TE_RUN_CASE_STEP_RESULT	(WM_USER + 104)
#define WM_TE_RUN_FINISHED			(WM_USER + 105)
#define WM_UPDATE_SETTING_STATE		(WM_USER + 106)
#define WM_TE_LOAD_SCRIPT_RESULT	(WM_USER + 107)

#define MAX_INFO_LEN					200

class CBurntool3LibTestDlg : public CDialog
{
// Construction
public:
	CBurntool3LibTestDlg(CWnd* pParent = NULL);	// standard constructor

	friend void TestMain(LPVOID param);

	friend T_BOOL UpdateCaseID(T_U32 eCaseID, T_U32 ulStep);
	friend T_BOOL UpdateCaseResult(T_U32 eCaseID, TE_GENERAL_TEST_RESULT eResult);	
	friend T_BOOL UpdateTestStepData(T_U32 ulTestStep);
	friend T_BOOL UpdateTestStepResult(TE_GENERAL_TEST_RESULT eResult);

	
	CEvent		m_ScriptInitializedEvent;
	CEvent		m_LaunchTestEvent;
	CEvent		m_ExitTestEvent;

// Dialog Data
	//{{AFX_DATA(CBurntool3LibTestDlg)
	enum { IDD = IDD_REQ_BURNTOOL3LIBTEST_090827_DIALOG };
	CProgressCtrl	m_CaseProgress;
	CButton	m_RadSingle;
	CButton	m_RadMulti;
	CButton	m_RadAll;
	CStatic	m_StcTo;
	CStatic	m_StcFrom;
	CStatic	m_StcFor;
	CComboBox	m_LstToCase;
	CComboBox	m_LstRepeatTime;
	CComboBox	m_LstFromCase;
	CStatic	m_StcVersionReportPath;
	CStatic	m_StcTester;
	CStatic	m_StcTestMethodScriptPath;
	CStatic	m_StcModuleNameLogPath;
	CStatic	m_StcTitle;
	CStatic	m_StcPassCnt;
	CStatic	m_StcNACnt;
	CStatic	m_StcFailCnt;
	CStatic	m_StcCurCaseID;
	CProgressCtrl	m_Progress;
	CButton	m_BtnBack;
	CButton	m_BtnExit;
	CButton	m_BtnOK;
	CButton	m_BtnOpenReport;
	CButton	m_BtnOpenLog;
	CButton	m_BtnLoadScript;
	CButton	m_BtnSettings;
	CEdit	m_EdtVersionReportPath;
	CEdit	m_EdtTester;
	CEdit	m_EdtTestMethodScriptPath;
	CEdit	m_EdtModuleNameLogPath;
	CStatic	m_StcDate;
	CStatic	m_StcTime;
	CString	m_StrTitle;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CBurntool3LibTestDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	virtual LRESULT WindowProc(UINT message, WPARAM wParam, LPARAM lParam);
	//}}AFX_VIRTUAL

public:
		
	BOOL		m_bScriptLoaded;
	T_TEST_MSG	m_tTestMsg;

// Implementation
protected:
	
	enum T_STATE
	{
		LOGON,
		SETTING,
		PRETEST,
		TESTING,
	};
	
	enum T_TEST_TYPE
	{
		SINGLE,
		MULTI,
		ALL,
	};

	HICON		m_hIcon;

	HANDLE		m_hTestEngineThread;

	T_STATE		m_eCurState;
	T_STATE		m_ePreState;

	T_TEST_TYPE	m_eTestType;
	CString		m_StrVersion;
	CString		m_StrReportPath;
	CString		m_StrTester;
	CString		m_StrTestMethod;
	CString		m_StrScriptPath;
	CString		m_StrModuleName;
	CString		m_StrLogPath;
	DWORD		m_ulPassCnt;
	DWORD		m_ulFailCnt;
	DWORD		m_ulNACnt;
	CString		m_StrPassCnt;
	CString		m_StrFailCnt;
	CString		m_StrNACnt;
	CString		m_StrCurCaseID;
	DWORD		m_ulTotalCaseStep;
	CString		m_StrCurCaseStep;

	void SetState(T_STATE eState);
	void HandleState(void);
	void Switch2LogonState(void);
	void Switch2SettingState(void);
	void Switch2PreTestState(void);
	void Switch2TestingState(void);
	void UpdatePreTestState(void);
	void UpdateSettingState(void);

	BOOL SetLogFileNameToLua(void);			
	BOOL SetModuleNameToLua(void);	
	BOOL SetScriptFileNameToLua(void);
	BOOL SetReportFileName(void);
	BOOL SetTestObjectVersion(void);
	BOOL SetTestType(void);
	BOOL SetTester(void);

	// Generated message map functions
	//{{AFX_MSG(CBurntool3LibTestDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnButtonOk();
	afx_msg void OnButtomBack();
	afx_msg void OnButtonExit();
	afx_msg void OnButtonSettings();
	afx_msg void OnButtonOpenReport();
	afx_msg void OnKillfocusEditModuleName();
	afx_msg void OnKillfocusEditTestMothed();
	afx_msg void OnKillfocusEditVersion();
	afx_msg void OnKillfocusEditTester();
	afx_msg void OnRadioSingle();
	afx_msg void OnRadioMulti();
	afx_msg void OnRadioAll();
	afx_msg void OnKillfocusListRepeatTime();
	afx_msg void OnButtonOpenLog();
	afx_msg void OnButtonLoadScript();
	afx_msg LRESULT OnLaunchTestEngineResult(WPARAM wParam, LPARAM lParam);
	afx_msg LRESULT OnTestEngineCaseResult(WPARAM wParam, LPARAM lParam);
	afx_msg LRESULT OnTestEngineCaseID(WPARAM wParam, LPARAM lParam);
	afx_msg LRESULT OnTestEngineCaseStepData(WPARAM wParam, LPARAM lParam);
	afx_msg LRESULT OnTestEngineCaseStepResult(WPARAM wParam, LPARAM lParam);
	afx_msg LRESULT OnTestEngineFinished(WPARAM wParam, LPARAM lParam);	
	afx_msg LRESULT OnLoadScriptResult(WPARAM wParam, LPARAM lParam);
	afx_msg void OnKillfocusListFromCase();
	afx_msg void OnKillfocusListToCase();
	afx_msg void OnTimer(UINT nIDEvent);
	afx_msg void OnDestroy();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()


};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_REQ_BURNTOOL3LIBTEST_090827DLG_H__1F70C022_0E3F_4C9C_A769_939F850D29A6__INCLUDED_)
