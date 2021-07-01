



CREATE VIEW [dbo].[vw_Dashboard_All_Client_QMs]
AS
-- ALL Clients QMs view JK created for AG
--06/29 JK : AG added filter on srcfilename

SELECT Distinct
         QM.clientKey
       , QM.ClientMemberkey
       , QM.QmMsrId
       , QM.QmCntCat
       , QM.QMdate
       , tmp.MemberMonth
       , tmp.lob
       , tmp.PCP_NPI
       , tmp.PCP_PRACTICE_TIN
       , tmp.PCP_PRACTICE_NAME
       , tmp.MEMBER_FIRST_NAME
       , tmp.MEMBER_LAST_NAME
       , tmp.GENDER
       , tmp.AGE
       , tmp.DATE_OF_BIRTH
       , tmp.MEMBER_HOME_ADDRESS
       , tmp.MEMBER_HOME_ADDRESS2
       , tmp.MEMBER_HOME_CITY
       , tmp.MEMBER_HOME_STATE
       , tmp.MEMBER_HOME_ZIP
       , pr.FirstName
       , pr.LastName
       , pr.AccountType
       , pr.Chapter
       , pr.IsActive
      -- , LQM.QM_DESC 
 FROM ACECAREDW.adw.QM_ResultByMember_History QM
	 Join   [ACECAREDW].[dbo].[TmpAllMemberMonths] tmp
			ON  qm.clientKey = tmp.clientkey
				AND QM.clientmemberkey = tmp.clientmemberkey
				AND Year(QM.QMDate) =  YEar (tmp.membermonth)
				AND Month(qm.qmdate) = Month(tmp.membermonth)
	 LEFT JOIN  ACECAREDW.adw.tvf_AllClient_ProviderRoster(0, getdate(), 1) pr
             ON  pr.ClientKey = qm.ClientKey
			    AND pr.NPI = tmp.PCP_NPI
--JOIN   ( SELECT * FROM LST.LIST_QM_MAPPING LQM where srcfilename <> 'ATHENAEMRmeasurenamemappingtoACEmeasures_V1.csv' AND ClientKey is not null AND
 --ACTIVE = 'Y' ) LQM

 --ON LQM.QM = QM.[QMMSRID]


