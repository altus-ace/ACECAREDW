﻿-- =============================================
-- Author:		Bing Yu
-- Create date: 01/11/2021
-- Description:	Insert Eligibility Monthly file to DB
-- 
-- =============================================
CREATE PROCEDURE [adi].[ImportDHTX_EligibilityMonthly]
	@SrcFileName varchar(100),
	@FileDate varchar(10) ,
	--@CreateDatedatetime] ,
	@CreateBy  varchar(100) ,
	@OriginalFileName varchar(100)  ,
	@LastUpdatedBy  varchar(100) ,
--	@LastUpdatedDatedatetime] ,
	@DataDate varchar(10) ,
	@ReportDate varchar(20) ,
	@EffectiveMonth varchar(10) ,
	@MemberID varchar(50) ,
	@MBI varchar(50) ,
	@MemberFirstName varchar(50) ,
	@MemberMiddleInitial varchar(20) ,
	@MemberLastName varchar(50) ,
	@MemberDOB varchar(15) ,
	@MemberAddressLine1  varchar(100) ,
	@MemberAddressLine2  varchar(100) ,
	@MemberCity varchar(50) ,
	@MemberState varchar(20) ,
	@MemberZip varchar(10) ,
	@MemberCounty varchar(50) ,
	@MemberPhone varchar(20) ,
	@MemberMobilePhone varchar(20) ,
	@MemberEmail varchar(50) ,
	@MemberLanguage varchar(20) ,
	@MemberGender varchar(10) ,
	@MemberDeathDate varchar(15) ,
	@PlanName varchar(50) ,
	@CMSContractPBP varchar(50) ,
	@DualEligibleStatus varchar(20) ,
	@MedicareSecondaryPayer varchar(50) ,
	@Hospice varchar(50) ,
	@MemberESRDIndicator varchar(50) ,
	@PcpFirstName varchar(50) ,
	@PcpLastName varchar(50) ,
	@PcpNpi varchar(12) ,
	@DevotedPCPID varchar(50) ,
	@PcpPracticeName varchar(50) ,
	@PcpTIN varchar(20) ,
	@PcpTINName varchar(50) ,
	@PcpAddressLine1 varchar(50) ,
	@PcpAddressLine2 varchar(50) ,
	@PcpCity varchar(20) ,
	@PcpState varchar(10) ,
	@PcpCounty varchar(20) ,
	@PcpZipCode varchar(10) ,
	@PcpPhone varchar(20) ,
	@AgentOfRecord varchar(50) ,
	@NewThisMonth varchar(20) ,
	@MonthEndStatus varchar(20),
	@EnrollmentStartDate varchar(10),
	@EnrollmentEndDate varchar(10),
    @PCPStartDate varchar(10),
	@PCPEndDate varchar(10),
	@DevotedPCPGroupID varchar(50),
	@LineOfBusiness varchar(100)
--	@Statuschar(1)
         
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	EXEC [ACDW_CLMS_DHTX].adi.ImportDHTX_EligibilityMonthly
	@SrcFileName  ,
	@FileDate   ,
	--@CreateDatedatetime] ,
	@CreateBy    ,
	@OriginalFileName    ,
	@LastUpdatedBy    ,
--	@LastUpdatedDatedatetime] ,
	@DataDate   ,
	@ReportDate   ,
	@EffectiveMonth   ,
	@MemberID   ,
	@MBI   ,
	@MemberFirstName   ,
	@MemberMiddleInitial   ,
	@MemberLastName   ,
	@MemberDOB  ,
	@MemberAddressLine1    ,
	@MemberAddressLine2    ,
	@MemberCity   ,
	@MemberState   ,
	@MemberZip   ,
	@MemberCounty   ,
	@MemberPhone   ,
	@MemberMobilePhone   ,
	@MemberEmail   ,
	@MemberLanguage   ,
	@MemberGender   ,
	@MemberDeathDate ,
	@PlanName   ,
	@CMSContractPBP   ,
	@DualEligibleStatus   ,
	@MedicareSecondaryPayer   ,
	@Hospice   ,
	@MemberESRDIndicator   ,
	@PcpFirstName   ,
	@PcpLastName   ,
	@PcpNpi ,
	@DevotedPCPID   ,
	@PcpPracticeName   ,
	@PcpTIN   ,
	@PcpTINName   ,
	@PcpAddressLine1   ,
	@PcpAddressLine2   ,
	@PcpCity   ,
	@PcpState   ,
	@PcpCounty   ,
	@PcpZipCode   ,
	@PcpPhone   ,
	@AgentOfRecord   ,
	@NewThisMonth   ,
	@MonthEndStatus   ,
	@EnrollmentStartDate,
	@EnrollmentEndDate ,
    @PCPStartDate ,
	@PCPEndDate ,
	@DevotedPCPGroupID ,
	@LineOfBusiness 
	
END