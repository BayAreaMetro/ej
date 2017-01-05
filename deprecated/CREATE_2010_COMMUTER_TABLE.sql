CREATE VIEW EJ_2016.year_2010_commuter_data AS
SELECT CountyFip,
Tracts,
TotalCommuters,
EarlyMorning
ShareEM, 
TC_7_730am, 
ST_7_730am, 
ST_8_830am, 
TC_8_830am, 
TC_830_9am, 
ST_830_9am, 
TC_9_10am,
ST_9_10am
From EJ_2016.MegaregionCommuters
WHERE CountyFip in (1,13,41,55,75,81,85,95,97)
