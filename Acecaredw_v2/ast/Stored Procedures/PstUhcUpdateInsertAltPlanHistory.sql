
CREATE PROCEDURE [ast].[PstUhcUpdateInsertAltPlanHistory] (
    @LoadDate DATE
    )
AS
    --@LoadDate to mindat
    

    BEGIN
    truncate table ast.UhcMbrElig ;
	    /*drop table ast.UhcMbrElig 
	    CREATE TABLE ast.UhcMbrElig (SKey INT NOT NULL IDENTITY(1,1) PRIMARY KEY, CMK VARCHAR(50), SubGrpID varchar(20), CsPlan VARCHAR(50), prTin CHAR(10), MbrTin CHAR(10), MbrLoadDate Date
	      	  , StartDate date, EndDate Date, Active TINYINT DEFAULT(1)
	      	  , createddate date default(getdate()), createdby varchar(20) default(system_user));
	    */
    --CREATE TABLE ast.UhcMbrEligProccess1( batchID INT, LoadDate DATE, ProcessedState TINYINT DEFAULT(0), createdDate datetime default(getdate()), createdBy varchar(50) default(system_user))
    --CREATE TABLE ast.UhcMbrEligProccess2( batchID INT, LoadDate DATE, ProcessedState TINYINT DEFAULT(0), createdDate datetime default(getdate()), createdBy varchar(50) default(system_user))
    truncate table ast.UhcMbrEligProccess1;
    truncate table ast.UhcMbrEligProccess2;
    
    END;

    BEGIN -- Load CONTROL TABLES 
    insert into ast.UhcMbrEligProccess1(batchID, LoadDate, ProcessedState)
    SELECT ROW_NUMBER() OVER (order by m.A_LAST_UPDATE_DATE DESC) arn, m.A_LAST_UPDATE_DATE LoadDate, 0 AS Processed
    FROM dbo.Uhc_MembersByPcp m
    where m.LoadType = 'P'
        and m.A_LAST_UPDATE_DATE > '12/01/2020'
    GROUP BY m.A_LAST_UPDATE_DATE    
    ;
    insert into ast.UhcMbrEligProccess2(batchID, LoadDate, ProcessedState)
    SELECT ROW_NUMBER() OVER (order by m.A_LAST_UPDATE_DATE DESC) arn, m.A_LAST_UPDATE_DATE LoadDate, 0 AS Processed
    FROM dbo.Uhc_MembersByPcp m
    where m.LoadType = 'P'
        and m.A_LAST_UPDATE_DATE > '12/01/2020'
    GROUP BY m.A_LAST_UPDATE_DATE    
    ;
    END;

    /* validate control tables  */
