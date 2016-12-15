CREATE VIEW EJ_2016.year_2010_tract_data AS
SELECT 
acs14s.TotalPopulation,
acs14s.LowIncomePop,
acs14s.LowIncPopSOT,
acs14s.MinorityPopulation,
acs14s.MinorityPopSOT,
acs14s.PopAge65plus,
acs14s.Age65plusSOT,
acs14s.DisabledPop,
acs14s.SPFAM,
acs14s.SPFAM_SOT,
acs14s.POP_LEP,
acs14s.POP_LEP_SOT,
acs14s.POP_ZVHHS,
acs14s.POP_ZVHHS_SOT,
acs14s.POP_HUS_RENT50,
acs14s.POP_HUS_RENT50_SOT,
acs14cn00.Asian_Pacific_Islander_2014,
acs14cn00.Black_Alone_2014,
acs14cn00.Hispanic_Alone_2014,
acs14cn00.MinorityPopulation_ACS2014,
acs14cn00.Pop65plus_ACS2014,
dl.Disadvantage_Level,
coc.COCFLAG_2017
FROM 
EJ_2016.EJ_Select_Variables_ACS2014_Census2000_Compare as acs14cn00,
EJ_2016.ACS_2014_EJ_Selected_Variables as acs14s,
EJ_2016.Disadvantage_Level as dl,
EJ_2016.ACS_2014_ALL_COC_DATA_TRACTS as coc
WHERE 
1.GEOID==2.GEOID