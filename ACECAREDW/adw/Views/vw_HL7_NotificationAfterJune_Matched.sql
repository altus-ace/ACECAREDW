


CREATE VIEW [adw].[vw_HL7_NotificationAfterJune_Matched]
AS
SELECT        Notifi.*
FROM          [ACE-SDV-DB02].[Ace_CP01].[dbo].[vw_NotificationAfter_June] Notifi INNER JOIN [ACE-SDV-DB01].[ACECAREDW].[adw].[vw_ClientMember] CM
ON            Notifi.AceClientMemberId = CM. ClientMemberKey
WHERE        (Notifi.CreatedDate > CONVERT(datetime, '2019-06-01'))


