﻿CREATE TABLE [adi].[mbrUhcMbrByProvider] (
    [UHCMbrMbrByProviderKey]        INT             IDENTITY (1, 1) NOT NULL,
    [loadDate]                      DATE            NOT NULL,
    [DataDate]                      DATE            NOT NULL,
    [OriginalFileName]              VARCHAR (100)   NULL,
    [SrcFileName]                   VARCHAR (100)   NULL,
    [CreatedDate]                   DATETIME2 (7)   CONSTRAINT [Df_mbrUhcMbrByProvider_CreateDate] DEFAULT (getdate()) NOT NULL,
    [CreatedBy]                     VARCHAR (50)    CONSTRAINT [Df_mbrUhcMbrByProvider_CreateBy] DEFAULT (suser_sname()) NOT NULL,
    [LastUpdatedDate]               DATETIME2 (7)   CONSTRAINT [DF_mbrUhcMbrByProvider_LastUpdatedDate] DEFAULT (getdate()) NOT NULL,
    [LastUpdatedBy]                 VARCHAR (50)    CONSTRAINT [DF_mbrUhcMbrByProvider_LastUpdatedBy] DEFAULT (suser_sname()) NOT NULL,
    [PLAN_DESC]                     VARCHAR (50)    NULL,
    [MEMB_FIRST_NAME]               VARCHAR (50)    NULL,
    [MEMB_LAST_NAME]                VARCHAR (50)    NULL,
    [SUBSCRIBER_ID]                 VARCHAR (50)    NULL,
    [MEDICAID_NO]                   VARCHAR (20)    NULL,
    [MEDICARE_NO]                   VARCHAR (20)    NULL,
    [SOCIAL_SEC_NO]                 VARCHAR (12)    NULL,
    [AGE]                           TINYINT         NULL,
    [DATE_OF_BIRTH]                 DATE            NULL,
    [MEMB_GENDER]                   VARCHAR (10)    NULL,
    [MEMB_LANGUAGE]                 VARCHAR (50)    NULL,
    [MEMB_ADDRESS_LINE_1]           VARCHAR (50)    NULL,
    [MEMB_ADDRESS_LINE_2]           VARCHAR (50)    NULL,
    [MEMB_CITY]                     VARCHAR (50)    NULL,
    [MEMB_STATE]                    VARCHAR (50)    NULL,
    [MEMB_ZIP]                      VARCHAR (10)    NULL,
    [HOME_PHONE_NUMBER]             VARCHAR (12)    NULL,
    [BUS_PHONE_NUMBER]              VARCHAR (12)    NULL,
    [PCP_EFFECTIVE_DATE]            VARCHAR (50)    NULL,
    [PCP_TERM_DATE]                 DATE            NULL,
    [PLAN_CODE]                     VARCHAR (50)    NULL,
    [PROVIDER_ID]                   VARCHAR (50)    NULL,
    [PROV_FNAME]                    VARCHAR (50)    NULL,
    [PROV_LNAME]                    VARCHAR (50)    NULL,
    [PROV_PHONE]                    VARCHAR (12)    NULL,
    [PROV_ADDRESS_LINE_1]           VARCHAR (50)    NULL,
    [PROV_ADDRESS_LINE_2]           VARCHAR (50)    NULL,
    [PROV_CITY]                     VARCHAR (50)    NULL,
    [PROV_STATE]                    VARCHAR (50)    NULL,
    [PROV_ZIP]                      VARCHAR (10)    NULL,
    [PROV_EFF_DATE]                 DATE            NULL,
    [PROV_TERM_DATE]                DATE            NULL,
    [IRS_TAX_ID]                    VARCHAR (20)    NULL,
    [PAYEE_NAME]                    VARCHAR (50)    NULL,
    [VENDOR_ID]                     VARCHAR (20)    NULL,
    [LINE_OF_BUSINESS]              VARCHAR (50)    NULL,
    [MEMB_ETHNICITY]                VARCHAR (20)    NULL,
    [PANEL_ID]                      VARCHAR (50)    NULL,
    [COSMOS_CUST_SEG]               VARCHAR (20)    NULL,
    [COSMOS_CUST_SEG_DESC]          VARCHAR (100)   NULL,
    [PROV_LANG_1]                   VARCHAR (50)    NULL,
    [PROV_LANG_2]                   VARCHAR (50)    NULL,
    [PROV_LANG_3]                   VARCHAR (50)    NULL,
    [PLANPROGCONTTYPE]              VARCHAR (50)    NULL,
    [LAST_PCP_VISIT_DATE]           DATE            NULL,
    [LAST_PCP_VISIT_DAYS_BACK]      VARCHAR (10)    NULL,
    [LAST_PCP_VISIT_NPI]            VARCHAR (10)    NULL,
    [LAST_PCP_VISIT_TIN]            VARCHAR (9)     NULL,
    [LAST_PCP_VISIT_ASSIGN_OR_ATTR] VARCHAR (50)    NULL,
    [LAST_PCP_VISIT_PROV_TYPE]      VARCHAR (20)    NULL,
    [LAST_PCP_VISIT_PAR]            VARCHAR (50)    NULL,
    [CURRENT_EFFECTIVE_DATE]        DATE            NULL,
    [CONT_EFFECTIVE_DATE]           DATE            NULL,
    [ORIGINAL_EFFECTIVE_DATE]       DATE            NULL,
    [LIST_FLAG]                     VARCHAR (20)    NULL,
    [AUTO_ASSIGNED]                 VARCHAR (10)    NULL,
    [MbrLoadStatus]                 CHAR (1)        CONSTRAINT [DF_mbrUhcMbrByProvider_MbrLoadStatus] DEFAULT ((0)) NOT NULL,
    [IPRO_Risk_Score]               DECIMAL (10, 4) NULL,
    CONSTRAINT [PK_mbrUhcMbrByProvider] PRIMARY KEY CLUSTERED ([UHCMbrMbrByProviderKey] ASC)
);

