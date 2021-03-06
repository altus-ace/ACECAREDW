﻿CREATE view [dbo].[vw_Exp_AH_Membership_DEV]
AS    
    SELECT  -- MSSP
       CONVERT(NVARCHAR(255), RTRIM(m.MEMBER_ID)) AS Member_ID
     , l.CS_Export_LobName as CLIENT_ID
     , CONVERT(NVARCHAR(255), RTRIM(m.MEDICAID_ID)) AS MEDICAID_ID
     , CONVERT(NVARCHAR(255), RTRIM(m.MEMBER_FIRST_NAME)) AS MEMBER_FIRST_NAME
     , CONVERT(NVARCHAR(255), RTRIM(m.MEMBER_MI)) AS MEMBER_MI
     , CONVERT(NVARCHAR(255), RTRIM(m.MEMBER_LAST_NAME)) AS MEMBER_LAST_NAME
     , CONVERT(NVARCHAR(255), RTRIM(m.DATE_OF_BIRTH)) AS DATE_OF_BIRTH
     , CONVERT(NVARCHAR(255), RTRIM(m.MEMBER_GENDER)) AS MEMBER_GENDER
     , CONVERT(NVARCHAR(255), RTRIM(m.HOME_ADDRESS)) AS HOME_ADDRESS
     , CONVERT(NVARCHAR(255), RTRIM(m.HOME_CITY)) AS HOME_CITY
     , CONVERT(NVARCHAR(255), RTRIM(m.HOME_STATE)) AS HOME_STATE
     , CONVERT(NVARCHAR(255), RTRIM(m.HOME_ZIPCODE)) AS HOME_ZIPCODE
     , CONVERT(NVARCHAR(255), RTRIM(m.MAILING_ADDRESS)) AS MAILING_ADDRESS
     , CONVERT(NVARCHAR(255), RTRIM(m.MAILING_CITY)) AS MAILING_CITY
     , CONVERT(NVARCHAR(255), RTRIM(m.MAILING_STATE)) AS MAILING_STATE
     , CONVERT(NVARCHAR(255), RTRIM(m.MAILING_ZIP)) AS MAILING_ZIP
     , CONVERT(NVARCHAR(255), RTRIM(m.HOME_PHONE)) AS HOME_PHONE
     , CONVERT(NVARCHAR(255), RTRIM(m.ADDITIONAL_PHONE)) AS ADDITIONAL_PHONE
     , CONVERT(NVARCHAR(255), RTRIM(m.CELL_PHONE)) AS CELL_PHONE
     , CONVERT(NVARCHAR(255), RTRIM(m.Language)) AS Language
     , CONVERT(NVARCHAR(255), RTRIM(m.Ethnicity)) AS Ethnicity
	, CONVERT(NVARCHAR(255), RTRIM(LTRIM(m.Race))) AS Race
	, CONVERT(NVARCHAR(255), RTRIM(LTRIM(m.Email))) AS Email
     , CONVERT(NVARCHAR(255), RTRIM(m.MEDICARE_ID)) AS MEDICARE_ID
     , CONVERT(NVARCHAR(255), RTRIM(m.MEMBER_ORG_EFF_DATE)) AS MEMBER_ORG_EFF_DATE
     , CONVERT(NVARCHAR(255), RTRIM(m.MEMBER_CONT_EFF_DATE)) AS MEMBER_CONT_EFF_DATE
     , CONVERT(NVARCHAR(255), RTRIM(m.MEMBER_CUR_EFF_DATE)) AS MEMBER_CUR_EFF_DATE
     , CONVERT(NVARCHAR(255), RTRIM(m.MEMBER_CUR_TERM_DATE)) AS MEMBER_CUR_TERM_DATE
     , CONVERT(NVARCHAR(255), RTRIM(m.RESP_FIRST_NAME)) AS RESP_FIRST_NAME
     , CONVERT(NVARCHAR(255), RTRIM(m.RESP_LAST_NAME)) AS RESP_LAST_NAME
     , CONVERT(NVARCHAR(255), RTRIM(m.RESP_RELATIONSHIP)) AS RESP_RELATIONSHIP
     , CONVERT(NVARCHAR(255), RTRIM(m.RESP_ADDRESS)) AS RESP_ADDRESS
     , CONVERT(NVARCHAR(255), RTRIM(m.RESP_ADDRESS2)) AS RESP_ADDRESS2
     , CONVERT(NVARCHAR(255), RTRIM(m.RESP_CITY)) AS RESP_CITY
     , CONVERT(NVARCHAR(255), RTRIM(m.RESP_STATE)) AS RESP_STATE
     , CONVERT(NVARCHAR(255), RTRIM(m.RESP_ZIP)) AS RESP_ZIP
     , CONVERT(NVARCHAR(255), RTRIM(m.RESP_PHONE)) AS RESP_PHONE
     , CONVERT(NVARCHAR(255), RTRIM(m.PRIMARY_RISK_FACTOR)) AS PRIMARY_RISK_FACTOR
     , CONVERT(NVARCHAR(255), RTRIM(m.COUNT_OPEN_CARE_OPPS)) AS COUNT_OPEN_CARE_OPPS
     , CONVERT(NVARCHAR(255), RTRIM(m.INP_ADMITS_LAST_12_MOS)) AS INP_ADMITS_LAST_12_MOS
     , CONVERT(NVARCHAR(255), RTRIM(m.LAST_INP_DISCHARGE)) AS LAST_INP_DISCHARGE
     , CONVERT(NVARCHAR(255), RTRIM(m.POST_DISCHARGE_FUP_VISIT)) AS POST_DISCHARGE_FUP_VISIT
     , CONVERT(NVARCHAR(255), RTRIM(m.INP_FUP_WITHIN_7_DAYS)) AS INP_FUP_WITHIN_7_DAYS
     , CONVERT(NVARCHAR(255), RTRIM(m.ER_VISITS_LAST_12_MOS)) AS ER_VISITS_LAST_12_MOS
     , CONVERT(NVARCHAR(255), RTRIM(m.LAST_ER_VISIT)) AS LAST_ER_VISIT
     , CONVERT(NVARCHAR(255), RTRIM(m.POST_ER_FUP_VISIT)) AS POST_ER_FUP_VISIT
     , CONVERT(NVARCHAR(255), RTRIM(m.ER_FUP_WITHIN_7_DAYS)) AS ER_FUP_WITHIN_7_DAYS
     , CONVERT(NVARCHAR(255), RTRIM(m.LAST_PCP_VISIT)) AS LAST_PCP_VISIT
     , CONVERT(NVARCHAR(255), RTRIM(m.LAST_PCP_PRACTICE_SEEN)) AS LAST_PCP_PRACTICE_SEEN
     , CONVERT(NVARCHAR(255), RTRIM(m.LAST_BH_VISIT)) AS LAST_BH_VISIT
     , CONVERT(NVARCHAR(255), RTRIM(m.LAST_BH_PRACTICE_SEEN)) AS LAST_BH_PRACTICE_SEEN
     , CONVERT(NVARCHAR(255), RTRIM(m.TOTAL_COSTS_LAST_12_MOS)) AS TOTAL_COSTS_LAST_12_MOS
     , CONVERT(NVARCHAR(255), RTRIM(m.INP_COSTS_LAST_12_MOS)) AS INP_COSTS_LAST_12_MOS
     , CONVERT(NVARCHAR(255), RTRIM(m.ER_COSTS_LAST_12_MOS)) AS ER_COSTS_LAST_12_MOS
     , CONVERT(NVARCHAR(255), RTRIM(m.OUTP_COSTS_LAST_12_MOS)) AS OUTP_COSTS_LAST_12_MOS
     , CONVERT(NVARCHAR(255), RTRIM(m.PHARMACY_COSTS_LAST_12_MOS)) AS PHARMACY_COSTS_LAST_12_MOS
     , CONVERT(NVARCHAR(255), RTRIM(m.PRIMARY_CARE_COSTS_LAST_12_MOS)) AS PRIMARY_CARE_COSTS_LAST_12_MOS
     , CONVERT(NVARCHAR(255), RTRIM(m.BEHAVIORAL_COSTS_LAST_12_MOS)) AS BEHAVIORAL_COSTS_LAST_12_MOS
     , CONVERT(NVARCHAR(255), RTRIM(m.OTHER_OFFICE_COSTS_LAST_12_MOS)) AS OTHER_OFFICE_COSTS_LAST_12_MOS
     , CONVERT(NVARCHAR(255), RTRIM(m.NEXT_PREVENTATIVE_VISIT_DUE)) AS NEXT_PREVENTATIVE_VISIT_DUE
    , ACE_ID  
    , m.carrier_Member_ID 
    , l.ClientKey
