

CREATE PROCEDURE	[adw].[pdwMbr_32_Load_MemberMonth_UHC]
					(@LoadDate DATE, @ClientKey INT)

AS

BEGIN

		INSERT INTO		 [dbo].[TmpAllMemberMonths]
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
		   
		
		--UHC
			  ---  DECLARE @LoadDate DATE = '2021-03-17' DECLARE @ClientKey INT = 1
			 SELECT   ---All Clients with the exception of UHC 
						@LoadDate MemberMonth,
						a.CLientKey,
						a.LOB,
						a.UHC_SubScriber_ID,
						a.[PCP_NPI], 
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
						a.[IPRO_ADMIT_RISK_SCORE],
						GETDATE() [RunDate],
						SUSER_NAME() [RunBy]
			FROM		(
							SELECT   --- UHC
											@LoadDate MemberMonth,
											'1' AS ClientKey,
											a.PLAN_ID AS LOB,
											a.UHC_SubScriber_ID,
											a.[PCP_NPI], 
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
											a.[IPRO_ADMIT_RISK_SCORE],
											GETDATE() [RunDate],
											SUSER_NAME() [RunBy]
											,ROW_NUMBER()OVER(PARTITION BY a.UHC_SubScriber_ID ORDER BY UHC_SubScriber_ID)RwCnt
								FROM		[dbo].[vw_UHC_ActiveMembers] a
								WHERE		LoadDate = @LoadDate
					 )a
			WHERE	a.RwCnt = 1
		
	END

