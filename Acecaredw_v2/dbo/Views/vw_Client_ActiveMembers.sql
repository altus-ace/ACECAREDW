﻿CREATE VIEW vw_Client_ActiveMembers
As
SELECT DISTINCT
      [CLIENT]
      ,[MEMBER_ID]
      ,[MEMBER_FIRST_NAME]
      ,[MEMBER_MI]
      ,[MEMBER_LAST_NAME]
      ,[CLIENT_SUBSCRIBER_ID]
      ,[PLAN_ID]
      ,[PRODUCT_CODE]
      ,[SUBGRP_ID]
      ,[SUBGRP_NAME]
	  ,case when subgrp_id ='M_Adv' then 2
	when TRY_convert(int,subgrp_id) in (100) then 2 /* TX Star Plus subgrps*/
	when TRY_convert(int,subgrp_id) in (3,5,20,60,62,63,64,65,66,67,68,61) then 1 /*TX star and TX Star Pregnant Women*/
	WHEN SUBGRP_ID IN('D000') THEN 1 /*TX star and TX Star Pregnant Women*/
	 when TRY_converT(int,subgrp_id) in ( 309,310,311,302,303,304,301) then 0.5 /* TX CHIP and TX CHIP Pregnant Women*/
	 WHEN SUBGRP_ID IN('D001') THEN 0.5  /* TX CHIP and TX CHIP Pregnant Women*/
	end as TIN_TIER
      ,[MEDICAID_ID]
      ,[AGE]
      ,[DATE_OF_BIRTH]
      ,[GENDER]
     ,[LANG_CODE]
      ,[ETHNICITY]
      ,[RACE]
      ,[MEMBER_HOME_ADDRESS]
      ,[MEMBER_HOME_ADDRESS2]
      ,[MEMBER_HOME_CITY]
      ,[MEMBER_HOME_STATE]
      ,[MEMBER_HOME_ZIP_C]
      ,[MEMBER_HOME_PHONE]
      ,[MEMBER_MAIL_ADDRESS]
      ,[MEMBER_MAIL_ADDRESS2]
      ,[MEMBER_MAIL_CITY]
      ,[MEMBER_MAIL_STATE]
      ,[MEMBER_MAIL_ZIP_C]
      ,[MEMBER_MAIL_PHONE]
      ,[MEMBER_COUNTY]
       ,[MEMBER_BUS_PHONE]
      ,[MEMBER_ORG_EFF_DATE]
      ,[MEMBER_CONT_EFF_DATE]
      ,[MEMBER_CUR_EFF_DATE]
      ,[MEMBER_CUR_TERM_DATE]
      ,[PCP_CLIENT_ID]
      ,[PCP_FIRST_NAME]
      ,[PCP_LAST_NAME]
      ,[NPI]
      ,[PCP_PHONE]
      ,CONVERT(VARCHAR(255),[PCP_FAX]) AS PCP_FAX
    ,[PCP_ADDRESS]
      ,CONVERT(VARCHAR(255),[PCP_ADDRESS2]) AS PCP_ADDRESS2
      ,[PCP_CITY]
      ,[PCP_STATE]
      ,[PCP_ZIP_C]
      ,[PCP_EFFECTIVE_DATE]
      ,[PCP_TERM_DATE]
        ,[PCP_PRACTICE_TIN]
    ,CONVERT(VARCHAR(255),[PCP_GROUP_ID]) AS [PCP_GROUP_ID]
      ,[PCP_PRACTICE_NAME]
      ,[AUTO_ASSIGN]
      ,CONVERT(CHAR(1),[MEMBER_STATUS]) AS MEMBER_STATUS
      ,CONVERT(DATE,[MEMBER_TERM_DATE]) AS [MEMBER_TERM_DATE]
      ,CONVERT(NUMERIC(10,2),[IPRO_ADMIT_RISK_SCORE]) AS [IPRO_ADMIT_RISK_SCORE]
      ,CONVERT(VARCHAR(25) ,[RISK_CATEGORY_C]) AS [RISK_CATEGORY_C]
      ,[LINE_OF_BUSINESS]
      ,[PLAN_CODE]
      ,[PLAN_DESC]
      ,CONVERT(VARCHAR(255),[PRIMARY_RISK_FACTOR]) AS [PRIMARY_RISK_FACTOR]
      ,CONVERT(NUMERIC(14,2),[TOTAL_COSTS_LAST_12_MOS]) AS [TOTAL_COSTS_LAST_12_MOS]
      ,CONVERT(NUMERIC(5),[COUNT_OPEN_CARE_OPPS]) [COUNT_OPEN_CARE_OPPS]
      ,CONVERT(NUMERIC(14,2),[INP_COSTS_LAST_12_MOS])[INP_COSTS_LAST_12_MOS]
      ,CONVERT(NUMERIC(14,2),[ER_COSTS_LAST_12_MOS])[ER_COSTS_LAST_12_MOS]
      ,CONVERT(NUMERIC(14,2),[OUTP_COSTS_LAST_12_MOS])[OUTP_COSTS_LAST_12_MOS]
      ,CONVERT(NUMERIC(14,2),[PHARMACY_COSTS_LAST_12_MOS])[PHARMACY_COSTS_LAST_12_MOS]
      ,CONVERT(NUMERIC(14,2),[PRIMARY_CARE_COSTS_LAST_12_MOS])[PRIMARY_CARE_COSTS_LAST_12_MOS]
      ,CONVERT(NUMERIC(14,2),[BEHAVIORAL_COSTS_LAST_12_MOS])[BEHAVIORAL_COSTS_LAST_12_MOS]
      ,CONVERT(NUMERIC(14,2),[OTHER_OFFICE_COSTS_LAST_12_MOS])[OTHER_OFFICE_COSTS_LAST_12_MOS]
      ,CONVERT(NUMERIC(5),[INP_ADMITS_LAST_12_MOS]) AS [INP_ADMITS_LAST_12_MOS]
      ,CONVERT(VARCHAR(255),[LAST_INP_DISCHARGE]) [LAST_INP_DISCHARGE]
      ,CONVERT(VARCHAR(255),[POST_DISCHARGE_FUP_VISIT]) [POST_DISCHARGE_FUP_VISIT]
      ,CONVERT(VARCHAR(255),[INP_FUP_WITHIN_7_DAYS]) [INP_FUP_WITHIN_7_DAYS]
      ,CONVERT(NUMERIC(5),[ER_VISITS_LAST_12_MOS])AS [ER_VISITS_LAST_12_MOS]
      ,CONVERT(VARCHAR(255),[LAST_ER_VISIT]) [LAST_ER_VISIT]
      ,CONVERT(VARCHAR(255),[POST_ER_FUP_VISIT]) [POST_ER_FUP_VISIT]
      ,CONVERT(VARCHAR(255),[ER_FUP_WITHIN_7_DAYS]) [ER_FUP_WITHIN_7_DAYS]
      ,CONVERT(VARCHAR(255),[LAST_PCP_VISIT]) [LAST_PCP_VISIT]
      ,CONVERT(VARCHAR(255),[LAST_PCP_PRACTICE_SEEN]) [LAST_PCP_PRACTICE_SEEN]
      ,CONVERT(VARCHAR(255),[LAST_BH_VISIT]) [LAST_BH_VISIT]
      ,CONVERT(VARCHAR(255),[LAST_BH_PRACTICE_SEEN]) [LAST_BH_PRACTICE_SEEN]
     ,CONVERT(VARCHAR(255),[MEMBER_MONTH_COUNT])[MEMBER_MONTH_COUNT]
      ,[MEMBER_POD_C]
      ,[MEMBER_POD_DESC]
      ,[PCP_POD_C]
      ,[PCP_POD_DESC]
      ,[PCP_NAME]
     ,CONVERT(VARCHAR(255),[CLIENT_UNIQUE_SYSTEM_ID])[CLIENT_UNIQUE_SYSTEM_ID]
      ,[MEDICARE_ID]
      ,CONVERT(VARCHAR(255),[RESP_LAST_NAME])[RESP_LAST_NAME]
      ,CONVERT(VARCHAR(255),[RESP_FIRST_NAME])[RESP_FIRST_NAME]
      ,CONVERT(VARCHAR(255),[RESP_ADDRESS])[RESP_ADDRESS]
      ,CONVERT(VARCHAR(255),[RESP_ADDRESS2])[RESP_ADDRESS2]
      ,CONVERT(VARCHAR(255),[RESP_CITY])[RESP_CITY]
      ,CONVERT(VARCHAR(255),[RESP_STATE])[RESP_STATE]
      ,CONVERT(VARCHAR(255),[RESP_ZIP])[RESP_ZIP]
      ,CONVERT(VARCHAR(255),[RESP_PHONE])[RESP_PHONE]
      ,[CurMonthsOld]
      ,[CurYearsOld]
  FROM [ACECAREDW].[dbo].[vw_ActiveMembers]
  UNION
  SELECT 'UHC' AS CLIENT
