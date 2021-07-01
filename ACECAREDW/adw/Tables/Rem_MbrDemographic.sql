﻿CREATE TABLE [adw].[Rem_MbrDemographic] (
    [mbrDemographicKey] INT           NOT NULL,
    [mbrMemberKey]      INT           NOT NULL,
    [mbrLoadKey]        INT           NOT NULL,
    [EffectiveDate]     DATE          NOT NULL,
    [ExpirationDate]    DATE          NOT NULL,
    [LastName]          VARCHAR (100) NULL,
    [FirstName]         VARCHAR (100) NULL,
    [MiddleName]        VARCHAR (100) NULL,
    [SSN]               VARCHAR (15)  NULL,
    [Gender]            CHAR (5)      NULL,
    [DOB]               DATE          NULL,
    [MedicaidID]        VARCHAR (15)  NULL,
    [HICN]              VARCHAR (11)  NULL,
    [MBI]               VARCHAR (11)  NULL,
    [MedicareID]        VARCHAR (15)  NULL,
    [Ethnicity]         VARCHAR (20)  NULL,
    [Race]              VARCHAR (20)  NULL,
    [PrimaryLanguage]   VARCHAR (20)  NULL,
    [LoadDate]          DATE          NOT NULL,
    [DataDate]          DATE          NOT NULL,
    [CreatedDate]       DATETIME2 (7) NOT NULL,
    [CreatedBy]         VARCHAR (50)  NOT NULL,
    [LastUpdatedDate]   DATETIME2 (7) NOT NULL,
    [LastUpdatedBy]     VARCHAR (50)  NOT NULL,
    [RemDate]           DATETIME      DEFAULT (getdate()) NOT NULL,
    [RemUser]           VARCHAR (25)  DEFAULT (suser_sname()) NOT NULL,
    [RemReason]         VARCHAR (255) NOT NULL,
    [RemKey]            INT           IDENTITY (1, 1) NOT NULL,
    PRIMARY KEY CLUSTERED ([RemKey] ASC)
);
