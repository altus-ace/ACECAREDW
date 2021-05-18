﻿CREATE TABLE [adi].[MbrAetMbrByPcp] (
    [mbrAetMbrByPcpKey] INT            IDENTITY (1, 1) NOT NULL,
    [NPI]               INT            NULL,
    [MSCIndicator]      VARCHAR (3)    NULL,
    [LastName]          VARCHAR (50)   NULL,
    [FirstName]         VARCHAR (50)   NULL,
    [Address]           VARCHAR (225)  NULL,
    [PhoneNumber]       VARCHAR (25)   NULL,
    [HICN]              VARCHAR (20)   NULL,
    [Product]           VARCHAR (10)   NULL,
    [GroupIndicator]    VARCHAR (10)   NULL,
    [TermDate]          DATE           NULL,
    [Gender]            VARCHAR (2)    NULL,
    [DOB]               DATE           NULL,
    [Age]               INT            NULL,
    [PartDInd]          VARCHAR (3)    NULL,
    [CMInd]             VARCHAR (3)    NULL,
    [TIN]               VARCHAR (15)   NULL,
    [Month]             DATE           NULL,
    [PBGNumber]         VARCHAR (20)   NULL,
    [PBGName]           VARCHAR (50)   NULL,
    [SubgroupNumber]    VARCHAR (10)   NULL,
    [SubgroupName]      VARCHAR (50)   NULL,
    [TINName]           VARCHAR (100)  NULL,
    [PhysicianNumber]   VARCHAR (10)   NULL,
    [PhysicianName]     VARCHAR (150)  NULL,
    [PhysicianAddress]  VARCHAR (225)  NULL,
    [SpecialtyCategory] VARCHAR (60)   NULL,
    [Legacy]            VARCHAR (20)   NULL,
    [SRCMemberID]       VARCHAR (20)   NULL,
    [AetSubscriberID]   VARCHAR (25)   NULL,
    [EffectiveDate]     DATE           NULL,
    [RAFactorType]      VARCHAR (10)   NULL,
    [RiskScore]         DECIMAL (5, 2) NULL,
    [PULSEScore]        DECIMAL (5, 2) NULL,
    [SrcFileName]       VARCHAR (150)  NOT NULL,
    [InQuarantine]      TINYINT        CONSTRAINT [DF_adiAetMbrByPcp_InQuarantine] DEFAULT ((0)) NOT NULL,
    [LoadDate]          DATE           NOT NULL,
    [DataDate]          DATE           NOT NULL,
    [CreateDate]        DATETIME2 (7)  CONSTRAINT [Df_adiAetMbrByPcp_CreateDate] DEFAULT (getdate()) NOT NULL,
    [CreateBy]          VARCHAR (50)   CONSTRAINT [Df_adiAetMbrByPcp_CreateBy] DEFAULT (suser_sname()) NOT NULL,
    [LastUpdatedDate]   DATETIME2 (7)  CONSTRAINT [DF_adiAetMbrUhcMbrByPcp_LastUpdatedDate] DEFAULT (getdate()) NOT NULL,
    [LastUpdatedBy]     VARCHAR (50)   CONSTRAINT [DF_astAdiMbrUhcMbrByPcp_LastUpdatedBy] DEFAULT (suser_sname()) NOT NULL,
    CONSTRAINT [PK_adiMbrAetMbrByPcp_mbrAetMbrByPcpKey] PRIMARY KEY CLUSTERED ([mbrAetMbrByPcpKey] ASC),
    CONSTRAINT [Ck_adiAetMbrByPcp_InQuarantine] CHECK ([InQuarantine]=(1) OR [InQuarantine]=(0))
);

