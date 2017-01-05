SELECT        Count(GEOID) as [Total Tracts], SUM(Pop_2000) AS [Total Population]
FROM            [EJ_2016].year_2000_2010_change

SELECT        Count(GEOID) as [Total Tracts], SUM([TotalPop_ACS2014]) AS [Total Population]
From [EJ_2016].year_2000_2010_change

SELECT       Count(GEOID) as [Total Tracts], SUM([TotalPopulation]) AS [Total Population]
FROM            [EJ_2016].year_2000_tract_data

SELECT        Count(TRACTS) as [Total Tracts],SUM([TotalCommuters]) AS [Total Population]
FROM            [EJ_2016].year_2010_commuter_data

SELECT        Count(GEOID) as [Total Tracts], SUM([TotalPopulation]) AS [Total Population]
From [EJ_2016].year_2010_tract_data