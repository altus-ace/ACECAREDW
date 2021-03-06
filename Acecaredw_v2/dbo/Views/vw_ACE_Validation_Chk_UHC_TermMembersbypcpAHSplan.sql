﻿


CREATE view [dbo].[vw_ACE_Validation_Chk_UHC_TermMembersbypcpAHSplan]
as
select cc.old_id,cc.old_plan,h.client_Member_id,h.stopdate 
from (
SELECT pp.uhc_subscriber_id as old_id,
           ss.destination_value AS  old_plan,
		 c.cur_id,
	
		 case when cur_id is null then 1 else 0 end as Term
    FROM uhc_membersbypcp pp
         INNER JOIN [ALT_MAPPING_TABLES] ss ON ss.source_value = pp.subgrp_id
                                               AND source = 'UHC'
                                               AND ss.destination = 'ALTRUISTA'
									    and ss.URN not between 61 and 71
left join ( 
SELECT distinct pp1.uhc_subscriber_id as cur_id,
           ss1.destination_value  AS cur_plan
    FROM uhc_membersbypcp pp1
         INNER JOIN [ALT_MAPPING_TABLES] ss1 ON ss1.source_value = pp1.subgrp_id
                                               AND source = 'UHC'
                                               AND ss1.destination = 'ALTRUISTA'
									  and ss1.URN not between 61 and 71

    WHERE pp1.a_last_update_flag = 'Y' and pp1.LoadType='p' ) as c on c.cur_id=pp.UHC_SUBSCRIBER_ID

    
    WHERE  MONTH(pp.A_LAST_UPDATE_DATE)=MONTH(getdate())-1 and YEAR(pp.A_LAST_UPDATE_DATE)=YEAR(getdate()) and pp.loadtype='P'

    )as cc
    left join
   (SELECT  Client_member_id,startdate,stopdate
      
FROM [adw].[A_ALT_MemberPlanHistory] where stopdate=convert(date,dateadd(day,-day(GETDATE()),GETDATE())) and planhistorystatus=1 ) h on h.Client_Member_id=cc.old_id
    where cc.Term=1  and convert(date,h.stopdate) <> convert(date,dateadd(day,-day(GETDATE()),GETDATE()))


