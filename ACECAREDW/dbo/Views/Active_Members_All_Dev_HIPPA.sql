﻿



CREATE view [dbo].[Active_Members_All_Dev_HIPPA]
as
select
REPLACE(LEFT(LEFT(MEMBER_ID,9),1),'1','A')+REPLACE(LEFT(LEFT(MEMBER_ID,9),1),'1','B')+RIGHT(LEFT(MEMBER_ID,9),8) 	as	[M_Registration_ID]
  ,'UTEST' 	as	            [CLIENT_ID]
  ,' ' 	as	            [M_Title]
      ,LEFT([MEMBER_FIRST_NAME],1)+'*****' 	as	            [M_First_Name]
      ,'**'+LEFT([MEMBER_LAST_NAME],2)+'***' 	as	            [M_Last_Name]
  ,rtrim([MEMBER_MI]	)as	            [M_Middle_Name]
  ,rtrim([GENDER])	as	            [M_Gender]
  ,dateadd(day,30,[DATE_OF_BIRTH]) 	as	            [M_Date_Of_Birth]
      ,[UHC_UNIQUE_SYSTEM_ID] 	as	            [M_Alternate_Number]
  ,LEFT([MEMBER_HOME_PHONE],3)+'9999999' 	as	            [M_Mobile_Number]
  ,' ' 	as	            [M_Email_Id]
      ,LEFT([MEMBER_HOME_ADDRESS],3)+'*****' 	as	            [M_Address_Line1_Res]
      ,[MEMBER_HOME_ADDRESS2]	as	            [M_Address_Line2_Res]
      ,[MEMBER_HOME_CITY]	as	            [M_City_Res]
      ,[MEMBER_HOME_STATE]	as	            [M_State_Res]
  ,[MEMBER_COUNTY]	as	            [M_County_Res]
      ,[MEMBER_HOME_ZIP_C]	as	            [M_Zip_Code_Res]
      ,LEFT([MEMBER_MAIL_ADDRESS],3)+'*****' 	as	            [M_Address_Line1_Office]
      ,[MEMBER_MAIL_ADDRESS2]	as	            [M_Address_Line2_Office]
      ,[MEMBER_MAIL_CITY]	as	            [M_City_Office]
      ,[MEMBER_MAIL_STATE]	as	            [M_State_Office]
  ,' '	as	            [M_County_Office]
      ,[MEMBER_MAIL_ZIP_C]	as	            [M_Zip_Code_Office]
  ,' ' 	as	            [M_SSN]
  ,' '	as	            [M_Ethinicity]
  ,1 	as	            [M_Primary_Address]
  ,' ' 	as	            [M_Emergency_Contact]
  ,' ' 	as	            [M_Emergency_Phone]
  ,' ' 	as	            [M_Relationship]
  ,' ' 	as	            [M_Authentication_Key]
  ,' ' 	as	            [M_Photo_Path]
  ,1 	as	            [M_Is_Active]
  ,1 	as	            [M_Account_Status]
  ,REPLACE(LEFT(LEFT(MEMBER_ID,10),1),'1','A')+REPLACE(LEFT(LEFT(MEMBER_ID,10),1),'1','B')+RIGHT(LEFT(MEMBER_ID,10),8)  	as	            [M_Insured_ID]
  ,3	as	            [M_Patient_Status]
  ,12345678 	as	            [M_Ins_Plan_ID]
  ,'X' 	as	            [M_Policy_Group]
      ,REPLACE(REPLACE(REPLACE(REPLACE([LINE_OF_BUSINESS],'CHIP', 'A'),'EVERCARE','B'),'STAR MEDICAID','C'),'STAR KIDS','D')	as	            [M_Insurance_Plan]
  ,' '  	as	            [M_Employer]
  ,[MEMBER_ORG_EFF_DATE]	as	            [M_Plan_Start_Dt]
  ,[MEMBER_CUR_TERM_DATE]	as	            [M_Plan_End_Dt]
  ,1 	as	            [M_Plan_isActive]
  ,LEFT([MEMBER_FIRST_NAME],1)+'*****'  	as	            [M_Insured_First_Name]
      ,'**'+LEFT([MEMBER_LAST_NAME],2)+'***' 	as	            [M_Insured_Last_Name]
  ,[MEMBER_MI]	as	            [M_Insured_Middle_Name]
  ,[GENDER]	as	            [M_Insured_Gender]
  ,dateadd(day,30,[DATE_OF_BIRTH]) 	as	            [M_Insured_DOB]
  ,LEFT([MEMBER_HOME_PHONE],3)+'9999999' 	as	            [M_Insured_Telephone]
  ,LEFT([MEMBER_HOME_ADDRESS],3)+'*****'  	as	            [M_Insured_Address]
      ,[MEMBER_HOME_CITY]	as	            [M_Insured_City]
      ,[MEMBER_HOME_STATE]	as	            [M_Insured_State]
      ,[MEMBER_HOME_ZIP_C]	as	            [M_Insured_Zip_Code]
  ,' ' 	as	            [M_Insured_Email_Id]
  ,0 	as	            [M_Other_Health_Plan]
  ,REPLACE(LEFT(LEFT(MEMBER_ID,9),1),'1','A')+REPLACE(LEFT(LEFT(MEMBER_ID,9),1),'1','B')+RIGHT(LEFT(MEMBER_ID,9),8)	as	            [SUBSCRIBER_ID]
  ,'MEDICAID'	as	            [PRODUCT_ID]
      ,REPLACE(REPLACE(REPLACE(REPLACE([LINE_OF_BUSINESS],'CHIP', 'A'),'EVERCARE','B'),'STAR MEDICAID','C'),'STAR KIDS','D')	as	            [LINE_OF_BUSINESS]
      ,CAST([PLAN_CODE] as varchar(15))	as	            [PLAN_CODE]
  ,CAST([PLAN_DESC] as varchar(30))	as	            [PLAN_DESC]
  ,CAST([PLAN_ID] as varchar(15))	as	            [PLAN_ID]
  ,CAST([PRODUCT_CODE] as varchar(30))	as	            [PRODUCT_CODE]
  ,CAST([SUBGRP_ID] as varchar(15))	as	            [SUBGRP_ID]
  ,CAST([SUBGRP_NAME] as varchar(100))	as	            [SUBGRP_NAME]
  ,'***' + LEFT(MEDICAID_ID,5) + '***'	as	            [MEDICAID_ID]
  ,'***'	as	            [MEDICARE_ID]
      ,cast([PCP_PRACTICE_TIN] as varchar(10))	as	            [PCP_PRACTICE_TIN]
      ,cast([PCP_NPI] as varchar(10))	as	            [PCP_NPI]
  ,cast([PCP_FIRST_NAME] as varchar(35))	as	            [PCP_FIRST_NAME]
  ,cast([PCP_LAST_NAME] as varchar(35))	as	            [PCP_LAST_NAME]
      ,[MEMBER_ORG_EFF_DATE]	as	            [MEMBER_ORG_EFF_DATE]
      ,[MEMBER_CONT_EFF_DATE]	as	            [MEMBER_CONT_EFF_DATE]
      ,[MEMBER_CUR_EFF_DATE]	as	            [MEMBER_CUR_EFF_DATE]
      ,[MEMBER_CUR_TERM_DATE]      	as	            [MEMBER_CUR_TERM_DATE]
      ,CAST([AUTO_ASSIGN] as varchar(10))	as	            [AUTO_ASSIGN]
  ,CAST([MEMBER_STATUS] as varchar(5))	as	            [MEMBER_STATUS]
      ,[MEMBER_TERM_DATE]	as	            [MEMBER_TERM_DATE]
      ,[IPRO_ADMIT_RISK_SCORE]	as	            [CLIENT_ADMIT_RISK_SCORE]
      ,CAST([RISK_CATEGORY_C] as varchar(15))	as	            [CLIENT_RISK_CATEGORY_C]
      ,CAST([PRIMARY_RISK_FACTOR] as varchar(100))	as	            [PRIMARY_RISK_FACTOR]
      ,[TOTAL_COSTS_LAST_12_MOS]	as	            [TOTAL_COSTS_LAST_12_MOS]
      ,[COUNT_OPEN_CARE_OPPS]	as	            [COUNT_OPEN_CARE_OPPS]
      ,[INP_COSTS_LAST_12_MOS]	as	            [INP_COSTS_LAST_12_MOS]
      ,[ER_COSTS_LAST_12_MOS]	as	            [ER_COSTS_LAST_12_MOS]
      ,[OUTP_COSTS_LAST_12_MOS]	as	            [OUTP_COSTS_LAST_12_MOS]
      ,[PHARMACY_COSTS_LAST_12_MOS]	as	            [PHARMACY_COSTS_LAST_12_MOS]
      ,[PRIMARY_CARE_COSTS_LAST_12_MOS]	as	            [PRIMARY_CARE_COSTS_LAST_12_MOS]
      ,[BEHAVIORAL_COSTS_LAST_12_MOS]	as	            [BEHAVIORAL_COSTS_LAST_12_MOS]
      ,[OTHER_OFFICE_COSTS_LAST_12_MOS]	as	            [OTHER_OFFICE_COSTS_LAST_12_MOS]
      ,[INP_ADMITS_LAST_12_MOS]	as	            [INP_ADMITS_LAST_12_MOS]
      ,[LAST_INP_DISCHARGE]	as	            [LAST_INP_DISCHARGE]
      ,[ER_VISITS_LAST_12_MOS]	as	            [ER_VISITS_LAST_12_MOS]
      ,[LAST_ER_VISIT]	as	            [LAST_ER_VISIT]
      ,[LAST_PCP_VISIT]   	as	            [LAST_PCP_VISIT]
  ,cast([LAST_PCP_PRACTICE_SEEN] as varchar(100))	as	            [LAST_PCP_PRACTICE_SEEN]
      ,[LAST_BH_VISIT]	as	            [LAST_BH_VISIT]
  ,cast([LAST_BH_PRACTICE_SEEN] as varchar(100))	as	            [LAST_BH_PRACTICE_SEEN]
      ,[MEMBER_POD_C]	as	            [MEMBER_POD]
      ,[MEMBER_POD_DESC]	as	            [MEMBER_POD_DESC]
      ,'**'+LEFT([UHC_UNIQUE_SYSTEM_ID],5)+'***'	as	            [CLIENT_UNIQUE_SYSTEM_ID]
      ,year(a_last_update_date)	as	            [MBR_YEAR]
      ,month(a_last_update_date) 	as	            [MBR_MTH]
  ,a_last_update_date as	            [LOAD_DATE]
  ,' '	as	            [LOAD_USER]
  ,IPRO_ADMIT_RISK_SCORE
  FROM [ACECAREDW].[dbo].[vw_UHC_ActiveMembers_ALL] 