FROM ACDW_CLMS_SHCN_MSSP.dbo.vw_EXP_AH_Membership m
    join lst.List_Client l ON m.CLIENT_ID = l.CS_Export_LobName
UNION 
SELECT  -- BCBS
       CONVERT(NVARCHAR(255), RTRIM(m.MEMBER_ID)) AS Member_ID
     , l.CS_Export_LobName as CLIENT_ID
     , CONVERT(NVARCHAR(255), RTRIM(m.MEDICAID_ID)) AS MEDICAID_ID
     , CONVERT(NVARCHAR(255), RTRIM(m.MEMBER_FIRST_NAME)) AS MEMBER_FIRST_NAME
     , CONVERT(NVARCHAR(255), RTRIM(m.MEMBER_MI)) AS MEMBER_MI
     , CONVERT(NVARCHAR(255), RTRIM(m.MEMBER_LAST_NAME)) AS MEMBER_LAST_NAME
     , CONVERT(NVARCHAR(255), RTRIM(m.DATE_OF_BIRTH)) AS DATE_OF_BIRTH
     , CONVERT(NVARCHAR(255), RTRIM(m.MEMBER_GENDER)) AS MEMBER_GENDER
     , CONVERT(NVARCHAR(255), RTRIM(m.HOME_ADDRESS)) AS HOME_ADDRESS
     , CONVERT(NVARCHAR(255), RTRIM(m.HOME_CITY)) AS HOME_CITY
     , CONVERT(NVARCHAR(255), RTRIM(m.HOME_STATE)) AS HOME_STATE
     , CONVERT(NVARCHAR(255), RTRIM(m.HOME_ZIPCODE)) AS HOME_ZIPCODE
     , CONVERT(NVARCHAR(255), RTRIM(m.MAILING_ADDRESS)) AS MAILING_ADDRESS
     , CONVERT(NVARCHAR(255), RTRIM(m.MAILING_CITY)) AS MAILING_CITY
     , CONVERT(NVARCHAR(255), RTRIM(m.MAILING_STATE)) AS MAILING_STATE
     , CONVERT(NVARCHAR(255), RTRIM(m.MAILING_ZIP)) AS MAILING_ZIP
     , CONVERT(NVARCHAR(255), RTRIM(m.HOME_PHONE)) AS HOME_PHONE
     , CONVERT(NVARCHAR(255), RTRIM(m.ADDITIONAL_PHONE)) AS ADDITIONAL_PHONE
     , CONVERT(NVARCHAR(255), RTRIM(m.CELL_PHONE)) AS CELL_PHONE
     , CONVERT(NVARCHAR(255), RTRIM(m.Language)) AS Language
     , CONVERT(NVARCHAR(255), RTRIM(m.Ethnicity)) AS Ethnicity
	, CONVERT(NVARCHAR(255), RTRIM(LTRIM(m.Race))) AS Race
	, CONVERT(NVARCHAR(255), RTRIM(LTRIM(m.Email))) AS Email
     , CONVERT(NVARCHAR(255), RTRIM(m.MEDICARE_ID)) AS MEDICARE_ID
     , CONVERT(NVARCHAR(255), RTRIM(m.MEMBER_ORG_EFF_DATE)) AS MEMBER_ORG_EFF_DATE
     , CONVERT(NVARCHAR(255), RTRIM(m.MEMBER_CONT_EFF_DATE)) AS MEMBER_CONT_EFF_DATE
     , CONVERT(NVARCHAR(255), RTRIM(m.MEMBER_CUR_EFF_DATE)) AS MEMBER_CUR_EFF_DATE
     , CONVERT(NVARCHAR(255), RTRIM(m.MEMBER_CUR_TERM_DATE)) AS MEMBER_CUR_TERM_DATE
     , CONVERT(NVARCHAR(255), RTRIM(m.RESP_FIRST_NAME)) AS RESP_FIRST_NAME
     , CONVERT(NVARCHAR(255), RTRIM(m.RESP_LAST_NAME)) AS RESP_LAST_NAME
     , CONVERT(NVARCHAR(255), RTRIM(m.RESP_RELATIONSHIP)) AS RESP_RELATIONSHIP
     , CONVERT(NVARCHAR(255), RTRIM(m.RESP_ADDRESS)) AS RESP_ADDRESS
     , CONVERT(NVARCHAR(255), RTRIM(m.RESP_ADDRESS2)) AS RESP_ADDRESS2
     , CONVERT(NVARCHAR(255), RTRIM(m.RESP_CITY)) AS RESP_CITY
     , CONVERT(NVARCHAR(255), RTRIM(m.RESP_STATE)) AS RESP_STATE
     , CONVERT(NVARCHAR(255), RTRIM(m.RESP_ZIP)) AS RESP_ZIP
     , CONVERT(NVARCHAR(255), RTRIM(m.RESP_PHONE)) AS RESP_PHONE
     , CONVERT(NVARCHAR(255), RTRIM(m.PRIMARY_RISK_FACTOR)) AS PRIMARY_RISK_FACTOR
     , CONVERT(NVARCHAR(255), RTRIM(m.COUNT_OPEN_CARE_OPPS)) AS COUNT_OPEN_CARE_OPPS
     , CONVERT(NVARCHAR(255), RTRIM(m.INP_ADMITS_LAST_12_MOS)) AS INP_ADMITS_LAST_12_MOS
     , CONVERT(NVARCHAR(255), RTRIM(m.LAST_INP_DISCHARGE)) AS LAST_INP_DISCHARGE
     , CONVERT(NVARCHAR(255), RTRIM(m.POST_DISCHARGE_FUP_VISIT)) AS POST_DISCHARGE_FUP_VISIT
     , CONVERT(NVARCHAR(255), RTRIM(m.INP_FUP_WITHIN_7_DAYS)) AS INP_FUP_WITHIN_7_DAYS
     , CONVERT(NVARCHAR(255), RTRIM(m.ER_VISITS_LAST_12_MOS)) AS ER_VISITS_LAST_12_MOS
     , CONVERT(NVARCHAR(255), RTRIM(m.LAST_ER_VISIT)) AS LAST_ER_VISIT
     , CONVERT(NVARCHAR(255), RTRIM(m.POST_ER_FUP_VISIT)) AS POST_ER_FUP_VISIT
     , CONVERT(NVARCHAR(255), RTRIM(m.ER_FUP_WITHIN_7_DAYS)) AS ER_FUP_WITHIN_7_DAYS
     , CONVERT(NVARCHAR(255), RTRIM(m.LAST_PCP_VISIT)) AS LAST_PCP_VISIT
     , CONVERT(NVARCHAR(255), RTRIM(m.LAST_PCP_PRACTICE_SEEN)) AS LAST_PCP_PRACTICE_SEEN
     , CONVERT(NVARCHAR(255), RTRIM(m.LAST_BH_VISIT)) AS LAST_BH_VISIT
     , CONVERT(NVARCHAR(255), RTRIM(m.LAST_BH_PRACTICE_SEEN)) AS LAST_BH_PRACTICE_SEEN
     , CONVERT(NVARCHAR(255), RTRIM(m.TOTAL_COSTS_LAST_12_MOS)) AS TOTAL_COSTS_LAST_12_MOS
     , CONVERT(NVARCHAR(255), RTRIM(m.INP_COSTS_LAST_12_MOS)) AS INP_COSTS_LAST_12_MOS
     , CONVERT(NVARCHAR(255), RTRIM(m.ER_COSTS_LAST_12_MOS)) AS ER_COSTS_LAST_12_MOS
     , CONVERT(NVARCHAR(255), RTRIM(m.OUTP_COSTS_LAST_12_MOS)) AS OUTP_COSTS_LAST_12_MOS
     , CONVERT(NVARCHAR(255), RTRIM(m.PHARMACY_COSTS_LAST_12_MOS)) AS PHARMACY_COSTS_LAST_12_MOS
     , CONVERT(NVARCHAR(255), RTRIM(m.PRIMARY_CARE_COSTS_LAST_12_MOS)) AS PRIMARY_CARE_COSTS_LAST_12_MOS
     , CONVERT(NVARCHAR(255), RTRIM(m.BEHAVIORAL_COSTS_LAST_12_MOS)) AS BEHAVIORAL_COSTS_LAST_12_MOS
     , CONVERT(NVARCHAR(255), RTRIM(m.OTHER_OFFICE_COSTS_LAST_12_MOS)) AS OTHER_OFFICE_COSTS_LAST_12_MOS
     , CONVERT(NVARCHAR(255), RTRIM(m.NEXT_PREVENTATIVE_VISIT_DUE)) AS NEXT_PREVENTATIVE_VISIT_DUE
    , ACE_ID  
    , m.carrier_Member_ID 
    , l.ClientKey
