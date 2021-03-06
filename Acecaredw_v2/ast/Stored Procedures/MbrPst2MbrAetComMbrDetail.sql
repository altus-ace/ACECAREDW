﻿CREATE PROCEDURE [ast].[MbrPst2MbrAetComMbrDetail] --  [ast].[MbrPst2MbrAetComMbrDetail]'2021-03-19',2873
    @loadDate DATE     
    , @InsertCount INT OUTPUT
AS	

    --DECLARE @AdiTableName VARCHAR(50) = 'MbrAetCom';
    DECLARE @adiLoadDate DATE = @LoadDate;
    DECLARE @Product VARCHAR(20) = 'Commercial';
    DECLARE @RowStatusValue VARCHAR(10) = 'Loaded';
    
    DECLARE @OutputTbl TABLE (ActionType VARCHAR(50), ID INT);  
    
    MERGE ast.MbrStg2_MbrData trg
    USING(SELECT CurrentMbrToLoad.CLientMemberKey, c.ClientKey
		      , adiMbrs.[LastName], adiMbrs.[Member_First_Name] FirstName, adiMbrs.[Middle_Name] MiddleName, adiMbrs.[Member_Gender] GENDER, adiMbrs.[Member_Date_of_Birth] DOB
		      , adiMbrs.[Members_SSN] SSN, '' AS Hicn, adiMbrs.[Attributed_Provider_NPI_Number] NPI, adiMbrs.[Attributed_Provider_Tax_ID_Number_TIN] TIN, '' AutoAssign
			 , NULL as ClientEffectiveDate, NULL AS ClientExpirationDate, '' AS mbrMEDICARE_ID, '' AS mbrMEDICAID_NO, adimbrs.Aetna_Card_ID AS mbrInsuranceCardIdNum		      
		      , @Product AS plnProductPlan, adiMbrs.[Line_of_Business] AS plnProductSubPlan, subPlanName.TargetValue subPlanName
		      , adiMbrs.[Individual_Original_Effective_date_at_Aetna] as plnClientEffective
		      , adiMbrs.SrcFileName, CurrentMbrToLoad.AdiTableName , CurrentMbrToLoad.adiKey,  adiMbrs.LoadDate AS LoadDate, adiMbrs.dataDate as DataDAte, @RowStatusValue AS stgRowStatus			 		      
			 , 'TX' AS MbrState
		  FROM adi.mbrAetCom adiMbrs 
		      JOIN lst.List_Client c ON c.ClientKey = 9
		      JOIN (SELECT t.ClientMemberKey, t.EffectiveMonth, t.LastClientUpdateDate, t.adiKey, t.adiTableName, t.LoadDate
		  		  FROM adi.tvf_MbrAetCom_GetCurrentMembers(@adiLoadDate) t
		  		  ) CurrentMbrToLoad ON adiMbrs.mbrAetComMbr = CurrentMbrToLoad.AdiKey    
		      JOIN (SELECT DISTINCT pm.SourceValue, pm.TargetValue, pm.EffectiveDate, pm.ExpirationDate 
				    FROM lst.lstPlanMapping pm 
				    WHERE pm.clientKey = 9
					   and pm.TargetSystem = 'ACDW'
				    )SubPlanName  
		  		  ON adiMbrs.[Line_of_Business] = subPlanName.SourceValue 		  		  
		  		    AND @adiLoadDate BETWEEN SubPlanName.EffectiveDate and SubPlanName.ExpirationDate	        
		      JOIN (
						SELECT	TIN,EffectiveDate,ExpirationDate
						FROM	(
								 SELECT  PR.TIN, pr.EffectiveDate, pr.ExpirationDate
								 	,ROW_NUMBER() OVER (PARTITION BY pr.TIN,pr.HealthPlan
								 		 ORDER BY pr.EffectiveDate DESC) RwCnt
		  						 FROM dbo.vw_AllClient_ProviderRoster PR
		  						 WHERE pr.HealthPlan = 'AETNA' AND pr.LOB LIKE '%Commercial%'  
		  			 --GROUP BY pr.Tin, pr.EffectiveDate, pr.ExpirationDate	
								)a	
						WHERE	RwCnt = 1				 
		  		    ) ProviderRoster 
		  			 ON adiMbrs.Attributed_Provider_Tax_ID_Number_TIN = ProviderRoster.TIN
		  				and @adiloadDate BETWEEN ProviderRoster.EffectiveDate and ProviderRoster.ExpirationDate
						)src
      ON trg.ClientSubscriberId = src.ClientMemberKey
	   AND trg.ClientKey = src.ClientKey
	   AND trg.LoadDate = src.LoadDate
	 WHEN NOT MATCHED THEN 
	   INSERT (ClientSubscriberId, ClientKey
		  ,mbrLastName,mbrFirstName,mbrMiddleName, mbrGENDER,mbrDob
		  ,[mbrSSN],HICN ,prvNPI ,prvTIN ,prvAutoAssign, mbrMEDICAID_NO, mbrMEDICARE_ID, mbrInsuranceCardIdNum
		  ,prvClientEffective, prvClientExpiration 
		  ,plnProductPlan, plnProductSubPlan ,plnProductSubPlanName 
		  ,plnClientPlanEffective
		  ,SrcFileName,AdiTableName,AdiKey,LoadDate,DataDate, stgRowStatus, MbrState)
	   VALUES (src.ClientMemberKey, src.ClientKey
			 , src.LastName, src.FirstName, src.MiddleName, src.Gender, src.DOB
			 , src.SSN, src.HICN, src.NPI, src.TIN, src.AutoAssign, src.mbrMEDICAID_NO, src.mbrMEDICARE_ID, src.mbrInsuranceCardIdNum
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
		  ,trg.prvNPI				= src.NPI
		  ,trg.prvTIN 				= src.TIN
		  ,trg.prvAutoAssign		= src.AutoAssign
		  ,trg.mbrMEDICAID_NO		= src.mbrMEDICAID_NO
		  ,trg.mbrMEDICARE_ID		= src.mbrMEDICARE_ID
		  ,trg.mbrInsuranceCardIdNum	= src.mbrInsuranceCardIdNum
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

	