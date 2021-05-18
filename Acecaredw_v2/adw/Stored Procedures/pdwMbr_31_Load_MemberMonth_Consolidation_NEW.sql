
CREATE PROCEDURE	[adw].[pdwMbr_31_Load_MemberMonth_Consolidation_NEW] ---  	[adw].[pdwMbr_31_Load_MemberMonth_Consolidation_NEW]'2021-02-18',20
					(@MemberMonth DATE, @ClientKey INT)

AS

BEGIN
		MERGE	[dbo].[TmpAllMemberMonths] Trg 
		USING	(   ----- DECLARE @LoadDate DATE = '2021-04-12' DECLARE @ClientKey INT = 12 DECLARE @MemberMonth DATE = '2021-04-12'
					SELECT   ---All Clients with the exception of UHC
								@MemberMonth MemberMonth,
								a.CLientKey,
								a.Client_SubScriber_ID,
								a.PCP_Client_ID, 
								a.PLAN_ID,
								a.PLAN_CODE,
								a.SUBGRP_ID,
								a.SUBGRP_NAME,
								a.PCP_PRACTICE_TIN,
								a.PCP_PRACTICE_NAME,
								a.MEMBER_FIRST_NAME,
								a.MEMBER_LAST_NAME,
								a.GENDER,
								a.AGE, 
								a.DATE_OF_BIRTH,
								a.MEMBER_HOME_ADDRESS,
								a.MEMBER_HOME_ADDRESS2,
								a.MEMBER_HOME_CITY,
								a.MEMBER_HOME_STATE,
								a.MEMBER_HOME_ZIP_C,
								a.MEMBER_HOME_PHONE,
								a.ClientRiskScore,
								a.LoadDate
					FROM		dbo.tvf_Activemembers(@MemberMonth) a
					WHERE		ClientKey = @ClientKey
					/*
					UNION
					SELECT		@MemberMonth [MemberMonth]
								,1
								,b.UHC_SubScriber_ID
								,b.[PCP_NPI]
								,b.[PLAN_ID]
								,b.[PLAN_CODE]
								,b.[SUBGRP_ID]
								,b.[SUBGRP_NAME]
								,b.[PCP_PRACTICE_TIN]
								,b.[PCP_PRACTICE_NAME]
								,b.[MEMBER_FIRST_NAME]
								,b.[MEMBER_LAST_NAME]
								,b.[GENDER]
								,b.[AGE]
								,b.[DATE_OF_BIRTH]
								,b.[MEMBER_HOME_ADDRESS]
								,b.[MEMBER_HOME_ADDRESS2]
								,b.[MEMBER_HOME_CITY]
								,b.[MEMBER_HOME_STATE]
								,b.[MEMBER_HOME_ZIP_C]
								,b.[MEMBER_HOME_PHONE]
								,b.[IPRO_ADMIT_RISK_SCORE]
								,b.LoadDate
		FROM				[dbo].[vw_UHC_ActiveMembers] b */
				)src
		ON		trg.ClientKey = src.ClientKey
		AND		trg.MemberMonth = src.LoadDate
		AND		trg.ClientMemberKey = src.Client_SubScriber_ID
		WHEN NOT MATCHED BY TARGET
		THEN
		INSERT 		
								([MemberMonth]
								,[CLientKey]
								,[LOB]
								,[ClientMemberKey]
								,[PCP_NPI]
								,[PLAN_ID]
								,[PLAN_CODE]
								,[SUBGRP_ID]
								,[SUBGRP_NAME]
								,[PCP_PRACTICE_TIN]
								,[PCP_PRACTICE_NAME]
								,[MEMBER_FIRST_NAME]
								,[MEMBER_LAST_NAME]
								,[GENDER]
								,[AGE]
								,[DATE_OF_BIRTH]
								,[MEMBER_HOME_ADDRESS]
								,[MEMBER_HOME_ADDRESS2]
								,[MEMBER_HOME_CITY]
								,[MEMBER_HOME_STATE]
								,[MEMBER_HOME_ZIP]
								,[MEMBER_HOME_PHONE]
								,[IPRO_ADMIT_RISK_SCORE]
								,[RunDate]
								,[RunBy])
		   VALUES				(MemberMonth
								,CLientKey
								,PLAN_ID
								,Client_SubScriber_ID
								,PCP_Client_ID
								,PLAN_ID
								,PLAN_CODE
								,SUBGRP_ID
								,SUBGRP_NAME
								,PCP_PRACTICE_TIN
								,PCP_PRACTICE_NAME
								,MEMBER_FIRST_NAME
								,MEMBER_LAST_NAME
								,GENDER
								,AGE 
								,DATE_OF_BIRTH
								,MEMBER_HOME_ADDRESS
								,MEMBER_HOME_ADDRESS2
								,MEMBER_HOME_CITY
								,MEMBER_HOME_STATE
								,MEMBER_HOME_ZIP_C
								,MEMBER_HOME_PHONE
								,ClientRiskScore
								,GETDATE()
								,SUSER_NAME())
			---Do i really need to perform updates?
			--WHEN MATCHED	THEN 
			--UPDATE SET	trg.[IPRO_ADMIT_RISK_SCORE] = src.ClientRiskScore
			;
		
		
		
	END

