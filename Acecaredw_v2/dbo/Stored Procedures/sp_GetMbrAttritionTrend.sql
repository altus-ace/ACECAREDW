﻿






CREATE PROCEDURE [dbo].[sp_GetMbrAttritionTrend]
	AS
	BEGIN
		SET NOCOUNT ON;


IF OBJECT_ID('[dbo].[tmp_MbrAttritionTrend]', 'U') IS NOT NULL 
  DROP TABLE [dbo].[tmp_MbrAttritionTrend]; 


CREATE TABLE [dbo].[tmp_MbrAttritionTrend](
	[SUBSCRIBER_ID]		[varchar](20) NOT NULL,
	[LOB_ID]			[varchar](20) NULL,
	[PLAN_ID]			[varchar](20) NULL,
	[PRODUCT_CODE]		[varchar](20) NULL,
	[SUBGRP_ID]			[varchar](20) NULL,
	[AUTO_ASSIGN]		[varchar](20) NULL,
	[MBR_MTH]			[int] NULL,
	[MBR_YEAR]			[int] NULL,
	[JAN17]			    [int] NULL,    
	[FEB17]			    [int] NULL,
	[MAR17]			    [int] NULL,
	[APR17]			    [int] NULL,
	[MAY17]			    [int] NULL,
	[JUN17]			    [int] NULL,
	[JUL17]			    [int] NULL,
	[AUG17]			    [int] NULL,
	[SEP17]			    [int] NULL,
	[OCT17]			    [int] NULL,
	[NOV17]			    [int] NULL,
	[DEC17]			    [int] NULL,
	[JAN18]		        [int] NULL,
	[FEB18]			    [int] NULL,
	[MAR18]			    [int] NULL,
	[APR18]			    [int] NULL,
	[MAY18]			    [int] NULL,
	[JUN18]			    [int] NULL,
	[JUL18]			    [int] NULL,
	[AUG18]			    [int] NULL,
	[SEP18]			    [int] NULL,
	[OCT18]			    [int] NULL,
	[NOV18]			    [int] NULL,
	[DEC18]			    [int] NULL,
	[MM17]		        [int] NULL,
	[MM18]			    [int] NULL
) ON [PRIMARY]



INSERT INTO [dbo].[tmp_MbrAttritionTrend](
		[SUBSCRIBER_ID]	,
		[LOB_ID]		,			
		[PLAN_ID]		,	
		[PRODUCT_CODE]	,	
		[SUBGRP_ID]		,	
		[AUTO_ASSIGN]	,	
		[MBR_YEAR]		,
		[MBR_MTH]		,		
		[JAN17]			,    
		[FEB17]			,    
		[MAR17]			,    
		[APR17]			,    
		[MAY17]			,    
		[JUN17]			,    
		[JUL17]			,    
		[AUG17]			,    
		[SEP17]			,    
		[OCT17]			,    
		[NOV17]			,    
		[DEC17]			,    
		[JAN18]		    ,    
		[FEB18]			,    
		[MAR18]			,    
		[APR18]			,    
		[MAY18]			,    
		[JUN18]			,    
		[JUL18]			,    
		[AUG18]			,    
		[SEP18]			,    
		[OCT18]			,    
		[NOV18]			,    
		[DEC18]			,    
		[MM17]		    ,    
		[MM18]			
		)    
