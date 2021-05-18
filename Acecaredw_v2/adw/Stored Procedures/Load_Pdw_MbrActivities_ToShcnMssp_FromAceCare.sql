CREATE PROCEDURE [adw].[Load_Pdw_MbrActivities_ToShcnMssp_FromAceCare]
-- @Count INT OUTPUT
AS
BEGIN    
    
    /* 2 Log FACT LOAD */        
    DECLARE @AuditID INT ;    
    DECLARE @AuditStatus SmallInt= 1 -- 1 in process , 2 Completed
    DECLARE @JobType SmallInt = 8	   -- 1 adi load, 2 dw load????
    DECLARE @ClientKey INT	=   16 -- SHCN_MSSP
    DECLARE @JobName VARCHAR(200) = OBJECT_NAME(@@PROCID)  -- if it is the procedure name
    DECLARE @ActionStartTime DATETIME2 = getdate();
    DECLARE @InputSourceName VARCHAR(200) 
	   SELECT @InputSourceName = 'ACECAREDW.dbo.tmp_AHS_PatientActivities'
    DECLARE @DestinationName VARCHAR(200) = 'No Destination Name Provided'	
	   SELECT @DestinationName = DB_NAME() + '.adw.[MbrActivities]';    
    DECLARE @ErrorName VARCHAR(200) = 'No Error Name Provided'	;
    DECLARE @SourceCount int;     
    DECLARE @DestinationCount int;	     
    DECLARE @ErrorCount int = 0
    /* close load Staging Log record */    
    DECLARE @ActionStopTime DATETIME;

    Declare @Output table (ID INT PRIMARY KEY NOT NULL) ;
    
    SELECT @SourceCount	  = COUNT(*) 
	   FROM dbo.tmp_AHS_PatientActivities APA
		  JOIN lst.List_Client Client ON APA.lOB = Client.CS_Export_LobName
	   WHERE APA.ShcnMsspLoadStatus = 0 AND Client.ClientKey = 16;
   -- SET @Count = @SourceCount        
    /*EXEC amd.sp_AceEtlAudit_Open
        @AuditID = @AuditID OUTPUT
        , @AuditStatus = @AuditStatus
        , @JobType = @JobType
        , @ClientKey = @ClientKey
        , @JobName = @JobName
        , @ActionStartTime = @ActionStartTime
        , @InputSourceName = @InputSourceName
        , @DestinationName = @DestinationName
        , @ErrorName = @ErrorName      
    */
    /* 3 update old records setting the RowExpirationdate  */      
    -- add error handling 
    BEGIN TRY      
    BEGIN TRAN LoadMbrActivities
  --  TRUNCATE table ACDW_CLMS_SHCN_MSSP.[adw].[MbrActivities]; -- Remove By byu
    /* XXXXXXXXXX Move Activities to SHCN_MSSP catelog XXXXXXXX*/
    INSERT INTO ACDW_CLMS_SHCN_MSSP.[adw].[MbrActivities]
           ([ClientMemberKey]
           ,[ClientKey]
           ,[ActivitySource]
           ,[CareActivityTypeName]
           ,[ActivityOutcome]
           ,[ActivityPerformedDate]
           ,[ActivityCreatedDate]
           ,[OutcomeNotes]
           ,[VenueName]
           ,[srcFileName]
           ,[LoadDate] )
    OUTPUT inserted.MbrActivityKey INTO @Output(ID)
    SELECT 
              APA.ClientMemberKey, 
		    Client.ClientKey,
		    'AHS' ActivitySource,
              APA.CareActivityTypeName, 
              APA.ActivityOutcome, 
              APA.ActivityPerformedDate, 
              APA.ActivityCreatedDate, 
              APA.OutcomeNotes, 
              APA.VenueName,               
              APA.srcFileName, 
              APA.LoadDate              
    FROM dbo.tmp_AHS_PatientActivities APA
	   JOIN lst.List_Client Client ON APA.lOB = Client.CS_Export_LobName
    WHERE APA.ShcnMsspLoadStatus = 0 
	   AND Client.ClientKey = 16;
    
    /* do not truncate, the APA.ShcnMsspLoadStatus  flag should handle loading only the new rows */
    --TRUNCATE table ACDW_CLMS_SHCN_MSSP.[adw].[MbrActivities]
    
    COMMIT TRAN LoadMbrActivities;
    END TRY
    BEGIN CATCH
	   EXECUTE [dbo].[usp_QM_Error_handler]
	   /* add logg update  */
    END CATCH

    UPDATE apa SET apa.ShcnMsspLoadStatus = 1
--    SELECT * 
    FROM dbo.tmp_AHS_PatientActivities APA 
    WHERE apa.ShcnMsspLoadStatus = 0 --and apa.LOB  = 'SHCN_MSSP';
    
END;
