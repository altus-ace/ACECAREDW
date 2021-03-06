﻿
create view dbo.vw_UHC_LOB_PRACTICE_SUM
AS
SELECT 
M.LINE_OF_BUSINESS AS LOB,
--[PCP_NPI] AS NPI,
M.[PCP_PRACTICE_NAME] AS 'Practice Name',
M.[PCP_PRACTICE_TIN] AS TIN,
SUM(CONVERT(INT,M.[MEMBER_MONTH_COUNT])) AS 'Total MM',
SUM(TRY_CONVERT(MONEY,M.TOTAL_COSTS_LAST_12_MOS)) AS 'Total Costs PMPM',
SUM(TRY_CONVERT(MONEY,M.[INP_COSTS_LAST_12_MOS])) AS 'Inpt PMPM',
SUM(TRY_CONVERT(MONEY,M.[ER_COSTS_LAST_12_MOS])) AS 'ER PMPM',
SUM(TRY_CONVERT(MONEY,M.[OUTP_COSTS_LAST_12_MOS])) AS 'Outpt PMPM',
SUM(TRY_CONVERT(MONEY,M.[PHARMACY_COSTS_LAST_12_MOS])) AS 'Pharm PMPM',
SUM(TRY_CONVERT(MONEY,M.[PRIMARY_CARE_COSTS_LAST_12_MOS])) AS 'PCP PMPM',
SUM(TRY_CONVERT(MONEY,M.[BEHAVIORAL_COSTS_LAST_12_MOS])) AS 'Behav Costs PMPM',
SUM(TRY_CONVERT(MONEY,M.[OTHER_OFFICE_COSTS_LAST_12_MOS])) AS 'Other Costs PMPM',
SUM(CONVERT(INT,M.[INP_ADMITS_LAST_12_MOS]))/NULLIF(SUM(CONVERT(INT,M.[MEMBER_MONTH_COUNT])),0)*1000 AS ADK,
SUM(CONVERT(INT,M.[ER_VISITS_LAST_12_MOS]))/NULLIF(SUM(CONVERT(INT,M.[MEMBER_MONTH_COUNT])),0)*1000 AS ERK,
V.TOTAL_MEMBERS,
V.PHYICIAN_VISITS,
V.WELLNESS_VISITS,
--FORMAT(CONVERT(NUMERIC, V.PHYICIAN_VISITS)/NULLIF(CONVERT(NUMERIC,V.TOTAL_MEMBERS),0),'P2') AS '%'
FORMAT((CONVERT(NUMERIC,V.PHYICIAN_VISITS) + CONVERT(NUMERIC,V.WELLNESS_VISITS))/NULLIF(CONVERT(NUMERIC,V.TOTAL_MEMBERS),0),'P2') AS '% Members seen'
FROM [ACECAREDW].[dbo].[UHC_Membership] M WITH (NOLOCK)
left join [ACECAREDW_TEST].[dbo].[VW_RP_MemberVisistByTin] V WITH (NOLOCK) ON M.PCP_PRACTICE_TIN = V.PCP_PRACTICE_TIN
--WHERE LINE_OF_BUSINESS IS NOT NULL
GROUP BY M.[PCP_PRACTICE_NAME],M.[PCP_PRACTICE_TIN],M.LINE_OF_BUSINESS,V.TOTAL_MEMBERS,V.PHYICIAN_VISITS,V.WELLNESS_VISITS
--ORDER BY [PCP_NPI],[PCP_PRACTICE_NAME]
HAVING SUM(TRY_CONVERT(MONEY,M.TOTAL_COSTS_LAST_12_MOS)) IS NOT NULL
--ORDER BY M.[PCP_PRACTICE_NAME],M.[PCP_PRACTICE_TIN],V.TOTAL_MEMBERS

