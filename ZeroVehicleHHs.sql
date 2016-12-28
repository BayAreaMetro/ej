SELECT 
zvhh.OBJECTID, 
zvhh.GEOID, 
zvhh.county, 
zvhh.tract, 
zvhh.B25044_001E as TotalHHs_ACS2014, 
zvhh.B25044_003E + zvhh.B25044_010E as TotalZVHHs_ACS2014,
Case When zvhh.B25044_001E + zvhh.B25044_009E = 0 Then 0 Else Cast((Cast(zvhh.B25044_003E + zvhh.B25044_010E as numeric(18,2)))/(Cast(zvhh.B25044_001E + zvhh.B25044_009E as numeric(18,2))) as numeric(18,3)) End as ZVHHSOT,
t.shape  
FROM     EJ_2016.ACS5_2014_ZEROVEHICLEHHS as zvhh Left Outer Join
EJ_2016.BayArea_Tracts_2010 as t ON zvhh.GEOID = t.GEOID
where t.shape is not null and tract not in ('990100')
Order by county,tract

SELECT 
zvhh.OBJECTID, 
zvhh.GEOID, 
zvhh.county, 
zvhh.tract, 
zvhh.H044001 as TotalHHs_C2K,  
zvhh.H044003 + zvhh.H044010 as TotalZVHHs_C2K, 
t.Shape
FROM     
EJ_2016.CENSUS_2K_ZEROVEHICLEHHS AS zvhh LEFT OUTER JOIN
EJ_2016.BayArea_Tracts_2000 AS t ON zvhh.GEOID = t.GEOID
Order by county,tract

Go
create view EJ_2016.BayArea_CensusTracts_2010 as
SELECT OBJECTID, CountyFIP, GEOID, Shape.ToString() as Feature
FROM     Analysis.CA_TRACTS_2010
WHERE  (CountyFIP IN (1, 13, 41, 55, 75, 81, 85, 95, 97))
Go
create view EJ_2016.BayArea_CensusTracts_2000 as
SELECT OBJECTID, Cast(COUNTYFP00 as int) AS CountyFIP, GEOID, Shape.ToString() AS Feature
FROM     Analysis.BAYAREA_TRACTS_2000
Go



select OBJECTID, CTIDFP00 as GEOID, Shape From [Analysis].[TRACT_2000]

select OBJECTID, GEOID10, Shape From [Analysis].[TRACT10]


select * From [EJ_2016].[Census_ACS5_Compare]
select * From [Analysis].[CensusTractRelationshipFile]



SELECT [SF3_Table]
      ,[API_SF3]
      ,[SF3_Table_Title]
	  ,Case When API_SF3 is not null Then 'http://api.census.gov/data/2000/SF3?key=5fbaa5725148859f644e88cd2c738b394616a684&NAME&for=tract:*&in=state:06+county:001,013,041,055,075,081,085,095,097&get=' + API_SF3 else null end as API_SF3_URL
      ,[ACS5_Table]
      ,[ACS5_API]
      ,[Table_Comparibility]
      ,[Map_Series]
	  ,Case When ACS5_API is not null Then 'http://api.census.gov/data/2014/acs5?key=5fbaa5725148859f644e88cd2c738b394616a684&NAME&for=tract:*&in=state:06+county:001,013,041,055,075,081,085,095,097&get=' + ACS5_API else null end as API_ACS5_URL
  FROM [EJ_2016].[Census_ACS5_Compare]
  --Where ACS5_API Like 'B250%'





