


CREATE VIEW [adw].[vw_HL7_AppointmentSinceJune_Matched]
AS
SELECT       APP.*
FROM          [ACE-SDV-DB02].[Ace_CP01].[dbo].[vw_AppointmentSince_June] APP INNER JOIN [ACE-SDV-DB01].[ACECAREDW].[adw].[vw_ClientMember] CM
ON            CM. ClientMemberKey = APP.AceClientMemberID
WHERE        (APP.CreatedDate > CONVERT(datetime, '2019-06-01'))


