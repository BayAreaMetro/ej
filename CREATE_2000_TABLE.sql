CREATE VIEW EJ_2016.year_2000_tract_data AS
SELECT 
	cn00s.GEOID,
	cn00s.TotalPopulation,
	cn00s.LowIncomePopulation,
	cn00s.Minority_Population,
	cn00s.Pop65plus,
	cn00s.POP_HUS_RENT50,
	cn00s.POP_LEP,
	cn00s.POP_ZVHHS,
	cn00s.SPFAM,
	cn00s.Share_LowIncome_Population,
	cn00s.Share_MinorityPopulation,
	cn00s.Asian_Pacific_Islander,
	cn00s.Black_Alone,
	cn00s.Hispanic_Latino,
	cn00s.White_Alone
/*cn00s.Pop65plus/cn00s.TotalPopulation as 'Age65plusSOT',
cn00s.LowIncomePopulation/cn00s.TotalPopulation as 'LwIncPop_SOT',*/
From EJ_2016.CENSUS2000_EJ_SELECTEDVARIABLES as cn00s
