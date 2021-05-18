



CREATE PROCEDURE	[adw].[FctPR_PryAddress]
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
	'[FctProviderPracticeAddressSkey] [int] IDENTITY(1,1) NOT NULL,'+
	'[SourceJobName] [varchar](50) NULL,'+
	'[LoadDate] [date] DEFAULT CONVERT(DATE,GETDATE()) NULL,'+
	'[DataDate] [date] DEFAULT CONVERT(DATE,GETDATE()) NULL,'+
	'[CreatedDate] [datetime] DEFAULT GETDATE() NOT NULL,'+
	'[CreatedBy] [varchar](50) DEFAULT SUSER_SNAME()  NOT NULL,'+
	'[LastUpdatedDate] [date] DEFAULT GETDATE()  NOT NULL,'+
	'[LastUpdatedBy] [varchar](50) DEFAULT SUSER_SNAME() NOT NULL,'+
	'[TIN] VARCHAR(50) NOT NULL,'+
	'[AddType] VARCHAR(20) DEFAULT ''Primary'','+
	'[PrimaryAddress] VARCHAR(50), '+
	'[PrimaryCity] VARCHAR(50), '+
	'[PrimaryState] VARCHAR(50), '+
	'[PrimaryZipcode] VARCHAR(50), '+
	'[PrimaryPOD] VARCHAR(50), '+
	'[PrimaryQuadrant] VARCHAR(50), '+
	'[PrimaryAddressPhoneNumber] VARCHAR(50),'+
	'[Fax] VARCHAR(50)' +
	')'

	--PRINT @SqlString
	EXECUTE sp_executesql @SqlString


--C Insert into all Target 
--DECLARE @ConnectionString NVARCHAR(MAX) = 'adw.FctProviderPracticePrimaryAddress'
--DECLARE @SqlString NVARCHAR(MAX) 
SET  @SqlString = 
		N'INSERT INTO ' + @ConnectionString + '('
		+	' [SourceJobName],[TIN], [PrimaryAddress], [PrimaryCity]
		, [PrimaryState], [PrimaryZipcode], [PrimaryPOD], [PrimaryQuadrant]
		, [PrimaryAddressPhoneNumber], [Fax]'   + ')' +

		'SELECT	DISTINCT ''[ast].[vw_Get_FctProvRoster_TINData_DevPR]'',[TIN]
				, [PrimaryAddress], [PrimaryCity], [PrimaryState], [PrimaryZipcode]
					,[PrimaryPOD],[PrimaryQuadrant],[PrimaryAddressPhoneNumber],[Fax]'
				+
		' FROM		[ast].[vw_Get_FctProvRoster_TINData_DevPR]'
		

		--PRINT @SqlString
		EXECUTE sp_executesql @SqlString

END

		
