CREATE VIEW EJ_2016.year_2010_tract_data AS
SELECT 
	acs14s.GEOID,
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
	dl.Disadvantage_Level,
	coc.COCFLAG_2017
FROM 
	EJ_2016.EJ_Select_Variables_ACS2014_Census2000_Compare AS acs14cn00 
INNER JOIN
	EJ_2016.ACS_2014_EJ_Selected_Variables AS acs14s ON acs14cn00.GEOID = acs14s.GEOID 
INNER JOIN
	EJ_2016.DISADVANTAGE_LEVEL AS dl ON acs14s.GEOID = dl.GEOID 
INNER JOIN
	EJ_2016.ACS_2014_ALL_COC_DATA_TRACTS AS coc ON dl.GEOID = coc.GEOID