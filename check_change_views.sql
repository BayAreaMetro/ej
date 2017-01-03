CREATE VIEW EJ_2016.year_2000_2010_change_DEC30UPD_summary
SELECT sum(TotalPop_ACS2014) as TotalPop_ACS2014_total
      ,sum(Pop_2000) as Pop_2000_total
      ,sum(White_Alone_2014) as White_Alone_2014_total
      ,sum(White_Alone_2000) as White_Alone_2000_total
      ,sum(Black_Alone_2014) as Black_Alone_2014_total
      ,sum(Black_Alone_2000) as Black_Alone_2000_total
      ,sum(Hispanic_Alone_2014) as Hispanic_Alone_2014_total
      ,sum(Hispanic_Alone_2000) as Hispanic_Alone_2000_total
      ,sum(Asian_Pacific_Islander_2014) as Asian_Pacific_Islander_2014_total
      ,sum(Asian_Pacific_Islander_2000) as Asian_Pacific_Islander_2000_total
      ,sum(POP_ZVHHS_ACS2014) as POP_ZVHHS_ACS2014_total
      ,sum(Pop_ZVHHS_2000) as Pop_ZVHHS_2000_total
      ,sum(POP_LEP_ACS2014) as POP_LEP_ACS2014_total
      ,sum(Pop_LEP_2000) as Pop_LEP_2000_total
      ,sum(SPFAM_ACS2014) as SPFAM_ACS2014_total
      ,sum(SPFAM_2000) as SPFAM_2000_total
      ,sum(POP_HUS_RENT50_ACS2014) as POP_HUS_RENT50_ACS2014_total
      ,sum(HUS_RENT50_2000) as HUS_RENT50_2000_total
      ,sum(Pop65plus_ACS2014) as Pop65plus_ACS2014_total
      ,sum(Pop65Plus_2000) as Pop65Plus_2000_total
      ,sum(Veterans_ACS2014) as Veterans_ACS2014_total
      ,sum(Veterans_2000) as Veterans_2000_total
      ,sum(DisabledPop_ACS2014) as DisabledPop_ACS2014_total
      ,sum(DisabledPop_2000) as DisabledPop_2000_total
      ,sum(LowIncomePop_ACS2014) as LowIncomePop_ACS2014_total
      ,sum(LowIncomePop_2000) as LowIncomePop_2000_total
      ,sum(MinorityPopulation_ACS2014) as MinorityPopulation_ACS2014_total
      ,sum(MinorityPop_2000) as MinorityPop_2000_total
      ,sum(Disadvantage_Level) as Disadvantage_Level_total
      ,sum(COCFLAG_2017) as COCFLAG_2017_total
  FROM gis.EJ_2016.year_2000_2010_change_DEC30UPD

CREATE VIEW EJ_2016.year_2000_2010_change_DEC30UPD_no_change_tracts_summary AS
  SELECT sum(TotalPop_ACS2014) as TotalPop_ACS2014_total
      ,sum(Pop_2000) as Pop_2000_total
      ,sum(White_Alone_2014) as White_Alone_2014_total
      ,sum(White_Alone_2000) as White_Alone_2000_total
      ,sum(Black_Alone_2014) as Black_Alone_2014_total
      ,sum(Black_Alone_2000) as Black_Alone_2000_total
      ,sum(Hispanic_Alone_2014) as Hispanic_Alone_2014_total
      ,sum(Hispanic_Alone_2000) as Hispanic_Alone_2000_total
      ,sum(Asian_Pacific_Islander_2014) as Asian_Pacific_Islander_2014_total
      ,sum(Asian_Pacific_Islander_2000) as Asian_Pacific_Islander_2000_total
      ,sum(POP_ZVHHS_ACS2014) as POP_ZVHHS_ACS2014_total
      ,sum(Pop_ZVHHS_2000) as Pop_ZVHHS_2000_total
      ,sum(POP_LEP_ACS2014) as POP_LEP_ACS2014_total
      ,sum(Pop_LEP_2000) as Pop_LEP_2000_total
      ,sum(SPFAM_ACS2014) as SPFAM_ACS2014_total
      ,sum(SPFAM_2000) as SPFAM_2000_total
      ,sum(POP_HUS_RENT50_ACS2014) as POP_HUS_RENT50_ACS2014_total
      ,sum(HUS_RENT50_2000) as HUS_RENT50_2000_total
      ,sum(Pop65plus_ACS2014) as Pop65plus_ACS2014_total
      ,sum(Pop65Plus_2000) as Pop65Plus_2000_total
      ,sum(Veterans_ACS2014) as Veterans_ACS2014_total
      ,sum(Veterans_2000) as Veterans_2000_total
      ,sum(DisabledPop_ACS2014) as DisabledPop_ACS2014_total
      ,sum(DisabledPop_2000) as DisabledPop_2000_total
      ,sum(LowIncomePop_ACS2014) as LowIncomePop_ACS2014_total
      ,sum(LowIncomePop_2000) as LowIncomePop_2000_total
      ,sum(MinorityPopulation_ACS2014) as MinorityPopulation_ACS2014_total
      ,sum(MinorityPop_2000) as MinorityPop_2000_total
      ,sum(Disadvantage_Level) as Disadvantage_Level_total
      ,sum(COCFLAG_2017) as COCFLAG_2017_total
  FROM gis.EJ_2016.year_2000_2010_change_DEC30UPD_no_change_tracts

