﻿CREATE VIEW adw.vw_Exp_AH_PE_CareOps
AS 
    SELECT p.CS_Export_LobName, 
       p.PROGRAM_NAME, 
       p.MEMBER_ID, 
       p.ENROLL_DATE, 
       p.CREATE_DATE, 
       p.ENROLL_END_DATE, 
       p.PROGRAM_STATUS, 
       p.REASON_DESCRIPTION, 
       p.REFERAL_TYPE, 
       p.ClientKey
    FROM dbo.vw_AH_PE_UHC_Careopps p;
