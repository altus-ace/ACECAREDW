﻿-- =============================================
-- Author:		Bing Yu
-- Create date: 03/21/2019
-- Description:	Insert UHC Memebership info to UHC Memeber DB
-- =============================================
CREATE PROCEDURE [adi].[ImportUHCMember]
( 
    @mbrFName varchar(75) ,
	@mbrMName varchar(75),
	@mbrLName varchar(75),
	@UHC_SUBSCRIBER_ID VARCHAR(50),
	@CLASS VARCHAR(20),
	@PLAN_ID VARCHAR(20) ,
	@PRODUCT_CODE VARCHAR(20),
	@SUBGRP_ID VARCHAR(20),
	@SUBGRP_NAME VARCHAR(100),
	@MEDICARE_ID VARCHAR(12) ,
	@MEDICAID_ID VARCHAR(9),
	@AGE VARCHAR(5),
	@DATE_OF_BIRTH VARCHAR(10),
	@GENDER VARCHAR(20),
	@RELATIONSHIP_CODE VARCHAR(20),
	@LANG_CODE VARCHAR(20),
	@MEMBER_HOME_ADDRESS VARCHAR(100),
	@MEMBER_HOME_ADDRESS2 VARCHAR(100) ,
	@MEMBER_HOME_CITY VARCHAR(40) ,
	@MEMBER_HOME_STATE VARCHAR(20) ,
	@MEMBER_HOME_ZIP VARCHAR(15) ,
	@MEMBER_HOME_PHONE VARCHAR(25) ,
	@MEMBER_MAIL_ADDRESS VARCHAR(100) ,
	@MEMBER_MAIL_ADDRESS2 VARCHAR(100) ,
	@MEMBER_MAIL_CITY VARCHAR(40) ,
	@MEMBER_MAIL_STATE VARCHAR(20) ,
	@MEMBER_MAIL_ZIP VARCHAR(15) ,
	@MEMBER_MAIL_PHONE VARCHAR(25) ,
	@MEMBER_COUNTY_CODE VARCHAR(10) ,
	@MEMBER_COUNTY VARCHAR(50) ,
	@MEMBER_BUS_PHONE VARCHAR(25) ,
	@DUAL_COV_FLAG VARCHAR(20) ,
	@COB_FLAG VARCHAR(20),
	@MEMBER_ORG_EFF_DATE varchar(10) ,
	@MEMBER_CONT_EFF_DATE varchar(10) ,
	@MEMBER_CUR_EFF_DATE varchar(10),
	@MEMBER_CUR_TERM_DATE varchar(10) ,
	@CLASS_PLAN_ID VARCHAR(20) ,
	@RESP_LAST_NAME VARCHAR(75) ,
	@RESP_FIRST_NAME VARCHAR(75) ,
	@RESP_ADDRESS VARCHAR(100) ,
	@RESP_ADDRESS2 VARCHAR(100) ,
	@RESP_CITY VARCHAR(40) ,
	@RESP_STATE VARCHAR(20) ,
	@RESP_ZIP VARCHAR(15) ,
	@RESP_PHONE VARCHAR(25) ,
	@BROKER_ID VARCHAR(50) ,
	@PCP_UHC_ID VARCHAR(50) ,
	@PCP_FIRST_NAME VARCHAR(75) ,
	@PCP_LAST_NAME VARCHAR(75) ,
	@PCP_MPIN VARCHAR(50) ,
	@PCP_NPI VARCHAR(10) ,
	@PCP_PROV_TYPE_ID VARCHAR(20) ,
	@PCP_PROV_TYPE VARCHAR(50) ,
	@PCP_INDICATOR VARCHAR(20) ,
	@CMG VARCHAR(20) ,
	@PCP_PHONE VARCHAR(25) ,
	@PCP_FAX VARCHAR(25) ,
	@PCP_ADDRESS VARCHAR(100) ,
	@PCP_ADDRESS2 VARCHAR(100) ,
	@PCP_CITY VARCHAR(40) ,
	@PCP_STATE VARCHAR(20) ,
	@PCP_ZIP VARCHAR(15) ,
	@PCP_COUNTY VARCHAR(50) ,
	@PCP_EFFECTIVE_DATE varchar(10) ,
	@PCP_TERM_DATE varchar(10) ,
	@PCP_PRACTICE_TIN VARCHAR(15) ,
	@PCP_GROUP_ID VARCHAR(50) ,
	@PCP_PRACTICE_NAME VARCHAR(100) ,
	@IND_PRACT_ID VARCHAR(50) ,
	@IND_PRACT_NAME VARCHAR(100) ,
	@RECERT_DATE varchar(10) ,
	@ETHNICITY VARCHAR(10) ,
	@ETHNICITY_DESC VARCHAR(50) ,
	@AUTO_ASSIGN VARCHAR(50) ,
	@ASAP_ID VARCHAR(50) ,
	@FEW_ID VARCHAR(50) ,
	@LST_HRA_DATE VARCHAR(10) ,
	@NXT_HRA_DATE VARCHAR(10),
	@HRA_ID VARCHAR(50) ,
	@MEMBER_EMail VARCHAR(125) ,
	@PCP_Specialty_Code VARCHAR(50) ,
	@PCP_Specialty VARCHAR(255) ,
	@SourceFileName VARCHAR(100) ,
	@InQuarantine varchar(10),
	@LoadType varchar(2),
	--@LoadDate @date NOT ,
	@DataDate VARCHAR(10),
	--@CreateDate VARCHAR(10),
	@CreateBy VARCHAR(50),
--	@LastUpdatedDate @datetime2(7) NOT ,
	@LastUpdatedBy VARCHAR(50)
)

   
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

