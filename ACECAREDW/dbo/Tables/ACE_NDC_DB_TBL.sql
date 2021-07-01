﻿CREATE TABLE [dbo].[ACE_NDC_DB_TBL] (
    [NDC_CD]       NVARCHAR (20)  NOT NULL,
    [NDC_NAME]     NVARCHAR (128) NULL,
    [STRENGTH]     NVARCHAR (10)  NULL,
    [UNIT]         NVARCHAR (10)  NULL,
    [FORM]         NVARCHAR (128) NULL,
    [INGREDIENT]   NVARCHAR (128) NULL,
    [DIABETIC_NDC] SMALLINT       NOT NULL,
    PRIMARY KEY CLUSTERED ([NDC_CD] ASC)
);
