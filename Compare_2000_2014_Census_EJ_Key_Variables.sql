--Document the Key fields used from the Census API for the EJ 2016 Map Series.
--
--
--Create view with the following tables
--ACS_2014_EJ_Selected_Variables AS ACS INNER JOIN
--Census_Tract_Relationship_Correspondence AS rel ON ACS.GEOID = rel.GEOID10 LEFT OUTER JOIN
--Census2000_EJ_SelectedVariables_Revised AS C2K ON rel.GEOID00 = C2K.GEOID
Go
drop view Analysis.Census2K_ACS2014_EJ_Select_Variables_Compare_Detail
Go
create view Analysis.Census2K_ACS2014_EJ_Select_Variables_Compare_Detail as
SELECT        
ACS.GEOID, ACS.county, 

ACS.TotalPopulation AS TotalPop_ACS2014, 

CASE WHEN rel.PART00 = 'W' THEN (ACS.TotalPopulation - C2k.TotalPopulation) 
WHEN (rel.PART00 = 'P' AND rel.POPPCT00 = 0) 
THEN (ACS.TotalPopulation - C2k.TotalPopulation) 
ELSE (ACS.TotalPopulation - Round((Rel.POPPCT00 / 100) * C2K.TotalPopulation, 0)) END AS PopChange, 

ACS.Total_White_Alone AS TotalWhitePop_ACS2014, 

CASE WHEN rel.PART00 = 'W' THEN (ACS.Total_White_Alone - C2k.White_Alone) 
WHEN (rel.PART00 = 'P' AND rel.POPPCT00 = 0) 
THEN (ACS.Total_White_Alone - C2k.White_Alone) 
ELSE (ACS.Total_White_Alone - Round((Rel.POPPCT00 / 100) * C2K.White_Alone, 0)) END AS White_Alone_PopChange, 

ACS.Total_Black_Alone AS TotalBlackPop_ACS2014, 

CASE WHEN rel.PART00 = 'W' THEN (ACS.Total_Black_Alone - C2k.Black_Alone) 
WHEN (rel.PART00 = 'P' AND rel.POPPCT00 = 0) 
THEN (ACS.Total_Black_Alone - C2k.Black_Alone) 
ELSE (ACS.Total_Black_Alone - Round((Rel.POPPCT00 / 100) * C2K.Black_Alone, 0)) END AS Black_Alone_PopChange,

ACS.Total_Hispanic_Latino AS Total_Hispanic_Latino_Pop_ACS2014, 

CASE WHEN rel.PART00 = 'W' THEN (ACS.Total_Hispanic_Latino - C2k.Hispanic_Latino) 
WHEN (rel.PART00 = 'P' AND rel.POPPCT00 = 0) 
THEN (ACS.Total_Hispanic_Latino - C2K.Hispanic_Latino) 
ELSE (ACS.Total_Hispanic_Latino - Round((Rel.POPPCT00 / 100) * C2k.Hispanic_Latino, 0)) END AS Hispanic_Latino_PopChange,

ACS.Total_Asian_Pacific_Islander AS TotalAsian_Pacific_IslanderPop_ACS2014, 

CASE WHEN rel.PART00 = 'W' THEN (ACS.Total_Asian_Pacific_Islander - (C2k.Asian_Pacific_Islander)) 
WHEN (rel.PART00 = 'P' AND rel.POPPCT00 = 0) 
THEN (ACS.Total_Asian_Pacific_Islander - (Asian_Pacific_Islander)) 
ELSE (ACS.Total_Asian_Pacific_Islander - Round((Rel.POPPCT00 / 100) * (C2k.Asian_Pacific_Islander), 0)) END AS Asian_Pacific_Islander_PopChange,

ACS.POP_ZVHHS AS POP_ZVHHS_ACS2014,
 
CASE WHEN rel.PART00 = 'W' THEN (ACS.POP_ZVHHS - (C2k.POP_ZVHHS)) 
WHEN (rel.PART00 = 'P' AND rel.POPPCT00 = 0) 
THEN (ACS.POP_ZVHHS - (C2k.POP_ZVHHS)) 
ELSE (ACS.POP_ZVHHS - Round((Rel.POPPCT00 / 100) * (C2k.POP_ZVHHS), 0)) END AS POP_ZVHHS_Change,

ACS.POP_LEP AS POP_LEP_ACS2014,
 
