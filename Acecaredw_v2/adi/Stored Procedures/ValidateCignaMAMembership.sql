
CREATE PROCEDURE adi.ValidateCignaMAMembership

AS

DECLARE @LoadDate DATE = '2021-05-03'

					--Select count datadate
					SELECT   COUNT(*)RecCnt,[DataDate]
							 ,MbrLoadStatus
					FROM	 [ACDW_CLMS_CIGNA_MA].[adi].[tmp_CignaMAMembership]
					GROUP BY [DataDate],MbrLoadStatus
					ORDER BY DataDate DESC
					
					
					--New Roster
					--Step 1 matches on NPI and then TIN to return the exact matches of both for the npi set
					--Insert into a temp table DROP TABLE #Pr  -- SELECT * FROM #Pr order by npi
					IF OBJECT_ID('tempdb..#Pr') IS NOT NULL DROP TABLE #Pr
					CREATE TABLE #Pr(NPI VARCHAR(50),ClientNPI VARCHAR(50),AttribTIN VARCHAR(50),ClientTIN VARCHAR(50),MemberID VARCHAR(50))

					INSERT INTO #Pr(NPI,AttribTIN,ClientNPI,ClientTIN,MemberID)
					SELECT	pr.NPI
							,pr.AttribTIN
							,src.NPID					AS	ClientNPI
							,''							AS	ClientTIN 
							,src.MemberID 
					FROM		(SELECT		src.memberid,src.NPID
								 FROM		[ACDW_CLMS_CIGNA_MA].[adi].[tmp_CignaMAMembership] src
								 WHERE		DataDate = '2021-05-03'
								 AND		MbrLoadStatus =0
								) src
					LEFT JOIN	(SELECT		* 
								 FROM		[ACECAREDW].adw.tvf_AllClient_ProviderRoster (12,GETDATE(),1)
								 )pr
					ON			pr.NPI = src.NPID -- order by memberid --- 1326209354
					AND			pr.AttribTIN = ''
					--  SELECT * FROM #Pr where npi is null
					/*Step 4. Update AttribTIN from the roster */
					UPDATE		#Pr
					SET			NPI = (CASE WHEN Toasg.ClientNPI = Toasg.prNPI THEN Toasg.ClientNPI END)
								, AttribTIN = (CASE WHEN Toasg.ClientTIN <> Toasg.prTIN THEN Toasg.prTIN  END)
					FROM		#Pr pr  --  SELECT * FROM #PR pr
					JOIN		(  ---  SELECT * FROM (
							/*Step 2 Check to see if these NPIs exist in our roster 
								(Note that after the left join, if it still remains Null, then NPI does not exist in our roster
								, ie (Might not be in our contract))
								Step 3 Assign the TIN to NPIs that exist*/
									SELECT		*
									FROM		(
												 SELECT	NPI,AttribTIN,ClientNPI,ClientTIN
												 FROM	#Pr
												 WHERE	NPI IS NULL
												)noMatch
									LEFT JOIN	(SELECT		NPI AS prNPI,AttribTIN AS prTIN
												 FROM		ACECAREDW.[adw].[tvf_AllClient_ProviderRoster_TinRank](12,GETDATE(),1) --where NPI = '1326209354'
												 ) a
									ON			noMatch.ClientNPI = prNPI
							)Toasg
					ON		pr.ClientNPI= Toasg.ClientNPI 
					

					-- DECLARE @LoadDate DATE = '2021-05-03'
					SELECT DISTINCT * FROM (
					  SELECT REPLACE(adiData.memberid,'*', '')  AS ClientSubscriberId /* clean the input, if astrick in source, remove */
					   , client.clientKey AS ClientKey, 			   
			           adiData.lastname, adiData.firstname, adiData.middlename, adiData.ssn, 				   
			           adiData.gender, adiData.DOB, adiData.medicareid, adiData.LanguageDesc, 				   
			           pr.NPI, pr.AttribTIN, adiData.effectivedate ClientEffectiveDate, adiData.groupid, 		   
			           adiData.plan_name, 														   
			           adiData.SrcFileName, 														   
			           'tmp_CignaMAMembership' AS AdiTableName, 										   
			           adiData.MbrKey AS adiKey, 													   
			           'Loaded' AS RowStatus, 														   
			          @LoadDate AS LoadDate, 														   
			           adiData.DataDate, 															   
			           adiData.dualeligibility,													   
			           ROW_NUMBER() OVER(PARTITION BY adiData.MEMBERID ORDER BY adiData.dataDate DESC) aRowNumber  				    
				    FROM Acdw_clms_Cigna_Ma.[adi].[tmp_CignaMAMembership] AS adiData						   
				         JOIN lst.list_client Client ON client.ClientShortName = 'Cigna_MA'					   
				         LEFT JOIN (																   
				        	  SELECT * FROM adi.GetMbrNpiAndTin_CignaMA (@LoadDate,0)									   
				        	  ) PR																	   
				        	  ON adiData.NPID = PR.NPI									   
				        		 --AND @LoadDate BETWEEN Pr.EffectiveDate AND pr.ExpirationDate					   
				    WHERE adiData.DataDate = @loadDate
					AND	  adiData.MbrLoadStatus = 0
					--AND pr.RwCnt = 1											   
			 ) src																			   
			 JOIN lst.lstPlanMapping tPlan 
			 ON src.plan_name = tPlan.SourceValue
			 WHERE TargetSystem = 'ACDW'
		  AND src.aRowNumber = 1

		  --what to do, work on cigna load, work on staging to invalidate rows with no npi or plan

					

		  SELECT * FROM [ACDW_CLMS_CIGNA_MA].[adi].[tmp_CignaMAMembership] WHERE DataDate = '2021-05-03'
		  --Membership Validation
		  --1
		  ---SELECT COUNT(*), MstrMrnKey from(
		  SELECT prvNPI,prvTIN,plnProductSubPlanName
				 ,plnProductPlan,plnProductSubPlan
				 ,MstrMrnKey --,* 
		  FROM	 ast.MbrStg2_MbrData 
		  WHERE	 ClientKey = 12 AND LoadDate = '2021-05-03'
		  AND    prvNPI IS NOT NULL
		  AND    plnProductSubPlanName IS NOT NULL
		  --)a
		  --GROUP BY MstrMrnKey
		  --HAVING COUNT(*)>1

		  SELECT	* 
		  FROM		ast.MbrStg2_PhoneAddEmail 
		  WHERE		ClientKey = 12 
		  AND		LoadDate = '2021-05-03'

		  --2
		  ---Update invalid Mbrs records BEGIN TRAN COMMIT
		  
		  SELECT prvNPI,prvTIN,plnProductSubPlanName
				 ,plnProductPlan,plnProductSubPlan
				 ,MstrMrnKey ,stgRowStatus,AdiKey,* 
		  FROM	 ast.MbrStg2_MbrData 
		  WHERE	 ClientKey = 12 AND LoadDate = '2021-05-03'  ---495
		  AND    (prvNPI IS  NULL
		  OR    plnProductSubPlanName IS  NULL) ---Not Null = 487

		  --Update Not Valid Records
		  UPDATE ast.MbrStg2_MbrData 
		  SET	stgRowStatus = 'Not Valid'
		  WHERE	 ClientKey = 12 AND LoadDate = '2021-05-03'  ---495
		  AND    (prvNPI IS  NULL
		  OR    plnProductSubPlanName IS  NULL) ---Not Null = 487

		  --Update Invalid Members Address, Email and Phones
		  SELECT * FROM ast.MbrStg2_PhoneAddEmail WHERE ClientKey = 12 AND LoadDate = '2021-05-03'

		  SELECT		em.AdiKey,mbr.AdiKey,em.stgRowStatus,mbr.stgRowStatus
		  FROM			ast.MbrStg2_PhoneAddEmail em
		  JOIN			ast.MbrStg2_MbrData mbr
		  ON			em.AdiKey = mbr.AdiKey
		  WHERE			mbr.LoadDate = '2021-05-03'
		  AND			mbr.stgRowStatus = 'Not Valid'

		  --update records
		  begin tran commit
		  UPDATE		ast.MbrStg2_PhoneAddEmail
		  SET			stgRowStatus = mbr.stgRowStatus
		  -- SELECT		em.AdiKey,mbr.AdiKey,em.stgRowStatus,mbr.stgRowStatus
		  FROM			ast.MbrStg2_PhoneAddEmail em
		  JOIN			ast.MbrStg2_MbrData mbr
		  ON			em.AdiKey = mbr.AdiKey
		  WHERE			mbr.LoadDate = '2021-05-03'
		  AND			mbr.stgRowStatus = 'Not Valid'


		  ----CignaMA CareOpps
		  SELECT		COUNT(*)RecCnt, LoadDate,DataDate
						, a.CopLoadStatus
		  FROM			[ACDW_CLMS_CIGNA_MA].[adi].[CignaMA_ACECustomerSummary] a
		  GROUP BY		LoadDate,DataDate ,CopLoadStatus
		  ORDER BY		DataDate DESC

		  ---Careopps Validation

		 SELECT		COUNT(*)RecCnt, QmCntCat,QmMsrId
		 FROM		ast.QM_ResultByMember_History a
		 WHERE		ClientKey = 12
		 AND		QMDATE = '2021-05-15'
		 GROUP BY	 QmCntCat,QmMsrId
		 ORDER BY	QmMsrId

		 SELECT		*
		 FROM		adw.QM_ResultByMember_History a
		 WHERE		QMDate = '2021-04-06'
		 AND		ClientKey = 12


		 SELECT * FROM lst.list_client 