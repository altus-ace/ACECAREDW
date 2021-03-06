﻿CREATE TABLE [adi].[NtfAetComDlyCensus] (
    [ntfAetComNotificationKey]         INT            IDENTITY (1, 1) NOT NULL,
    [SrcFileName]                      VARCHAR (100)  NOT NULL,
    [CreatedDate]                      DATETIME       CONSTRAINT [DF_adiNtfAetComDlyCensus_CreatedDate] DEFAULT (getdate()) NOT NULL,
    [CreatedBy]                        VARCHAR (50)   CONSTRAINT [DF_adiNtfAetComDlyCensus_CreatedBy] DEFAULT (suser_sname()) NOT NULL,
    [Carrier Name]                     VARCHAR (30)   NULL,
    [ACO Name]                         VARCHAR (30)   NULL,
    [ACO Attributed Provider Name]     VARCHAR (100)  NULL,
    [NPI Number]                       VARCHAR (15)   NULL,
    [ACO Attributed Provider Address1] VARCHAR (100)  NULL,
    [ACO Attributed Provider Address2] VARCHAR (100)  NULL,
    [ACO Attributed Provider City]     VARCHAR (35)   NULL,
    [ACO Attributed Provider State]    VARCHAR (25)   NULL,
    [ACO Attributed Provider Zipcode]  VARCHAR (15)   NULL,
    [ACO Attributed Provider Phone]    VARCHAR (35)   NULL,
    [Member Last Name]                 VARCHAR (50)   NULL,
    [Member First Name]                VARCHAR (50)   NULL,
    [DW Member ID]                     VARCHAR (50)   NULL,
    [Cumb ID]                          VARCHAR (25)   NULL,
    [Card ID]                          VARCHAR (25)   NULL,
    [Card ID Seq No]                   VARCHAR (10)   NULL,
    [Date of Birth]                    DATE           NULL,
    [Pulse Score]                      NUMERIC (5, 3) NULL,
    [Status]                           VARCHAR (50)   NULL,
    [Member Phone]                     VARCHAR (35)   NULL,
    [ACO Attribution Effective Date]   DATE           NULL,
    [ACO Attribution End Date]         DATE           NULL,
    [Member Termination Date]          DATE           NULL,
    [Line of Business]                 VARCHAR (30)   NULL,
    [Product]                          VARCHAR (30)   NULL,
    [Plan Sponsor Name]                VARCHAR (100)  NULL,
    [Plan Sponsor Control]             VARCHAR (15)   NULL,
    [Admit Potentially Avoidable]      VARCHAR (10)   NULL,
    [Event Type]                       VARCHAR (15)   NULL,
    [Event Stage (Status) ]            VARCHAR (10)   NULL,
    [Stay Type]                        VARCHAR (50)   NULL,
    [Admission Type]                   VARCHAR (30)   NULL,
    [Notification Date]                DATE           NULL,
    [Expected Admit Date]              DATE           NULL,
    [Actual Admit Date]                DATE           NULL,
    [Expected Discharge Date]          DATE           NULL,
    [Actual Discharge Date]            DATE           NULL,
    [Discharge Disposition ]           VARCHAR (50)   NULL,
    [Diagnosis Code]                   VARCHAR (20)   NULL,
    [Diagnosis Description]            VARCHAR (250)  NULL,
    [Other Comorbid Diagnosis1]        VARCHAR (20)   NULL,
    [Other Comorbid Diagnosis2]        VARCHAR (20)   NULL,
    [Procedure Code]                   VARCHAR (20)   NULL,
    [Procedure Description]            VARCHAR (250)  NULL,
    [Procedure Start Date]             DATE           NULL,
    [Provider Name/Role]               VARCHAR (150)  NULL,
    [Facility Name/Role]               VARCHAR (150)  NULL,
    [Facility Address]                 VARCHAR (150)  NULL,
    [filler 1]                         VARCHAR (100)  NULL,
    [filler 2]                         VARCHAR (100)  NULL,
    [filler 3]                         VARCHAR (100)  NULL,
    [filler 4]                         VARCHAR (100)  NULL,
    [filler 5]                         VARCHAR (100)  NULL,
    [LastUpdatedDate]                  DATE           NULL,
    [LastUpdatedBy]                    VARCHAR (50)   NULL,
    [AttrProviderGroup]                VARCHAR (50)   NULL,
    [PMENumber]                        VARCHAR (20)   NULL,
    [IsReadmit]                        VARCHAR (5)    NULL,
    [HasReadmit]                       VARCHAR (5)    NULL,
    [ReadmissionPredictor]             VARCHAR (5)    NULL,
    [CMSContractNo]                    VARCHAR (20)   NULL,
    [RowStatus]                        TINYINT        CONSTRAINT [DF_RowStatus] DEFAULT ((0)) NULL,
    [LoadDate]                         DATE           NULL,
    [DataDate]                         DATE           NULL,
    PRIMARY KEY CLUSTERED ([ntfAetComNotificationKey] ASC)
);

