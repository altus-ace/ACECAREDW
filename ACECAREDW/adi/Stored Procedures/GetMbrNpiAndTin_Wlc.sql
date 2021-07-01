



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

CREATE PROCEDURE [adi].[GetMbrNpiAndTin_Wlc] (@DataDate DATE, @RowStatus INT,@ClientKey INT) -- [adi].[GetMbrNpiAndTin_Wlc]'2021-05-24',0,2

AS
					-- DECLARE @DataDate DATE = '2021-05-24' DECLARE @RowStatus INT = 0 DECLARE @ClientKey INT = 2
					IF OBJECT_ID('tempdb..#Pr') IS NOT NULL DROP TABLE #Pr
					CREATE TABLE #Pr(NPI VARCHAR(50),ClientNPI VARCHAR(50),AttribTIN VARCHAR(50),ClientTIN VARCHAR(50),MemberID VARCHAR(50)
										,Prov_id VARCHAR(50), ClientProviderID VARCHAR(50) )

					INSERT INTO #Pr(NPI,AttribTIN,ClientNPI,ClientTIN,MemberID,Prov_id,ClientProviderID)
					SELECT	pr.NPI
							,pr.AttribTIN
							,pr.NPI			AS	ClientNPI
							,pr.AttribTIN	AS	ClientTIN 
							,src.SEQ_Mem_ID 
							,src.Prov_id
							,pr.ClientProviderID
					FROM		(SELECT		DISTINCT b.SEQ_Mem_ID,b.Prov_id
											--,b.[Attributed_Provider_Tax_ID_Number_TIN],src.EffectiveMonth
								 FROM		adi.tvf_PdwSrc_Wlc_MemberByPcp(@DataDate) src -- 
								 JOIN		[ACECAREDW].[adi].[MbrWlcMbrByPcp] b
								 ON			src.SEQ_Mem_ID = b.SEQ_Mem_ID
								 WHERE		b.DataDate =  src.DataDate
								 AND		src.SEQ_Mem_ID = b.SEQ_Mem_ID
								 AND		b.DataDate = @DataDate
								 AND		MbrLoadStatus =  0 
								) src
					LEFT JOIN	(SELECT		* 
								 FROM		[ACECAREDW].adw.tvf_AllClient_ProviderRoster (@ClientKey,@DataDate,1)
								 )pr
					ON			pr.ClientProviderID = src.Prov_id 
					--AND			pr.AttribTIN = src.[Attributed_Provider_Tax_ID_Number_TIN]
					
					
					/*Step 4. Update AttribTIN from the roster */
					--This other part is not applicable to AetnaMA
					/*
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
												 FROM	#Pr order by npi
												 WHERE	NPI IS NULL
												)noMatch
									LEFT JOIN	(SELECT		NPI AS prNPI,AttribTIN AS prTIN
												 FROM		ACECAREDW.[adw].[tvf_AllClient_ProviderRoster_TinRank](3,GETDATE(),1) 
												 ) a
									ON			noMatch.ClientNPI = prNPI
							)Toasg
					ON		pr.ClientNPI= Toasg.ClientNPI 
					
					*/
					
					SELECT	*
					FROM	#Pr 
					

					
