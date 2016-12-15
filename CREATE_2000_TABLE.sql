CREATE VIEW EJ_2016.year_2000_tract_data AS
SELECT 
cn00s.POP_HUS_RENT50,
cn00s.POP_LEP,
cn00s.POP_ZVHHS,
cn00s.SPFAM,
cn00s.Share_LowIncome_Population,
cn00s.Share_MinorityPopulation,
cn00s.Pop65plus,
acs14cn00.Asian_Pacific_Islander_2000,
acs14cn00.Black_Alone_2000,
acs14cn00.Hispanic_Alone_2000,
acs14cn00.LowIncomePop_2000,
acs14cn00.MinorityPop_2000,
acs14cn00.Pop65plus_2000,
acs14cn00.Pop_2000,
acs14cn00.White_Alone_2000,
/*cn00s.Pop65plus/cn00s.TotalPopulation as 'Age65plusSOT',
cn00s.LowIncomePopulation/cn00s.TotalPopulation as 'LwIncPop_SOT',*/
cn00s.TotalPopulation
From EJ_2016.CENSUS2000_EJ_SELECTEDVARIABLES as cn00s,
EJ_2016.EJ_Select_Variables_ACS2014_Census2000_Compare as acs14cn00
WHERE cn00s.GEOID = acs14cn00.GEOID
