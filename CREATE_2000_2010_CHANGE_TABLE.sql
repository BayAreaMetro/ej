CREATE VIEW EJ_2016.year_2000_2010_change AS
SELECT
	acs14cn00.GEOID,
	acs14cn00.PopChange,
	acs14cn00.TotalPopPctChange,
	acs14cn00.LowIncomePopChange,
	acs14cn00.LowIncomePopPctChange,
	acs14cn00.MinorityPopChange,
	acs14cn00.MinorityPopPctChange,
	acs14cn00.Pop65PlusChange,
	acs14cn00.Pop65PlusPctChange,
	acs14cn00.SPFAM_Change,
	acs14cn00.SPFAM_PctChange,
	acs14cn00.POP_LEP_Change,
	acs14cn00.POP_LEP_PctChange,
	acs14cn00.POP_ZVHHS_Change,
	acs14cn00.POP_ZVHHS_PctChange,
	acs14cn00.POP_HUS_RENT50_Change,
	acs14cn00.RENT50_PctChange,
	acs14cn00.Asian_Pacific_IslanderPopChange,
	acs14cn00.AsianPacificPopPctChange,
	acs14cn00.BlackAlonePopPctChange,
	acs14cn00.BlackPopChange,
	acs14cn00.WhitePopChange,
	acs14cn00.WhiteAlonePopPctChange
From 
EJ_2016.EJ_Select_Variables_ACS2014_Census2000_Compare as acs14cn00