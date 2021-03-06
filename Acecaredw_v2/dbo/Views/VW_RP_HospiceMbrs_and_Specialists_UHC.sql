﻿
CREATE VIEW [dbo].[VW_RP_HospiceMbrs_and_Specialists_UHC]
AS 
SELECT distinct b.SUBSCRIBER_ID
    ,CONVERT(DATE, GETDATE(), 101) AS RUN_DATE
	,MCO = 'UHG'
	,CONCAT(a.MEMBER_LAST_NAME, ', ',a.MEMBER_FIRST_NAME) as SUBSCRIBER_NAME
	,CONCAT(a.PCP_LAST_NAME, ', ',a.PCP_FIRST_NAME) as PCP_NAME
	,a.PCP_PRACTICE_NAME as PCP_GROUP_NAME
	,b.SVC_PROV_NPI
	,b.SVC_PROV_FULL_NAME
	,UPPER(b.PROV_SPEC) as PROV_SPECIALITY
	,SUM (case when b.PRIMARY_SVC_DATE > DATEADD(M, -12, GetDate()) then 1 else 0 end) as VISIT_COUNT_LAST_12_Months
	,SUM(case when b.PRIMARY_SVC_DATE < getdate() then 1 else 0 end) as VISIT_COUNT_LAST_24_Months
	,MAX(b.PRIMARY_SVC_DATE)  as LAST_SPECIALIST_VISIT
FROM (
	SELECT DISTINCT SUBSCRIBER_ID
		,SVC_PROV_NPI
		,SVC_PROV_FULL_NAME
		,PROV_SPEC
		,PRIMARY_SVC_DATE			
	FROM ACECAREDW_TEST.dbo.Claims_Headers
	WHERE SUBSCRIBER_ID IN (
			SELECT MEMBER_ID
			FROM ACECAREDW.dbo.[VW_RP_HospiceMbrs_UHC]
			)
		AND PRIMARY_SVC_DATE > DATEADD(M, -24, GetDate()) /* last 24 months rolling*/
		AND PROV_TYPE = 'Med Profession'
	) AS b
INNER JOIN ACECAREDW.dbo.vw_UHC_ActiveMembers a on b.SUBSCRIBER_ID = a.UHC_SUBSCRIBER_ID
	group by b.SUBSCRIBER_ID
	,b.SVC_PROV_NPI
	,b.SVC_PROV_FULL_NAME
	,b.PROV_SPEC
	,a.MEMBER_LAST_NAME
	,a.MEMBER_FIRST_NAME
	,a.PCP_LAST_NAME
	,a.PCP_FIRST_NAME
	,a.PCP_PRACTICE_NAME
	;
