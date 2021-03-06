﻿CREATE TABLE [dbo].[z_tmp_AttribMembers1] (
    [URN]             INT          IDENTITY (1, 1) NOT NULL,
    [adiKey]          INT          NULL,
    [ClientMemberKey] VARCHAR (50) NULL,
    [ClientKey]       INT          NULL,
    [AttribNPI]       VARCHAR (20) NULL,
    [EffDate]         DATE         NULL,
    [TermDate]        DATE         NULL,
    [LoadDate]        DATE         NULL,
    [RecStatus]       VARCHAR (1)  NULL,
    [RecStatusDate]   DATE         NULL,
    [MaxDateFlg]      INT          NULL,
    [ActiveFlg]       INT          DEFAULT ((1)) NULL,
    [PlanMatchFlg]    INT          NULL,
    [NPIMatchFlg]     INT          NULL,
    [InsertRunId]     VARCHAR (10) NULL,
    [UpdateRunId]     VARCHAR (10) NULL,
    [CreateDate]      DATE         DEFAULT (getdate()) NULL,
    [CreateBy]        VARCHAR (50) DEFAULT (suser_sname()) NULL
);

