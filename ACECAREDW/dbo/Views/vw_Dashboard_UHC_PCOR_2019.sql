﻿
Create VIEW [dbo].[vw_Dashboard_UHC_PCOR_2019] AS
SELECT 
	[ClientMemberKey],
	[QmMsrId],
	[QMDate],
	LOB,
	QM_DESC AS MeasureDesc,
	CASE WHEN [QmCntCat] = 'DEN' THEN 1 ELSE 0 END AS MbrDEN,
	CASE WHEN [QmCntCat] = 'NUM' THEN 1 ELSE 0 END AS MbrNUM,
	[AGE],
	[PCP_PRACTICE_TIN],
	[PCP_PRACTICE_NAME],
	[PCP_NPI],
	[PCP_PHONE],
	CASE WHEN MeasureID is null then 'Not Contracted' else 'Contracted' end as 'Contract?',
	case when UHC_SUBSCRIBER_ID is null then 'NOT ACE_MBR' else 'ACE MBR' end AS 'ACE MBR?'
FROM (
SELECT 
distinct 
	QM.[ClientMemberKey],
	QM.[QmMsrId],
	QM.[QmCntCat],
	QM.[QMDate],
	CASE WHEN AMT.DESTINATION_VALUE IN ('MMP','MMP NF','MMP  NF','MMP Waiver') THEN 'MMP'
		 WHEN AMT.DESTINATION_VALUE IN ('STARKIDS','STARKIDS IDD') THEN 'STARKIDS'
		 WHEN AMT.DESTINATION_VALUE IN ('STARPLUS IDD','STARPLUS NHC','STARPLUS NHR','TX-STAR+PLUS','TX STAR+PLUS 111','TX STAR+PLUS 120','TX STAR+PLUS 123','TX STAR+PLUS 901') THEN 'STARPLUS'
		 WHEN AMT.DESTINATION_VALUE IN ('TX-CHIP','TX-CHIP Pregnant Women') THEN 'TX-CHIP'
		 WHEN AMT.DESTINATION_VALUE IN ('TX-STAR','TX-STAR Pregnant Women') THEN 'TX-STAR'
		 END AS LOB,
	LQM.QM,
	LQM.QM_DESC,
	MP.[AGE],
	MP.[PCP_PRACTICE_TIN],
	MP.[PCP_PRACTICE_NAME],
	MP.[PCP_NPI],
	MP.[PCP_PHONE],
	MP.UHC_SUBSCRIBER_ID,
	CP.MeasureID,
	MP.LoadType
FROM [ACECAREDW].[adw].[QM_ResultByMember_History] QM
LEFT JOIN [ACECAREDW].[lst].[lstCareOpToPlan] CP
ON QM.[QmMsrId] = CP.[MeasureID]
JOIN ACECAREDW.lst.LIST_QM_Mapping LQM on LQM.QM = QM.[QmMsrId]
LEFT JOIN [ACECAREDW].[dbo].[UHC_MembersByPCP] MP
ON QM.ClientMemberKey = MP.UHC_SUBSCRIBER_ID AND YEAR(QM.[QMDate]) = YEAR (MP.[A_LAST_UPDATE_DATE])
	 AND MONTH(QM.[QMDate]) = MONTH (MP.[A_LAST_UPDATE_DATE]) AND LoadType <> 'S'
LEFT join ACECAREDW.dbo.ALT_MAPPING_TABLES AMT on amt.SOURCE_VALUE = mp.subgrp_id
WHERE YEAR(QM.[QMDate]) = 2019  
) A