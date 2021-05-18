CREATE TABLE [dbo].[UHC_CareOpps] (
    [URN]                INT           IDENTITY (1, 1) NOT NULL,
    [Context]            VARCHAR (255) NULL,
    [TIN_Num]            VARCHAR (255) NULL,
    [TIN_Name]           VARCHAR (255) NULL,
    [Measure_Desc]       VARCHAR (255) NULL,
    [Sub_Meas]           VARCHAR (255) NULL,
    [ProviderID]         VARCHAR (255) NULL,
    [MemberID]           VARCHAR (255) NULL,
    [UniversalMemberId]  VARCHAR (25)  NULL,
    [MedicaidID]         VARCHAR (255) NULL,
    [DOB]                DATE          NULL,
    [Gender]             VARCHAR (255) NULL,
    [Age]                INT           NULL,
    [NameFirst]          VARCHAR (255) NULL,
    [NameLast]           VARCHAR (255) NULL,
    [Member_Address_1]   VARCHAR (255) NULL,
    [Member_Address_2]   VARCHAR (255) NULL,
    [Member_City]        VARCHAR (40)  NULL,
    [Member_State]       VARCHAR (40)  NULL,
    [Member_ZipCode]     VARCHAR (40)  NULL,
    [Member_Phone]       VARCHAR (40)  NULL,
    [Provider_NPI]       VARCHAR (40)  NULL,
    [Prov_Last_Name]     VARCHAR (255) NULL,
    [Prov_First_Name]    VARCHAR (255) NULL,
    [Provider_Address_1] VARCHAR (255) NULL,
    [Provider_Address_2] VARCHAR (255) NULL,
    [Provider_City]      VARCHAR (40)  NULL,
    [Provider_State]     VARCHAR (40)  NULL,
    [Provider_ZipCode]   VARCHAR (40)  NULL,
    [Provider_Phone]     VARCHAR (40)  NULL,
    [Provider_County]    VARCHAR (100) NULL,
    [Through_Date]       DATE          NULL,
    [TINMaxVisit]        VARCHAR (255) NULL,
    [A_LAST_UPDATE_DATE] DATETIME      DEFAULT (getdate()) NULL,
    [A_LAST_UPDATE_BY]   VARCHAR (50)  NULL,
    [A_LAST_UPDATE_FLAG] VARCHAR (1)   DEFAULT ('Y') NULL,
    PRIMARY KEY CLUSTERED ([URN] ASC)
);


GO
CREATE NONCLUSTERED INDEX [idxUhcCareOps_MbrId]
    ON [dbo].[UHC_CareOpps]([MemberID] ASC);


GO
CREATE NONCLUSTERED INDEX [Ndx_CareOps]
    ON [dbo].[UHC_CareOpps]([Measure_Desc] ASC)
    INCLUDE([Sub_Meas], [MemberID], [A_LAST_UPDATE_DATE]);

