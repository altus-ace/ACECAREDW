CREATE VIEW adi.vw_PstSrc_CopWlcTxM
AS 
    SELECT 
	   SUBSTRING(adiData.Subscriber, 0, CHARINDEX('-', adiData.Subscriber) ) As MemberID
	   , adiData.LastKnownServiceDate AS DateOfLastService
	   , 'IncentiveProgram' AS IncentiveProgram
	   , 'HealtPlanName' AS HealthPlanName
	   , 'LOB' as Product
	   , adiData.URN AS AdiKey
	   , 'CopWlcTxM' AS AdiTableName
	   , adiData.DataDate  AS LoadDate
	   , adidata.OriginalFileName AS SrcFileName
	   , CASE WHEN (adiData.ComplianceStatus = 'Compliant') THEN 'NUM'
		  WHEN (adiData.ComplianceStatus = 'Non-Compliant') OR(adiData.ComplianceStatus = 'In-Play') OR (adiData.ComplianceStatus = 'Unattainable')  THEN 'COP'     
		  ELSE 'Unk' END AS CopMsrStatus
	   , adiData.Measure AS CopMsrName	   
	   , adiData.DataDate AS QM_Date
	   , adiData.Measure AS Destination /* Destination to map to QM Measure table */
	   , Client.ClientKey , adiData.Subscriber, adiData.ComplianceStatus
	   , adiData.ServiceStartDate, adiData.ServiceEndDate
	   , adiData.Measure	  , qmMeasure.QM AS QM_ID, qmMeasure.QmKey, adiData.DataDate
    FROM adi.CopWlcTxM adiData 
	   JOIN lst.List_Client Client ON 2 = client.ClientKey 
	   LEFT JOIN lst.LIST_QM_Mapping qmMeasure  ON adiData.Measure = qmMeasure.QM_DESC
		  and qmMeasure.QM like 'WCTX%'
    WHERE adiData.Status = 0
	   and adiData.Subscriber <> ''
	   