FROM ACDW_CLMS_SHCN_BCBS.dbo.vw_EXP_AH_Membership m
    join lst.List_Client l ON m.CLIENT_ID = l.CS_Export_LobName
UNION
SELECT  -- ACECAREDW  members
       CONVERT(NVARCHAR(255), RTRIM(m.MEMBER_ID)) AS Member_ID
     , l.CS_Export_LobName as CLIENT_ID
     , CONVERT(NVARCHAR(255), RTRIM(m.MEDICAID_ID)) AS MEDICAID_ID
     , CONVERT(NVARCHAR(255), RTRIM(m.MEMBER_FIRST_NAME)) AS MEMBER_FIRST_NAME
     , CONVERT(NVARCHAR(255), RTRIM(m.MEMBER_MI)) AS MEMBER_MI
     , CONVERT(NVARCHAR(255), RTRIM(m.MEMBER_LAST_NAME)) AS MEMBER_LAST_NAME
     , CONVERT(NVARCHAR(255), RTRIM(m.DATE_OF_BIRTH)) AS DATE_OF_BIRTH
     , CONVERT(NVARCHAR(255), RTRIM(m.MEMBER_GENDER)) AS MEMBER_GENDER
     , CONVERT(NVARCHAR(255), RTRIM(m.HOME_ADDRESS)) AS HOME_ADDRESS
     , CONVERT(NVARCHAR(255), RTRIM(m.HOME_CITY)) AS HOME_CITY
     , CONVERT(NVARCHAR(255), RTRIM(m.HOME_STATE)) AS HOME_STATE
     , CONVERT(NVARCHAR(255), RTRIM(m.HOME_ZIPCODE)) AS HOME_ZIPCODE
     , CONVERT(NVARCHAR(255), RTRIM(m.MAILING_ADDRESS)) AS MAILING_ADDRESS
     , CONVERT(NVARCHAR(255), RTRIM(m.MAILING_CITY)) AS MAILING_CITY
     , CONVERT(NVARCHAR(255), RTRIM(m.MAILING_STATE)) AS MAILING_STATE
     , CONVERT(NVARCHAR(255), RTRIM(m.MAILING_ZIP)) AS MAILING_ZIP
     , CONVERT(NVARCHAR(255), RTRIM(m.HOME_PHONE)) AS HOME_PHONE
     , CONVERT(NVARCHAR(255), RTRIM(m.ADDITIONAL_PHONE)) AS ADDITIONAL_PHONE
     , CONVERT(NVARCHAR(255), RTRIM(m.CELL_PHONE)) AS CELL_PHONE
     , CONVERT(NVARCHAR(255), RTRIM(m.Language)) AS Language
     , CONVERT(NVARCHAR(255), RTRIM(m.Ethnicity)) AS Ethnicity
	, CONVERT(NVARCHAR(255), RTRIM(LTRIM(m.Race))) AS Race
	, CONVERT(NVARCHAR(255), RTRIM(LTRIM(m.Email))) AS Email
     , CONVERT(NVARCHAR(255), RTRIM(m.MEDICARE_ID)) AS MEDICARE_ID
     , CONVERT(NVARCHAR(255), RTRIM(m.MEMBER_ORG_EFF_DATE)) AS MEMBER_ORG_EFF_DATE
     , CONVERT(NVARCHAR(255), RTRIM(m.MEMBER_CONT_EFF_DATE)) AS MEMBER_CONT_EFF_DATE
     , CONVERT(NVARCHAR(255), RTRIM(m.MEMBER_CUR_EFF_DATE)) AS MEMBER_CUR_EFF_DATE
     , CONVERT(NVARCHAR(255), RTRIM(m.MEMBER_CUR_TERM_DATE)) AS MEMBER_CUR_TERM_DATE
     , CONVERT(NVARCHAR(255), RTRIM(m.RESP_FIRST_NAME)) AS RESP_FIRST_NAME
     , CONVERT(NVARCHAR(255), RTRIM(m.RESP_LAST_NAME)) AS RESP_LAST_NAME
     , CONVERT(NVARCHAR(255), RTRIM(m.RESP_RELATIONSHIP)) AS RESP_RELATIONSHIP
     , CONVERT(NVARCHAR(255), RTRIM(m.RESP_ADDRESS)) AS RESP_ADDRESS
     , CONVERT(NVARCHAR(255), RTRIM(m.RESP_ADDRESS2)) AS RESP_ADDRESS2
     , CONVERT(NVARCHAR(255), RTRIM(m.RESP_CITY)) AS RESP_CITY
     , CONVERT(NVARCHAR(255), RTRIM(m.RESP_STATE)) AS RESP_STATE
     , CONVERT(NVARCHAR(255), RTRIM(m.RESP_ZIP)) AS RESP_ZIP
     , CONVERT(NVARCHAR(255), RTRIM(m.RESP_PHONE)) AS RESP_PHONE
     , CONVERT(NVARCHAR(255), RTRIM(m.PRIMARY_RISK_FACTOR)) AS PRIMARY_RISK_FACTOR
     , CONVERT(NVARCHAR(255), RTRIM(m.COUNT_OPEN_CARE_OPPS)) AS COUNT_OPEN_CARE_OPPS
     , CONVERT(NVARCHAR(255), RTRIM(m.INP_ADMITS_LAST_12_MOS)) AS INP_ADMITS_LAST_12_MOS
     , CONVERT(NVARCHAR(255), RTRIM(m.LAST_INP_DISCHARGE)) AS LAST_INP_DISCHARGE
     , CONVERT(NVARCHAR(255), RTRIM(m.POST_DISCHARGE_FUP_VISIT)) AS POST_DISCHARGE_FUP_VISIT
     , CONVERT(NVARCHAR(255), RTRIM(m.INP_FUP_WITHIN_7_DAYS)) AS INP_FUP_WITHIN_7_DAYS
     , CONVERT(NVARCHAR(255), RTRIM(m.ER_VISITS_LAST_12_MOS)) AS ER_VISITS_LAST_12_MOS
     , CONVERT(NVARCHAR(255), RTRIM(m.LAST_ER_VISIT)) AS LAST_ER_VISIT
     , CONVERT(NVARCHAR(255), RTRIM(m.POST_ER_FUP_VISIT)) AS POST_ER_FUP_VISIT
     , CONVERT(NVARCHAR(255), RTRIM(m.ER_FUP_WITHIN_7_DAYS)) AS ER_FUP_WITHIN_7_DAYS
     , CONVERT(NVARCHAR(255), RTRIM(m.LAST_PCP_VISIT)) AS LAST_PCP_VISIT
     , CONVERT(NVARCHAR(255), RTRIM(m.LAST_PCP_PRACTICE_SEEN)) AS LAST_PCP_PRACTICE_SEEN
     , CONVERT(NVARCHAR(255), RTRIM(m.LAST_BH_VISIT)) AS LAST_BH_VISIT
     , CONVERT(NVARCHAR(255), RTRIM(m.LAST_BH_PRACTICE_SEEN)) AS LAST_BH_PRACTICE_SEEN
     , CONVERT(NVARCHAR(255), RTRIM(m.TOTAL_COSTS_LAST_12_MOS)) AS TOTAL_COSTS_LAST_12_MOS
     , CONVERT(NVARCHAR(255), RTRIM(m.INP_COSTS_LAST_12_MOS)) AS INP_COSTS_LAST_12_MOS
     , CONVERT(NVARCHAR(255), RTRIM(m.ER_COSTS_LAST_12_MOS)) AS ER_COSTS_LAST_12_MOS
     , CONVERT(NVARCHAR(255), RTRIM(m.OUTP_COSTS_LAST_12_MOS)) AS OUTP_COSTS_LAST_12_MOS
     , CONVERT(NVARCHAR(255), RTRIM(m.PHARMACY_COSTS_LAST_12_MOS)) AS PHARMACY_COSTS_LAST_12_MOS
     , CONVERT(NVARCHAR(255), RTRIM(m.PRIMARY_CARE_COSTS_LAST_12_MOS)) AS PRIMARY_CARE_COSTS_LAST_12_MOS
     , CONVERT(NVARCHAR(255), RTRIM(m.BEHAVIORAL_COSTS_LAST_12_MOS)) AS BEHAVIORAL_COSTS_LAST_12_MOS
     , CONVERT(NVARCHAR(255), RTRIM(m.OTHER_OFFICE_COSTS_LAST_12_MOS)) AS OTHER_OFFICE_COSTS_LAST_12_MOS
     , CONVERT(NVARCHAR(255), RTRIM(m.NEXT_PREVENTATIVE_VISIT_DUE)) AS NEXT_PREVENTATIVE_VISIT_DUE
    , ACE_ID  
    , m.carrier_Member_ID 
    , l.ClientKey
FROM ACECAREDW.dbo.vw_AH_WC_Membership m
    join lst.List_Client l ON m.CLIENT_ID = l.CS_Export_LobName

