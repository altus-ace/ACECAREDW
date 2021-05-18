﻿CREATE TABLE [ast].[TmpNpiPrData] (
    [loadDate]         DATE           NULL,
    [dd]               DATE           NULL,
    [active]           INT            NOT NULL,
    [RwEffDate]        DATE           NULL,
    [RwExpDate]        DATE           NULL,
    [TIN]              VARCHAR (8000) NULL,
    [calcclientKey]    INT            NOT NULL,
    [LOB]              VARCHAR (8000) NULL,
    [HealthPlan]       VARCHAR (8000) NULL,
    [EffectiveDate]    VARCHAR (8000) NULL,
    [PrvHpExpDate]     DATE           NULL,
    [ClientProviderID] VARCHAR (8000) NULL,
    [NPI]              VARCHAR (8000) NULL,
    [LastName]         VARCHAR (8000) NULL,
    [FirstName]        VARCHAR (8000) NULL,
    [Degree]           VARCHAR (8000) NULL,
    [GroupName]        VARCHAR (8000) NULL,
    [Comments]         VARCHAR (1)    NOT NULL,
    [AccountType]      VARCHAR (8000) NULL,
    [NetworkContact]   VARCHAR (8000) NULL,
    [Chapter]          VARCHAR (8000) NULL,
    [ProviderType]     VARCHAR (8000) NULL,
    [AceProviderID]    VARCHAR (8000) NULL,
    [AceAccountID]     VARCHAR (8000) NULL,
    [ETHNICITY]        VARCHAR (8000) NULL,
    [LANGUAGESSPOKEN]  VARCHAR (8000) NOT NULL,
    [DateOfBirth]      VARCHAR (8000) NULL,
    [Gender]           VARCHAR (8000) NULL,
    [PrimaryCounty]    VARCHAR (8000) NULL
);
