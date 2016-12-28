CREATE VIEW [EJ_2016].[year_2010_tract_data] AS 
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
	dec22upd.B11004_010E + dec22upd.B11004_016E as 'SPFAM',
	CASE 
		WHEN dec22upd.B11004_001E > 0 
			THEN ((dec22upd.B11004_010E + dec22upd.B11004_016E)/dec22upd.B11004_001E) 
		ELSE NULL 
	END AS 'SPFAM_SOT', 
	acs14s.POP_LEP,
	acs14s.POP_LEP_SOT,
	ZVHH.B25044_001E as TotalHHs_ACS2014,
	CASE 
		WHEN ZVHH.B25044_001E > 0 
			THEN (ZVHH.B25044_003E + ZVHH.B25044_010E) / CAST(ZVHH.B25044_001E AS DECIMAL(10,2)) --TOTAL ZERO-VEHICLE HOUSEHOLDS / TOTAL HOUSEHOLDS
		ELSE NULL                                                                               --CAST one of the integers as decimal BEFORE doing division, get a decimal result :) 
	END as POP_ZVHHS_SOT, 
	acs14s.POP_HUS_RENT50,
	CASE 
		WHEN dec22upd.B25070_001E > 0 
			THEN (acs14s.POP_HUS_RENT50/dec22upd.B25070_001E) 
		ELSE NULL 
	END AS 'POP_HUS_RENT50_SOT', 
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
LEFT JOIN
	EJ_2016.update_2014_acs_dec22 AS dec22upd ON coc.GEOID = CONCAT (dec22upd.state, dec22upd.county, dec22upd.tract)
LEFT JOIN 
	EJ_2016.ACS5_2014_ZEROVEHICLEHHS as ZVHH ON acs14cn00.GEOID = ZVHH.GEOID
