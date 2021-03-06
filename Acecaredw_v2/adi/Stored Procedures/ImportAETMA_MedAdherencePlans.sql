﻿-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [adi].[ImportAETMA_MedAdherencePlans](
    @OriginalFileName varchar(100) ,
	@SrcFileName varchar(100) ,
	@DataDate varchar(10),
	@FileDate varchar(10),
	--@LoadDate date NOT ,
	--CreatedDate date NOT ,
	@CreatedBy varchar(50),
	--LastUpdatedDate datetime NOT ,
	@LastUpdatedBy varchar(50),

    @ProviderGroupNumber [varchar](50),
	@ProviderGroupName [varchar](50) ,
	@TIN [varchar](9),
	@TINName [varchar](50),
	@PIN [varchar](20),
	@NPI [varchar](10) ,
	@ProviderName [varchar](50),
	@MemberID [varchar](20),
	@CVTYMemberID [varchar](50) ,
	@MemberFirstName [varchar](50),
	@MemberLastName [varchar](50),
	@MemberDateofBirth varchar(10),
	@MemberPhoneNumber [varchar](50) ,
	@MemberAddressLine1 [varchar](50),
	@MemberCity [varchar](50) ,
	@MemberState [varchar](50),
	@ZipCode [varchar](10) ,
	@ContractNumber [varchar](50) ,
	@MemberStatus [varchar](50),
	@SNPIndicator [char](1) ,
	@LowIncomeSubsidy [varchar](5),
	@AdherenceType [varchar](50) ,
	@AdherenceDrugName [varchar](100),
	@InitialFillDate varchar(10),
	@LatestDispensedDate varchar(12),
	@DaysSupplyCount [varchar](5),
	@NextFillDate varchar(10),
	@PharmacyName [varchar](100),
	@PharmacyPhoneNumber [varchar](20),
	@PharmacyAddressLine1 [varchar](100),
	@PharmacyCity [varchar](100),
	@PharmacyState [varchar](2),
	@PharmacyZipCode [varchar](15) ,
	@PrescriberId [varchar](50),
	@PrescriberName [varchar](100) ,
	@PriorYearPDC varchar(10) ,
	@PDCYTD varchar(10),
	@MissedDaysYTD [varchar](5) ,
	@MissedDaysQ1 [varchar](5) ,
	@MissedDaysQ2 [varchar](5) ,
	@MissedDaysQ3 [varchar](5) ,
	@MissedDaysQ4 [varchar](5),
	@LatetofillIndicator [char](1) ,
	@Eligiblefor_30_90conversion [char](1) ,
	@Eligibleforlowercostalternative [char](1),
	@FillIndicator [varchar](10),
	@STARGoal [varchar](10),
	@DaysSupplyToAdherent [varchar](5),
	@SUPDOpportunity [char](1),
	@MA_90_DayConv_Denominator [varchar](5),
	@MA_90_DayConv_Numerator [varchar](5) ,
	@ChronicallyNonAdherent [varchar](10)
	
   
)
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
    EXEC [ACDW_CLMS_AET_MA].[adi].[ImportAETMA_MedAdherencePlans]
	@OriginalFileName ,
	@SrcFileName  ,
	@DataDate ,
	@FileDate ,
	--@LoadDate date NOT ,
	--CreatedDate date NOT ,
	@CreatedBy ,
	--LastUpdatedDate datetime NOT ,
	@LastUpdatedBy ,

    @ProviderGroupNumber ,
	@ProviderGroupName ,
	@TIN ,
	@TINName ,
	@PIN ,
	@NPI ,
	@ProviderName ,
	@MemberID ,
	@CVTYMemberID  ,
	@MemberFirstName ,
	@MemberLastName ,
	@MemberDateofBirth ,
	@MemberPhoneNumber ,
	@MemberAddressLine1 ,
	@MemberCity  ,
	@MemberState ,
	@ZipCode  ,
	@ContractNumber ,
	@MemberStatus ,
	@SNPIndicator  ,
	@LowIncomeSubsidy ,
	@AdherenceType  ,
	@AdherenceDrugName ,
	@InitialFillDate ,
	@LatestDispensedDate ,
	@DaysSupplyCount ,
	@NextFillDate ,
	@PharmacyName ,
	@PharmacyPhoneNumber ,
	@PharmacyAddressLine1 ,
	@PharmacyCity ,
	@PharmacyState ,
	@PharmacyZipCode ,
	@PrescriberId ,
	@PrescriberName ,
	@PriorYearPDC  ,
	@PDCYTD ,
	@MissedDaysYTD ,
	@MissedDaysQ1 ,
	@MissedDaysQ2 ,
	@MissedDaysQ3 ,
	@MissedDaysQ4 ,
	@LatetofillIndicator  ,
	@Eligiblefor_30_90conversion ,
	@Eligibleforlowercostalternative ,
	@FillIndicator ,
	@STARGoal ,
	@DaysSupplyToAdherent ,
	@SUPDOpportunity ,
	@MA_90_DayConv_Denominator ,
	@MA_90_DayConv_Numerator  ,
	@ChronicallyNonAdherent 

END




