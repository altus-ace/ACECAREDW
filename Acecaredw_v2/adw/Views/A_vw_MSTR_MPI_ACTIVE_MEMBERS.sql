﻿

CREATE VIEW [adw].[A_vw_MSTR_MPI_ACTIVE_MEMBERS]
AS
    /* Purpose: Gets all Active members with MPI/Ace ID for Export to 3rd parties */    
    /* version history:
	   12/2/2019: GK: Added a MbrMEmber.ClientKey <> 1 clause for switching over to MBR model */
    /* old version of UHC data */
    SELECT DISTINCT 
            RTRIM(LTRIM(MPI.A_MSTR_MRN))			 AS AceID
          , RTRIM(LTRIM(MPI.MEMBER_FIRST_NAME))		 AS MEMBER_FIRST_NAME
          , RTRIM(LTRIM(MPI.MEMBER_MI))				 AS MEMBER_MI
          , RTRIM(LTRIM(MPI.MEMBER_LAST_NAME))		 AS MEMBER_LAST_NAME
          , RTRIM(LTRIM(MPI.GENDER))				 AS GENDER
          , CONVERT(VARCHAR, MPI.DATE_OF_BIRTH,120)		 AS DATE_OF_BIRTH
		, RTRIM(LTRIM(MPI.MEDICAID_ID))			 AS MEDICAID_ID
          , RTRIM(LTRIM(MPI.MEDICARE_ID))			 AS MEDICARE_ID
          , RTRIM(LTRIM(MPI.MEMBER_HOME_ADDRESS))		 AS MEMBER_HOME_ADDRESS
          , RTRIM(LTRIM(MPI.MEMBER_HOME_ADDRESS2))	 AS MEMBER_HOME_ADDRESS2
          , RTRIM(LTRIM(MPI.MEMBER_HOME_CITY))		 AS MEMBER_HOME_CITY
          , RTRIM(LTRIM(MPI.MEMBER_HOME_STATE))		 AS MEMBER_HOME_STATE
		/* orginal above */
          , RTRIM(LTRIM(LEFT(MPI.MEMBER_HOME_ZIP, 5)))	 AS MEMBER_HOME_ZIP
		, RTRIM(LTRIM(MPI.MEMBER_HOME_ZIP_PLUS_4))	 AS MEMBER_HOME_ZIP_PLUS_4
		, RTRIM(LTRIM(am.Member_Home_Phone))		 AS Member_Home_Phone
		, RTRIM(LTRIM(am.MEMBER_BUS_PHONE))		 AS Member_Business_Phone
		, RTRIM(LTRIM(am.MEMBER_MAIL_PHONE))		 AS Member_Alt_Phone_1
		, RTRIM(LTRIM(am.RESP_PHONE))				 AS Member_Alt_Phone_2	
		, RTRIM(LTRIM(am.MEMBER_ID))				 AS ClientMemberKey	
		, am.clientKey
     FROM dbo.vw_ActiveMembers AS am
          INNER JOIN adw.A_Mbr_Members AS mm ON am.MEMBER_ID = mm.Client_Member_ID
          INNER JOIN adw.A_vw_MSTR_MPI_PatientInfo AS MPI ON mm.A_MSTR_MRN = MPI.A_MSTR_MRN

    UNION
    /* For Member Model version */
    SELECT DISTINCT
            RTRIM(LTRIM(MPI.A_MSTR_MRN))			 AS AceID
          , RTRIM(LTRIM(MPI.MEMBER_FIRST_NAME))		 AS MEMBER_FIRST_NAME
          , RTRIM(LTRIM(MPI.MEMBER_MI))				 AS MEMBER_MI
          , RTRIM(LTRIM(MPI.MEMBER_LAST_NAME))		 AS MEMBER_LAST_NAME
          , RTRIM(LTRIM(MPI.GENDER))				 AS GENDER
          , CONVERT(VARCHAR, MPI.DATE_OF_BIRTH, 120)	 AS DATE_OF_BIRTH
		, RTRIM(LTRIM(MPI.MEDICAID_ID))			 AS MEDICAID_ID
          , RTRIM(LTRIM(MPI.MEDICARE_ID))			 AS MEDICARE_ID
          , RTRIM(LTRIM(MPI.MEMBER_HOME_ADDRESS))		 AS MEMBER_HOME_ADDRESS
          , RTRIM(LTRIM(MPI.MEMBER_HOME_ADDRESS2))	 AS MEMBER_HOME_ADDRESS2
          , RTRIM(LTRIM(MPI.MEMBER_HOME_CITY))		 AS MEMBER_HOME_CITY
          , RTRIM(LTRIM(MPI.MEMBER_HOME_STATE))		 AS MEMBER_HOME_STATE
		/* orginal above */
          , RTRIM(LTRIM(LEFT(MPI.MEMBER_HOME_ZIP, 5)))	 AS MEMBER_HOME_ZIP
		, RTRIM(LTRIM(MPI.MEMBER_HOME_ZIP_PLUS_4))	 AS MEMBER_HOME_ZIP_PLUS_4
		, RTRIM(LTRIM(am.Member_Home_Phone))		 AS Member_Home_Phone
		, RTRIM(LTRIM(am.MEMBER_BUS_PHONE))		 AS Member_Business_Phone
		, RTRIM(LTRIM(am.MEMBER_MAIL_PHONE))		 AS Member_Alt_Phone_1
		, RTRIM(LTRIM(am.RESP_PHONE))				 AS Member_Alt_Phone_2	
		, RTRIM(LTRIM(am.MEMBER_ID))				 AS ClientMemberKey
		, Mbr.ClientKey						 AS ClientKey
     FROM dbo.vw_ActiveMembers AS am
          INNER JOIN adw.MbrMember AS Mbr ON am.MEMBER_ID = Mbr.ClientMemberKey
		  AND  Mbr.ClientKey <> 1
          INNER JOIN adw.A_vw_MSTR_MPI_PatientInfo AS MPI ON mbr.MstrMrnKey = MPI.A_MSTR_MRN;
