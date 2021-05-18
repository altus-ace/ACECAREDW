

 CREATE PROCEDURE [ast].[Pst_MbrPhnAddEmail_Validate]
	@LoadDate DATE 
	, @ClientKey INT 
 AS 

    --DECLARE @LoadDate DATE = '01/25/2021'
    --DECLARE  @ClientKey INT = 9
	   -- business rule check: All rows are valid, insert em!!
    --SELECT src.*
    UPDATE ast SET ast.stgRowStatus = 'Valid'
    FROM ast.mbrStg2_PhoneAddEmail ast
	   JOIN (SELECT m.mbrStg2_PhoneAddEmailUrn, m.stgRowStatus
			 FROM ast.MbrStg2_PhoneAddEmail m    
			 WHERE m.LoadDate = @LoadDate
				AND m.ClientKey = @ClientKey 
				AND m.stgRowStatus IN ('Loaded', 'Valid')
			 ) src
		  ON ast.mbrStg2_PhoneAddEmailUrn = src.mbrStg2_PhoneAddEmailUrn    
    ;
