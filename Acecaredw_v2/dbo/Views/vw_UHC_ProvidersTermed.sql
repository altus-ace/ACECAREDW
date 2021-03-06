﻿CREATE VIEW dbo.vw_UHC_ProvidersTermed
AS
SELECT DISTINCT TMPSALESFORCE_CONTACT.PROVIDER_NPI__C AS 'NPI'
	,[PROVIDER MPIN] = ' ' /* UHC INTERNAL USE ONLY*/
	,[PROVIDER #] = ' '
	,UPPER(ISNULL(TMPSALESFORCE_CONTACT.LASTNAME, ' ')) AS 'LAST NAME'
	,UPPER(ISNULL(TMPSALESFORCE_CONTACT.FIRSTNAME, ' ')) AS 'FIRST NAME'
	,UPPER(ISNULL(UPPER(CAST(Stuff((
						SELECT ',' + RTRIM(DEGREE_NAME__C)
						FROM tmpSalesforce_Provider_Degree__c TD
						WHERE TD.CONTACT__C = TD2.CONTACT__C
							AND TD.DEGREE_NAME__C NOT IN (
								'(OTHER)'
								,' '
								)
						FOR XML Path('')
						), 1, 1, '') AS VARCHAR(100))), ' ')) AS DEGREE
	,UPPER(ISNULL(TMPSALESFORCE_ACCOUNT.Tax_ID_Number__c, ' ')) AS 'TAX ID'
	,UPPER(ISNULL(TMPSALESFORCE_PROVIDER_Specialties__C.Speciality_Name_CAQH__c, ' ') )AS 'PRIMARY SPECIALTY'
	,UPPER(ISNULL(TMPSALESFORCE_ACCOUNT.NAME, ' ')) AS 'GROUP NAME'
	,UPPER(ISNULL((tmpSalesforce_Account_Locations__c.Address_1__c + ' ' + tmpSalesforce_Account_Locations__c.Address_2__c), ' ')) AS 'PRIMARY ADDRESS'
	,UPPER(ISNULL(tmpSalesforce_Account_Locations__c.City__c, ' ')) AS 'PRIMARY CITY'
	,UPPER(ISNULL(tmpSalesforce_Account_Locations__c.State__c, ' ')) AS 'PRIMARY STATE'
	,UPPER(ISNULL(tmpSalesforce_Zip_Code__c.NAME, ' ')) AS 'PRIMARY ZIPCODE'
	,UPPER(ISNULL(tmpsalesforce_zip_code__c.Quadrant__c, ' ')) AS 'PRIMARY POD'
	,UPPER(ISNULL(tmpSalesforce_Account_LocationS__C.Phone__c, ' ')) AS 'PRIMARY ADDRESS PHONE#'
	,UPPER(ISNULL(TL2.Address_1__c + ' ' + TL2.Address_2__c, ' ')) AS 'BILLING ADDRESS'
	,UPPER(ISNULL(TL2.City__c, ' ')) AS 'BILLING CITY'
	,UPPER(ISNULL(TL2.State__c, ' ')) AS 'BILLING STATE'
	,UPPER(ISNULL(TZ1.NAME, ' ')) AS 'BILLING ZIPCODE'
	,UPPER(ISNULL(TZ1.Quadrant__c, ' ')) AS 'BILLING POD'
	,UPPER(ISNULL(TL2.Phone__c, ' ')) AS 'BILLING ADDRESS PHONE#'
	,TMPSALESFORCE_CONTACT.DEA_Expiration__c AS 'TERMDATE'
	,UPPER(TMPSALESFORCE_CONTACT.Status__c) AS 'STATUS'
	,'COMMENTS' = ' '
FROM TMPSALESFORCE_CONTACT
LEFT JOIN tmpSalesforce_Provider_Degree__c TD2 ON TD2.CONTACT__C = TMPSALESFORCE_CONTACT.ID
LEFT JOIN tmpSalesforce_Account ON TMPSALESFORCE_CONTACT.ACCOUNTID = tmpSalesforce_Account.ID
	AND tmpSalesforce_Account.IN_NETWORK__c = 1
LEFT JOIN TMPSALESFORCE_PROVIDER_Specialties__C ON TMPSALESFORCE_PROVIDER_SPECIALTIES__C.Provider_Name__c = TMPSALESFORCE_CONTACT.ID
	AND Specialtiy_Type__c = 'PRIMARY'
LEFT JOIN tmpSalesforce_Account_Locations__c ON tmpSalesforce_Account_Locations__c.Account_Name__c = TMPSALESFORCE_ACCOUNT.ID
	AND tmpSalesforce_Account_Locations__c.Location_Type__c = 'PRIMARY'
LEFT JOIN tmpSalesforce_Account_Locations__c TL2 ON TL2.Account_Name__c = TMPSALESFORCE_ACCOUNT.ID
	AND TL2.Location_Type__c = 'BILLING'
LEFT JOIN tmpSalesforce_Zip_Code__c ON tmpSalesforce_Account_Locations__c.Zip_Code__c = tmpSalesforce_Zip_Code__c.ID
LEFT JOIN tmpSalesforce_Zip_Code__c TZ1 ON TL2.Zip_Code__c = TZ1.ID
WHERE tmpSalesforce_Contact.Status__c in('Termed')
	AND tmpsalesforce_Contact.Type__c IN ('PCP')
	AND LASTNAME NOT IN (
		'TEST'
		,'TESTLAST'
		,'ACETEST'
		)
	AND tmpsalesforce_Account.in_Network__c = '1'
	AND TMPSALESFORCE_CONTACT.DEA_Expiration__c>=GETDATE()-31 AND TMPSALESFORCE_CONTACT.DEA_Expiration__c<= GETDATE()     

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vw_UHC_ProvidersTermed';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vw_UHC_ProvidersTermed';

