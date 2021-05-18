
CREATE VIEW [dbo].[vw_Exp_AH_Eligibility_dev]
AS 
    SELECT -- UHC Members
       expELig.expMember_ID AS [MEMBER_ID],        
	  expELig.expLOB AS LOB, 
       expELig.expBENEFIT_PLAN AS [BENEFIT PLAN], 
       expELig.expInt_Ext_Indicator AS [INTERNAL/EXTERNAL INDICATOR], 
       expELig.expStartDate AS START_DATE, 
       expELig.expStopDate AS END_DATE
	  , expELig.ClientKey
    FROM adw.ExportAhsEligiblity expELig	   
    WHERE expELig.ExportStatus = 0
    UNION -- AceCare Dw Member Model Not UHC
    SELECT DISTINCT
            mbr.ClientMemberKey AS [MEMBER_ID],            
		  lc.CS_Export_LobName AS [LOB],
            mpl.MbrCsSubPlanName AS [BENEFIT PLAN],
            'E' AS [INTERNAL/EXTERNAL INDICATOR],
            mpl.effectiveDate AS [START_DATE],
            mpl.ExpirationDate AS [END_DATE]
		  , lc.ClientKey 
     FROM [adw].mbrMember mbr	   
          INNER JOIN lst.[List_Client] lc ON lc.ClientKey = mbr.ClientKey                             
          INNER JOIN (SELECT CS.MbrMemberKey, cs.MbrCsSubPlanName, cs.EffectiveDate, cs.ExpirationDate		
				    FROM [adw].mbrCsPlanHistory CS
				    WHERE cs.EffectiveDate < cs.ExpirationDate	   ) mpl 
		  ON mpl.mbrMemberKey = mbr.mbrMemberKey
	   WHERE NOT mbr.ClientKey in (1, 11) 
    UNION	   
	   SELECT DISTINCT
            e.Exp_MEMBER_ID AS [MEMBER_ID],            
		  e.Exp_LOB  AS [LOB],
            e.[Exp_BENEFIT PLAN] AS [BENEFIT PLAN],
            e.[Exp_INTERNAL/EXTERNAL INDICATOR] AS [INTERNAL/EXTERNAL INDICATOR],
            e.Exp_START_DATE AS [START_DATE],
            e.Exp_END_DATE AS [END_DATE],
		  e.ClientKey 	   AS CLIENTKEY
	   FROM [adw].AhsExpEligiblity e 
	   WHERE (e.ClientKey = 11)
    UNION 
    SELECT   -- mssp
	   e.[MEMBER_ID],
	   e. [LOB],
	   e.[BENEFIT PLAN],
	   e.[INTERNAL/EXTERNAL INDICATOR],
	   e.[START_DATE],
	   e.[END_DATE],
	   16 AS ClientKey
    FROM [ACDW_CLMS_SHCN_MSSP].[dbo].[vw_Exp_AH_Eligibility] e
    UNION 
    SELECT   -- bcbs
	   e.[MEMBER_ID],
	   e. [LOB],
	   e.[BENEFIT PLAN],
	   e.[INTERNAL/EXTERNAL INDICATOR],
	   e.[START_DATE],
	   e.[END_DATE],
	   20 AS ClientKey
    FROM [ACDW_CLMS_SHCN_bcbs].[dbo].[vw_Exp_AH_Eligibility] e

    