CASE WHEN rel.PART00 = 'W' THEN (ACS.POP_LEP - (C2k.POP_LEP)) 
WHEN (rel.PART00 = 'P' AND rel.POPPCT00 = 0) 
THEN (ACS.POP_LEP - (C2k.POP_LEP)) 
ELSE (ACS.POP_LEP - Round((Rel.POPPCT00 / 100) * (C2k.POP_LEP), 0)) END AS POP_LEP_Change,

ACS.SPFAM AS SPFAM_ACS2014, 

CASE WHEN rel.PART00 = 'W' THEN (ACS.SPFAM - (C2k.SPFAM)) 
WHEN (rel.PART00 = 'P' AND rel.POPPCT00 = 0) 
THEN (ACS.SPFAM - (C2k.SPFAM)) 
ELSE (ACS.SPFAM - Round((Rel.POPPCT00 / 100) * (C2k.SPFAM), 0)) END AS SPFAM_Change,

ACS.POP_HUS_RENT50 AS POP_HUS_RENT50_ACS2014, 

CASE WHEN rel.PART00 = 'W' THEN (ACS.POP_HUS_RENT50 - (C2k.POP_HUS_RENT50)) 
WHEN (rel.PART00 = 'P' AND rel.POPPCT00 = 0) 
THEN (ACS.POP_HUS_RENT50 - (C2k.POP_HUS_RENT50)) 
ELSE (ACS.POP_HUS_RENT50 - Round((Rel.POPPCT00 / 100) * (C2k.POP_HUS_RENT50), 0)) END AS POP_HUS_RENT50_Change,

ACS.PopAge65plus AS Pop65plus_ACS2014, 

CASE WHEN rel.PART00 = 'W' OR (rel.PART00 = 'P' AND rel.POPPCT00 = 0) 
THEN (ACS.PopAge65plus - C2k.Pop65plus) 
ELSE (ACS.PopAge65plus - Round((Rel.POPPCT00 / 100) * C2K.Pop65plus, 0)) END AS Pop65PlusChange, 

ACS.Age65plusSOT, 

ACS.Veterans AS Veterans_ACS2014, 

CASE WHEN rel.PART00 = 'W' OR (rel.PART00 = 'P' AND rel.POPPCT00 = 0) 
THEN (ACS.Veterans - C2k.Veterans) 
ELSE (ACS.Veterans - Round((Rel.POPPCT00 / 100) * C2K.Veterans, 0)) END AS VeteransChange, 

ACS.VeteransSOT,

ACS.LowIncomePop AS LowIncomePop_ACS2014, 

CASE WHEN rel.PART00 = 'W' OR (rel.PART00 = 'P' AND rel.POPPCT00 = 0) 
THEN (ACS.LowIncomePop - C2k.LowIncomePopulation) 
ELSE (ACS.LowIncomePop - Round((Rel.POPPCT00 / 100) * C2K.LowIncomePopulation, 0)) 
END AS LowIncomePopChange, 

ACS.LowIncPopSOT, 

ACS.DisabledPop AS DisabledPop_ACS2014, 

CASE WHEN rel.PART00 = 'W' OR (rel.PART00 = 'P' AND rel.POPPCT00 = 0) 
THEN (ACS.DisabledPop - C2k.DisabledPop) 
ELSE (ACS.DisabledPop - Round((Rel.POPPCT00 / 100) * C2K.DisabledPop, 0)) END AS DisabledPopChange,
 
ACS.DisabledPopSOT,

ACS.MinorityPopulation AS MinorityPopulation_ACS2014, 

CASE WHEN rel.PART00 = 'W' OR (rel.PART00 = 'P' AND rel.POPPCT00 = 0) 
THEN (ACS.MinorityPopulation - C2k.Minority_Population) 
ELSE (ACS.MinorityPopulation - Round((Rel.POPPCT00 / 100) * C2K.Minority_Population, 0)) END AS MinorityPopChange, 

ACS.MinorityPopSOT

