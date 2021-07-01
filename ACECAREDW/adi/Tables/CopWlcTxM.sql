﻿CREATE TABLE [adi].[CopWlcTxM] (
    [URN]                               INT           IDENTITY (1, 1) NOT NULL,
    [ProviderID]                        VARCHAR (50)  NULL,
    [ProviderName]                      VARCHAR (150) NULL,
    [MemberName]                        VARCHAR (150) NULL,
    [Subscriber]                        VARCHAR (50)  NULL,
    [DOB]                               DATE          NULL,
    [Phone]                             VARCHAR (50)  NULL,
    [STARFlag]                          VARCHAR (50)  NULL,
    [MeasureID]                         VARCHAR (20)  NULL,
    [Measure]                           VARCHAR (100) NULL,
    [ComplianceStatus]                  VARCHAR (50)  NULL,
    [ComplianceDetail]                  VARCHAR (100) NULL,
    [LastKnownServiceDate]              VARCHAR (20)  NULL,
    [ServiceStartDate]                  VARCHAR (20)  NULL,
    [ServiceEndDate]                    VARCHAR (20)  NULL,
    [ClaimsThruDate]                    DATE          NULL,
    [StarMeasureComplianceUpdatedThru ] VARCHAR (50)  NULL,
    [NPI]                               VARCHAR (50)  NULL,
    [NPIName]                           VARCHAR (150) NULL,
    [MedicareID]                        VARCHAR (50)  NULL,
    [MedicaidID]                        VARCHAR (50)  NULL,
    [HPRFlag]                           VARCHAR (10)  NULL,
    [P4QFlag]                           VARCHAR (10)  NULL,
    [Category]                          VARCHAR (150) NULL,
    [BaseValue]                         VARCHAR (100) NULL,
    [SrcFileName]                       VARCHAR (100) NULL,
    [FileDate]                          DATE          NULL,
    [DataDate]                          DATE          NULL,
    [CreateDate]                        DATETIME      DEFAULT (sysdatetime()) NULL,
    [CreateBy]                          VARCHAR (100) DEFAULT (suser_sname()) NULL,
    [OriginalFileName]                  VARCHAR (100) NULL,
    [Status]                            INT           CONSTRAINT [DF_CopWlcTxM_Status] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_adiCopWlcTxM_URN] PRIMARY KEY CLUSTERED ([URN] ASC)
);

