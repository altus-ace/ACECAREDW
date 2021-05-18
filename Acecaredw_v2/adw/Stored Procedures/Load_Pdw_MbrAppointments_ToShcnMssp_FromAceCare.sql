CREATE PROCEDURE [adw].[Load_Pdw_MbrAppointments_ToShcnMssp_FromAceCare]
--@Count INT OUTPUT -- Removed by byu
AS
BEGIN   

 --   TRUNCATE TABLE ACDW_CLMS_SHCN_MSSP.[adw].[MbrAppointments]; remove by byu

	  DECLARE @SourceCount int;  	 
	  Select  @SourceCount = COUNT(*)
	    FROM dbo.tmp_AHS_PatientAppointments apa
        JOIN lst.List_Client Client ON APA.lOB = Client.CS_Export_LobName
    WHERE APA.ShcnMsspLoadStatus = 0 AND Client.ClientKey = 16;
	--SET @Count = @SourceCount	-- Removed by byu

    INSERT INTO ACDW_CLMS_SHCN_MSSP.[adw].[MbrAppointments]
               ([ClientMemberKey]
               ,[ClientKey]
               ,[AppointmentStatus]
               ,[AppointmentDate]
               ,[ScheduledByUser]
               ,[AppointmentNote]
               ,[AppointmentCreatedDate]
               ,[srcFileName]
               ,[LoadDate]
               ,[CreatedDate]
               ,[CreatedBy])
    SELECT --apa.tmpAhsPatientAppointmentsSKey, 
        apa.ClientMemberKey, 
        Client.ClientKey, 	 
        apa.AppointmentStatusName, 
        apa.AppointmentDate,     
        apa.AppointmentScheduledBy, 
        apa.AppointmentNote, 
        apa.AppointmentCreatedDate,     
        apa.srcFileName, 
        apa.LoadDate, 
        apa.CreatedDate, 
        apa.CreatedBy
    FROM dbo.tmp_AHS_PatientAppointments apa
        JOIN lst.List_Client Client ON APA.lOB = Client.CS_Export_LobName
        /*
	   JOIN ACDW_CLMS_SHCN_MSSP.adw.FctMembership Mbr 
    		  ON apa.ClientMemberKey = mbr.ClientMemberKey
            AND apa.LOB = 'SHCN_MSSP'*/
    WHERE APA.ShcnMsspLoadStatus = 0 AND Client.ClientKey = 16;
    -- 
  
    --update  ShcnMsspLoadStatus  = 1, for all rows.
END;