FROM            
ACS_2014_EJ_Selected_Variables AS ACS INNER JOIN
Census_Tract_Relationship_Correspondence AS rel ON ACS.GEOID = rel.GEOID10 LEFT OUTER JOIN
Census2000_EJ_SelectedVariables_Revised AS C2K ON rel.GEOID00 = C2K.GEOID
WHERE        (ACS.GEOID IS NOT NULL)
Go
select 
--GEOID00,
GEOID10, 
count(GEOID10) as Total_Tracts
From Census_Tract_Relationship_Correspondence
Group By 
--GEOID00, 
GEOID10
Go
--Create Summary view by 2010 Geography
create view Analysis.EJ_Select_Variables_ACS2014_Census2000_Compare_Revised as
SELECT        
GEOID, 
county, 
TotalPop_ACS2014,
TotalWhitePop_ACS2014,
SUM(White_Alone_PopChange) as WhitePopChange,
TotalBlackPop_ACS2014,
SUM(Black_Alone_PopChange) as BlackPopChange,
Total_Hispanic_Latino_Pop_ACS2014,
SUM(Hispanic_Latino_PopChange) as Hispanic_LatinoPopChange,
TotalAsian_Pacific_IslanderPop_ACS2014,
SUM(Asian_Pacific_Islander_PopChange) as Asian_Pacific_IslanderPopChange,
SUM(PopChange) AS PopChange, 
Pop65plus_ACS2014, 
SUM(Pop65PlusChange) AS Pop65PlusChange, 
Age65plusSOT, 
Veterans_ACS2014, 
SUM(VeteransChange) AS VeteransChange, 
VeteransSOT, 
LowIncomePop_ACS2014, 
SUM(LowIncomePopChange) AS LowIncomePopChange, 
LowIncPopSOT, 
DisabledPop_ACS2014, 
SUM(DisabledPopChange) AS DisabledPopChange, 
DisabledPopSOT,
MinorityPopulation_ACS2014, 
SUM(MinorityPopChange) AS MinorityPopChange, 
MinorityPopSOT,
--Add Missing Vars here
--[POP_ZVHHS_Change], [POP_LEP_ACS2014],[POP_LEP_Change], [SPFAM_ACS2014], [SPFAM_Change], [POP_HUS_RENT50_ACS2014], [POP_HUS_RENT50_Change]
POP_ZVHHS_ACS2014, 
SUM(POP_ZVHHS_Change) AS POP_ZVHHS_Change, 
POP_LEP_ACS2014, 
SUM(POP_LEP_Change) AS POP_LEP_Change,
SPFAM_ACS2014, 
SUM(SPFAM_Change) AS SPFAM_Change,
POP_HUS_RENT50_ACS2014, 
SUM(POP_HUS_RENT50_Change) AS POP_HUS_RENT50_Change
FROM            Census2K_ACS2014_EJ_Select_Variables_Compare_Detail
GROUP BY GEOID, county, TotalPop_ACS2014, TotalWhitePop_ACS2014, TotalBlackPop_ACS2014, Total_Hispanic_Latino_Pop_ACS2014, TotalAsian_Pacific_IslanderPop_ACS2014, Pop65plus_ACS2014, Age65plusSOT, Veterans_ACS2014, VeteransSOT, LowIncomePop_ACS2014, LowIncPopSOT, DisabledPop_ACS2014, POP_ZVHHS_ACS2014,POP_LEP_ACS2014,SPFAM_ACS2014,POP_HUS_RENT50_ACS2014,DisabledPopSOT,MinorityPopulation_ACS2014,MinorityPopSOT
Go

select geoid, count(geoid) as [Tract Parts]
from Census2K_ACS2014_EJ_Select_Variables_Compare_Detail
Group By geoid
Go
--Create Table with key attributes for export to FGDB
SELECT        
b.OBJECTID, 
a.GEOID, 
a.county, 
a.TotalPop_ACS2014, 
Case When a.TotalPop_ACS2014 - a.PopChange<0 Then 0 Else a.TotalPop_ACS2014 - a.PopChange END  AS Pop_2000, 
CASE When (a.TotalPop_ACS2014 - a.PopChange)<0 Then a.TotalPop_ACS2014 
Else a.PopChange END as PopChange, 
CASE 
WHEN a.PopChange < 0 AND a.TotalPop_ACS2014 = 0 THEN -100
WHEN a.TotalPop_ACS2014 > 0 AND (a.TotalPop_ACS2014 - a.PopChange)>0 THEN ((a.PopChange) / (a.TotalPop_ACS2014 - a.PopChange ))*100 
WHEN a.PopChange = 0 THEN 0 
ELSE 100 END AS TotalPopPctChange,  

