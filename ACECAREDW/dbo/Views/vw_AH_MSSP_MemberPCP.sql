﻿




CREATE VIEW [dbo].[vw_AH_MSSP_MemberPCP]

AS

SELECT   [MEMBER_ID],
         [CLIENT_ID],
         [MEMBER_PCP],
         [PROVIDER_RELATIONSHIP_TYPE],
         [LOB],
		 [PCP_EFFECTIVE_DATE],
		 [PCP_TERM_DATE],
		 [MEMBER_PCP_ADDITIONAL_INFORMATION_1]

FROM [ACDW_CLMS_SHCN_MSSP].[dbo].[vw_Exp_AH_MemberPCP]
