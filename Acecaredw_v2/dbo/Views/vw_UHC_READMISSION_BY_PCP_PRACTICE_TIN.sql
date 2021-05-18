﻿CREATE VIEW dbo.vw_UHC_READMISSION_BY_PCP_PRACTICE_TIN
AS 
	WITH CTE 
	AS
	(SELECT 
			MEMBER_ID
			,PCP_PRACTICE_TIN
			--,EFF_ADMIT_DATE AS READMIT_DT
			,LAG([CONFIRMED_DISCHARGED_DATE],1) OVER (ORDER BY MEMBER_ID,[CONFIRMED_DISCHARGED_DATE]) AS ADMIT_DISCHARGED_DT
			,EFF_ADMIT_DATE AS READMIT_DT
	FROM (SELECT
		--P.[External_Event_ID]
		P.[MEMBER_ID]
		,P.[EFF_ADMIT_DATE]
		,P.[CONFIRMED_DISCHARGED_DATE]
		--,P.[ADMIT_HOSPITAL]
		--,P.[DIAGNOSIS_DESC]
		--,P.[ASSIGNED_PCP_NAME]
		--,P.[DiscDisp]
		,MP.PCP_PRACTICE_NAME
		,MP.PCP_PRACTICE_TIN
		--,MP.A_LAST_UPDATE_DATE
	FROM (
			SELECT 
				  [External_Event_ID]
				  ,[MEMBER_ID]
				  ,[EFF_ADMIT_DATE]
				  ,[CONFIRMED_DISCHARGED_DATE]
				  ,[ADMIT_HOSPITAL]
				  ,[DIAGNOSIS_DESC]
				  ,[ASSIGNED_PCP_NAME]
				  ,[DiscDisp]
				  ,LST_UPDATE_DATE
			FROM [CC].[dbo].[p12] WITH (NOLOCK)
			WHERE DATEDIFF(YEAR,EFF_ADMIT_DATE,GETDATE())=1 AND [CONFIRMED_DISCHARGED_DATE] IS NOT NULL
		) P
  
 RIGHT JOIN (
			SELECT 
					PCP_PRACTICE_NAME,
					PCP_PRACTICE_TIN,
					UHC_SUBSCRIBER_ID,
					[A_LAST_UPDATE_DATE]
			FROM [ACECAREDW].[dbo].[UHC_MembersByPCP] WITH (NOLOCK)
			WHERE DATEDIFF(YEAR,[A_LAST_UPDATE_DATE],GETDATE())=1 AND LoadType = 'P'
		) MP ON P.MEMBER_ID = MP.UHC_SUBSCRIBER_ID AND MONTH(P.LST_UPDATE_DATE) = MONTH(MP.A_LAST_UPDATE_DATE) AND YEAR(P.LST_UPDATE_DATE) = YEAR(MP.A_LAST_UPDATE_DATE)
 --WHERE P.[MEMBER_ID]= '100417732'
 GROUP BY PCP_PRACTICE_TIN,MEMBER_ID,EFF_ADMIT_DATE,CONFIRMED_DISCHARGED_DATE,PCP_PRACTICE_NAME
 --ORDER BY EFF_ADMIT_DATE
 ) A)

 --,CTE1
 --AS 

	SELECT 
		PCP_PRACTICE_TIN
		,MEMBER_ID
		,ADMIT_DISCHARGED_DT
		,READMIT_DT
		,CASE WHEN DATEDIFF(D,ADMIT_DISCHARGED_DT,READMIT_DT) <= 0 THEN 0
			  WHEN DATEDIFF(D,DATEADD(DD,1,ADMIT_DISCHARGED_DT),READMIT_DT) <30 THEN 1
			  ELSE 0 END AS READMIT_FLAG
		FROM CTE
		

		--SELECT 
		--	  PCP_PRACTICE_TIN
		--	  ,SUM(READMIT_FLAG) AS READMIT
		--FROM CTE1
		--GROUP BY PCP_PRACTICE_TIN