--    SELECT * FROM ast.UhcMbrEligProccess1;
--    SELECT * FROM ast.UhcMbrEligProccess2;
--    select * FROM ast.UhcMbrElig ;
   

    /* get the set of records that Make up the eligiblity source set */
    DECLARE @iBuildWorkingSet tinyint;
    DECLARE @BatchLoadDate DATE 
    DECLARE @BatchRank INT 
    DECLARE @StartDate DATE ;
    DECLARE @LatestMonthStopDate  DATE ='12/31/2099';
    DECLARE @NextMonth DATE ;
    DECLARE @StopDate Date ;
    SELECT @iBuildWorkingSet = COUNT(*) FROm ast.UhcMbrEligProccess1 P1 WHERE P1.ProcessedState <> 1;

    /* build working dataset 1 row per member per month from MembersByPcp */
    WHILE @iBuildWorkingSet > 0 
    BEGIN 
        SELECT @batchLoadDate = b.LoadDate, @BatchRank = b.BatchID    
        FROM ast.UhcMbrEligProccess1 b
        WHERE b.BatchID = (SELECT min(BatchID) FROM ast.UhcMbrEligProccess1 WHERE ProcessedState = 0);
        
        SET @StartDate = DateFROMPARTS(Year(@batchLoadDate), Month(@batchLoadDate), 1);    
        SET @NextMonth = DATEADD(Month, 1, @StartDate);
        SET @StopDate = CASE WHEN (@BatchRank = 1) THEN @LatestMonthStopDate  else DateAdd(Day, -1, @NextMonth) END ;
    
        SELECT @BatchLoadDate BatchDate, @BatchRank BatchRank, @StartDate StartDate, @StopDate StopDate, @NextMonth NextMonthStart;
    
        BEGIN -- 1 row per member per month,
            INSERT INTO ast.UhcMbrElig (CMK, SubGrpID , CsPlan , prTin, MbrTin , MbrLoadDate , StartDate , EndDate )
            SELECT m.UHC_SUBSCRIBER_ID, m.SUBGRP_ID, pm.TargetValue csPlan, prTin.TIN, m.PCP_PRACTICE_TIN, m.A_LAST_UPDATE_DATE, @StartDate, @StopDate    
            FROM dbo.Uhc_MembersByPcp m		 -- mbr roster for the month
        	   JOIN lst.lstPlanMapping pm 
        		  ON m.SUBGRP_ID = pm.SourceValue	 -- cs Plan  value that is active THIS MONTH
				AND pm.ClientKey = 1
        			AND @BatchLoadDate between pm.EffectiveDate and pm.ExpirationDate
        			AND pm.TargetSystem = 'CS_AHS'	   
        	   LEFT JOIN (SELECT pr.TIN 
    				    FROM dbo.vw_AllClient_ProviderRoster pr 
    				    WHERE pr.CalcClientKey = 1
    					   and @BatchLoadDate between pr.EffectiveDate AND pr.ExpirationDate
    				    GROUP BY pr.TIN ) prTIn		 -- PRovider Roster must not be null
        		  	ON m.PCP_PRACTICE_TIN = prTIn.TIN	-- provider roster 
            where m.A_LAST_UPDATE_FLAG = 'Y'
        END
        /* update active flag */
        BEGIN 
            --SELECT t.sKey, t.prtin, t.CsPlan, 0 as newActive
            UPDATE t SET t.Active = 0
            FROM ast.UhcMbrElig t
            WHERE( (t.prTin is null)		 --pr roster doesn't includ tin
        	   OR (t.CsPlan is null)  )	 -- csPlan is not mappable
        	   and t.Active = 1;
        END;
        /* UPdate mbrPRocessed table */
        BEGIN
            UPDATE b set b.ProcessedState = 1
            --SELECT *
            FROM ast.UhcMbrEligProccess1 b
            WHERE b.LoadDate = @BatchLoadDate;
        END;
    
        SELECT @iBuildWorkingSet = COUNT(*) FROm ast.UhcMbrEligProccess1 P1 WHERE P1.ProcessedState <> 1;   
    END;

    /* Calc Eligiblity */
    --DECLARE @BatchLoadDate DATE 
    --DECLARE @BatchRank INT 

    DECLARE @iProcessWorkingSet tinyint;
    SELECT @iProcessWorkingSet  = COUNT(*) FROm ast.UhcMbrEligProccess2 P1 WHERE P1.ProcessedState <> 1;
    /* build working dataset 1 row per member per month from MembersByPcp */
    WHILE @iProcessWorkingSet > 0 
    BEGIN
        SELECT @batchLoadDate = b.LoadDate, @BatchRank = b.BatchID    
        FROM ast.UhcMbrEligProccess2 b
        WHERE b.BatchID = (SELECT min(BatchID) FROM ast.UhcMbrEligProccess2 WHERE ProcessedState = 0);
        
        SELECT @BatchLoadDate, @BatchRank;
    
        SELECT 'active per month' type, @BatchLoadDate aMonth,  *
        FROM ast.UhcMbrElig t	   
        WHERE @BatchLoadDate between t.StartDate and t.EndDate
    	   and t.Active = 1
    
        /* Updates  plan start date only*/
        SELECT 'U' type, case when(t.StartDate < ph.startDate) THEN 1 ELSE 0 END as ThisRowNeedsUpdate, *
        FROM ast.UhcMbrElig t
    	   JOIN adw.A_ALT_MemberPlanHistory_BK PH 
    		  ON t.CMK = ph.Client_Member_ID
    			 and t.CsPlan = ph.Benefit_Plan
    			 and t.StartDate > ph.startDate
    			 and t.StartDate = ph.stopDate
    			 and ph.planHistoryStatus = 1
        WHERE '2021-03-17'/*@BatchLoadDate */between t.StartDate and t.EndDate
    	   and t.Active = 1
    	   --and '2021-03-17'/*@BatchLoadDate*/ between ph.startDate and ph.stopDate
    	   	   
        ORDER BY t.cmk
        
        /* Terms */
        SELECT 'T' type    
        FROM ast.UhcMbrElig t
    	   LEFT JOIN adw.A_ALT_MemberPlanHistory_BK PH 
    		  ON t.CMK = ph.Client_Member_ID
    			 and t.CsPlan = ph.Benefit_Plan
    			 and ph.planHistoryStatus = 1			 
        WHERE @BatchLoadDate between t.StartDate and t.EndDate
    	   and t.Active = 1
    	   and @BatchLoadDate between ph.startDate and ph.stopDate
    	   and t.SKey is null
    
        ORDER BY t.cmk
        /* Inserts */
        SELECT 'I' type
        FROM adw.A_ALT_MemberPlanHistory_BK PH 
    	   LEFT JOIN ast.UhcMbrElig t
    		  ON ph.Client_Member_ID = t.CMK 
    			 and ph.Benefit_Plan = t.CsPlan 
    			 and ph.planHistoryStatus = 1
        WHERE @BatchLoadDate between t.StartDate and t.EndDate
    	   and t.Active = 1
    	   and @BatchLoadDate between ph.startDate and ph.stopDate
    	   and ph.A_ALT_MemberPlanHistory_ID is null
        ORDER BY t.cmk    
        
            /* UPdate mbrPRocessed table */
    --    IF 1 = 2
        BEGIN
            UPDATE b set b.ProcessedState = 1
            --SELECT *
            FROM ast.UhcMbrEligProccess2 b
            WHERE b.LoadDate = @BatchLoadDate;
        END;
      --  BREAK;
        SELECT @iProcessWorkingSet  = COUNT(*) FROm ast.UhcMbrEligProccess2 P1 WHERE P1.ProcessedState <> 1;
    END;

    
    BEGIN  -- CREATE BACKUP TABLE: if this goes totally wrong, you can use this table to reset the csplan table
        IF OBJECT_ID('adw.A_ALT_MemberPlanHistory_Backup', 'u') IS NOT NULL 
		  DROP TABLE adw.A_ALT_MemberPlanHistory_Backup
        SELECT *
        into adw.A_ALT_MemberPlanHistory_Backup
        FROM adw.A_ALT_MemberPlanHistory
    
        ALTER TABLE [adw].[A_ALT_MemberPlanHistory_Backup] ADD  DEFAULT (getdate()) FOR [loadDate] 
        ALTER TABLE [adw].[A_ALT_MemberPlanHistory_Backup] ADD  DEFAULT ((0)) FOR [exported] 
        ALTER TABLE [adw].[A_ALT_MemberPlanHistory_Backup] ADD  DEFAULT (CONVERT([datetime2],'01/01/1980')) FOR [exportedDate] 
        ALTER TABLE [adw].[A_ALT_MemberPlanHistory_Backup] ADD  DEFAULT (getdate()) FOR [A_CREATED_DATE] 
        ALTER TABLE [adw].[A_ALT_MemberPlanHistory_Backup] ADD  DEFAULT (suser_sname()) FOR [A_CREATED_BY] 
        ALTER TABLE [adw].[A_ALT_MemberPlanHistory_Backup] ADD  DEFAULT (getdate()) FOR [A_UPDATED_DATE] 
        ALTER TABLE [adw].[A_ALT_MemberPlanHistory_Backup] ADD  DEFAULT (suser_sname()) FOR [A_UPDATED_BY] 
    END;

    /* Build your Export queries: Get each set: New, Terms, PlanChanges */
    BEGIN
	   /* new */
	   SELECT e.*
	   INTO #NewInserts
	   FROM ast.UhcMbrElig e
	       LEFT JOIN adw.A_ALT_MemberPlanHistory_BK ph 
	   	   ON e.CMK = ph.Client_Member_ID
	   	   AND e.CsPlan = ph.Benefit_Plan
	   	AND getdate() between ph.startDate and ph.stopDate
	   	AND ph.planHistoryStatus = 1
	   WHERE getdate() between e.StartDate AND e.EndDate    AND e.Active = 1
	       AND ph.a_alt_MEmberPlanHistory_ID is null-- Not found in existing
    
	   /* TERMS*/
	   SELECT ph.*
	   INTO #OldTerms
	   FROM adw.A_ALT_MemberPlanHistory_BK ph 		   
	       LEFT JOIN ast.UhcMbrElig e
	   	   ON ph.Client_Member_ID = e.CMK
	   	   AND getdate() BETWEEN e.StartDate and e.EndDate
	   WHERE  ph.planHistoryStatus = 1	
	       AND getdate() between ph.startDate and ph.stopDate
	       AND e.SKey is null				    -- not found in new: Term
    
        
	   /* plan change */
	   SELECT e.*, ph.A_ALT_MemberPlanHistory_ID, ph.Benefit_Plan
	   INTO #PlanChange 
	   FROM ast.UhcMbrElig e
	       JOIN adw.A_ALT_MemberPlanHistory_BK ph  -- Explicit JOIN matches that have different Plan 
	   	   ON e.CMK = ph.Client_Member_ID
	   	   and e.CsPlan <> ph.Benefit_Plan	    -- different plan
	   	AND getdate() between ph.startDate and ph.stopDate
	   	AND ph.planHistoryStatus = 1
	   where getdate() between e.StartDate and e.EndDate    and e.Active = 1
        
    END;
    
    BEGIN -- Push to production table 
	   BEGIN TRAN ChangePlanHist
	   --DECLARE @LoadDate DATE = '04/27/2021';
	   /* Process New */
