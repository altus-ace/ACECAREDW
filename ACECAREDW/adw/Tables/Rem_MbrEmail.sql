﻿CREATE TABLE [adw].[Rem_MbrEmail] (
    [mbrEmailKey]     INT           NOT NULL,
    [mbrMemberKey]    INT           NOT NULL,
    [mbrLoadKey]      INT           NOT NULL,
    [EffectiveDate]   DATE          NOT NULL,
    [ExpirationDate]  DATE          NOT NULL,
    [EmailType]       INT           NOT NULL,
    [EmailAddress]    VARCHAR (100) NOT NULL,
    [IsPrimary]       TINYINT       NOT NULL,
    [LoadDate]        DATE          NOT NULL,
    [DataDate]        DATE          NOT NULL,
    [CreatedDate]     DATETIME2 (7) NOT NULL,
    [CreatedBy]       VARCHAR (50)  NOT NULL,
    [LastUpdatedDate] DATETIME2 (7) NOT NULL,
    [LastUpdatedBy]   VARCHAR (50)  NOT NULL,
    [RemDate]         DATETIME      DEFAULT (getdate()) NOT NULL,
    [RemUser]         VARCHAR (25)  DEFAULT (suser_sname()) NOT NULL,
    [RemReason]       VARCHAR (255) NOT NULL,
    [RemKey]          INT           IDENTITY (1, 1) NOT NULL,
    PRIMARY KEY CLUSTERED ([RemKey] ASC)
);

