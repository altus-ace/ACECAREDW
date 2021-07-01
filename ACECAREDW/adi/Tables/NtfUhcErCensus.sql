﻿CREATE TABLE [adi].[NtfUhcErCensus] (
    [NtfUhcErCensusKey]           INT           IDENTITY (1, 1) NOT NULL,
    [PcpID]                       VARCHAR (15)  NULL,
    [PcpFirstName]                VARCHAR (65)  NULL,
    [PcpLastName]                 VARCHAR (65)  NULL,
    [PatientFirstName]            VARCHAR (65)  NULL,
    [PatientLastName]             VARCHAR (65)  NULL,
    [PatientId]                   VARCHAR (50)  NULL,
    [RosterSubGroup]              VARCHAR (100) NULL,
    [PatientCardID]               VARCHAR (50)  NULL,
    [MemberHealthPlanNumber]      VARCHAR (50)  NULL,
    [PatientBirthDate]            DATE          NULL,
    [PatientGender]               VARCHAR (10)  NULL,
    [PrimaryLanguage]             VARCHAR (20)  NULL,
    [Address]                     VARCHAR (50)  NULL,
    [City]                        VARCHAR (35)  NULL,
    [State]                       VARCHAR (25)  NULL,
    [Zip]                         VARCHAR (12)  NULL,
    [ContactPhoneNumber]          VARCHAR (35)  NULL,
    [AlternativePhoneNumber]      VARCHAR (35)  NULL,
    [LOB]                         VARCHAR (20)  NULL,
    [ServiceDate]                 DATE          NULL,
    [AdmitTime]                   TIME (7)      NULL,
    [DischargeTime]               TIME (7)      NULL,
    [ServiceDateReported]         DATE          NULL,
    [DayOfWeek]                   VARCHAR (10)  NULL,
    [ReOccuranceWithin30Days]     VARCHAR (20)  NULL,
    [AvoidableERVisit]            VARCHAR (50)  NULL,
    [LastIpVisitDate]             VARCHAR (50)  NULL,
    [PrimaryDiagnosisCode]        VARCHAR (20)  NULL,
    [PrimaryDiagnosisDescription] VARCHAR (100) NULL,
    [AttendingPhysicianFirstName] VARCHAR (50)  NULL,
    [AttendingPhysicianLastName]  VARCHAR (50)  NULL,
    [FacilityName]                VARCHAR (100) NULL,
    [FacilityState]               VARCHAR (25)  NULL,
    [PcpNpi]                      VARCHAR (15)  NULL,
    [LoadDate]                    DATE          NOT NULL,
    [DataDate]                    DATE          NOT NULL,
    [SrcFileName]                 VARCHAR (100) NOT NULL,
    [CreatedDate]                 DATETIME      CONSTRAINT [DF_astNtfUchErCensus_CreatedDate] DEFAULT (getdate()) NOT NULL,
    [CreatedBy]                   VARCHAR (50)  CONSTRAINT [DF_astNtfUchErCensus_CreatedBY] DEFAULT (suser_sname()) NOT NULL,
    [LastUpdatedDate]             DATETIME      CONSTRAINT [DF_astNtfUchErCensus_LastUpdatedDate] DEFAULT (getdate()) NOT NULL,
    [LastUpdatedBy]               VARCHAR (50)  CONSTRAINT [DF_astNtfUchErCensus_LastUpdatedBY] DEFAULT (suser_sname()) NOT NULL,
    [AHRQ_Diagnosis_Category]     VARCHAR (50)  NULL,
    [ACSC_HPC]                    VARCHAR (10)  NULL,
    [HAI_POA]                     VARCHAR (10)  NULL,
    [RowStatus]                   INT           CONSTRAINT [DF_astNtfUhcErCensus_RowStatus] DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([NtfUhcErCensusKey] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_NtfUhcErCensus_SrcFileName]
    ON [adi].[NtfUhcErCensus]([SrcFileName] ASC);
