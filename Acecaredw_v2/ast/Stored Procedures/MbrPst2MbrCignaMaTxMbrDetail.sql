CREATE PROCEDURE [ast].[MbrPst2MbrCignaMaTxMbrDetail]--  [ast].[MbrPst2MbrCignaMaTxMbrDetail]'2021-04-12',482
    @loadDate DATE 
    , @InsertCount INT OUTPUT
AS	
    DECLARE @LoadType CHAR(1) = 'P'
    DECLARE @adiLoadDate DATE = @LoadDate;
    DECLARE @RowStatusValue VARCHAR(10) = 'Loaded';
    
 --   CREATE TABLE #tmpPlan (ProdPlan VARCHAR(50), ProdSubPlan VARCHAR(50), prodSubPlanName VARCHAR(50))

	--INSERT INTO #tmpPlan (ProdPlan,ProdSubPlan, prodSubPlanName)
	--VALUES ('Cigna Preferred AL Medicare (HMO)', 'Cigna Preferred AL Medicare (HMO)', 'Cigna Preferred AL Medicare (HMO)')
	--		,('Cigna TotalCare (HMO D-SNP)', 'Cigna TotalCare (HMO D-SNP)', 'Cigna TotalCare (HMO D-SNP)')
	--		,('Cigna Fundamental Medicare (HMO)', 'Cigna Fundamental Medicare (HMO)', 'Cigna Fundamental Medicare (HMO)')
	--		,('Cigna Preferred Plus Medicare (HMO)', 'Cigna Preferred Plus Medicare (HMO)', 'Cigna Preferred Plus Medicare (HMO)')
	--		,('Cigna True Choice Medicare (PPO)', 'Cigna True Choice Medicare (PPO)', 'Cigna True Choice Medicare (PPO)')
	--		,('Cigna Achieve Medicare (HMO C-SNP)', 'Cigna Achieve Medicare (HMO C-SNP)',  'Cigna Achieve Medicare (HMO C-SNP)')
	--		,('Cigna Preferred Savings Medicare (HMO)',	'Cigna Preferred Savings Medicare (HMO)','Cigna Preferred Savings Medicare (HMO)')
	--	;

    DECLARE @OutputTbl TABLE (ActionType VARCHAR(50), ID INT);
    
    MERGE ast.[MbrStg2_MbrData] trg
    USING ( -- DECLARE @LoadType CHAR(1) = 'P' DECLARE @LoadDate DATE = '2021-03-31'; DECLARE @RowStatusValue VARCHAR(10) = 'Loaded'
				SELECT DISTINCT  src.ClientSubscriberId			as [ClientSubscriberId]																			    
					,src.ClientKey				as [ClientKey]						 
					,-1						as [MstrMrnKey]
					,@LoadType 				as [LoadType]
					,src.lastname 				as [mbrLastName]
					,src.firstname 			as [mbrFirstName]
					,src.middlename 			as [mbrMiddleName]
					,src.ssn 					as [mbrSSN]
					,src.gender 				as [mbrGENDER]
					,src.DOB 					as [mbrDob]
					,''						as [mbrInsuranceCardIdNum]
					,''					 	as [mbrMEDICAID_NO]
					,src.medicareid 			as [mbrMEDICARE_ID]
					,''	   					as [HICN]
					,''						as [MBI]
					,''						as [mbrEthnicity]
					,''			 			as [mbrRace]
					,src.LanguageDesc 			as [mbrPrimaryLanguage] -- some kinda map?
					,src.NPI 					as [prvNPI]
					,src.AttribTIN				as [prvTIN]
					,''				    		as [prvAutoAssign]
					,src.ClientEffectiveDate 	as [prvClientEffective]
					,''		   				as [prvClientExpiration]
					,tPlan.sourceValue			as [plnProductPlan]
					,tPlan.sourceValue			as [plnProductSubPlan]
					,src.plan_name 			as [plnProductSubPlanName]
					,''						as [plnMbrIsDualCoverage]
					,''						as [plnClientPlanEffective]
					,''						as [rspLastName]
					,''						as [rspFirstName]
					,''						as [rspAddress1]
					,''						as [rspAddress2]
					,''						as [rspCITY]
					,''						as [rspSTATE]
					,''						as [rspZIP]
					,''						as [rspPhone] 
					,src.SrcFileName 			as [SrcFileName]
					,src.AdiTableName 			as [AdiTableName]
					,src.adiKey 				as [AdiKey]
					,src.RowStatus 			as [stgRowStatus]
					,src.LoadDate				as [LoadDate]
					,src.DataDate				as [DataDate]
					,null				   	as [CreateDate]
					,null		 			as [CreateBy]
					,''						as [MbrMemberKey]
					,''						as [MbrPlanKey]
					,''						as [MbrPcpKey]
					,''						as [MbrCsPlanKey]
					,''						as [TransformPcpEffectiveDate]
					,''						as [TransfromPcpExpirationDate]
					,''						as [TransformPlanEffectiveDate]
					,''						as [TransfromPlanExpirationDate]
					,''						as [TransformCsPlanEffectiveDate]
					,''						as [TransfromCsPlanExpirationDate]
					,''						as [MbrLoadHistoryKey]
					,''						as [TransformDemoEffectiveDate]
					,''						as [TransformDemoExpirationDate]
					,''						as [TransformCsPlanNameDate]
					,''						as [plnClientPlanEndDate]
					, 'TX'					AS StgMbrState
					,@RowStatusValue			as [stgRowAction]
					,src.dualeligibility		as [Member_Dual_Eligible_Flag]					
			 FROM (    SELECT REPLACE(adiData.memberid,'*', '')  AS ClientSubscriberId /* clean the input, if astrick in source, remove */
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
				    WHERE adiData.DataDate = @loadDate ---Have to select the latest DataDate
					AND	  adiData.MbrLoadStatus = 0
					--AND pr.RwCnt = 1											   
			 ) src																			   
			 JOIN lst.lstPlanMapping tPlan ON src.plan_name = tPlan.SourceValue
		  WHERE TargetSystem = 'ACDW'
		  AND src.aRowNumber = 1
    		  )src		  
    ON trg.ClientKey = src.ClientKey
        AND trg.LoadDate = src.LoadDate
        AND trg.AdiKey = src.AdiKey
    WHEN NOT MATCHED THEN  
        INSERT 
        (ClientSubscriberId, ClientKey,LoadType
        		  ,mbrLastName,mbrFirstName,mbrMiddleName, mbrGENDER,mbrDob
        		  , mbrMEDICARE_ID, mbrMEDICAID_NO,HICN ,prvNPI ,prvTIN ,prvAutoAssign
        		  , prvClientEffective, prvClientExpiration
        		  , rspLastName, rspFirstName, rspAddress1, rspAddress2, rspCITY, rspSTATE, rspZIP, rspPhone
        		  , plnProductPlan, plnProductSubPlan ,plnProductSubPlanName ,plnClientPlanEffective
			  , mbrState
        		  ,SrcFileName,AdiTableName,AdiKey,LoadDate,DataDate, stgRowStatus)
        VALUES (Src.ClientSubscriberId, src.ClientKey, src.LoadType 
		   , src.mbrLastName, src.mbrFirstName, src.mbrMiddleName, src.mbrGENDER, src.mbrDob
        	   , src.mbrMEDICARE_ID, src.mbrMEDICAID_NO, src.HICN, src.prvNPI, src.prvTIN, src.prvAutoAssign
		   , src.prvClientEffective, src.prvClientExpiration
		   , src.rspLastName, src.rspFirstName, src.rspAddress1, src.rspAddress2, src.rspCITY, src.rspSTATE, src.rspZIP, src.rspPhone
		   , src.plnProductPlan, src.plnProductSubPlan, src.plnProductSubPlan, src.plnClientPlanEffective
		   , src.StgMbrState
        	   , src.SrcFileName, src.adiTableName, src.AdiKey, src.LoadDate, src.DataDate, src.stgRowStatus)
    /*WHEN MATCHED THEN  	  UPDATE set blah blah blah*/
    OUTPUT $Action, Inserted.mbrStg2_MbrDataUrn INTO @OutputTbl
    ;
        
    SELECT @InsertCount = COUNT(*) 
    FROM @OutputTbl;