--	UPDATE UHCMember 
--	SET FirstName = @FirstName,
--	    LastName = @LastName

 --   WHERE SubscriberID = @SubscriberID
	 
--	IF @@ROWCOUNT = 0
	BEGIN
    -- Insert statements 
		INSERT INTO adi.mbrUhcMbrByPcp
		(
			mbrFName,
			mbrMName ,
			mbrLName ,
			UHC_SUBSCRIBER_ID ,
			CLASS ,
			PLAN_ID ,
			PRODUCT_CODE ,
			SUBGRP_ID ,
			SUBGRP_NAME ,
			MEDICARE_ID ,
			MEDICAID_ID ,
			AGE ,
			DATE_OF_BIRTH ,
			GENDER ,
			RELATIONSHIP_CODE ,
			LANG_CODE,
			MEMBER_HOME_ADDRESS ,
			MEMBER_HOME_ADDRESS2 ,
			MEMBER_HOME_CITY ,
			MEMBER_HOME_STATE ,
			MEMBER_HOME_ZIP ,
			MEMBER_HOME_PHONE ,
			MEMBER_MAIL_ADDRESS ,
			MEMBER_MAIL_ADDRESS2 ,
			MEMBER_MAIL_CITY ,
			MEMBER_MAIL_STATE ,
			MEMBER_MAIL_ZIP,
			MEMBER_MAIL_PHONE ,
			MEMBER_COUNTY_CODE ,
			MEMBER_COUNTY ,
			MEMBER_BUS_PHONE ,
			DUAL_COV_FLAG ,
			COB_FLAG,
			MEMBER_ORG_EFF_DATE ,
			MEMBER_CONT_EFF_DATE ,
			MEMBER_CUR_EFF_DATE,
			MEMBER_CUR_TERM_DATE ,
			CLASS_PLAN_ID ,
			RESP_LAST_NAME,
			RESP_FIRST_NAME ,
			RESP_ADDRESS ,
			RESP_ADDRESS2 ,
			RESP_CITY ,
			RESP_STATE ,
			RESP_ZIP ,
			RESP_PHONE,
			BROKER_ID ,
			PCP_UHC_ID ,
			PCP_FIRST_NAME ,
			PCP_LAST_NAME ,
			PCP_MPIN,
			PCP_NPI ,
			PCP_PROV_TYPE_ID,
			PCP_PROV_TYPE ,
			PCP_INDICATOR ,
			CMG ,
			PCP_PHONE ,
			PCP_FAX ,
			PCP_ADDRESS ,
			PCP_ADDRESS2 ,
			PCP_CITY ,
			PCP_STATE ,
			PCP_ZIP ,
			PCP_COUNTY ,
			PCP_EFFECTIVE_DATE ,
			PCP_TERM_DATE ,
			PCP_PRACTICE_TIN ,
			PCP_GROUP_ID ,
			PCP_PRACTICE_NAME ,
			IND_PRACT_ID ,
			IND_PRACT_NAME ,
			RECERT_DATE,
			ETHNICITY ,
			ETHNICITY_DESC ,
			AUTO_ASSIGN,
			ASAP_ID ,
			FEW_ID ,
			LST_HRA_DATE ,
			NXT_HRA_DATE ,
			HRA_ID ,
			MEMBER_EMail ,
			PCP_Specialty_Code ,
			PCP_Specialty ,
			SourceFileName ,
			InQuarantine ,
			LoadType ,
			LoadDate ,
			DataDate ,
			CreateDate ,
		    CreateBy ,
			LastUpdatedDate ,
			LastUpdatedBy 

											 														
		)
		VALUES (
		       

	@mbrFName,
	@mbrMName ,
	@mbrLName ,
	@UHC_SUBSCRIBER_ID ,
	@CLASS ,
	@PLAN_ID  ,
	@PRODUCT_CODE ,
	@SUBGRP_ID ,
	@SUBGRP_NAME ,
	@MEDICARE_ID ,
	@MEDICAID_ID ,
	CASE WHEN (@AGE = '')
	THEN NULL
	ELSE CONVERT(int,@AGE)
	END ,
	CASE WHEN (@DATE_OF_BIRTH = '')
	THEN NULL
	ELSE CONVERT(date, @DATE_OF_BIRTH)
	END ,
	@GENDER ,
	@RELATIONSHIP_CODE ,
	@LANG_CODE ,
	@MEMBER_HOME_ADDRESS ,
	@MEMBER_HOME_ADDRESS2  ,
	@MEMBER_HOME_CITY ,
	@MEMBER_HOME_STATE ,
	@MEMBER_HOME_ZIP  ,
	@MEMBER_HOME_PHONE ,
	@MEMBER_MAIL_ADDRESS ,
	@MEMBER_MAIL_ADDRESS2  ,
	@MEMBER_MAIL_CITY  ,
	@MEMBER_MAIL_STATE  ,
	@MEMBER_MAIL_ZIP ,
	@MEMBER_MAIL_PHONE ,
	@MEMBER_COUNTY_CODE  ,
	@MEMBER_COUNTY  ,
	@MEMBER_BUS_PHONE ,
	@DUAL_COV_FLAG  ,
	@COB_FLAG,
	CASE WHEN (@MEMBER_ORG_EFF_DATE = '')
	THEN NULL
	ELSE CONVERT(date, @MEMBER_ORG_EFF_DATE)
	END ,
    CASE WHEN (@MEMBER_CONT_EFF_DATE = '')
	THEN NULL
	ELSE CONVERT(date, @MEMBER_CONT_EFF_DATE )
	END ,
	CASE WHEN (@MEMBER_CUR_EFF_DATE = '')
	THEN NULL
	ELSE CONVERT(date, @MEMBER_CUR_EFF_DATE)
	END ,
	CASE WHEN (@MEMBER_CUR_TERM_DATE  = '')
	THEN NULL
	ELSE CONVERT(date, @MEMBER_CUR_TERM_DATE )
	END ,
	@CLASS_PLAN_ID  ,
	@RESP_LAST_NAME  ,
	@RESP_FIRST_NAME  ,
	@RESP_ADDRESS  ,
	@RESP_ADDRESS2  ,
	@RESP_CITY  ,
	@RESP_STATE ,
	@RESP_ZIP ,
	@RESP_PHONE  ,
	@BROKER_ID  ,
	@PCP_UHC_ID  ,
	@PCP_FIRST_NAME  ,
	@PCP_LAST_NAME  ,
	@PCP_MPIN  ,
	@PCP_NPI  ,
	@PCP_PROV_TYPE_ID  ,
	@PCP_PROV_TYPE  ,
	@PCP_INDICATOR ,
	@CMG  ,
	@PCP_PHONE ,
	@PCP_FAX  ,
	@PCP_ADDRESS  ,
	@PCP_ADDRESS2  ,
	@PCP_CITY  ,
	@PCP_STATE  ,
	@PCP_ZIP  ,
	@PCP_COUNTY  ,
	CASE WHEN (@PCP_EFFECTIVE_DATE  = '')
	THEN NULL
	ELSE CONVERT(date, @PCP_EFFECTIVE_DATE)
	END ,
	CASE WHEN (@PCP_TERM_DATE   = '')
	THEN NULL
	ELSE CONVERT(date, @PCP_TERM_DATE)
	END ,
	@PCP_PRACTICE_TIN  ,
	@PCP_GROUP_ID  ,
	@PCP_PRACTICE_NAME  ,
	@IND_PRACT_ID  ,
	@IND_PRACT_NAME  ,
	CASE WHEN (	@RECERT_DATE    = '')
	THEN NULL
	ELSE CONVERT(date, 	@RECERT_DATE)
	END ,
	@ETHNICITY  ,
	@ETHNICITY_DESC  ,
	@AUTO_ASSIGN  ,
	@ASAP_ID  ,
	@FEW_ID ,
	CASE WHEN (@LST_HRA_DATE = '')
	THEN NULL
	ELSE CONVERT(date, 	@LST_HRA_DATE)
	END ,
	CASE WHEN (@NXT_HRA_DATE = '')
	THEN NULL
	ELSE CONVERT(date, @NXT_HRA_DATE)
	END ,
	@HRA_ID  ,
	@MEMBER_EMail ,
	@PCP_Specialty_Code  ,
	@PCP_Specialty ,
	@SourceFileName ,
	CASE WHEN (	@InQuarantine  = '')
	THEN NULL
	ELSE CONVERT(tinyint, 	@InQuarantine )
	END ,
	@LoadType,
	--@LoadDate @date NOT ,
	GETDATE(),
	@DataDate,
	--@CreateDate VARCHAR(10),
	GETDATE(),
	@CreateBy ,
--	@LastUpdatedDate @datetime2(7) NOT ,
	GETDATE(),
	@LastUpdatedBy
	) 

    END
END