a.TotalWhitePop_ACS2014 as White_Alone_2014, 
Case When a.TotalWhitePop_ACS2014 - a.WhitePopChange<0 Then 0 Else a.TotalWhitePop_ACS2014 - a.WhitePopChange END  AS White_Alone_2000,
CASE When (a.TotalWhitePop_ACS2014 - a.WhitePopChange)<0 Then a.TotalWhitePop_ACS2014 
Else a.WhitePopChange END as WhitePopChange, 
CASE 
WHEN a.WhitePopChange < 0 AND a.TotalWhitePop_ACS2014 = 0 THEN -100
WHEN a.TotalWhitePop_ACS2014 > 0 AND (a.TotalWhitePop_ACS2014 - a.WhitePopChange)>0 THEN ((a.WhitePopChange) / (a.TotalWhitePop_ACS2014 - a.WhitePopChange ))*100 
WHEN a.WhitePopChange = 0 THEN 0 
ELSE 100 END AS WhiteAlonePopPctChange,  

a.TotalBlackPop_ACS2014 as Black_Alone_2014, 
Case When a.TotalBlackPop_ACS2014 - a.BlackPopChange<0 Then 0 Else a.TotalBlackPop_ACS2014 - a.BlackPopChange END  AS Black_Alone_2000,
CASE When (a.TotalBlackPop_ACS2014 - a.BlackPopChange)<0 Then a.TotalBlackPop_ACS2014 
Else a.BlackPopChange END as BlackPopChange, 
CASE 
WHEN a.BlackPopChange < 0 AND a.TotalBlackPop_ACS2014 = 0 THEN -100
WHEN a.TotalBlackPop_ACS2014 > 0 AND (a.TotalBlackPop_ACS2014 - a.BlackPopChange)>0 THEN ((a.BlackPopChange) / (a.TotalBlackPop_ACS2014 - a.BlackPopChange ))*100 
WHEN a.BlackPopChange = 0 THEN 0 
ELSE 100 END AS BlackAlonePopPctChange,  

a.Total_Hispanic_Latino_Pop_ACS2014 as Hispanic_Alone_2014, 
Case When a.Total_Hispanic_Latino_Pop_ACS2014 - a.Hispanic_LatinoPopChange<0 Then 0 Else a.Total_Hispanic_Latino_Pop_ACS2014 - a.Hispanic_LatinoPopChange END  AS Hispanic_Alone_2000,
CASE When (a.Total_Hispanic_Latino_Pop_ACS2014 - a.Hispanic_LatinoPopChange)<0 Then a.Total_Hispanic_Latino_Pop_ACS2014 
Else a.Hispanic_LatinoPopChange END as Hispanic_LatinoPopChange, 
CASE 
WHEN a.Hispanic_LatinoPopChange < 0 AND a.Total_Hispanic_Latino_Pop_ACS2014 = 0 THEN -100
WHEN a.Total_Hispanic_Latino_Pop_ACS2014 > 0 AND (a.Total_Hispanic_Latino_Pop_ACS2014 - a.Hispanic_LatinoPopChange)>0 THEN ((a.Hispanic_LatinoPopChange) / (a.Total_Hispanic_Latino_Pop_ACS2014 - a.Hispanic_LatinoPopChange ))*100 
WHEN a.Hispanic_LatinoPopChange = 0 THEN 0 
ELSE 100 END AS HispanicLatinoPopPctChange,

a.TotalAsian_Pacific_IslanderPop_ACS2014 as Asian_Pacific_Islander_2014, 
Case When a.TotalAsian_Pacific_IslanderPop_ACS2014 - a.Asian_Pacific_IslanderPopChange<0 Then 0 Else a.TotalAsian_Pacific_IslanderPop_ACS2014 - a.Asian_Pacific_IslanderPopChange END  AS Asian_Pacific_Islander_2000,
CASE When (a.TotalAsian_Pacific_IslanderPop_ACS2014 - a.Asian_Pacific_IslanderPopChange)<0 Then a.TotalAsian_Pacific_IslanderPop_ACS2014 
Else a.Asian_Pacific_IslanderPopChange END as Asian_Pacific_IslanderPopChange, 
CASE 
WHEN a.Asian_Pacific_IslanderPopChange < 0 AND a.TotalAsian_Pacific_IslanderPop_ACS2014 = 0 THEN -100
WHEN a.TotalAsian_Pacific_IslanderPop_ACS2014 > 0 AND (a.TotalAsian_Pacific_IslanderPop_ACS2014 - a.Asian_Pacific_IslanderPopChange)>0 THEN ((a.Asian_Pacific_IslanderPopChange) / (a.TotalAsian_Pacific_IslanderPop_ACS2014 - a.Asian_Pacific_IslanderPopChange ))*100 
WHEN a.Asian_Pacific_IslanderPopChange = 0 THEN 0 
ELSE 100 END AS AsianPacificPopPctChange,

