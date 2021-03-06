﻿
CREATE VIEW [dbo].[vw_List_ACEAccountProvidersAddresses]
AS
SELECT DISTINCT 
                         TOP (100) PERCENT dbo.tmpSalesforce_Account.ACE_Acct_ID1__c + dbo.tmpSalesforce_Account.ACE_Acct_ID2__c AS ACEAccountID, UPPER(dbo.tmpSalesforce_Account.Name) AS AccountName, 
                         dbo.tmpSalesforce_Account.Tax_ID_Number__c AS AccountTIN, dbo.tmpSalesforce_Account.Group_NPI_Number__c AS AccountNPI, UPPER(dbo.tmpSalesforce_Account.Type__c) AS AccountType, 
                         dbo.tmpSalesforce_Contact.ACE_Provider_ID1__c + dbo.tmpSalesforce_Contact.ACE_Provider_ID2__c AS ACEProviderID, dbo.tmpSalesforce_Contact.Provider_NPI__c AS ProviderNPI, 
                         UPPER(dbo.tmpSalesforce_Contact.FirstName) + ' ' + UPPER(dbo.tmpSalesforce_Contact.LastName) AS ProviderName, UPPER(dbo.tmpSalesforce_Contact.FirstName) AS ProviderFirstName, 
                         UPPER(dbo.tmpSalesforce_Contact.LastName) AS ProviderLastName, UPPER(dbo.tmpSalesforce_Contact.Type__c) AS ProviderType, dbo.tmpSalesforce_Contact.Provider_TIN_Number__c AS ProviderTIN, 
                         dbo.tmpSalesforce_Contact.Status__c, UPPER(ISNULL(dbo.tmpSalesforce_Account_Locations__c.Address_1__c + ' ' + dbo.tmpSalesforce_Account_Locations__c.Address_2__c, ' ')) AS ACCOUNT_PRIMARY_ADDRESS, 
                         UPPER(ISNULL(dbo.tmpSalesforce_Account_Locations__c.City__c, ' ')) AS ACCOUNT_PRIMARY_CITY, UPPER(ISNULL(dbo.tmpSalesforce_Account_Locations__c.State__c, ' ')) AS ACCOUNT_PRIMARY_STATE, 
                         UPPER(ISNULL(dbo.tmpSalesforce_Zip_Code__c.Name, ' ')) AS ACCOUNT_PRIMARY_ZIPCODE, UPPER(ISNULL(dbo.tmpSalesforce_Zip_Code__c.Quadrant__c, ' ')) AS ACCOUNT_PRIMARY_POD, 
                         UPPER(ISNULL(dbo.tmpSalesforce_Account_Locations__c.Phone__c, ' ')) AS ACCOUNT_PRIMARY_ADDRESS_PHONE#, 
                         UPPER(ISNULL(dbo.tmpSalesforce_Location__c.Address_1__c + ' ' + dbo.tmpSalesforce_Location__c.Address_2__c, ' ')) AS PROVIDER_PRIMARY_ADDRESS, UPPER(ISNULL(dbo.tmpSalesforce_Location__c.City__c, ' ')) 
                         AS PROVIDER_PRIMARY_CITY, UPPER(ISNULL(dbo.tmpSalesforce_Location__c.State__c, ' ')) AS PROVIDER_PRIMARY_STATE, UPPER(ISNULL(TZ2.Name, ' ')) AS PROVIDER_PRIMARY_ZIPCODE, 
                         UPPER(ISNULL(TZ2.Quadrant__c, ' ')) AS PROVIDER_PRIMARY_POD, UPPER(ISNULL(dbo.tmpSalesforce_Location__c.Phone__c, ' ')) AS PROVIDER_PRIMARY_ADDRESS_PHONE#, 
                         UPPER(dbo.tmpSalesforce_Contact.FirstName) AS PROVIDER_FIRSTNAME, UPPER(dbo.tmpSalesforce_Contact.LastName) AS PROVIDER_LASTNAME
FROM            dbo.tmpSalesforce_Account LEFT OUTER JOIN
                         dbo.tmpSalesforce_Contact ON dbo.tmpSalesforce_Account.Id = dbo.tmpSalesforce_Contact.AccountId LEFT OUTER JOIN
                         dbo.tmpSalesforce_Account_Locations__c ON dbo.tmpSalesforce_Account_Locations__c.Account_Name__c = dbo.tmpSalesforce_Account.Id AND 
                         dbo.tmpSalesforce_Account_Locations__c.Location_Type__c = 'PRIMARY' LEFT OUTER JOIN
                         dbo.tmpSalesforce_Zip_Code__c ON dbo.tmpSalesforce_Account_Locations__c.Zip_Code__c = dbo.tmpSalesforce_Zip_Code__c.Id LEFT OUTER JOIN
                         dbo.tmpSalesforce_Location__c ON dbo.tmpSalesforce_Location__c.Provider_Name__c = dbo.tmpSalesforce_Contact.Id AND dbo.tmpSalesforce_Location__c.Address_Type__c = 'Primary' LEFT OUTER JOIN
                         dbo.tmpSalesforce_Zip_Code__c AS TZ2 ON dbo.tmpSalesforce_Location__c.ZipCode_New__c = TZ2.Id
WHERE        (dbo.tmpSalesforce_Account.In_network__c = 1)
    /* 4/3/2020: GK: Added this to ensure all rows have an NPI */
    and NOT TRY_CONVERT(INT, dbo.tmpSalesforce_Contact.Provider_NPI__c) is null
    AND NOT dbo.tmpSalesforce_Contact.Provider_NPI__c is null
  

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
         Begin Table = "tmpSalesforce_Account"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 346
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tmpSalesforce_Contact"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 339
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tmpSalesforce_Account_Locations__c"
            Begin Extent = 
               Top = 270
               Left = 38
               Bottom = 400
               Right = 305
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tmpSalesforce_Zip_Code__c"
            Begin Extent = 
               Top = 402
               Left = 38
               Bottom = 532
               Right = 250
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tmpSalesforce_Location__c"
            Begin Extent = 
               Top = 534
               Left = 38
               Bottom = 664
               Right = 369
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TZ2"
            Begin Extent = 
               Top = 666
               Left = 38
               Bottom = 796
               Right = 250
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin C', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vw_List_ACEAccountProvidersAddresses';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'riteriaPane = 
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vw_List_ACEAccountProvidersAddresses';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vw_List_ACEAccountProvidersAddresses';

