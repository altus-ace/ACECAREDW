create PROCEDURE [adw].[Update_AhsExpEligibility]( @ExportDate Date, @ClientKey INT)
AS 
begin

    UPDATE elig set elig.Exported = 1, elig.ExportedDate = @ExportDate
    --SELECT Elig.*
    FROM adw.AhsExpEligiblity elig 
    where elig.ClientKey = @ClientKey and elig.Exported = 0


END