a.POP_ZVHHS_ACS2014 as POP_ZVHHS_ACS2014, 
Case When a.POP_ZVHHS_ACS2014 - a.POP_ZVHHS_Change<0 Then 0 Else a.POP_ZVHHS_ACS2014 - a.POP_ZVHHS_Change END  AS POP_ZVHHS_2000,
CASE When (a.POP_ZVHHS_ACS2014 - a.POP_ZVHHS_Change)<0 Then a.POP_ZVHHS_ACS2014 
Else a.POP_ZVHHS_Change END as POP_ZVHHS_Change, 
CASE 
WHEN a.POP_ZVHHS_Change < 0 AND a.POP_ZVHHS_ACS2014 = 0 THEN -100
WHEN a.POP_ZVHHS_ACS2014 > 0 AND (a.POP_ZVHHS_ACS2014 - a.POP_ZVHHS_Change)>0 THEN ((a.POP_ZVHHS_Change) / (a.POP_ZVHHS_ACS2014 - a.POP_ZVHHS_Change))*100 
WHEN a.POP_ZVHHS_Change = 0 THEN 0 
ELSE 100 END AS POP_ZVHHS_PctChange,

a.POP_LEP_ACS2014 as POP_LEP_ACS2014, 
Case When a.POP_LEP_ACS2014 - a.POP_LEP_Change<0 Then 0 Else a.POP_LEP_ACS2014 - a.POP_LEP_Change END  AS POP_LEP_2000,
CASE When (a.POP_LEP_ACS2014 - a.POP_LEP_Change)<0 Then a.POP_LEP_ACS2014 
Else a.POP_LEP_Change END as POP_LEP_Change, 
CASE 
WHEN a.POP_LEP_Change < 0 AND a.POP_LEP_ACS2014 = 0 THEN -100
WHEN a.POP_LEP_ACS2014 > 0 AND (a.POP_LEP_ACS2014 - a.POP_LEP_Change)>0 THEN ((a.POP_LEP_Change) / (a.POP_LEP_ACS2014 - a.POP_LEP_Change))*100 
WHEN a.POP_LEP_Change = 0 THEN 0 
ELSE 100 END AS POP_LEP_PctChange,

a.SPFAM_ACS2014 as SPFAM_ACS2014, 
Case When a.SPFAM_ACS2014 - a.SPFAM_Change<0 Then 0 Else a.SPFAM_ACS2014 - a.SPFAM_Change END  AS SPFAM_2000,
CASE When (a.SPFAM_ACS2014 - a.SPFAM_Change)<0 Then a.SPFAM_ACS2014 
Else a.SPFAM_Change END as SPFAM_Change, 
CASE 
WHEN a.SPFAM_Change < 0 AND a.SPFAM_ACS2014 = 0 THEN -100
WHEN a.SPFAM_ACS2014 > 0 AND (a.SPFAM_ACS2014 - a.SPFAM_Change)>0 THEN ((a.SPFAM_Change) / (a.SPFAM_ACS2014 - a.SPFAM_Change))*100 
WHEN a.SPFAM_Change = 0 THEN 0 
ELSE 100 END AS SPFAM_PctChange,

a.POP_HUS_RENT50_ACS2014 as POP_HUS_RENT50_ACS2014, 
Case When a.POP_HUS_RENT50_ACS2014 - a.POP_HUS_RENT50_Change<0 Then 0 Else a.POP_HUS_RENT50_ACS2014 - a.POP_HUS_RENT50_Change END  AS POP_HUS_RENT50_2000,
CASE When (a.POP_HUS_RENT50_ACS2014 - a.POP_HUS_RENT50_Change)<0 Then a.POP_HUS_RENT50_ACS2014 
Else a.POP_HUS_RENT50_Change END as POP_HUS_RENT50_Change, 
CASE 
WHEN a.POP_HUS_RENT50_Change < 0 AND a.POP_HUS_RENT50_ACS2014 = 0 THEN -100
WHEN a.POP_HUS_RENT50_ACS2014 > 0 AND (a.POP_HUS_RENT50_ACS2014 - a.POP_HUS_RENT50_Change)>0 THEN ((a.POP_HUS_RENT50_Change) / (a.POP_HUS_RENT50_ACS2014 - a.POP_HUS_RENT50_Change))*100 
WHEN a.POP_HUS_RENT50_Change = 0 THEN 0 
ELSE 100 END AS RENT50_PctChange,

