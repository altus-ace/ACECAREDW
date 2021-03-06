﻿

CREATE PROCEDURE [ast].pstLoadMbrUhcMbrByPcpMemberPcpPlan
    @loadDate DATE     
    , @InsertCount INT OUTPUT
AS	
    /* Add Log open/close to this */

    DECLARE @adiLoadDate DATE = @LoadDate;
    DECLARE @RowStatusValue VARCHAR(10) = 'Loaded';
    
    DECLARE @OutputTbl TABLE (ActionType VARCHAR(50), ID INT);
    
    MERGE ast.[MbrStg2_MbrData] trg
    USING (SELECT adiMbr.UHC_SUBSCRIBER_ID AS ClientSubscriberId, adiMbr.ClientKey, adiMbr.LoadType --@LoadType AS loadType 
            , adiMbr.mbrLName AS mbrLastName, adiMbr.mbrFName AS mbrFirstName, adiMbr.mbrMName AS mbrMiddleName, adiMbr.GENDER AS mbrGENDER, adiMbr.DATE_OF_BIRTH AS mbrDob
        	  , adiMbr.MEDICARE_ID, adiMbr.MEDICAID_ID, adiMbr.HICN, adiMbr.PCP_NPI AS prvNPI, adiMbr.PCP_PRACTICE_TIN AS prvTIN, adiMbr.AUTO_ASSIGN AS prvAutoAssign
            , adiMbr.PCP_EFFECTIVE_DATE AS prvClientEffective, adiMbr.PCP_TERM_DATE AS prvClientExpiration
    		  , adiMbr.RESP_LAST_NAME AS rspLastName, adiMbr.RESP_FIRST_NAME AS rspFirstName, adiMbr.RESP_ADDRESS AS rspAddress1, adiMbr.RESP_ADDRESS2 AS rspAddress2
    		  , adiMbr.RESP_CITY AS rspCITY, adiMbr.RESP_STATE AS rspSTATE, adiMbr.RESP_ZIP AS rspZIP,  adiMbr.RESP_PHONE AS rspPhone
            , adiMbr.PLAN_ID AS plnProductPlan, PlanMapping.TargetValue AS plnProductSubPlan, adiMbr.SUBGRP_NAME subPlanName, adiMbr.MEMBER_CUR_EFF_DATE AS plnClientPlanEffective
        	  , adiMbr.SourceFileName, adiMbr.adiTableName, adiMbr.AdiKey, adiMbr.LoadDate, adiMbr.DataDate,@RowStatusValue  AS stgRowStatus
    	   FROM adi.vw_pdwSrc_MbrUhcMbrByPcp_MbrDetail adiMbr        
    		  LEFT JOIN lst.lstPlanMapping PlanMapping				
        		 ON adiMbr.SUBGRP_ID = PlanMapping.SourceValue 
        			 AND PlanMapping.ClientKey = adiMbr.ClientKey
        			 AND PlanMapping.TargetSystem = 'ACDW'
        			 AND @adiLoadDate BETWEEN PlanMapping.EffectiveDate and PlanMapping.ExpirationDate	        
    	   WHERE adiMbr.PCP_PRACTICE_TIN IN (SELECT DISTINCT vp.TIN FROM [adw].[tvf_Get_UhcMTx_ValidProviderTinsByDate](@adiLoadDate)  vp) 
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
        		  ,SrcFileName,AdiTableName,AdiKey,LoadDate,DataDate, stgRowStatus)
        VALUES (Src.ClientSubscriberId, src.ClientKey, src.LoadType 
            , src.mbrLastName, src.mbrFirstName, src.mbrMiddleName, src.mbrGENDER, src.mbrDob
        	  , src.MEDICARE_ID, src.MEDICAID_ID, src.HICN, src.prvNPI, src.prvTIN, src.prvAutoAssign
            , src.prvClientEffective, src.prvClientExpiration
    		  , src.rspLastName, src.rspFirstName, src.rspAddress1, src.rspAddress2, src.rspCITY, src.rspSTATE, src.rspZIP, src.rspPhone
            , src.plnProductPlan, src.plnProductSubPlan, src.subPlanName, src.plnClientPlanEffective
        	  , src.SourceFileName, src.adiTableName, src.AdiKey, src.LoadDate, src.DataDate, src.stgRowStatus)
    /*WHEN MATCHED THEN  	  UPDATE set blah blah blah*/
    OUTPUT $Action, Inserted.mbrStg2_MbrDataUrn INTO @OutputTbl
    ;
        
    SELECT @InsertCount = COUNT(*) 
    FROM @OutputTbl;
    /* add close to this using this count as the insert count */