---
CREATE VIEW EJ_2016.update_2014_acs_dec22_spfam_chg AS
	SELECT rel.GEOID10,
	CASE WHEN rel.PART00 = 'W' 
			THEN ((dec22upd_ACS.B11004_010E+dec22upd_ACS.B11004_016E) 
			- (dec22upd_C2K.P017010 + dec22upd_C2K.P017016)) 
	WHEN (rel.PART00 = 'P' AND dec22upd_C2K.P017001 = 0) 
		THEN ((dec22upd_ACS.B11004_010E+dec22upd_ACS.B11004_016E) - (dec22upd_C2K.P017010 + dec22upd_C2K.P017016)) 
	ELSE 
		((dec22upd_ACS.B11004_010E+dec22upd_ACS.B11004_016E) - 
		Round((dec22upd_C2K.P017001 / 100) * (dec22upd_C2K.P017010 + dec22upd_C2K.P017016), 0)) 
	END AS SPFAM_Change
FROM
	EJ_2016.update_2014_acs_dec22 AS dec22upd_ACS
LEFT JOIN
	CensusTractRelationshipFile AS rel ON rel.GEOID10 = CONCAT (dec22upd_ACS.state, dec22upd_ACS.county, dec22upd_ACS.tract)
LEFT JOIN 
	ej_2016.update_2000_sf3_dec22 AS dec22upd_C2K 
	ON CONCAT (dec22upd_ACS.state, dec22upd_ACS.county, dec22upd_ACS.tract) = 
	   CONCAT (dec22upd_C2K.state, dec22upd_C2K.county, dec22upd_C2K.tract)
;
GO
CREATE VIEW EJ_2016.update_2014_acs_dec22_pop_hus_rent_chg AS
	SELECT rel.GEOID10,
	CASE WHEN rel.PART00 = 'W' 
		THEN (ACS.POP_HUS_RENT50 - (C2k.POP_HUS_RENT50)) 
	WHEN (rel.PART00 = 'P' AND dec22upd_C2K.H069001 = 0) 
		THEN (ACS.POP_HUS_RENT50 - (C2k.POP_HUS_RENT50)) 
	ELSE (ACS.POP_HUS_RENT50 - Round((dec22upd_C2K.H069001 / 100) * (C2k.POP_HUS_RENT50), 0)) END AS POP_HUS_RENT50_Change
FROM            
	ACS_2014_EJ_Selected_Variables AS ACS LEFT JOIN
	CensusTractRelationshipFile AS rel ON ACS.GEOID = rel.GEOID10 LEFT JOIN
	Census2000_EJ_SelectedVariables_Revised AS C2K ON rel.GEOID00 = C2K.GEOID LEFT JOIN 
	ej_2016.update_2000_sf3_dec22 AS dec22upd_C2K ON C2K.GEOID = CONCAT (dec22upd_C2K.state, dec22upd_C2K.county, dec22upd_C2K.tract)
;