a.Pop65plus_ACS2014, 
Case When a.Pop65plus_ACS2014 - a.Pop65PlusChange<0 Then 0 Else a.Pop65plus_ACS2014 - a.Pop65PlusChange END  AS Pop65plus_2000, 
CASE When (a.Pop65plus_ACS2014 - a.Pop65PlusChange)<0 Then a.Pop65plus_ACS2014 Else a.Pop65PlusChange END as Pop65PlusChange,
CASE 
WHEN a.Pop65PlusChange < 0 AND a.Pop65plus_ACS2014 = 0 THEN -100
WHEN a.Pop65plus_ACS2014 > 0 AND (a.Pop65plus_ACS2014 - a.Pop65PlusChange)>0 THEN ((a.Pop65PlusChange) / (a.Pop65plus_ACS2014 - a.Pop65PlusChange))*100 
WHEN a.Pop65PlusChange = 0 THEN 0 
ELSE 100 END AS Pop65PlusPctChange,
a.Age65plusSOT, 
 
a.Veterans_ACS2014, 
Case When a.Veterans_ACS2014 - a.VeteransChange<0 Then 0 Else a.Veterans_ACS2014 - a.VeteransChange END  AS Veterans_2000, 
CASE When (a.Veterans_ACS2014 - a.VeteransChange)<0 Then a.Veterans_ACS2014 Else a.VeteransChange END as VeteransChange,
CASE 
WHEN a.VeteransChange < 0 AND a.Veterans_ACS2014 = 0 THEN -100
WHEN a.Veterans_ACS2014 > 0 AND (a.Veterans_ACS2014 - a.VeteransChange)>0 THEN ((a.VeteransChange) / (a.Veterans_ACS2014 - a.VeteransChange))*100 
WHEN a.VeteransChange = 0 THEN 0 
ELSE 100 END AS VeteransPopPctChange,
a.VeteransSOT,

a.LowIncomePop_ACS2014, 
Case When a.LowIncomePop_ACS2014 - a.LowIncomePopChange<0 Then 0 Else a.LowIncomePop_ACS2014 - a.LowIncomePopChange END  AS LowIncomePop_2000, 
CASE When (a.LowIncomePop_ACS2014 - a.LowIncomePopChange)<0 Then a.LowIncomePop_ACS2014 Else a.LowIncomePopChange END as LowIncomePopChange,
CASE 
WHEN a.LowIncomePopChange < 0 AND a.LowIncomePop_ACS2014 = 0 THEN -100
WHEN a.LowIncomePop_ACS2014 > 0 AND (a.LowIncomePop_ACS2014 - a.LowIncomePopChange)>0 THEN ((a.LowIncomePopChange) / (a.LowIncomePop_ACS2014 - a.LowIncomePopChange))*100 
WHEN a.LowIncomePopChange = 0 THEN 0 
ELSE 100 END AS LowIncomePopPctChange,
a.LowIncPopSOT,

a.DisabledPop_ACS2014,
Case When a.DisabledPop_ACS2014 - a.DisabledPopChange<0 Then 0 Else a.DisabledPop_ACS2014 - a.DisabledPopChange END  AS DisabledPop_2000, 
CASE When (a.DisabledPop_ACS2014 - a.DisabledPopChange)<0 Then a.DisabledPop_ACS2014 Else a.DisabledPopChange END as DisabledPopChange,
CASE 
WHEN a.DisabledPopChange < 0 AND a.DisabledPop_ACS2014 = 0 THEN -100
WHEN a.DisabledPop_ACS2014 > 0 AND (a.DisabledPop_ACS2014 - a.DisabledPopChange)>0 THEN ((a.DisabledPopChange) / (a.DisabledPop_ACS2014 - a.DisabledPopChange))*100 
WHEN a.DisabledPopChange = 0 THEN 0 
ELSE 100 END AS DisabledPopPctChange,
a.DisabledPopSOT, 

