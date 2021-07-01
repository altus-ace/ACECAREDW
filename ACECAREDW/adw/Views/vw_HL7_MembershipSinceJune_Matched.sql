


CREATE VIEW [adw].[vw_HL7_MembershipSinceJune_Matched]
AS
SELECT       Member.*
FROM          [ACE-SDV-DB02].[Ace_CP01].[dbo].[vw_MemberSince_June] Member INNER JOIN [ACE-SDV-DB01].[ACECAREDW].[adw].[vw_ClientMember] CM
ON            Member.AceClientMemberId = CM. ClientMemberKey
WHERE        (Member.CreatedDate > CONVERT(datetime, '2019-06-01'))


