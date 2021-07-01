﻿CREATE TABLE [dbo].[z_UHC_IPDischarges] (
    [URN]                INT           IDENTITY (1, 1) NOT NULL,
    [CASEID]             VARCHAR (255) NULL,
    [EFF_ADMIT_DATE]     DATE          NULL,
    [CONFIRM_DISC_DATE]  DATE          NULL,
    [LOS]                VARCHAR (255) NULL,
    [DISC_DISPO]         VARCHAR (255) NULL,
    [FU_VISIT_DUE_DATE]  DATE          NULL,
    [SCH_VISIT_DATE]     VARCHAR (255) NULL,
    [MEMBER_AGE]         VARCHAR (255) NULL,
    [ADM_HOSP]           VARCHAR (255) NULL,
    [DIAG_DESC]          VARCHAR (255) NULL,
    [DIAG_CODE]          VARCHAR (255) NULL,
    [LAST_INP_DISCHARGE] DATE          NULL,
    [PAYOR]              VARCHAR (255) NULL,
    [MEMBER_FIRST_NAME]  VARCHAR (255) NULL,
    [MEMBER_LAST_NAME]   VARCHAR (255) NULL,
    [DATE_OF_BIRTH]      DATE          NULL,
    [MEMBER_PHONE]       VARCHAR (255) NULL,
    [ASSIGN_PCP_NAME]    VARCHAR (255) NULL,
    [ASSIGN_PCP_ADDRESS] VARCHAR (255) NULL,
    [ASSIGN_PCP_CITY]    VARCHAR (255) NULL,
    [ASSIGN_PCP_ST]      VARCHAR (255) NULL,
    [ASSIGN_PCP_ZIP]     VARCHAR (255) NULL,
    [PCP_PRACTICE_TIN]   VARCHAR (255) NULL,
    [PCP_PRACTICE_NAME]  VARCHAR (255) NULL,
    [UHC_SUBSCRIBER_ID]  VARCHAR (255) NULL,
    [LINE_OF_BUSINESS]   VARCHAR (255) NULL,
    [A_LAST_UPDATE_DATE] DATE          DEFAULT (getdate()) NULL,
    [A_LAST_UPDATE_BY]   VARCHAR (255) DEFAULT ('PKG Import') NULL,
    [A_LAST_UPDATE_FLAG] VARCHAR (1)   DEFAULT ('Y') NULL
);
