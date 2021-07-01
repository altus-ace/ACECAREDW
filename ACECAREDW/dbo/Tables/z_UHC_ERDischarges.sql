﻿CREATE TABLE [dbo].[z_UHC_ERDischarges] (
    [URN]                INT           IDENTITY (1, 1) NOT NULL,
    [ER_ADM_DATE]        DATE          NULL,
    [ER_ADM_TIME]        VARCHAR (255) NULL,
    [ER_DISC_DATE]       DATE          NULL,
    [ER_DISC_TIME]       VARCHAR (255) NULL,
    [FU_VISIT_DUE_DATE]  DATE          NULL,
    [SCH_VISIT_DATE]     VARCHAR (255) NULL,
    [ADMIT_CHIEF_COMP]   VARCHAR (255) NULL,
    [DISC_DISPO]         VARCHAR (255) NULL,
    [ASSUME_STATUS]      VARCHAR (255) NULL,
    [ADM_HOSP]           VARCHAR (255) NULL,
    [PAYOR]              VARCHAR (255) NULL,
    [MEMBER_FIRST_NAME]  VARCHAR (255) NULL,
    [MEMBER_LAST_NAME]   VARCHAR (255) NULL,
    [MEMBER_PHONE]       VARCHAR (255) NULL,
    [MEMBER_AGE]         VARCHAR (255) NULL,
    [DATE_OF_BIRTH]      DATE          NULL,
    [ASSIGN_PCP_NAME]    VARCHAR (255) NULL,
    [ASSIGN_PCP_PHONE]   VARCHAR (255) NULL,
    [ASSIGN_PCP_ADDRESS] VARCHAR (255) NULL,
    [ASSIGN_PCP_CITY]    VARCHAR (255) NULL,
    [ASSIGN_PCP_ST]      VARCHAR (255) NULL,
    [ASSIGN_PCP_ZIP]     VARCHAR (255) NULL,
    [FINAL_APPT_STATUS]  VARCHAR (255) NULL,
    [PCP_PRACTICE_NAME]  VARCHAR (255) NULL,
    [PCP_PRACTICE_TIN]   VARCHAR (255) NULL,
    [UHC_SUBSCRIBER_ID]  VARCHAR (255) NULL,
    [LINE_OF_BUSINESS]   VARCHAR (255) NULL,
    [A_LAST_UPDATE_DATE] DATE          DEFAULT (getdate()) NULL,
    [A_LAST_UPDATE_BY]   VARCHAR (50)  DEFAULT ('PKG Import') NULL,
    [A_LAST_UPDATE_FLAG] VARCHAR (1)   DEFAULT ('Y') NULL
);

