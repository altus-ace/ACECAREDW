﻿-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [adi].[ImportAETMA_Financial_MbrDetails](
    @OriginalFileName varchar (100)  ,
	@SrcFileName varchar (100)  ,
	@LoadDate varchar(10)   ,
	--@CreatedDate date   ,
	@CreatedBy varchar (50)  ,
--	@LastUpdatedDate datetime   ,
	@LastUpdatedBy varchar (50)  ,
	@ReportGroup [varchar](50) ,
	@ReportGroupName [varchar](50) ,
	@SubgroupNumber [varchar](50) ,
	@SubgroupName [varchar](50) ,
	@TIN [varchar](12) ,
	@TINName [varchar](50) ,
	@PVN [varchar](50) ,
	@PIN [varchar](50) ,
	@ProviderName [varchar](50) ,
	@EffectiveMonth [varchar](50) ,
	@Legacy [varchar](50) ,
	@SRCMemberID [varchar](50) ,
	@LastName [varchar](50) ,
	@FirstName [varchar](50) ,
	@Age [varchar](10) ,
	@AgeBand [varchar](50) ,
	@Gender [varchar](10) ,
	@Product [varchar](50) ,
	@CMSContract [varchar](50) ,
	@PBPID [varchar](50) ,
	@LineBusiness [varchar](50) ,
	@RiskScore_Projected [varchar](50) ,
	@Revenue [varchar](50) ,
	@MedicalRxCost [varchar](50) ,
	@MedicalCostFundPer [varchar](50) ,
	@RevenueNoPartD [varchar](50) ,
	@MedicalRxCostNoPartD [varchar](50) ,
	@EffectiveYear [varchar](10) ,
	@EffectiveMonthName [varchar](10) ,
	@EffectiveDate varchar(10),
	@TINReportName [varchar](50) ,
	@ProviderReportName [varchar](50) ,
	@MemberMonths [varchar](10) ,
	@AsofDate varchar(10) ,
	@Target  [varchar](50) ,
	@LocalMarketName  [varchar](50) ,
	@MarketAvgRiskScore_Projected [varchar](50) ,
	@MarketMedicalRxCost_PMPM [varchar](50),
	@MarketRevenue_PMPM [varchar](50) ,
	@MarketMedicalCostFund [varchar](50) ,
	@MarketMedical_RxCostNoPartD_PMPM [varchar](50) ,
	@MarketRevenueNo_PartD_PMPM [varchar](50) ,
	@MarketMedicalCostFund_NoPartD [varchar](50) ,
	@ProviderFirstName [varchar](50),
	@ProviderMiddleName [varchar](50),
	@ProviderLastName [varchar](50),
	@NPI [varchar](20) ,
	@Chapter [varchar](20) 

   
)
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    EXEC [ACDW_CLMS_AET_MA].[adi].[ImportAETMA_Financial_MbrDetails]
	@OriginalFileName  ,
	@SrcFileName   ,
	@LoadDate   ,
	--@CreatedDate date   ,
	@CreatedBy   ,
--	@LastUpdatedDate datetime   ,
	@LastUpdatedBy   ,
	@ReportGroup  ,
	@ReportGroupName  ,
	@SubgroupNumber  ,
	@SubgroupName  ,
	@TIN  ,
	@TINName  ,
	@PVN  ,
	@PIN  ,
	@ProviderName  ,
	@EffectiveMonth  ,
	@Legacy  ,
	@SRCMemberID  ,
	@LastName  ,
	@FirstName  ,
	@Age  ,
	@AgeBand  ,
	@Gender  ,
	@Product  ,
	@CMSContract  ,
	@PBPID  ,
	@LineBusiness  ,
	@RiskScore_Projected  ,
	@Revenue ,
	@MedicalRxCost  ,
	@MedicalCostFundPer  ,
	@RevenueNoPartD  ,
	@MedicalRxCostNoPartD  ,
	@EffectiveYear  ,
	@EffectiveMonthName  ,
	@EffectiveDate ,
	@TINReportName  ,
	@ProviderReportName  ,
	@MemberMonths  ,
	@AsofDate ,
	@Target   ,
	@LocalMarketName   ,
	@MarketAvgRiskScore_Projected  ,
	@MarketMedicalRxCost_PMPM,
	@MarketRevenue_PMPM  ,
	@MarketMedicalCostFund  ,
	@MarketMedical_RxCostNoPartD_PMPM  ,
	@MarketRevenueNo_PartD_PMPM  ,
	@MarketMedicalCostFund_NoPartD  ,
	@ProviderFirstName ,
	@ProviderMiddleName ,
	@ProviderLastName ,
	@NPI  ,
	@Chapter  
END