/* Old tool for UHC only.
	    SELECT DISTINCT
            RTRIM(LTRIM(MPI.A_MSTR_MRN)) AS MRN
          , RTRIM(LTRIM(MPI.MEMBER_FIRST_NAME)) AS MEMBER_FIRST_NAME
          , RTRIM(LTRIM(MPI.MEMBER_MI)) AS MEMBER_MI
          , RTRIM(LTRIM(MPI.MEMBER_LAST_NAME)) AS MEMBER_LAST_NAME
          , RTRIM(LTRIM(MPI.GENDER)) AS GENDER
          , RTRIM(LTRIM(MPI.DATE_OF_BIRTH)) AS DATE_OF_BIRTH
		, RTRIM(LTRIM(MPI.MEDICAID_ID)) AS MEDICAID_ID
          , RTRIM(LTRIM(MPI.MEDICARE_ID)) AS MEDICARE_ID
          , RTRIM(LTRIM(MPI.MEMBER_HOME_ADDRESS))	  AS MEMBER_HOME_ADDRESS
          , RTRIM(LTRIM(MPI.MEMBER_HOME_ADDRESS2))  AS MEMBER_HOME_ADDRESS2
          , RTRIM(LTRIM(MPI.MEMBER_HOME_CITY))	  AS MEMBER_HOME_CITY
          , RTRIM(LTRIM(MPI.MEMBER_HOME_STATE))	  AS MEMBER_HOME_STATE
		/* orginal above */
          , RTRIM(LTRIM(LEFT(MPI.MEMBER_HOME_ZIP, 5))) AS MEMBER_HOME_ZIP
		, RTRIM(LTRIM(MPI.MEMBER_HOME_ZIP_PLUS_4)) AS MEMBER_HOME_ZIP_PLUS_4
		, RTRIM(LTRIM(am.Member_Home_Phone))	  AS Member_Home_Phone
		, RTRIM(LTRIM(am.MEMBER_BUS_PHONE))	  AS Member_Business_Phone
		, RTRIM(LTRIM(am.MEMBER_MAIL_PHONE))	  AS Member_Alt_Phone_1
		, RTRIM(LTRIM(am.RESP_PHONE))			  AS Member_Alt_Phone_2	
		, RTRIM(LTRIM(am.Uhc_Subscriber_ID)) AS  Member_Subscriber_ID		
     FROM dbo.vw_UHC_ActiveMembers AS am
          INNER JOIN adw.A_Mbr_Members AS mm ON am.UHC_SUBSCRIBER_ID = mm.Client_Member_ID
          INNER JOIN adw.A_vw_MSTR_MPI_PatientInfo AS MPI ON mm.A_MSTR_MRN = MPI.A_MSTR_MRN;
		*/
