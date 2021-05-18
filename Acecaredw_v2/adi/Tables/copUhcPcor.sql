﻿CREATE TABLE [adi].[copUhcPcor] (
    [copUhcPcor]                                                                  INT           IDENTITY (1, 1) NOT NULL,
    [loadDate]                                                                    DATE          NOT NULL,
    [DataDate]                                                                    DATE          NOT NULL,
    [SrcFileName]                                                                 VARCHAR (100) NOT NULL,
    [CreatedDate]                                                                 DATE          CONSTRAINT [DF_copUhcPcor_CreatedDate] DEFAULT (getdate()) NOT NULL,
    [CreatedBy]                                                                   VARCHAR (50)  CONSTRAINT [DF_copUhcPcor_CreatedBy] DEFAULT (suser_sname()) NOT NULL,
    [LastUpdatedDate]                                                             DATE          CONSTRAINT [DF_copUhcPcor_LastUpdatedDate] DEFAULT (getdate()) NOT NULL,
    [LastUpdatedBy]                                                               VARCHAR (50)  CONSTRAINT [DF_copUhcPcor_LastUpdatedBy] DEFAULT (suser_sname()) NOT NULL,
    [GroupName]                                                                   VARCHAR (100) NULL,
    [Physician]                                                                   VARCHAR (100) NULL,
    [PhysicianAddress]                                                            VARCHAR (100) NULL,
    [FirstName]                                                                   VARCHAR (100) NULL,
    [LastName]                                                                    VARCHAR (100) NULL,
    [MemberID]                                                                    VARCHAR (50)  NOT NULL,
    [DOB]                                                                         DATE          NOT NULL,
    [Phone]                                                                       VARCHAR (35)  NULL,
    [MemberAddress]                                                               VARCHAR (100) NULL,
    [MemberState]                                                                 VARCHAR (25)  NULL,
    [MemberZip]                                                                   VARCHAR (15)  NULL,
    [DateOfLastService]                                                           DATE          NULL,
    [IncentiveProgram]                                                            VARCHAR (50)  NULL,
    [CareScore]                                                                   VARCHAR (10)  NULL,
    [HealthPlanName]                                                              VARCHAR (20)  NULL,
    [Product]                                                                     VARCHAR (50)  NULL,
    [FUH_FollowUpHospMentalIllness_30]                                            CHAR (3)      NULL,
    [FUH_FollowUpHospMentalIllness_30_6_17_years]                                 CHAR (3)      NULL,
    [FUH_FollowUpHospMentalIllness_30_18_64_years]                                CHAR (3)      NULL,
    [FUH_FollowUpHospMentalIllness_30_65_years]                                   CHAR (3)      NULL,
    [FUH_FollowUpAfterHospMentIllness7Day]                                        CHAR (3)      NULL,
    [FUH_FollowUpAfterHospMentIllness7Day_6_17_years]                             CHAR (3)      NULL,
    [FUH_FollowUpAfterHospMentIllness7Day_18_64_years]                            CHAR (3)      NULL,
    [FUH_FollowUpAfterHospMentIllness7Day_65_years]                               CHAR (3)      NULL,
    [PPC_PostPartumCare]                                                          CHAR (3)      NULL,
    [PPC_TimelinessPrenatalCare]                                                  CHAR (3)      NULL,
    [ADD_FollowUpCareChild_ADHD_ContMaintPhase]                                   CHAR (3)      NULL,
    [ADD_FollowUpCareChild_ADHD_InitiationPhase]                                  CHAR (3)      NULL,
    [AWC_AdolescentWellCareVisits]                                                CHAR (3)      NULL,
    [BCS_BreastCancerScreening]                                                   CHAR (3)      NULL,
    [CAP_ChildrenAdolescentsAccessPrimaryCare]                                    CHAR (3)      NULL,
    [CBP_ControllingHighBloodPressure]                                            CHAR (3)      NULL,
    [CCS_CervicalCancerScreening]                                                 CHAR (3)      NULL,
    [CDC_CompDiabetesCareHbA1cControl]                                            CHAR (3)      NULL,
    [CDC_CompDiabetesCareHbA1cPoorControl]                                        CHAR (3)      NULL,
    [CIS_ChildImmunizationStatusCombo10]                                          CHAR (3)      NULL,
    [CTM_STWAWC_AdolescentWellCareVisits]                                         CHAR (3)      NULL,
    [SSD_DiabetesScreeningSchizophreniaBipolar]                                   CHAR (3)      NULL,
    [URI_ChildUpperRespInfection]                                                 CHAR (3)      NULL,
    [W15_WellChildVisitsFirst_15_Months]                                          CHAR (3)      NULL,
    [W34_WellChildVisits_3_6_Years]                                               CHAR (3)      NULL,
    [WCC_WeightCounselingChildBMIPercentile]                                      CHAR (3)      NULL,
    [WCC_WeightCounselingChildNutrition]                                          CHAR (3)      NULL,
    [WCC_WeightCounselingChildPhysicalActivity]                                   CHAR (3)      NULL,
    [CDC_ComprehensiveDiabetesCare_HbA1c_Testing]                                 CHAR (3)      NULL,
    [MPM_AnnualMonitoringForPatientsOnPersistentMedicationsACEInhibitorsOrARBs]   CHAR (3)      NULL,
    [MPM_AnnualMonitoringForPatientsOnPersistentMedicationsDiuretics]             CHAR (3)      NULL,
    [AdherenceToAntipsychoticMedicationsForIndividualsWithSchizophreniaAges19_64] CHAR (3)      NULL,
    [CareForOlderAdults_COA_MedicationReviewAges66OrOlder]                        CHAR (3)      NULL,
    [MedicationReconciliationPostDischargeAges18OrOlder]                          CHAR (3)      NULL,
    [ComprehensiveDiabetesCareHemoglobinA1CTesting]                               CHAR (3)      NULL,
    [AAP_AdultsAccesstoPreventiveAmbulatoryHealthServices]                        CHAR (3)      NULL,
    [CHL_ChlamydiaScreeningInWomen]                                               CHAR (3)      NULL,
    [COA_CareForOlderAdults_MedicationReview]                                     CHAR (3)      NULL,
    PRIMARY KEY CLUSTERED ([copUhcPcor] ASC)
);
