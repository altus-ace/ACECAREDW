﻿CREATE VIEW [adw].[vw_EXP_AH_TeamAssignment]
AS
SELECT        'UHC' AS CLIENT_ID, RISK_CATEGORY, POD, [USER]
FROM            dbo.ALT_TEAM_ASSIGNMENT