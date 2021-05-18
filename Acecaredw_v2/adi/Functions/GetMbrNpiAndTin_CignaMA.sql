


-- =============================================
-- Author:		Brit Akhile
-- Create date: 2021/05/11
-- Using the new latest version of provider roster, Select Valid Npis
--, Npi and Tins and assign Tins to Npis with invalid Tins
-- =============================================

CREATE FUNCTION adi.GetMbrNpiAndTin_CignaMA (@DataDate DATE, @RowStatus INT)
					
RETURNS @Pr TABLE (
			NPI VARCHAR(50)
			,ClientNPI VARCHAR(50)
			,AttribTIN VARCHAR(50)
			,ClientTIN VARCHAR(50)
			,MemberID VARCHAR(50) 
			)
AS 


BEGIN

	
	
					--New Roster
					--Step 1 matches on NPI and then TIN to return the exact matches of both for the npi set
									
		-- DECLARE @Pr TABLE (NPI VARCHAR(50),ClientNPI VARCHAR(50),AttribTIN VARCHAR(50),ClientTIN VARCHAR(50),MemberID VARCHAR(50));DECLARE @DataDate DATE = '2021-05-03' DECLARE @RowStatus INT = 0
					INSERT INTO @Pr(NPI,AttribTIN,ClientNPI,ClientTIN,MemberID)
					SELECT	pr.NPI
							,pr.AttribTIN
							,src.NPID					AS	ClientNPI
							,''							AS	ClientTIN 
							,src.MemberID 
					FROM		(SELECT		src.memberid,src.NPID
								 FROM		[ACDW_CLMS_CIGNA_MA].[adi].[tmp_CignaMAMembership] src
								 WHERE		DataDate =  @DataDate 
								 AND		MbrLoadStatus =  @RowStatus 
								) src
					LEFT JOIN	(SELECT		* 
								 FROM		[ACECAREDW].adw.tvf_AllClient_ProviderRoster (12,GETDATE(),1)
								 )pr
					ON			pr.NPI = src.NPID 
					AND			pr.AttribTIN = ''
					
					/*Step 4. Update AttribTIN from the roster */
					UPDATE		@Pr
					SET			NPI = (CASE WHEN Toasg.ClientNPI = Toasg.prNPI THEN Toasg.ClientNPI END)
								, AttribTIN = (CASE WHEN Toasg.ClientTIN <> Toasg.prTIN THEN Toasg.prTIN  END)
					FROM		@Pr pr  
					JOIN		(  ---  SELECT * FROM (
							/*Step 2 Check to see if these NPIs exist in our roster 
								(Note that after the left join, if it still remains Null, then NPI does not exist in our roster
								, ie (Might not be in our contract))
								Step 3 Assign the TIN to NPIs that exist*/
									SELECT		*
									FROM		(
												 SELECT	NPI,AttribTIN,ClientNPI,ClientTIN
												 FROM	@Pr
												 WHERE	NPI IS NULL
												)noMatch
									LEFT JOIN	(SELECT		NPI AS prNPI,AttribTIN AS prTIN
												 FROM		ACECAREDW.[adw].[tvf_AllClient_ProviderRoster_TinRank](12,GETDATE(),1) 
												 ) a
									ON			noMatch.ClientNPI = prNPI
							)Toasg
					ON		pr.ClientNPI= Toasg.ClientNPI 
	RETURN				
	
	END

