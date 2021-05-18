
CREATE PROCEDURE [adi].[AceValid_AetComTx_Mbr](
    @LoadDate DATE
     )
as 
    -- DECLARE @LoadDate DATE = '2021-03-19'
    DECLARE @AllDetails BIT = 1;
    DECLARE @iLoadDate DATE = @LoadDate;
    DECLARE @LoadType CHAR(1) = 'P';
    DECLARE @ClientKey INT = 9;       
    DECLARE @EffMonth VARCHAR(6) ;
    select @EffMonth = CONVERT(VARCHAR(4), Year(@iLoadDate)) + 
	   CASE WHEN LEN(CONVERT(VARCHAR(2), Month(@iLoadDate)) ) < 2 THEN '0'+ CONVERT(VARCHAR(2), Month(@iLoadDate))
 	   ELSE CONVERT(VARCHAR(2), Month(@iLoadDate)) end 

    IF @AllDetails = 1
    BEGIN
	   SELECT @iLoadDate As LoadDate
	   , @LoadType As LoadType
	   , @ClientKey AS ClientKey
	   , @EffMonth AS EffectiveMonth
    END;
    IF @AllDetails = 1 
    BEGIN 
	   SELECT 'TotalRowsForMonth' AS EffectiveMonthCount, m.EffectiveMonth, COUNT(*) rowCnt
	   FROM adi.MbrAetCom m
	   WHERE m.LoadDate = @iLoadDate
	      and effectiveMonth = @EffMonth
	   GROUP BY m.EffectiveMonth
	   ORDER By m.EffectiveMonth desc
    END;

    SELECT a.mbrAetComMbr,a.EffectiveMonth,  a.MEMBER_ID, a.Attributed_Provider_Tax_ID_Number_TIN, a.Line_of_Business
	   --, PlanProduct.TargetValue MappedLob, pr.TIN, pr.EffectiveDate, pr.ExpirationDate
    FROM adi.MbrAetCom a
	   LEFT JOIN (SELECT t.ClientMemberKey, t.EffectiveMonth, t.LastClientUpdateDate, t.adiKey, t.adiTableName, t.LoadDate
			 FROM [adi].tvf_MbrAetCom_GetCurrentMembers(@iLoadDate) t
			 ) mf ON a.mbrAetComMbr = mf.AdiKey   	     
	    JOIN lst.lstPlanMapping PlanProduct  
		  ON a.[Line_of_Business] = PlanProduct.SourceValue 
			 AND PlanProduct.ClientKey = @ClientKey
			 AND PlanProduct.TargetSystem = 'ACDW'
			 AND @iLoadDate BETWEEN PlanProduct.EffectiveDate and PlanProduct.ExpirationDate	
	   LEFT JOIN (	
					SELECT		TIN,HealthPlan,LOB,EffectiveDate,ExpirationDate
					FROM		(
					SELECT distinct pr.TIN, pr.HealthPlan, pr.LOB, pr.EffectiveDate, pr.ExpirationDate
					,ROW_NUMBER() OVER (PARTITION BY pr.TIN,pr.HealthPlan
								 ORDER BY pr.EffectiveDate DESC) RwCnt
			 		FROM dbo.vw_AllClient_ProviderRoster PR 
		  			WHERE pr.HealthPlan = 'AETNA'
				    AND pr.LOB LIKE '%Commercial%')a
					WHERE	RwCnt = 1
				  --  AND pr.ProviderType IN ('PCP')
				)PR
		  ON a.Attributed_Provider_Tax_ID_Number_TIN = pr.TIN	
			 AND @iLoadDate BETWEEN pr.EffectiveDate AND pr.ExpirationDate
    WHERE a.LoadDate = @iLoadDate 
	   AND a.EffectiveMonth = @EffMonth
	   AND NOT pr.TIN IS NULL    
    ORDER BY a.MEMBER_ID
    ;
