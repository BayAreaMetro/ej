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
	dec22upd.P017010 + dec22upd.P017016 as 'SPFAM',
	CASE 
		WHEN dec22upd.P017001 > 0 
			THEN ((dec22upd.P017010 + dec22upd.P017016)/dec22upd.P017001) 
		ELSE NULL 
	END AS 'SPFAM_SOT', 
	cn00s.POP_LEP,
	cn00s.POP_LEP/cn00s.TotalPopulation as 'POP_LEP_SOT',
	ZVHH.H044003 + ZVHH.H044010 as 'POP_ZVHHS',
	CASE
		WHEN ZVHH.H044001 > 0 
			THEN (ZVHH.H044003 + ZVHH.H044010) / CAST(ZVHH.H044001 as decimal(10,2))
		ELSE NULL
	END as 'POP_ZVHHS_SOT',
	cn00s.POP_HUS_RENT50,
	CASE 
		WHEN dec22upd.H069001 > 0 
			THEN (cn00s.POP_HUS_RENT50/dec22upd.H069001) 
		ELSE NULL 
	END AS 'POP_HUS_RENT50_SOT', 
	cn00s.Asian_Pacific_Islander,
	cn00s.Black_Alone,
	cn00s.Hispanic_Latino
From EJ_2016.CENSUS2000_EJ_SELECTEDVARIABLES_NO_ZERO_POP as cn00s 
LEFT JOIN
	ej_2016.update_2000_sf3_dec22 AS dec22upd ON cn00s.GEOID = CONCAT (dec22upd.state, dec22upd.county, dec22upd.tract)
LEFT JOIN 
	EJ_2016.CENSUS_2K_ZEROVEHICLEHHS as ZVHH ON cn00s.GEOID = ZVHH.GEOID
