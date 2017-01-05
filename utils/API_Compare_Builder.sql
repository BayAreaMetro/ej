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

