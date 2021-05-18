﻿CREATE TABLE [adi].[NtfWlcTxCensus] (
    [ntfWlcTxCensusUrn]     INT           IDENTITY (1, 1) NOT NULL,
    [OriginalFileName]      VARCHAR (100) NOT NULL,
    [SourceFileName]        VARCHAR (100) NOT NULL,
    [LoadDate]              DATE          NOT NULL,
    [CreatedDate]           DATETIME      CONSTRAINT [DF_adiNtfWlcTxCensus_CreatedDate] DEFAULT (getdate()) NOT NULL,
    [CreatedBy]             VARCHAR (50)  CONSTRAINT [DF_adiNtfWlcTxCensus_CreatedBy] DEFAULT (suser_sname()) NOT NULL,
    [ATH]                   VARCHAR (20)  NULL,
    [LAST_NAME]             VARCHAR (65)  NULL,
    [FIRST_NAME]            VARCHAR (65)  NULL,
    [DOB]                   DATE          NULL,
    [SUBSCRIBER_ID]         VARCHAR (50)  NULL,
    [CMCD]                  VARCHAR (50)  NULL,
    [LOB]                   CHAR (5)      NULL,
    [FACILITY]              VARCHAR (100) NULL,
    [ATTENDING]             VARCHAR (150) NULL,
    [AD_DATE]               DATE          NULL,
    [DIS_DATE]              DATE          NULL,
    [DIAGNOSIS]             VARCHAR (200) NULL,
    [AUTH_DAYS]             INT           NULL,
    [AUTH_NO]               VARCHAR (20)  NULL,
    [PCP]                   VARCHAR (200) NULL,
    [DENIAL_DAYS]           INT           NULL,
    [OV]                    CHAR (5)      NULL,
    [IPA]                   VARCHAR (20)  NULL,
    [SERVICE_DETAILS_NOTES] VARCHAR (200) NULL,
    [DIAG_CODE]             VARCHAR (50)  NULL,
    [DIAG_TEXT]             VARCHAR (500) NULL,
    PRIMARY KEY CLUSTERED ([ntfWlcTxCensusUrn] ASC)
);
