﻿CREATE TABLE [dbo].[UHC_Hedis_CareOps] (
    [URN]                   INT           IDENTITY (1, 1) NOT NULL,
    [MEDICAID_ID]           VARCHAR (20)  NULL,
    [MEMBER_LAST_NAME]      VARCHAR (50)  NULL,
    [MEMBER_FIRST_NAME]     VARCHAR (50)  NULL,
    [DATE_OF_BIRTH]         DATE          NULL,
    [CARE_OPP_SHORT_DESC]   VARCHAR (200) NULL,
    [CARE_OPP_LONG_DESC]    VARCHAR (500) NULL,
    [CARE_OPP_VERSION_DATE] DATE          NULL,
    [IPRO_ADMIT_RISK_SCORE] VARCHAR (20)  NULL,
    [UHC_SUBSCRIBER_ID]     VARCHAR (20)  NULL,
    [UHC_UNIQUE_SYSTEM_ID]  VARCHAR (20)  NULL,
    [MEMBER_ADDRESS]        VARCHAR (50)  NULL,
    [MEMBER_CITY]           VARCHAR (50)  NULL,
    [MEMBER_STATE]          VARCHAR (50)  NULL,
    [MEMBER_COUNTY]         VARCHAR (50)  NULL,
    [MEMBER_ZIP]            VARCHAR (20)  NULL,
    [MEMBER_PHONE]          VARCHAR (20)  NULL,
    [PCP_NAME]              VARCHAR (150) NULL,
    [PCP_ADDRESS]           VARCHAR (50)  NULL,
    [PCP_CITY]              VARCHAR (50)  NULL,
    [PCP_STATE]             VARCHAR (50)  NULL,
    [PCP_COUNTY]            VARCHAR (50)  NULL,
    [PCP_ZIP]               VARCHAR (50)  NULL,
    [PCP_PRACTICE_TIN]      VARCHAR (20)  NULL,
    [PCP_PRACTICE_NAME]     VARCHAR (150) NULL,
    [LINE_OF_BUSINESS_DESC] VARCHAR (50)  NULL,
    [PLAN_CODE]             VARCHAR (50)  NULL,
    [PLAN_DESC]             VARCHAR (150) NULL,
    [FILE_GENERATION_DATE]  DATE          NULL,
    [A_LAST_UPDATE_DATE]    DATETIME      DEFAULT (getdate()) NULL,
    [A_LAST_UPDATE_BY]      VARCHAR (50)  NULL,
    [A_LAST_UPDATE_FLAG]    VARCHAR (1)   DEFAULT ('Y') NULL,
    PRIMARY KEY CLUSTERED ([URN] ASC)
);

