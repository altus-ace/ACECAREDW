﻿CREATE TABLE [adi].[Exp_LabCorpMembershipRoster] (
    [URN]                     INT           IDENTITY (1, 1) NOT NULL,
    [SrcFileName]             VARCHAR (100) NULL,
    [DataDate]                DATE          NULL,
    [CreateDate]              DATETIME      NULL,
    [CreateBy]                VARCHAR (100) NULL,
    [OriginalFileName]        VARCHAR (100) NULL,
    [Status]                  INT           NOT NULL,
    [UniqueRequestID]         VARCHAR (50)  NULL,
    [MemberID]                VARCHAR (50)  NULL,
    [SubscriberID]            VARCHAR (50)  NULL,
    [FIRST_NAME]              VARCHAR (100) NULL,
    [MIDDLE_NAME]             VARCHAR (10)  NULL,
    [LAST_NAME]               VARCHAR (100) NULL,
    [DATE_OF_BIRTH]           VARCHAR (10)  NULL,
    [GENDER]                  VARCHAR (10)  NULL,
    [RaceCode]                VARCHAR (50)  NULL,
    [DriversLicenseNumber]    VARCHAR (20)  NULL,
    [DriversLicenseState]     VARCHAR (20)  NULL,
    [SSN9]                    VARCHAR (10)  NULL,
    [SSN4]                    VARCHAR (10)  NULL,
    [MRN]                     VARCHAR (50)  NULL,
    [Ordering_Account_Number] VARCHAR (20)  NULL,
    [MEMBER_HOME_ADDRESS]     VARCHAR (100) NULL,
    [MEMBER_HOME_ADDRESS2]    VARCHAR (100) NULL,
    [MEMBER_HOME_CITY]        VARCHAR (100) NULL,
    [MEMBER_HOME_STATE]       VARCHAR (20)  NULL,
    [MEMBER_HOME_ZIP5]        VARCHAR (10)  NULL,
    [zip4]                    VARCHAR (10)  NULL,
    [Country]                 VARCHAR (100) NULL,
    [MemberPrimaryPhone]      VARCHAR (20)  NULL,
    [CellPhone]               VARCHAR (20)  NULL,
    [HomePhone]               VARCHAR (20)  NULL,
    [EmailAddress]            VARCHAR (50)  NULL,
    [PayerName]               VARCHAR (50)  NULL,
    [PayerGroupNumber]        VARCHAR (20)  NULL,
    [RecordIndicator]         CHAR (1)      NULL,
    PRIMARY KEY CLUSTERED ([URN] ASC)
);