SELECT	
		a.SUBSCRIBER_ID
		,(CASE a.PRODUCT_CODE
			WHEN    'TXCHIP0' THEN   'CHIP'
			WHEN 		'TXCHIP1' THEN   'CHIP' 
			WHEN 		'TXCHIP2' THEN   'CHIP'
			WHEN 		'TXCHIP3' THEN   'CHIP'
			WHEN 		'TXCHIPI' THEN   'CHIP'             
			WHEN 		'TXCHPNM1' THEN   'CHIP'            
			WHEN 		'TXCHPNM2' THEN   'CHIP'            
			WHEN 		'TXKIN' THEN   'KIDS' 
			WHEN 		'TXKMN' THEN   'KIDS' 
			WHEN 		'TXKSIN' THEN   'KIDS' 
			WHEN 		'TXKYN' THEN   'KIDS' 
			WHEN 		'TXMMP' THEN   'MMP' 
			WHEN 		'TXMMPHW' THEN   'MMP' 
			WHEN 		'TXSNPH1' THEN   'SPEC' 
			WHEN 		'TXSPCRT1' THEN   'STAR+'             
			WHEN 		'TXSPCRT2' THEN   'STAR+' 
			WHEN 		'TXSPCRT3' THEN   'STAR+' 
			WHEN 		'TXSPCRT7' THEN   'STAR+' 
			WHEN 		'TXSTAR' THEN   'STAR' 
			ELSE		'UNK'
			END) 
		,a.PLAN_ID	
		,a.PRODUCT_CODE
		,a.SUBGRP_ID
		,a.AUTO_ASSIGN
		,a.MBR_YEAR
		,a.MBR_MTH
		--,COUNT(a.SUBSCRIBER_ID) AS CNT
		,ISNULL((SELECT 1 FROM tmp_MbrAttrition b WHERE a.SUBSCRIBER_ID = b.SUBSCRIBER_ID AND MBR_MTH = 1 AND MBR_YEAR=2017),0) as JAN17 
		,ISNULL((SELECT 1 FROM tmp_MbrAttrition b WHERE a.SUBSCRIBER_ID = b.SUBSCRIBER_ID AND MBR_MTH = 2 AND MBR_YEAR=2017),0) as FEB17
		,ISNULL((SELECT 1 FROM tmp_MbrAttrition b WHERE a.SUBSCRIBER_ID = b.SUBSCRIBER_ID AND MBR_MTH = 3 AND MBR_YEAR=2017),0) as MAR17
		,ISNULL((SELECT 1 FROM tmp_MbrAttrition b WHERE a.SUBSCRIBER_ID = b.SUBSCRIBER_ID AND MBR_MTH = 4 AND MBR_YEAR=2017),0) as APR17
		,ISNULL((SELECT 1 FROM tmp_MbrAttrition b WHERE a.SUBSCRIBER_ID = b.SUBSCRIBER_ID AND MBR_MTH = 5 AND MBR_YEAR=2017),0) as MAY17
		,ISNULL((SELECT 1 FROM tmp_MbrAttrition b WHERE a.SUBSCRIBER_ID = b.SUBSCRIBER_ID AND MBR_MTH = 6 AND MBR_YEAR=2017),0) as JUN17
		,ISNULL((SELECT 1 FROM tmp_MbrAttrition b WHERE a.SUBSCRIBER_ID = b.SUBSCRIBER_ID AND MBR_MTH = 7 AND MBR_YEAR=2017),0) as JUL17
		,ISNULL((SELECT 1 FROM tmp_MbrAttrition b WHERE a.SUBSCRIBER_ID = b.SUBSCRIBER_ID AND MBR_MTH = 8 AND MBR_YEAR=2017),0) as AUG17
		,ISNULL((SELECT 1 FROM tmp_MbrAttrition b WHERE a.SUBSCRIBER_ID = b.SUBSCRIBER_ID AND MBR_MTH = 9 AND MBR_YEAR=2017),0) as SEP17
		,ISNULL((SELECT 1 FROM tmp_MbrAttrition b WHERE a.SUBSCRIBER_ID = b.SUBSCRIBER_ID AND MBR_MTH = 10 AND MBR_YEAR=2017),0) as OCT17
		,ISNULL((SELECT 1 FROM tmp_MbrAttrition b WHERE a.SUBSCRIBER_ID = b.SUBSCRIBER_ID AND MBR_MTH = 11 AND MBR_YEAR=2017),0) as NOV17 
		,ISNULL((SELECT 1 FROM tmp_MbrAttrition b WHERE a.SUBSCRIBER_ID = b.SUBSCRIBER_ID AND MBR_MTH = 12 AND MBR_YEAR=2017),0) as DEC17 
		,ISNULL((SELECT 1 FROM tmp_MbrAttrition b WHERE a.SUBSCRIBER_ID = b.SUBSCRIBER_ID AND MBR_MTH = 1 AND MBR_YEAR=2018),0) as JAN18
		,ISNULL((SELECT 1 FROM tmp_MbrAttrition b WHERE a.SUBSCRIBER_ID = b.SUBSCRIBER_ID AND MBR_MTH = 2 AND MBR_YEAR=2018),0) as FEB18
		,ISNULL((SELECT 1 FROM tmp_MbrAttrition b WHERE a.SUBSCRIBER_ID = b.SUBSCRIBER_ID AND MBR_MTH = 3 AND MBR_YEAR=2018),0) as MAR18
		,ISNULL((SELECT 1 FROM tmp_MbrAttrition b WHERE a.SUBSCRIBER_ID = b.SUBSCRIBER_ID AND MBR_MTH = 4 AND MBR_YEAR=2018),0) as APR18
		,ISNULL((SELECT 1 FROM tmp_MbrAttrition b WHERE a.SUBSCRIBER_ID = b.SUBSCRIBER_ID AND MBR_MTH = 5 AND MBR_YEAR=2018),0) as MAY18
		,ISNULL((SELECT 1 FROM tmp_MbrAttrition b WHERE a.SUBSCRIBER_ID = b.SUBSCRIBER_ID AND MBR_MTH = 6 AND MBR_YEAR=2018),0) as JUN18
		,ISNULL((SELECT 1 FROM tmp_MbrAttrition b WHERE a.SUBSCRIBER_ID = b.SUBSCRIBER_ID AND MBR_MTH = 7 AND MBR_YEAR=2018),0) as JUL18
		,ISNULL((SELECT 1 FROM tmp_MbrAttrition b WHERE a.SUBSCRIBER_ID = b.SUBSCRIBER_ID AND MBR_MTH = 8 AND MBR_YEAR=2018),0) as AUG18
		,ISNULL((SELECT 1 FROM tmp_MbrAttrition b WHERE a.SUBSCRIBER_ID = b.SUBSCRIBER_ID AND MBR_MTH = 9 AND MBR_YEAR=2018),0) as SEP18
		,ISNULL((SELECT 1 FROM tmp_MbrAttrition b WHERE a.SUBSCRIBER_ID = b.SUBSCRIBER_ID AND MBR_MTH = 10 AND MBR_YEAR=2018),0) as OCT18
		,ISNULL((SELECT 1 FROM tmp_MbrAttrition b WHERE a.SUBSCRIBER_ID = b.SUBSCRIBER_ID AND MBR_MTH = 11 AND MBR_YEAR=2018),0) as NOV18 
		,ISNULL((SELECT 1 FROM tmp_MbrAttrition b WHERE a.SUBSCRIBER_ID = b.SUBSCRIBER_ID AND MBR_MTH = 12 AND MBR_YEAR=2018),0) as DEC18 
		,ISNULL((SELECT COUNT(SUBSCRIBER_ID) FROM tmp_MbrAttrition b WHERE a.SUBSCRIBER_ID = b.SUBSCRIBER_ID AND MBR_YEAR=2017),0) as MM17
		,ISNULL((SELECT COUNT(SUBSCRIBER_ID) FROM tmp_MbrAttrition b WHERE a.SUBSCRIBER_ID = b.SUBSCRIBER_ID AND MBR_YEAR=2018),0) as MM18
  FROM [ACECAREDW].[dbo].[tmp_MbrAttrition] a
  
  END





