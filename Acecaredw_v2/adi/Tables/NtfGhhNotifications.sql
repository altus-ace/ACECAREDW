﻿CREATE TABLE [adi].[NtfGhhNotifications] (
    [NtfGhhNotificationKey] INT            IDENTITY (1, 1) NOT NULL,
    [DataDate]              DATE           NOT NULL,
    [SrcFileName]           VARCHAR (100)  NOT NULL,
    [CreatedDate]           DATETIME       CONSTRAINT [DF_NtfGhhNotification_CreatedDate] DEFAULT (getdate()) NOT NULL,
    [CreatedBy]             VARCHAR (50)   CONSTRAINT [DF_NtfGhhNotification_CreatedBy] DEFAULT (suser_sname()) NOT NULL,
    [LastUpdatedDate]       DATETIME       CONSTRAINT [DF_NtfGhhNotification_LastUpdatedDate] DEFAULT (getdate()) NOT NULL,
    [LastUpdatedBy]         VARCHAR (50)   CONSTRAINT [DF_NtfGhhNotification_LastUpdatedBy] DEFAULT (suser_sname()) NOT NULL,
    [NotificationID]        INT            NOT NULL,
    [AceID]                 NUMERIC (15)   NULL,
    [AlternateFacilityMRN]  VARCHAR (50)   NULL,
    [AceClientMemberID]     VARCHAR (50)   NULL,
    [EmrID]                 VARCHAR (50)   NULL,
    [NotificationType]      VARCHAR (20)   NULL,
    [EventType]             VARCHAR (10)   NULL,
    [PatientClass]          VARCHAR (50)   NULL,
    [AdmissionType]         VARCHAR (50)   NULL,
    [AdmitDateTime]         DATETIME       NULL,
    [DischargeDateTime]     DATETIME       NULL,
    [DischargedLocation]    VARCHAR (50)   NULL,
    [DischargeDisposition]  VARCHAR (1000) NULL,
    [ChiefComplaint]        VARCHAR (1000) NULL,
    [DiagnosisDescription]  VARCHAR (1000) NULL,
    [DiagnosisCodingMethod] VARCHAR (50)   NULL,
    [DiagnosisCode]         VARCHAR (100)  NULL,
    [DiagnosisDateTime]     VARCHAR (50)   NULL,
    [DiagnosisType]         VARCHAR (50)   NULL,
    [AdmitHospital]         VARCHAR (100)  NULL,
    [MessageDateTime]       VARCHAR (50)   NULL,
    [AttendingDoctor]       VARCHAR (50)   NULL,
    [ReferringDoctor]       VARCHAR (50)   NULL,
    [ConsultingDoctor]      VARCHAR (50)   NULL,
    [AdmittingDoctor]       VARCHAR (50)   NULL,
    [PatientVisitID]        VARCHAR (50)   NULL,
    [NewBornBabyIndicator]  VARCHAR (50)   NULL,
    [ReadmissionIndicator]  VARCHAR (50)   NULL,
    [Status]                INT            CONSTRAINT [DF_NtfGhhNtf_Status] DEFAULT ((0)) NULL,
    [AdmitSource]           VARCHAR (6)    NULL,
    [ADTExport]             CHAR (1)       NULL,
    [SendADTDate]           DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([NtfGhhNotificationKey] ASC)
);

