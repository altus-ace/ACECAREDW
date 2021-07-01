﻿



-- =============================================
-- Author:		Brit Akhile
-- Create date: 2021/05/11
-- Using the new latest version of provider roster, Select Valid Npis
--, Npi and Tins and assign Tins to Npis with invalid Tins
/*
	Step 1: Declare a table variable
	Step 2: Check to see if these NPIs exist in our roster 
			(Note that after the left join, if it still remains Null, then NPI does not exist in our roster
			, ie (Might not be in our contract))
	Step 3: Assign the TIN to NPIs that exist
	Step 4: Update AttribTIN from the roster
*/
-- =============================================

CREATE PROCEDURE [adi].[GetMbrNpiAndTin_UHC] (@LoadDate DATE, @RowStatus INT,@ClientKey INT) -- [adi].[GetMbrNpiAndTin_UHC]'2021-05-17',0,1

AS
					-- DECLARE @LoadDate DATE = '2021-05-17' DECLARE @RowStatus INT = 0 DECLARE @ClientKey INT = 1
					IF OBJECT_ID('tempdb..#Pr') IS NOT NULL DROP TABLE #Pr
					CREATE TABLE #Pr(NPI VARCHAR(50),ClientNPI VARCHAR(50),AttribTIN VARCHAR(50),ClientTIN VARCHAR(50),MemberID VARCHAR(50))

					INSERT INTO #Pr(NPI,AttribTIN,ClientNPI,ClientTIN,MemberID)
					SELECT	pr.NPI
							,pr.AttribTIN
							,src.PROVIDER_NPI			AS	ClientNPI
							,src.IRS_TAX_ID	AS	ClientTIN 
							,src.SUBSCRIBER_ID 
					FROM		(SELECT		DISTINCT src.SUBSCRIBER_ID,src.PROVIDER_NPI
											,src.IRS_TAX_ID
								 FROM		[ACDW_CLMS_UHC].[adi].[UHCMemberbyProvider] src -- 
								 WHERE		DataDate =  @LoadDate 
								) src
					LEFT JOIN	(SELECT		* 
								 FROM		[ACECAREDW].adw.tvf_AllClient_ProviderRoster (@ClientKey,GETDATE(),1)
								 )pr
					ON			pr.NPI = src.PROVIDER_NPI 
					AND			pr.AttribTIN = src.IRS_TAX_ID
					
					
					/*Step 4. Update AttribTIN from the roster */
					--This other part is not applicable to AetnaMA
					
					UPDATE		#Pr
					SET			NPI = (CASE WHEN Toasg.ClientNPI = Toasg.prNPI THEN Toasg.ClientNPI END)
								, AttribTIN = (CASE WHEN Toasg.ClientTIN <> Toasg.prTIN THEN Toasg.prTIN  END)
					FROM		#Pr pr  --  SELECT * FROM #PR pr
					JOIN		(  ---  SELECT * FROM (
							--Step 2 
								--Step 3 
									SELECT		*
									FROM		(
												 SELECT	NPI,AttribTIN,ClientNPI,ClientTIN
												 FROM	#Pr 
												 WHERE	NPI IS NULL
												)noMatch
									LEFT JOIN	(SELECT		NPI AS prNPI,AttribTIN AS prTIN
												 FROM		ACECAREDW.[adw].[tvf_AllClient_ProviderRoster_TinRank](@ClientKey,GETDATE(),1) 
												 ) a
									ON			noMatch.ClientNPI = prNPI
							)Toasg
					ON		pr.ClientNPI= Toasg.prNPI 
					
					
					
					SELECT	*
					FROM	#Pr 
					

					