--	     INSERT INTO adw.A_ALT_MemberPlanHistory (A_Client_ID, Benefit_Plan, Client_Member_ID, loadDate, planHistoryStatus, startDate, stopDate)
	   SELECT 1 AS ClientKey, n.CsPlan, n.CMK, @LoadDate, 1 As PlanHistStatus, n.StartDate, n.EndDate
	   FROM #NewInserts n;
	   
	   /* Process Terms */
	   DECLARE @TermDate DATE = DateAdd(day, -1, '04/01/2021');
	   SELECT ph.A_Alt_MemberPlanHistory_ID, ph.StopDate, @TermDate
	   --UPDATE ph SET ph.StopDate = @TermDate
	   FROM #OldTerms t
	       JOIN adw.A_ALT_MemberPlanHistory ph ON t.A_Alt_MemberPlanHistory_ID = ph.A_Alt_MemberPlanHistory_ID
	   
	   /*Process Plan Changes */
	   /* get Terms */
	   SELECT ph.A_Alt_MemberPlanHistory_ID, ph.StopDate, @TermDate
	   --UPDATE ph SET ph.StopDate = @TermDate    
	   FROM #PlanChange t
	       JOIN adw.A_ALT_MemberPlanHistory ph ON t.A_Alt_MemberPlanHistory_ID = ph.A_Alt_MemberPlanHistory_ID
	   
	   /* get inserts */
	   --INSERT INTO adw.A_ALT_MemberPlanHistory (A_Client_ID, Benefit_Plan, Client_Member_ID, loadDate, planHistoryStatus, startDate, stopDate)
	   SELECT 1 AS ClientKey, n.CsPlan, n.CMK, @LoadDate, 1 As PlanHistStatus, n.StartDate, n.EndDate
	   FROM #PlanChange n
	   ORDER BY n.CMK
	   COMMIT TRAN ChangePlanHist
	   -- ROLLBACK TRAN ChangePlanHist
    END;



    /* vaidate the working source set has no duplicates 
        SELECT e.cmk
        FROM ast.UhcMbrElig e
        where getdate() between e. StartDate and e.EndDate
            and e.Active = 1
        GROUP BY e.CMK 
        having  count(*) > 1
    */
    
    /* validate the result has no duplicates 
        SELECT ph.Client_Member_ID
        FROM adw.A_ALT_MemberPlanHistory ph
        where getdate() between ph.startDate and ph.stopDate
            and ph.planHistoryStatus = 1
        group by ph.Client_Member_ID 
        having count(*) > 1
    */


