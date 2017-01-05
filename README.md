# ej
SQL queries for MTC's Environmental Justice Data and Maps

###main query files:

EJ_SELECT_VARIABLES_C2000_ACS2014_COMPARE_DEC28   
update_select_change_vars.sql  
year_2000_2010_change_DEC30UPD  

###folders: 

`map_tables/` contains deprecated table creation scripts for the first round of maps  

the following were used in a previous iteration of the output summary tables. now that it is clear that the user is strictly interested in using the tables to compare individual census tracts and to make comparisons, @joshuacroft simplified the output to one table as found in the root directory   

```
deprecated/CREATE_2000_2010_CHANGE_TABLE.sql  
deprecated/CREATE_2000_TABLE.sql  
deprecated/CREATE_2010_COMMUTER_TABLE.sql  
deprecated/CREATE_2010_TABLE.sql  
deprecated/Compare_2000_2014_Census_EJ_Key_Variables.sql
```

these are utilities that can be used to check on the outputs or build new api calls:  

```
utils/API_Compare_Builder.sql  
utils/check_population_summary.sql  
utils/ZeroVehicleHHs.sql  
```