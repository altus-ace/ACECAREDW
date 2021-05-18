CREATE PROCEDURE [adw].[Load_Pdw_MbrProgramEnrollments_ToShcnMssp_FromAceCare]
@Count INT OUTPUT
AS 
BEGIN
    -- truncate the table
   -- TRUNCATE TABLE ACDW_CLMS_SHCN_MSSP.[adw].[MbrProgramEnrollments] removed by byu

	  DECLARE @SourceCount int;  	 
	  Select  @SourceCount = COUNT(*)
	   FROM dbo.Tmp_AHS_ProgramEnrollments APE
		  JOIN lst.List_Client Client ON APE.LOB = Client.CS_Export_LobName	   
    		  JOIN (SELECT APE.tmpAhsPatientAppointmentsSKey--,  APE.ClientMemberKey, APE.ProgramName, APE.LoadDate              
				, ROW_NUMBER() OVER (partition BY APE.ClientMemberKey, APE.ProgramName, APE.StartDate ORDER BY APE.LoadDate DESC) aRowNum
				FROM dbo.Tmp_AHS_ProgramEnrollments APE
			 	JOIN lst.List_Client Client ON APE.LOB = Client.CS_Export_LobName	   
				WHERE APE.ShcnMsspLoadStatus = 0 AND Client.ClientKey = 16) LatestProgEnr
			 ON APE.tmpAhsPatientAppointmentsSKey = LatestProgEnr.tmpAhsPatientAppointmentsSKey
			 and LatestProgEnr.aRowNum = 1 
	   WHERE APE.ShcnMsspLoadStatus = 0 AND Client.ClientKey = 16
	SET @Count = @SourceCount;

    /* XXXXXXXXXX Move Program ENrollments to SHCN_MSSP catelog XXXXXXXX*/
    INSERT INTO ACDW_CLMS_SHCN_MSSP.[adw].[MbrProgramEnrollments]
               ([ClientMemberKey]
               ,[ClientKey]
               ,[ProgramName]
               ,[EnrollmentStartDate]
               ,[EnrollmentStopDate]
               ,[PlanStartDate]
               ,[PlanStopDate]
               ,[ProgramStatus]
               ,UpdateOnDate
               ,[SrcFileName]
               ,[LoadDate]
               )
    SELECT -- APE.tmpAhsPatientAppointmentsSKey, 
                  APE.ClientMemberKey, 
                  Client.ClientKey,
                  APE.ProgramName, 
                  APE.StartDate, 
                  APE.EndDate, 
                  APE.PlanStartDate, 
                  APE.PlanEndDate, 
                  APE.ProgramStatusName, 
                  APE.UpdatedOnDate, 
                  APE.srcFileName, 
                  APE.LoadDate              			   
    FROM dbo.Tmp_AHS_ProgramEnrollments APE
        JOIN lst.List_Client Client ON APE.LOB = Client.CS_Export_LobName	   
    	   JOIN (SELECT APE.tmpAhsPatientAppointmentsSKey--,  APE.ClientMemberKey, APE.ProgramName, APE.LoadDate              
			 , ROW_NUMBER() OVER (partition BY APE.ClientMemberKey, APE.ProgramName, APE.StartDate ORDER BY APE.LoadDate DESC) aRowNum
			 FROM dbo.Tmp_AHS_ProgramEnrollments APE
				JOIN lst.List_Client Client ON APE.LOB = Client.CS_Export_LobName	   
			 WHERE APE.ShcnMsspLoadStatus = 0 AND Client.ClientKey = 16) LatestProgEnr
		  ON APE.tmpAhsPatientAppointmentsSKey = LatestProgEnr.tmpAhsPatientAppointmentsSKey
			 and LatestProgEnr.aRowNum = 1 
    WHERE APE.ShcnMsspLoadStatus = 0 AND Client.ClientKey = 16
	    ;
	    
     update APE set APE.ShcnMsspLoadStatus =  1 
	FROM dbo.Tmp_AHS_ProgramEnrollments APE
	where APE.ShcnMsspLoadStatus = 0;

END;