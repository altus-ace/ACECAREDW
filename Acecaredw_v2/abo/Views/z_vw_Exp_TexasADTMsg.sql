﻿



CREATE VIEW [abo].[z_vw_Exp_TexasADTMsg]
AS 
    SELECT 
	[FacilityName]
      ,[FacilityNPI]
      ,[FacilityCity]
      ,[FacilityState]
      ,[FacilityType]
      ,[VisitID]
      ,[Status]
      ,[StatusDate]
      ,[StatusTime]
      ,[EventReceiveDate]
      ,[EventReceiveTime]
      ,[EventProcessedDate]
      ,[EventProcessedTime]
      ,[Setting]
      ,[PatientID]
      ,[LastName]
      ,[FirstName]
      ,[MiddleName]
      ,[Suffix]
      ,[DOB]
      ,[Gender]
      ,[Address1]
      ,[Address2]
      ,[Address3]
      ,[City]
      ,[State]
      ,[Zip]
      ,[MobilePhone]
      ,[HomePhone]
      ,[PatientPhoneNumber]
      ,[PrimaryInsuranceNumber]
      ,[PrimaryInsurer]
      ,[PrimaryInsurancePlan]
      ,[InsuranceBilled]
      ,[OtherPractices]
      ,[OtherProviders]
      ,[OtherPrograms]
      ,[FacilityVisitId]
      ,[AccountNumber]
      ,[AdmittedFrom]
      ,[DischargedDisposition]
      ,[DischargeLocation]
      ,[MLOADisposition]
      ,[MLOALocation]
      ,[AdmitCareCoordinator]
      ,[DischargeCareCoordinator]
      ,[EntryDelay]
      ,[VisitDuration]
      ,[LOS]
      ,[CCD]
      ,[AttendingProviderNPI]
      ,[AttendingProviderLastName]
      ,[AttendingProviderFirstName]
      ,[ActiveRosterPatient]
      ,[PrimaryDiagnosisDescription]
      ,[PrimaryDiagnosisCode]
      ,[DiagnosisCategory]
      ,[SubsequentDiagnosisCodes]
      ,[HighUtilizerFlag]
      ,[ReadmissionRiskFlag]
      ,[RecentSNFStayFlag]
      ,[RecentInpatientStayFlag]
      ,[COVID_19Flags]

FROM [ACDW_CLMS_SHCN_MSSP].[adw].[vw_Exp_TexasADTMsg];




