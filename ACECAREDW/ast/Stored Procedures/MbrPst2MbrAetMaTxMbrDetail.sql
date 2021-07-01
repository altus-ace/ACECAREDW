	    
CREATE PROCEDURE [ast].[MbrPst2MbrAetMaTxMbrDetail] --- [ast].[MbrPst2MbrAetMaTxMbrDetail]'2021-05-20',3
    @loadDate DATE     
    , @InsertCount INT OUTPUT
AS	

    --DECLARE @AdiTableName VARCHAR(50) = 'MbrAetMaTx';
    DECLARE @adiLoadDate DATE = @LoadDate;
    DECLARE @ClientKey INT = 3;
    DECLARE @RowStatusValue VARCHAR(10) = 'Loaded';
   
    DECLARE @OutputTbl TABLE (ActionType VARCHAR(50), ID INT);  


	
		--  DECLARE @LoadDate DATE = '2021-06-20' DECLARE @ClientKey INT = 3 	
		IF OBJECT_ID('tempdb..#Prr') IS NOT NULL DROP TABLE #Prr
		CREATE TABLE #Prr(NPI VARCHAR(50),ClientNPI VARCHAR(50),AttribTIN VARCHAR(50),ClientTIN VARCHAR(50),MemberID VARCHAR(50))

		INSERT INTO #Prr(NPI,ClientNPI,AttribTIN,ClientTIN,MemberID)
		EXECUTE  [adi].[GetMbrNpiAndTin_AetnaMA] @LoadDate,0,@ClientKey 
    
    MERGE ast.MbrStg2_MbrData trg
    USING (SELECT DISTINCT CurrentRowsToLoad.CLientMemberKey, c.ClientKey
		      , adiMbrs.[LastName], adiMbrs.[Member_First_Name] FirstName, adiMbrs.[Middle_Name] MiddleName, adiMbrs.[Member_Gender] GENDER, adiMbrs.[Member_Date_of_Birth] DOB
		      , adiMbrs.[Members_SSN] SSN, '' AS Hicn, adiMbrs.NPI, adiMbrs.AttribTIN TIN, '' AutoAssign
		      , NULL as ClientEffectiveDate, NULL AS ClientExpirationDate, '' AS mbrMEDICARE_ID, '' AS mbrMEDICAID_NO, adimbrs.Aetna_Card_ID AS mbrInsuranceCardIdNum		      															  
		      , PlanProduct.TargetValue AS plnProductPlan, PlanProduct.TargetValue  AS plnProductSubPlan, PlanProduct.TargetValue subPlanName
		      , adiMbrs.[Individual_Original_Effective_date_at_Aetna] as plnClientEffective
		      , adiMbrs.SrcFileName, CurrentRowsToLoad.AdiTableName , CurrentRowsToLoad.adiKey, adiMbrs.LoadDate AS LoadDate, adiMbrs.DataDate as DataDAte, @RowStatusValue AS stgRowStatus		
			 , 'TX' AS MbrState  
		  FROM (SELECT * FROM adi.mbrAetMaTx m
					LEFT JOIN #Prr pr
					ON pr.MemberID = m.Member_ID
					AND pr.NPI = [Attributed_Provider_NPI_Number]
					AND pr.AttribTIN = [Attributed_Provider_Tax_ID_Number_TIN]) adiMbrs
		      JOIN lst.List_Client c ON c.ClientKey = @ClientKey
		      JOIN (SELECT t.ClientMemberKey, t.EffectiveMonth, t.CurrentLoadingEffectiveMonth, t.adiKey, t.adiTableName, t.LoadDate
		  		  FROM [adi].[tvf_MbrAetMaTx_GetCurrentMembers](@adiLoadDate) t
		  		  ) AS CurrentRowsToLoad ON adiMbrs.mbrAetMaTxKey = CurrentRowsToLoad.AdiKey  
			  JOIN (	SELECT		ClientKey, TargetSystem, SourceValue,ExpirationDate
								,EffectiveDate,TargetValue
					FROM		lst.lstPlanMapping
					WHERE		ClientKey = 3
					AND			Active = 'Y'
					AND			TargetSystem = 'ACDW') PlanProduct  
		  	  ON adiMbrs.[Line_of_Business] = PlanProduct.SourceValue   
		      --JOIN lst.lstPlanMapping PlanProduct  
		  		  --ON adiMbrs.[Line_of_Business] = PlanProduct.SourceValue 
		  			 --AND PlanProduct.ClientKey = @ClientKey
		  			 --AND PlanProduct.TargetSystem = 'ACDW'
		  			 --AND @adiLoadDate BETWEEN PlanProduct.EffectiveDate and PlanProduct.ExpirationDate	        
		      --JOIN lst.lstPlanMapping SubPlanName
		  		  --ON PlanProduct.TargetValue = SubPlanName.SourceValue
		  			 --AND SubPlanName.ClientKey = @ClientKey
		  			 --AND SubPlanName.TargetSystem = 'ACDW'
		  			 --AND @adiLoadDate BETWEEN SubPlanName.EffectiveDate and SubPlanName.ExpirationDate	  
			/*JOIN lst.ListAceMapping AutoAssign
				ON adiMbrs.some field not in the new adi */
		      /* only check that the TIN IS VALID */
		      JOIN (SELECT pr.AttribTIN, pr.NPI
		  		  FROM #Prr PR   ---  select * from #Prr
				  ) VP
		  	   ON adiMbrs.Attributed_Provider_Tax_ID_Number_TIN = vp.AttribTIN 
			 ) src
    ON trg.ClientSubscriberId = src.ClientMemberKey
	   AND trg.ClientKey = src.ClientKey
	   AND trg.LoadDate = src.LoadDate
    WHEN NOT MATCHED THEN 
	   INSERT (ClientSubscriberId, ClientKey
		  ,mbrLastName,mbrFirstName,mbrMiddleName, mbrGENDER,mbrDob
		  ,[mbrSSN],HICN ,prvNPI ,prvTIN ,prvAutoAssign,  mbrMEDICARE_ID, mbrMEDICAID_NO, mbrInsuranceCardIdNum		      
		  ,prvClientEffective, prvClientExpiration 
		  ,plnProductPlan, plnProductSubPlan ,plnProductSubPlanName 
		  ,plnClientPlanEffective
		  ,SrcFileName,AdiTableName,AdiKey,LoadDate,DataDate, stgRowStatus, mbrState)
	   VALUES (src.ClientMemberKey, src.ClientKey
			 , src.LastName, src.FirstName, src.MiddleName, src.Gender, src.DOB
			 , src.SSN, src.HICN, src.NPI, src.TIN, src.AutoAssign, src.mbrMEDICARE_ID, src.mbrMEDICAID_NO, src.mbrInsuranceCardIdNum
			 , src.ClientEffectiveDate, src.ClientExpirationDate
			 , src.PlnProductPlan, src.plnProductSUbPlan, src.subPlanName
			 , src.plnClientEffective
			 , src.SrcFileName, src.adiTableName, src.adiKey, src.LoadDate, src.DataDate, src.stgRowStatus, src.MbrState)
    WHEN MATCHED THEN UPDATE
	   SET  trg.mbrLastName			= src.LastName
		  ,trg.mbrFirstName			= src.FirstName
		  ,trg.mbrMiddleName		= src.MiddleName
		  ,trg.mbrGENDER			= src.Gender
		  ,trg.mbrDob				= src.DOB
		  ,trg.mbrSSN				= src.SSN
		  ,trg.HICN 				= src.HICN
		  ,trg.mbrMEDICARE_ID		= src.mbrMEDICARE_ID
		  ,trg.mbrMEDICAID_NO		= src.mbrMEDICAID_NO
		  ,trg.mbrInsuranceCardIdNum	= src.mbrInsuranceCardIdNum	    
		  ,trg.prvNPI				= src.NPI
		  ,trg.prvTIN 				= src.TIN
		  ,trg.prvAutoAssign		= src.AutoAssign
		  ,trg.prvClientEffective	= src.ClientEffectiveDate
		  ,trg.prvClientExpiration 	= src.ClientExpirationDate
		  ,trg.plnProductPlan		= src.PlnProductPlan
		  ,trg.plnProductSubPlan 	= src.plnProductSUbPlan
		  ,trg.plnProductSubPlanName 	= src.subPlanName
		  ,trg.plnClientPlanEffective	= src.plnClientEffective
		  ,trg.SrcFileName			= src.SrcFileName
		  ,trg.AdiTableName			= src.adiTableName
		  ,trg.AdiKey				= src.adiKey	   	   
		  ,trg.stgRowStatus			= src.stgRowStatus
		  ,trg.MbrState			= src.MbrState
    OUTPUT $Action, Inserted.mbrStg2_MbrDataUrn INTO @OutputTbl
    ;

    SELECT @InsertCount = COUNT(*) 
    FROM @OutputTbl;

