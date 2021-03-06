﻿-- =============================================
-- Author:		Bing Yu
-- Create date: 09/09/2020
-- Description:	Insert BCBS Institutioanl claims  to DB
-- =============================================
CREATE PROCEDURE [adi].[ImportBCBSInstitutionalClaim]
    @SrcFileName [varchar](100) ,
	-- [CreateDate] [datetime] NULL,
	@CreateBy [varchar](100) ,
	@OriginalFileName [varchar](100),
	@LastUpdatedBy [varchar](100) ,
	--@LastUpdatedDate [datetime] NULL,
	@DataDate varchar(10),
	@ClaimRecordID [varchar](3) ,
	@PatientID varchar(30),
	@SubscriberID [varchar](30),
	@MemberFirstName [varchar](35) ,
	@MemberMiddleInitial [varchar](35) ,
	@MemberLastName [varchar](35),
	@MemberBirthDate varchar(10) ,
	@MemberGender [char](1),
	@MemberAddressLine1 [varchar](55),
	@MemberAddressLine2 [varchar](55) ,
	@MemberCity [varchar](28),
	@MemberState [char](2),
	@MemberZip [char](9),
	@ClaimID [varchar](30),
	@ClaimHeaderStatusCode char(1) ,
	@AdjustmentSeqNumber varchar(10),
	@Inpatient_OutpatientCode char(2),
	@ServiceFromDate varchar(10),
	@ServiceToDate varchar(10),
	@FacilityName_BillingProviderName [varchar](75),
	@BillingProviderNPI [char](10),
	@ServicingProviderTIN [char](9) ,
	@HLServicingProviderNPI [char](10) ,
	@HLServicingProviderFirstName [varchar](35),
	@HLServicingProviderMiddle [varchar](35),
	@HLServicingProviderLastName [varchar](35),
	@HLServicingProviderAddress1 [varchar](55) ,
	@HLServicingProviderStreetAddress [varchar](55) ,
	@HLServicingProviderCity [varchar](28),
	@HLServicingProviderState [char](2),
	@HLServicingProviderZip [char](9),
	@HLServicingProviderPhoneNumber [char](10),
	@HLServicingProviderTaxonomyCode [char](10),
	@TypeBillCode [char](2),
	@FrequencyCode [char](1) ,
	@DischargeStatusCode [char](2) ,
	@DRGCode [char](3) ,
	@ICDVersionCode [char](2),
	@HLPrimaryDiagnosisCode [char](10) ,
	@HLDiagnosisCode2 [char](10) ,
	@HLDiagnosisCode3 [char](10),
	@HLDiagnosisCode4 [char](10) ,
	@HLDiagnosisCode5 [char](10) ,
	@HLDiagnosisCode6 [char](10),
	@HLDiagnosisCode7 [char](10),
	@HLDiagnosisCode8 [char](10),
	@HLDiagnosisCode9 [char](10) ,
	@HLDiagnosisCode10 [char](10) ,
	@HLDiagnosisCode11 [char](10),
	@HLDiagnosisCode12 [char](10),
	@ProcedureCode1 [char](7) ,
	@ProcedureCode2 [char](7) ,
	@ProcedureCode3 [char](7),
	@ProcedureCode4 [char](7),
	@ProcedureCode5 [char](7),
	@HLBilledAmount varchar(20),
	@HLPaidAmount varchar(20),
	@ClaimLinenumber varchar(10),
	@ClaimLineStatusCode [char](1),
	@LLServicingProviderNPI [char](10) ,
	@LLServicingProviderFirstName [char](35) ,
	@LLServicingProviderMiddle [char](35) ,
	@LLServicingProviderLastName [char](35),
	@LLPrimaryDiagnosisCode [char](10) ,
	@LLDiagnosisCode2 [char](10) ,
	@LLDiagnosisCode3 [char](10) ,
	@LLDiagnosisCode4 [char](10) ,
	@LLDiagnosisCode5 [char](10),
	@LLDiagnosisCode6 [char](10) ,
	@LLDiagnosisCode7 [char](10),
	@LLDiagnosisCode8 [char](10) ,
	@LLDiagnosisCode9 [char](10) ,
	@LLDiagnosisCode10 [char](10) ,
	@LLDiagnosisCode11 [char](10) ,
	@LLDiagnosisCode12 [char](10),
	@RevenueCode [char](4),
	@HCPCS_CPTCode [char](6),
	@HCPCS_CPTModifierCode1 [char](2) ,
	@HCPCS_CPTModifierCode2 [char](2),
	@LLBilledAmount varchar(10),
	@LLPaidAmount varchar(10),
	@ServiceQuantity varchar(10) ,
	@LLDateService varchar(10),
	@LLPaidDate varchar(10),
	@ServicingProviderSpecialtyCode [varchar](3) ,
	@ServicingProviderSpecialtyDescrip [varchar](75) 
            
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	EXEC [ACDW_CLMS_SHCN_BCBS].[adi].[ImportBCBSInstitutionalClaim]
	@SrcFileName  ,
	-- [CreateDate] [datetime] NULL,
	@CreateBy ,
	@OriginalFileName ,
	@LastUpdatedBy  ,
	--@LastUpdatedDate [datetime] NULL,
	@DataDate ,
	@ClaimRecordID ,
	@PatientID ,
	@SubscriberID ,
	@MemberFirstName ,
	@MemberMiddleInitial  ,
	@MemberLastName ,
	@MemberBirthDate  ,
	@MemberGender ,
	@MemberAddressLine1 ,
	@MemberAddressLine2  ,
	@MemberCity ,
	@MemberState ,
	@MemberZip ,
	@ClaimID ,
	@ClaimHeaderStatusCode ,
	@AdjustmentSeqNumber ,
	@Inpatient_OutpatientCode ,
	@ServiceFromDate ,
	@ServiceToDate ,
	@FacilityName_BillingProviderName ,
	@BillingProviderNPI ,
	@ServicingProviderTIN  ,
	@HLServicingProviderNPI  ,
	@HLServicingProviderFirstName ,
	@HLServicingProviderMiddle ,
	@HLServicingProviderLastName ,
	@HLServicingProviderAddress1  ,
	@HLServicingProviderStreetAddress  ,
	@HLServicingProviderCity ,
	@HLServicingProviderState ,
	@HLServicingProviderZip 
	,
	@HLServicingProviderPhoneNumber ,
	@HLServicingProviderTaxonomyCode ,
	@TypeBillCode ,
	@FrequencyCode  ,
	@DischargeStatusCode ,
	@DRGCode  ,
	@ICDVersionCode ,
	@HLPrimaryDiagnosisCode  ,
	@HLDiagnosisCode2  ,
	@HLDiagnosisCode3 ,
	@HLDiagnosisCode4  ,
	@HLDiagnosisCode5  ,
	@HLDiagnosisCode6 ,
	@HLDiagnosisCode7 ,
	@HLDiagnosisCode8 ,
	@HLDiagnosisCode9  ,
	@HLDiagnosisCode10  ,
	@HLDiagnosisCode11 ,
	@HLDiagnosisCode12 ,
	@ProcedureCode1  ,
	@ProcedureCode2  ,
	@ProcedureCode3 ,
	@ProcedureCode4 ,
	@ProcedureCode5 ,
	@HLBilledAmount ,
	@HLPaidAmount ,
	@ClaimLinenumber ,
	@ClaimLineStatusCode ,
	@LLServicingProviderNPI  ,
	@LLServicingProviderFirstName  ,
	@LLServicingProviderMiddle  ,
	@LLServicingProviderLastName ,
	@LLPrimaryDiagnosisCode  ,
	@LLDiagnosisCode2  ,
	@LLDiagnosisCode3  ,
	@LLDiagnosisCode4  ,
	@LLDiagnosisCode5 ,
	@LLDiagnosisCode6  ,
	@LLDiagnosisCode7 ,
	@LLDiagnosisCode8 ,
	@LLDiagnosisCode9  ,
	@LLDiagnosisCode10 ,
	@LLDiagnosisCode11  ,
	@LLDiagnosisCode12 ,
	@RevenueCode ,
	@HCPCS_CPTCode ,
	@HCPCS_CPTModifierCode1 ,
	@HCPCS_CPTModifierCode2 ,
	@LLBilledAmount ,
	@LLPaidAmount ,
	@ServiceQuantity ,
	@LLDateService ,
	@LLPaidDate ,
	@ServicingProviderSpecialtyCode ,
	@ServicingProviderSpecialtyDescrip 
    
END
