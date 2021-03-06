﻿CREATE TABLE [adi].[MbrGhhMember] (
    [MbrGhhMemberKey]   INT           IDENTITY (1, 1) NOT NULL,
    [DataDate]          DATE          NOT NULL,
    [SrcFileName]       VARCHAR (100) NOT NULL,
    [CreatedDate]       DATETIME      CONSTRAINT [DF_MbrGhhMember_CreatedDate] DEFAULT (getdate()) NOT NULL,
    [CreatedBy]         VARCHAR (50)  CONSTRAINT [DF_MbrGhhMember_CreatedBy] DEFAULT (suser_sname()) NOT NULL,
    [LastUpdatedDate]   DATETIME      CONSTRAINT [DF_MbrGhhMember_LastUpdatedDate] DEFAULT (getdate()) NOT NULL,
    [LastUpdatedBy]     VARCHAR (50)  CONSTRAINT [DF_MbrGhhMember_LastUpdatedBy] DEFAULT (suser_sname()) NOT NULL,
    [AceID]             NUMERIC (15)  NOT NULL,
    [AceClientMemberId] VARCHAR (50)  NOT NULL,
    [EmrID]             VARCHAR (50)  NULL,
    [FirstName]         VARCHAR (65)  NOT NULL,
    [MiddleName]        VARCHAR (65)  NOT NULL,
    [LastName]          VARCHAR (65)  NOT NULL,
    [Gender]            VARCHAR (5)   NOT NULL,
    [DateOfBirth]       DATE          NOT NULL,
    [Medicaid_ID]       VARCHAR (15)  NULL,
    [Medicare_ID]       VARCHAR (15)  NULL,
    [SSN]               VARCHAR (11)  NULL,
    [HomeAddress1]      VARCHAR (100) NULL,
    [HomeAddress2]      VARCHAR (100) NULL,
    [HomeCity]          VARCHAR (65)  NULL,
    [HomeState]         VARCHAR (25)  NULL,
    [HomeZip]           VARCHAR (20)  NULL,
    [HomeZipPlus4]      VARCHAR (20)  NULL,
    [HomePhone]         VARCHAR (30)  NULL,
    [MobilePhone]       VARCHAR (30)  NULL,
    [BusinessPhone]     VARCHAR (30)  NULL,
    [PCP_Practice_TIN]  VARCHAR (11)  NOT NULL,
    [PCP_NPI]           VARCHAR (10)  NOT NULL,
    [Status]            INT           CONSTRAINT [DF_MbrGhhMember_Status] DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([MbrGhhMemberKey] ASC)
);