, [MEMBER_ID]
      ,[MEMBER_FIRST_NAME]
      ,[MEMBER_MI]
      ,[MEMBER_LAST_NAME]
      ,[UHC_SUBSCRIBER_ID] AS CLIENT_SUBSCRIBER_ID
      ,[PLAN_ID]
      ,[PRODUCT_CODE]
      ,[SUBGRP_ID]
      ,[SUBGRP_NAME]
	 ,case when subgrp_id ='M_Adv' then 2
	when TRY_convert(int,subgrp_id) in (100) then 2 /* TX Star Plus subgrps*/
	when TRY_convert(int,subgrp_id) in (3,5,20,60,62,63,64,65,66,67,68,61) then 1 /*TX star and TX Star Pregnant Women*/
	WHEN SUBGRP_ID IN('D000') THEN 1 /*TX star and TX Star Pregnant Women*/
	 when TRY_converT(int,subgrp_id) in ( 309,310,311,302,303,304,301) then 0.5 /* TX CHIP and TX CHIP Pregnant Women*/
	 WHEN SUBGRP_ID IN('D001') THEN 0.5  /* TX CHIP and TX CHIP Pregnant Women*/
	end as TIN_TIER
      ,[MEDICAID_ID]
      ,CONVERT(INT,[AGE]) AS AGE
      ,CONVERT(DATE,[DATE_OF_BIRTH])AS DATE_OF_BIRTH
      ,CONVERT(CHAR(5) ,[GENDER]) AS GENDER
      ,[LANG_CODE]
      ,[ETHNICITY]
      ,CONVERT(VARCHAR(20),[RACE]) AS RACE
   ,[MEMBER_HOME_ADDRESS]
      ,[MEMBER_HOME_ADDRESS2]
      ,[MEMBER_HOME_CITY]
      ,CONVERT(CHAR(25),[MEMBER_HOME_STATE]) AS MEMBER_HOME_STATE
      ,[MEMBER_HOME_ZIP_C]
      ,[MEMBER_HOME_PHONE]
      ,[MEMBER_MAIL_ADDRESS]
      ,[MEMBER_MAIL_ADDRESS2]
      ,[MEMBER_MAIL_CITY]
      ,CONVERT(CHAR(25) ,[MEMBER_MAIL_STATE]) AS MEMBER_MAIL_STATE
      ,[MEMBER_MAIL_ZIP_C]
      ,[MEMBER_MAIL_PHONE]
      ,[MEMBER_COUNTY]
       ,[MEMBER_BUS_PHONE]
      ,[MEMBER_ORG_EFF_DATE]
      ,[MEMBER_CONT_EFF_DATE]
      ,CONVERT(DATE,[MEMBER_CUR_EFF_DATE]) AS [MEMBER_CUR_EFF_DATE]
      ,CONVERT(DATE,[MEMBER_CUR_TERM_DATE]) AS [MEMBER_CUR_TERM_DATE]
      ,[PCP_UHC_ID] AS PCP_CLIENT_ID
      ,[PCP_FIRST_NAME]
      ,[PCP_LAST_NAME]
      ,[PCP_NPI] AS NPI
      ,[PCP_PHONE]
      ,[PCP_FAX] 
        ,[PCP_ADDRESS]
      ,[PCP_ADDRESS2]
      ,[PCP_CITY]
      ,[PCP_STATE]
      ,[PCP_ZIP_C]
      ,CONVERT(DATE,[PCP_EFFECTIVE_DATE]) AS [PCP_EFFECTIVE_DATE]
      ,CONVERT(DATE,[PCP_TERM_DATE]) AS [PCP_TERM_DATE]
       ,[PCP_PRACTICE_TIN]
     ,[PCP_GROUP_ID]
      ,[PCP_PRACTICE_NAME]
      ,[AUTO_ASSIGN]
     ,[MEMBER_STATUS]
      ,[MEMBER_TERM_DATE]
      ,[IPRO_ADMIT_RISK_SCORE]
      ,[RISK_CATEGORY_C]
      ,[LINE_OF_BUSINESS]
       ,[PLAN_CODE]
      ,[PLAN_DESC]
      ,[PRIMARY_RISK_FACTOR]
      ,[TOTAL_COSTS_LAST_12_MOS]
      ,[COUNT_OPEN_CARE_OPPS]
      ,[INP_COSTS_LAST_12_MOS]
      ,[ER_COSTS_LAST_12_MOS]
      ,[OUTP_COSTS_LAST_12_MOS]
      ,[PHARMACY_COSTS_LAST_12_MOS]
      ,[PRIMARY_CARE_COSTS_LAST_12_MOS]
      ,[BEHAVIORAL_COSTS_LAST_12_MOS]
      ,[OTHER_OFFICE_COSTS_LAST_12_MOS]
      ,[INP_ADMITS_LAST_12_MOS]
      ,[LAST_INP_DISCHARGE]
      ,[POST_DISCHARGE_FUP_VISIT]
      ,[INP_FUP_WITHIN_7_DAYS]
      ,[ER_VISITS_LAST_12_MOS]
      ,[LAST_ER_VISIT]
      ,[POST_ER_FUP_VISIT]
      ,[ER_FUP_WITHIN_7_DAYS]
      ,[LAST_PCP_VISIT]
      ,[LAST_PCP_PRACTICE_SEEN]
      ,[LAST_BH_VISIT]
      ,[LAST_BH_PRACTICE_SEEN]
     ,[MEMBER_MONTH_COUNT]
      ,CONVERT(VARCHAR(50),[MEMBER_POD_C]) AS  [MEMBER_POD_C]
      ,[MEMBER_POD_DESC]
      ,CONVERT(VARCHAR(50),[PCP_POD_C]) AS [PCP_POD_C]
      ,[PCP_POD_DESC]
      ,[PCP_NAME]
      ,[UHC_UNIQUE_SYSTEM_ID] AS CLIENT_UNIQUE_SYSTEM_ID
      ,[MEDICARE_ID]
      ,[RESP_LAST_NAME]
      ,[RESP_FIRST_NAME]
      ,[RESP_ADDRESS]
      ,[RESP_ADDRESS2]
      ,[RESP_CITY]
      ,[RESP_STATE]
      ,[RESP_ZIP]
      ,[RESP_PHONE]
      ,[CurMonthsOld]
      ,[CurYearsOld]
  FROM [ACECAREDW].[dbo].[vw_UHC_ActiveMembers_01]