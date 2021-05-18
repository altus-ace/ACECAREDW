﻿CREATE TABLE [adi].[NtfAetMaTxDlyCensus] (
    [NtfAetDlyCensusKey]              INT           IDENTITY (1, 1) NOT NULL,
    [OriginalFileName]                VARCHAR (100) NOT NULL,
    [SourceFileName]                  VARCHAR (100) NOT NULL,
    [LoadDate]                        DATE          NOT NULL,
    [DataDate]                        DATE          NOT NULL,
    [CreatedDate]                     DATE          CONSTRAINT [DF_NtfAetTxMaDlyCensusN_CreatedDate] DEFAULT (getdate()) NOT NULL,
    [CreatedBy]                       VARCHAR (50)  CONSTRAINT [DF_NtfAetTxMaDlyCensusN_CreatedBy] DEFAULT (suser_sname()) NULL,
    [CarrierName]                     VARCHAR (100) NULL,
    [ACOName]                         VARCHAR (50)  NULL,
    [ACOAttributed Provider Name]     VARCHAR (150) NULL,
    [NPINumber]                       VARCHAR (12)  NULL,
    [ACOAttributed Provider Address1] VARCHAR (75)  NULL,
    [ACOAttributed Provider Address2] VARCHAR (75)  NULL,
    [ACOAttributed Provider City]     VARCHAR (40)  NULL,
    [ACOAttributed Provider State]    VARCHAR (20)  NULL,
    [ACOAttributed Provider Zipcode]  VARCHAR (12)  NULL,
    [ACOAttributed Provider Phone]    VARCHAR (25)  NULL,
    [Attr Provider Group]             VARCHAR (50)  NULL,
    [MemberLastName]                  VARCHAR (65)  NULL,
    [MemberFirstName]                 VARCHAR (65)  NULL,
    [DwMemberID]                      VARCHAR (50)  NULL,
    [CumbID]                          VARCHAR (50)  NULL,
    [CardID]                          VARCHAR (50)  NULL,
    [CardIdSeqNo]                     VARCHAR (50)  NULL,
    [DateOfBirth]                     DATE          NULL,
    [PulseScore]                      VARCHAR (50)  NULL,
    [Status]                          VARCHAR (50)  NULL,
    [MemberPhone]                     VARCHAR (25)  NULL,
    [AcoAttributionEffectiveDate]     DATE          NULL,
    [AcoAttributionEndDate]           DATE          NULL,
    [MemberTerminationDate]           DATE          NULL,
    [LineOfBusiness]                  VARCHAR (50)  NULL,
    [Product]                         VARCHAR (50)  NULL,
    [PlanSponsorName]                 VARCHAR (50)  NULL,
    [PlanSponsorControl]              VARCHAR (50)  NULL,
    [AdmitPotentiallyAvoidable]       VARCHAR (50)  NULL,
    [PME Number]                      VARCHAR (50)  NULL,
    [EventType]                       VARCHAR (50)  NULL,
    [EventStageStatus]                VARCHAR (50)  NULL,
    [Is Readmit]                      VARCHAR (50)  NULL,
    [Has Readmit]                     VARCHAR (50)  NULL,
    [StayType]                        VARCHAR (50)  NULL,
    [AdmissionType]                   VARCHAR (50)  NULL,
    [NotificationDate]                DATE          NULL,
    [ExpectedAdmitDate]               DATE          NULL,
    [ActualAdmitDate]                 DATE          NULL,
    [ExpectedDischargeDate]           DATE          NULL,
    [ActualDischargeDate]             DATE          NULL,
    [Lenghth of Stay]                 VARCHAR (10)  NULL,
    [DischargeDisposition]            VARCHAR (255) NULL,
    [DiagnosisCode]                   VARCHAR (15)  NULL,
    [DiagnosisDescription]            VARCHAR (255) NULL,
    [OtherComorbidDiagnosis1]         VARCHAR (15)  NULL,
    [OtherComorbidDiagnosis2]         VARCHAR (15)  NULL,
    [ProcedureCode]                   VARCHAR (15)  NULL,
    [ProcedureDescription]            VARCHAR (255) NULL,
    [ProcedureStart Date]             DATE          NULL,
    [ProviderName/Role]               VARCHAR (255) NULL,
    [FacilityName/Role]               VARCHAR (255) NULL,
    [FacilityAddress]                 VARCHAR (100) NULL,
    [Readmission Predictor]           VARCHAR (50)  NULL,
    [CMS Contract#]                   VARCHAR (50)  NULL,
    [filler1]                         VARCHAR (50)  NULL,
    [filler2]                         VARCHAR (50)  NULL,
    [filler3]                         VARCHAR (50)  NULL,
    [filler4]                         VARCHAR (50)  NULL,
    [filler5]                         VARCHAR (50)  NULL,
    [RowStatus]                       TINYINT       CONSTRAINT [DF_NotficationExported] DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([NtfAetDlyCensusKey] ASC)
);
