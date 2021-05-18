﻿-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [adi].[ImportcopAetMaCareopps](
   -- @loadDate VARCHAR(10),
	@DataDate VARCHAR(10),
	@SrcFileName varchar(100),
    -- @CreatedDate [date NOT ,
	@CreatedBy varchar(50),
	@LastUpdatedDate VARCHAR(10) ,
	@LastUpdatedBy varchar(50),
	@Legacy varchar(50),
	@ProviderGroupNumber varchar(50),
	@ProviderGroupName varchar(50) ,
	@SubgroupNumber varchar(50) ,
	@SubgroupName varchar(50),
	@TIN varchar(50),
	@TINName varchar(150) ,
	@PIN varchar(50) ,
	@ProviderName varchar(150),
	@NPI varchar(50),
	@PBGInd varchar(50),
	@GroupInd varchar(50) ,
	@MemberID varchar(50),
	@CVTYMemberID varchar(50),
	@MemberLastName varchar(150),
	@MemberFirstName varchar(150),
	@MemberDOB varchar(50) ,
	@Address1 varchar(150) ,
	@Address2 varchar(150) ,
	@City varchar(50) ,
	@State varchar(50) ,
	@ZipCode varchar(50),
	@MemberPhone varchar(50),
	@MemberGender varchar(50),
	@BaselineIndicator varchar(50),
	@MemberStatus varchar(50) ,
	@ContractNumber varchar(50) ,
	@Product varchar(50),
	@ProviderAssignmentType varchar(50),
	@ReadmissionsAllCause varchar(50),
	@MedicationReconciliationPostDischarge varchar(50) ,
	@BreastScreeningCompliance varchar(50),
	@ColorectalScreeningCompliance varchar(50),
	@AceiArbAdherence varchar(50),
	@AceiArbPDCYTD varchar(50) ,
	@DiabetesEyeExam varchar(50),
	@DiabetesNephropathyScreening varchar(50),
	@DiabetesLdlControl varchar(50),
	@DiabetesLdlLevel varchar(50),
	@DiabetesMedicationAdherence varchar(50),
	@DiabetesMedicationPDCYTD varchar(50) ,
	@DiabetesControlledHbA1c varchar(50),
	@DiabetesHba1CLevel varchar(50) ,
	@Hba1cBillingProviderName varchar(50),
	@Hba1cBillingProviderPhoneNumber varchar(50),
	@StatinUseInDiabetics varchar(50),
	@DiabetesTreatment varchar(50) ,
	@StatinMedicationAdherence varchar(50),
	@StatinMedicationPDCYTD varchar(50),
	@HighRiskMedication varchar(50),
	@OsteoporosisManagement varchar(50) ,
	@RheumatoidArthritisManagement varchar(50) ,
	@AdultBMIAssessment varchar(50),
	@HCCChronicConditionRevalidation varchar(50) ,
	@PafSubmission varchar(50) ,
	@OfficeVisits varchar(50) ,
	@LastOfficeVisit varchar(50) ,
	@OfficeVisitsChronic1stHalf varchar(50) ,
	@OfficeVisitshronic2ndHalf varchar(50) ,
	@LastOfficeVisitChronic varchar(50) ,
	@ChronicDisease varchar(50), 
	@AnnualFluVaccine varchar(50) ,
	@ControllingHighBloodPressure varchar(50) ,
	@BloodPressure varchar(50),
	@HTNDiagnosisDate varchar(50) ,
	@StatinTherapyCardiovascularDisease varchar(50),   
	@ReportAsOf varchar(50)


)
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	--UPDATE adi.MbrAetCom
--	SET MEMBER_ID  =  @MEMBER_ID 

--    WHERE  MEMBER_ID = @MEMBER_ID

	 
--	IF @@ROWCOUNT = 0

    -- Insert statements for procedure here
IF (@Legacy <> '' )
BEGIN
 INSERT INTO adi.copAetMaCareopps
   (
    [loadDate],
	[DataDate],
	[SrcFileName],
	[CreatedDate],
	[CreatedBy],
	[LastUpdatedDate],
	[LastUpdatedBy],
	[Legacy],
	[ProviderGroupNumber],
	[ProviderGroupName],
	[SubgroupNumber],
	[SubgroupName],
	[TIN],
	[TINName],
	[PIN] ,
	[ProviderName],
	[NPI],
	[PBGInd],
	[GroupInd],
	[MemberID],
	[CVTYMemberID],
	[MemberLastName],
	[MemberFirstName],
	[MemberDOB],
	[Address1],
	[Address2],
	[City],
	[State],
	[ZipCode],
	[MemberPhone],
	[MemberGender] ,
	[BaselineIndicator],
	[MemberStatus],
	[ContractNumber],
	[Product]  ,
	[ProviderAssignmentType] ,
	[Readmissions-AllCause]  ,
	[MedicationReconciliationPostDischarge] ,
	[Breast ScreeningCompliance],
	[ColorectalScreeningCompliance] ,
	[AceiArbAdherence],
	[Acei ArbPDCYTD],
	[DiabetesEyeExam],
	[DiabetesNephropathyScreening],
	[DiabetesLdlControl] ,
	[DiabetesLdlLevel],
	[DiabetesMedicationAdherence],
	[DiabetesMedicationPDCYTD] ,
	[DiabetesControlledHbA1c] ,
	[DiabetesHba1C Level],
	[Hba1cBillingProviderName],
	[Hba1cBillingProviderPhoneNumber],
	[StatinUseInDiabetics],
	[DiabetesTreatment],
	[StatinMedicationAdherence],
	[StatinMedicationPDCYTD],
	[HighRiskMedication],
	[OsteoporosisManagement],
	[RheumatoidArthritisManagement],
	[AdultBMIAssessment],
	[HCC-ChronicConditionRevalidation],
	[PafSubmission],
	[OfficeVisits],
	[LastOfficeVisit] ,
	[OfficeVisits-Chronic1stHalf],
	[Office Visits-Chronic2ndHalf] ,
	[Last OfficeVisit-Chronic],
	[ChronicDisease],
	[AnnualFluVaccine],
	[ControllingHighBloodPressure],
	[BloodPressure],
	[HTNDiagnosisDate],
	[StatinTherapyCardiovascularDisease],
	[ReportAsOf]
	
--	,[MedicationAdherence90DayConversion]
     )
     VALUES
   (   
    GETDATE(),
	--CASE WHEN @ReportAsOf = ''
	--THEN NULL
	--ELSE CONVERT(DATE, @ReportAsOf)
	--END,
	GETDATE(),
	--CASE WHEN @DataDate = ''
	--THEN NULL
	--ELSE CONVERT(DATE, @DataDate)
	--END,
	
	@SrcFileName ,
	GETDATE(),
    -- @CreatedDate [date NOT ,
	@CreatedBy ,
	GETDATE(),
	--@LastUpdatedDate ,
	@LastUpdatedBy ,
	@Legacy ,
	@ProviderGroupNumber ,
	@ProviderGroupName ,
	@SubgroupNumber  ,
	@SubgroupName ,
	@TIN ,
	@TINName  ,
	@PIN  ,
	@ProviderName ,
	@NPI ,
	@PBGInd ,
	@GroupInd ,
	@MemberID ,
	@CVTYMemberID ,
	@MemberLastName ,
	@MemberFirstName ,
	@MemberDOB ,
	@Address1  ,
	@Address2  ,
	@City  ,
	@State ,
	@ZipCode ,
	@MemberPhone ,
	@MemberGender ,
	@BaselineIndicator ,
	@MemberStatus ,
	@ContractNumber ,
	@Product ,
	@ProviderAssignmentType ,
	@ReadmissionsAllCause ,
	@MedicationReconciliationPostDischarge ,
	@BreastScreeningCompliance ,
	@ColorectalScreeningCompliance ,
	@AceiArbAdherence,
	@AceiArbPDCYTD  ,
	@DiabetesEyeExam ,
	@DiabetesNephropathyScreening,
	@DiabetesLdlControl ,
	@DiabetesLdlLevel ,
	@DiabetesMedicationAdherence ,
	@DiabetesMedicationPDCYTD  ,
	@DiabetesControlledHbA1c ,
	@DiabetesHba1CLevel  ,
	@Hba1cBillingProviderName ,
	@Hba1cBillingProviderPhoneNumber ,
	@StatinUseInDiabetics ,
	@DiabetesTreatment  ,
	@StatinMedicationAdherence ,
	@StatinMedicationPDCYTD ,
	@HighRiskMedication ,
	@OsteoporosisManagement  ,
	@RheumatoidArthritisManagement ,
	@AdultBMIAssessment ,
	@HCCChronicConditionRevalidation ,
	@PafSubmission ,
	@OfficeVisits,
	@LastOfficeVisit ,
	@OfficeVisitsChronic1stHalf ,
	@OfficeVisitshronic2ndHalf ,
	@LastOfficeVisitChronic ,
	@ChronicDisease , 
	@AnnualFluVaccine ,
	@ControllingHighBloodPressure,
	@BloodPressure,
	@HTNDiagnosisDate,
	@StatinTherapyCardiovascularDisease,   
	@ReportAsOf
	--,@MedicationAdherence90DayConversion
	
	 )
	 END
END