a.MinorityPopulation_ACS2014,
Case When a.MinorityPopulation_ACS2014 - a.MinorityPopChange<0 Then 0 Else a.MinorityPopulation_ACS2014 - a.MinorityPopChange END  AS MinorityPop_2000, 
CASE When (a.MinorityPopulation_ACS2014 - a.MinorityPopChange)<0 Then a.MinorityPopulation_ACS2014 Else a.MinorityPopChange END as MinorityPopChange,
CASE 
WHEN a.MinorityPopChange < 0 AND a.MinorityPopulation_ACS2014 = 0 THEN -100
WHEN a.MinorityPopulation_ACS2014 > 0 AND (a.MinorityPopulation_ACS2014 - a.MinorityPopChange)>0 THEN ((a.MinorityPopChange) / (a.MinorityPopulation_ACS2014 - a.MinorityPopChange))*100 
WHEN a.MinorityPopChange = 0 THEN 0 
ELSE 100 END AS MinorityPopPctChange,
a.MinorityPopSOT, 
b.COCFLAG_2017,
b.PDA_Flag,
b.PDA_Share,
b.HDI_Flag,
b.HOA_Flag,
b.TPA_Flag,
b.TPA_Share,
b.OpportunityArea_Class,
b.Opportunity_Flag,
b.Walkability_Mean_06,
b.AMI_80,
b.Employment_Density_2010,

b.SHAPE
--INTO EJ_Select_Variables_ACS2014_Census2000_Compare_Update_v2
FROM            
EJ_Select_Variables_ACS2014_Census2000_Compare_Revised AS a INNER JOIN ACS_2014_ALL_COC_DATA_TRACTS AS b ON a.GEOID = b.GEOID
--Where a.POP_ZVHHS_ACS2014 > 0
--Drop Table Analysis.EJ_Select_Variables_ACS2014_Census2000_Compare_Update_v2

Select *
FROM     
Analysis.EJ_Select_Variables_ACS2014_Census2000_Compare_Update_v2


SELECT        t.OBJECTID, a.tract, a.B01003_001E AS TotalPopulation, 
                         a.B17026_002E + a.B17026_003E + a.B17026_004E + a.B17026_005E + a.B17026_006E + a.B17026_007E + a.B17026_008E + a.B17026_009E AS Low_Income_Population, 
                         CASE WHEN [B01003_001E] > 0 THEN ([B17026_002E] + [B17026_003E] + [B17026_004E] + [B17026_005E] + [B17026_006E] + [B17026_007E] + [B17026_008E] + [B17026_009E]) 
                         / [B01003_001E] ELSE 0 END AS Low_IncomePopSOT, b.Minority_Population, b.MinoritySOT, t.Shape
FROM            ACS_2009_EJ_SELECTED_VARS AS a INNER JOIN
                         ACS2009_ETHNICITY AS b ON a.tract = b.tract INNER JOIN
                         BAYTRACTS_URBANIZED_2000 AS t ON b.tract = t.TRACT
Go
select * From Analysis.ACS2009_EJ_Selected_Variables Order By OBJECTID
Go
create view Analysis.ACS2009_EJ_Selected_Variables as
SELECT        TOP (2000) b.OBJECTID, a.county, b.UANAME AS Urbanized_Area_Name, a.tract, a.GEOID, a.TotalPopulation, a.Minority_Population, a.MinoritySOT, a.B17026_001E AS Poverty_TotalPopulation, 
                         a.LowIncome_Population, a.LowIncomeSOT, b.Shape
FROM            ACS2009_LI_MINORITY_DATA AS a INNER JOIN
                         BAYTRACTS_URBANIZED_2000 AS b ON a.tract = b.TRACT
ORDER BY a.MinoritySOT --a.county, a.tract
Go

--Selected Ethnicity and Income Data from ACS 2005 thru 2009 API
--http://api.census.gov/data/2009/acs5?key=5fbaa5725148859f644e88cd2c738b394616a684&NAME&for=tract:*&in=state:06+county:001,013,041,055,075,081,085,095,097&get=B01003_001E,B02001_002E,B02001_003E,B02001_004E,B02001_005E,B02001_006E,B02001_007E,B02001_008E,B02001_009E,B02001_010E,B17026_002E,B17026_003E,B17026_004E,B17026_005E,B17026_006E,B17026_007E,B17026_008E,B17026_009E





