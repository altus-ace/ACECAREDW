﻿CREATE TABLE [adi].[copUhcPcorMbrMeasureView] (
    [copUhcPcorKey]        INT           IDENTITY (1, 1) NOT NULL,
    [loadDate]             DATE          NOT NULL,
    [DataDate]             DATE          NOT NULL,
    [OriginalFileName]     VARCHAR (100) NULL,
    [SrcFileName]          VARCHAR (100) NULL,
    [CreatedDate]          DATETIME2 (7) CONSTRAINT [DF_CopUhcPcorMbrMeasureView_CreatedDate] DEFAULT (getdate()) NOT NULL,
    [CreatedBy]            VARCHAR (50)  CONSTRAINT [DF_CopUhcPcorMbrMeasureView_CreatedBy] DEFAULT (suser_sname()) NOT NULL,
    [LastUpdatedDate]      DATETIME2 (7) CONSTRAINT [DF_CopUhcPcorMbrMeasureView_LastUpdatedDate] DEFAULT (getdate()) NOT NULL,
    [LastUpdatedBy]        VARCHAR (50)  CONSTRAINT [DF_CopUhcPcorMbrMeasureView_LastUpdatedBy] DEFAULT (suser_sname()) NOT NULL,
    [IncentiveProgram]     VARCHAR (20)  NULL,
    [Category]             VARCHAR (20)  NULL,
    [HealthPlan]           VARCHAR (10)  NULL,
    [LOB]                  VARCHAR (100) NULL,
    [MeasureCode]          VARCHAR (10)  NULL,
    [MeasureDesc]          VARCHAR (120) NULL,
    [SubMeasure]           VARCHAR (100) NULL,
    [Bucket]               VARCHAR (10)  NULL,
    [Compliant]            VARCHAR (10)  NULL,
    [MemberID]             VARCHAR (50)  NULL,
    [FirstName]            VARCHAR (35)  NULL,
    [LastName]             VARCHAR (35)  NULL,
    [DOB]                  DATE          NULL,
    [Phone]                VARCHAR (35)  NULL,
    [MemberAddress]        VARCHAR (75)  NULL,
    [City]                 VARCHAR (35)  NULL,
    [State]                VARCHAR (25)  NULL,
    [Zip]                  VARCHAR (14)  NULL,
    [BaseEventEpisodeDate] DATE          NULL,
    [DateOfLastService]    DATE          NULL,
    [Physician]            VARCHAR (50)  NULL,
    [PhysicianAddress]     VARCHAR (100) NULL,
    PRIMARY KEY CLUSTERED ([copUhcPcorKey] ASC)
);

