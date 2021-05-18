



CREATE PROCEDURE	[adw].[FctPR_BillingAddress]
					(@ConnectionString NVARCHAR(MAX))

AS

BEGIN
				
				DECLARE	@SqlString NVARCHAR(MAX)
				


	SET @SqlString = N'DROP TABLE ' +  @ConnectionString 
	EXECUTE sp_executesql @SqlString
	
 
--B Create all Targets
  
--Create Triggers 
	SET @SqlString = 
	N'CREATE TABLE ' + @ConnectionString + '(' +
	'[FctProviderPracticeBillingSkey] [int] IDENTITY(1,1) NOT NULL,'+
	'[SourceJobName] [varchar](50) NULL,'+
	'[LoadDate] [date] DEFAULT CONVERT(DATE,GETDATE()) NULL,'+
	'[DataDate] [date] DEFAULT CONVERT(DATE,GETDATE()) NULL,'+
	'[CreatedDate] [datetime] DEFAULT GETDATE() NOT NULL,'+
	'[CreatedBy] [varchar](50) DEFAULT SUSER_SNAME()  NOT NULL,'+
	'[LastUpdatedDate] [date] DEFAULT GETDATE()  NOT NULL,'+
	'[LastUpdatedBy] [varchar](50) DEFAULT SUSER_SNAME() NOT NULL,'+
	'[TIN] VARCHAR(50) NOT NULL,'+
	'[AddType] VARCHAR(20) DEFAULT ''Billing'','+
	'[BillingAddress] VARCHAR(100), '+
	'[BillingCity] VARCHAR(50), '+
	'[BillingState] VARCHAR(50), '+
	'[BillingZipcode] VARCHAR(50), '+
	'[BillingPOD] VARCHAR(50), '+
	'[BillingAddressPhoneNumber] VARCHAR(50),'+
	')'

	--PRINT @SqlString
	EXECUTE sp_executesql @SqlString


--C Insert into all Target 
--DECLARE @ConnectionString NVARCHAR(MAX) = 'adw.FctProviderPracticeBillingAddress'
--DECLARE @SqlString NVARCHAR(MAX) 
SET  @SqlString = 
		N'INSERT INTO ' + @ConnectionString + '('
		+	' [SourceJobName],[TIN], [BillingAddress], [BillingCity]
		, [BillingState], [BillingZipcode], [BillingPOD]
		, [BillingAddressPhoneNumber]'   + ')' +

		'SELECT	DISTINCT ''[ast].[vw_Get_FctProvRoster_TINData_DevPR]'',[TIN]
				, [BillingAddress], [BillingCity], [BillingState], [BillingZipcode]
					,[BillingPOD],[BillingAddressPhoneNumber]'
				+
		' FROM		[ast].[vw_Get_FctProvRoster_TINData_DevPR]'
		

		--PRINT @SqlString
		EXECUTE sp_executesql @SqlString

END

		