CREATE VIEW [EJ_2016].[year_2000_2010_change_DEC30UPD_no_change_tracts]
AS 
SELECT [GEOID10]
      ,[county]
      ,[TotalPop_ACS2014]
      ,SUM(Pop_2000) as Pop_2000
      ,[White_Alone_2014]
      ,SUM([Relative_White_Alone_2000]) as White_Alone_2000
      ,[Black_Alone_2014]
      ,SUM([Relative_Black_Alone_2000]) as Black_Alone_2000 
      ,[Hispanic_Alone_2014]
      ,SUM([Relative_Hispanic_Alone_2000]) as Hispanic_Alone_2000
      ,[Asian_Pacific_Islander_2014]
      ,SUM([Relative_Asian_Pacific_Islander_2000]) as Asian_Pacific_Islander_2000
      ,[POP_ZVHHS_ACS2014]
      ,SUM([Relative_Pop_ZVHHS_2000]) as Pop_ZVHHS_2000
      ,[POP_LEP_ACS2014]
      ,SUM([Relative_Pop_LEP_2000]) as Pop_LEP_2000
      ,[SPFAM_ACS2014]
      ,SUM([Relative_SPFAM_2000]) as SPFAM_2000
      ,[POP_HUS_RENT50_ACS2014]
      ,SUM([Relative_Pop_HUS_RENT50_2000]) as HUS_RENT50_2000
      ,[Pop65plus_ACS2014]
      ,SUM([Relative_Pop65Plus_2000]) as Pop65Plus_2000
      ,[Veterans_ACS2014]
      ,SUM([Relative_Veterans_2000]) as Veterans_2000
      ,[DisabledPop_ACS2014]
      ,SUM([Relative_DisabledPop_2000]) as DisabledPop_2000
      ,[LowIncomePop_ACS2014]
      ,SUM([Relative_LowIncomePop_2000]) as LowIncomePop_2000
      ,[MinorityPopulation_ACS2014]
      ,SUM([Relative_MinorityPop_2000]) as MinorityPop_2000
	  ,DL.Disadvantage_Level 
	  ,COC2014.COCFLAG_2017
  FROM [EJ_2016].[EJ_SELECT_VARIABLES_C2000_ACS2014_COMPARE_DEC28] AS Compare
	LEFT OUTER JOIN
	ACS_2014_ALL_COC_DATA_TRACTS AS COC2014 ON Compare.GEOID10 = COC2014.GEOID 
	LEFT OUTER JOIN
	DISADVANTAGE_LEVEL AS DL ON Compare.GEOID10 = DL.GEOID
  WHERE Part00 = 'W'
  group by 
  [GEOID10]
      ,[county]
      ,[TotalPop_ACS2014]
      ,[White_Alone_2014]
      ,[Black_Alone_2014]
      ,[Hispanic_Alone_2014]
      ,[Asian_Pacific_Islander_2014]
      ,[POP_ZVHHS_ACS2014]
      ,[POP_LEP_ACS2014]
      ,[SPFAM_ACS2014]
      ,[POP_HUS_RENT50_ACS2014]
      ,[Pop65plus_ACS2014]
      ,[Veterans_ACS2014]
      ,[DisabledPop_ACS2014]
      ,[LowIncomePop_ACS2014]
      ,[MinorityPopulation_ACS2014]
	  ,[Disadvantage_Level]
	  ,[COCFLAG_2017]
GO