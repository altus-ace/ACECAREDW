﻿CREATE TABLE [adi].[MbrUhcMicroIncentives] (
    [MbrUhcMicroIncentiveKey]  INT           IDENTITY (1, 1) NOT NULL,
    [GRGR_ID]                  VARCHAR (10)  NULL,
    [GRGR_NAME]                VARCHAR (35)  NULL,
    [SGSG_ID]                  VARCHAR (10)  NULL,
    [SGSG_NAME]                VARCHAR (35)  NULL,
    [MEDICAID_NUMBER]          VARCHAR (10)  NULL,
    [MeasureAndLob]            VARCHAR (20)  NULL,
    [MEMBER_LAST_NAME]         VARCHAR (100) NULL,
    [MEMBER_FIRST_NAME]        VARCHAR (100) NULL,
    [MEMBER_MIDDLE_INITIAL]    VARCHAR (100) NULL,
    [ADDRESS_LINE_1]           VARCHAR (100) NULL,
    [ADDRESS_LINE_2]           VARCHAR (100) NULL,
    [CITY]                     VARCHAR (65)  NULL,
    [STATE]                    VARCHAR (25)  NULL,
    [ZIP_CODE]                 VARCHAR (15)  NULL,
    [HOME_PHONE_NUMBER]        VARCHAR (25)  NULL,
    [COUNTY]                   VARCHAR (65)  NULL,
    [SBAD_MAIL_ADDR1]          VARCHAR (100) NULL,
    [SBAD_MAIL_ADDR2]          VARCHAR (100) NULL,
    [SBAD_MAIL_CITY]           VARCHAR (65)  NULL,
    [SBAD_MAIL_STATE]          VARCHAR (25)  NULL,
    [SBAD_MAIL_ZIP]            VARCHAR (15)  NULL,
    [MEDICARE_NUMBER]          VARCHAR (15)  NULL,
    [SUBSCRIBER_ID]            VARCHAR (50)  NOT NULL,
    [PROVIDER_ID]              VARCHAR (20)  NULL,
    [PROVIDER_FIRST_NAME]      VARCHAR (100) NULL,
    [PROVIDER_MIDDLE_INITIAL]  VARCHAR (100) NULL,
    [PROVIDER_LAST_NAME]       VARCHAR (100) NULL,
    [MANUAL_ASSIGNMENT_REASON] VARCHAR (10)  NULL,
    [NETWORK_ID]               VARCHAR (20)  NULL,
    [NETWORK_NAME]             VARCHAR (50)  NULL,
    [GENDER]                   VARCHAR (5)   NULL,
    [EFFECTIVE_DATE]           DATE          NULL,
    [TERMINATION_DATE]         DATE          NULL,
    [PLAN_ID]                  VARCHAR (20)  NULL,
    [PLAN_DESC]                VARCHAR (100) NULL,
    [PRODUCT_ID]               VARCHAR (20)  NULL,
    [PRODUCT_DESC]             VARCHAR (100) NULL,
    [RELATIONSHIP_CODE]        VARCHAR (10)  NULL,
    [DATE_OF_BIRTH]            DATE          NULL,
    [LANGUAGE_CODE]            VARCHAR (10)  NULL,
    [RESP_PERSON_LAST_NAME]    VARCHAR (100) NULL,
    [RESP_PERSON_FIRST_NAME]   VARCHAR (100) NULL,
    [RESP_PERSON_ID]           VARCHAR (50)  NULL,
    [RESP_PERSON_ADDRESS_1]    VARCHAR (100) NULL,
    [RESP_PERSON_ADDRESS_2]    VARCHAR (100) NULL,
    [RESP_PERSON_CITY]         VARCHAR (65)  NULL,
    [RESP_PERSON_STATE]        VARCHAR (25)  NULL,
    [RESP_PERSON_ZIP_CODE]     VARCHAR (15)  NULL,
    [RESP_PERSON_PHONE_NUMBER] VARCHAR (25)  NULL,
    [PLAN_CODE]                VARCHAR (10)  NULL,
    [RECERTIFICATION_DATE]     DATE          NULL,
    [ETHNICITY]                VARCHAR (10)  NULL,
    [ETHNICITY_DESC]           VARCHAR (25)  NULL,
    [FAMILY_LINK]              VARCHAR (20)  NULL,
    [TRANSACTION_TYPE]         VARCHAR (20)  NULL,
    [CONTRACT]                 VARCHAR (20)  NULL,
    [PBP]                      VARCHAR (10)  NULL,
    [ORIGINAL_EFFECTIVE_DATE]  DATE          NULL,
    [loadDate]                 DATE          NOT NULL,
    [DataDate]                 DATE          NOT NULL,
    [SrcFileName]              VARCHAR (100) NOT NULL,
    [CreatedDate]              DATETIME2 (7) CONSTRAINT [DF_adiMbrUhcMicroIncentive_CreatedDate] DEFAULT (getdate()) NOT NULL,
    [CreatedBy]                VARCHAR (50)  CONSTRAINT [DF_adiMbrUhcMicroIncentive_CreatedBy] DEFAULT (suser_sname()) NOT NULL,
    [LastUpdatedDate]          DATETIME2 (7) CONSTRAINT [DF_adiMbrUhcMicroIncentive_LastUpdatedDate] DEFAULT (getdate()) NOT NULL,
    [LastUpdatedBy]            VARCHAR (50)  CONSTRAINT [DF_adiMbrUhcMicroIncentive_LastUpdatedBy] DEFAULT (suser_sname()) NOT NULL,
    PRIMARY KEY CLUSTERED ([MbrUhcMicroIncentiveKey] ASC)
);

