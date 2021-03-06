﻿


CREATE VIEW [dbo].[vw_AH_MSSP_Membership]

AS

SELECT   [Member_id],
         [CLIENT_ID],[MEDICAID_ID],
         [MEMBER_FIRST_NAME],
         [MEMBER_MI],
      [MEMBER_LAST_NAME],
[DATE_OF_BIRTH],
[MEMBER_GENDER],
[HOME_ADDRESS],
[HOME_CITY],[HOME_STATE],
[HOME_ZIPCODE],
[MAILING_ADDRESS],
[MAILING_CITY],
[MAILING_STATE],
[MAILING_ZIP],
[HOME_PHONE],
[ADDITIONAL_PHONE],
[CELL_PHONE],
[LANGUAGE],
[Ethnicity],
[Email],
[Race],
[MEDICARE_ID],
[MEMBER_ORG_EFF_DATE],
[MEMBER_CONT_EFF_DATE],
[MEMBER_CUR_EFF_DATE],
[MEMBER_CUR_TERM_DATE],
[RESP_FIRST_NAME],
[RESP_LAST_NAME],
[RESP_RELATIONSHIP],
[RESP_ADDRESS],
[RESP_ADDRESS2],
[RESP_CITY],
[RESP_STATE],
[RESP_ZIP],
[RESP_PHONE],
[PRIMARY_RISK_FACTOR],
[COUNT_OPEN_CARE_OPPS],
[INP_ADMITS_LAST_12_MOS],
[LAST_INP_DISCHARGE],
[POST_DISCHARGE_FUP_VISIT],
[INP_FUP_WITHIN_7_DAYS],
[ER_VISITS_LAST_12_MOS],
[LAST_ER_VISIT],
[POST_ER_FUP_VISIT],
[ER_FUP_WITHIN_7_DAYS],
[LAST_PCP_VISIT],
[LAST_PCP_PRACTICE_SEEN],
[LAST_BH_VISIT],
[LAST_BH_PRACTICE_SEEN],
[TOTAL_COSTS_LAST_12_MOS],
[INP_COSTS_LAST_12_MOS],
[ER_COSTS_LAST_12_MOS],
[OUTP_COSTS_LAST_12_MOS],[PHARMACY_COSTS_LAST_12_MOS],[PRIMARY_CARE_COSTS_LAST_12_MOS],[BEHAVIORAL_COSTS_LAST_12_MOS],
[OTHER_OFFICE_COSTS_LAST_12_MOS],[NEXT_PREVENTATIVE_VISIT_DUE],[ACE_ID],
[Carrier_member_id]


FROM [ACDW_CLMS_SHCN_MSSP].[dbo].[vw_Exp_AH_Membership]
