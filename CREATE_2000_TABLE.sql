CREATE VIEW EJ_2016.year_2000_tract_data AS
SELECT 
	cn00s.GEOID,
	cn00s.TotalPopulation,
	cn00s.LowIncomePopulation,
	cn00s.Share_LowIncome_Population as 'LowIncPopSOT',
	cn00s.Minority_Population,
	cn00s.Share_MinorityPopulation as 'MinorityPopSOT',
	cn00s.Pop65plus as 'PopAge65plus',
	cn00s.Pop65plus/cn00s.TotalPopulation as 'Age65plusSOT',
	cn00s.DisabledPop,
	cn00s.SPFAM,
	cn00s.SPFAM/cn00s.TotalPopulation as 'SPFAM_SOT',
	cn00s.POP_LEP,
	cn00s.POP_LEP/cn00s.TotalPopulation as 'POP_LEP_SOT',
	cn00s.POP_ZVHHS,
	cn00s.POP_ZVHHS/cn00s.TotalPopulation as 'POP_ZVHHS_SOT',
	cn00s.POP_HUS_RENT50,
	cn00s.POP_HUS_RENT50/cn00s.TotalPopulation as 'POP_HUS_RENT50_SOT',
	cn00s.Asian_Pacific_Islander,
	cn00s.Black_Alone,
	cn00s.Hispanic_Latino
From EJ_2016.CENSUS2000_EJ_SELECTEDVARIABLES_NO_ZERO_POP as cn00s
