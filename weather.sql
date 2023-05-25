SELECT * FROM sfbikeshare.weather;
truncate weather;

ALTER TABLE weather
MODIFY COLUMN precipitation_inches TEXT;

#safe directory
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/weather.csv' 
INTO TABLE sfbikeshare.weather 
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@date,@max_temperature_f,@mean_temperature_f,@min_temperature_f,@max_dew_point_f,@mean_dew_point_f,@min_dew_point_f,@max_humidity,
@mean_humidity,@min_humidity,@max_sea_level_pressure_inches,@mean_sea_level_pressure_inches,@min_sea_level_pressure_inches,
@max_visibility_miles,@mean_visibility_miles,@min_visibility_miles,@max_wind_Speed_mph,@mean_wind_speed_mph,@max_gust_speed_mph,
@precipitation_inches,@cloud_cover,events,@wind_dir_degrees,@zip_code)
SET date 								= STR_TO_DATE(@date,'%m/%d/%Y'),
	max_gust_speed_mph 					= NULLIF(@max_gust_speed_mph,''),
	max_dew_point_f 					= NULLIF(@max_dew_point_f,''),
    mean_dew_point_f 					= NULLIF(@mean_dew_point_f,''),
    min_dew_point_f 					= NULLIF(@min_dew_point_f,''),
    max_humidity 						= NULLIF(@max_humidity,''),
    mean_humidity 						= NULLIF(@mean_humidity,''),
    min_humidity 						= NULLIF(@min_humidity,''),
	max_visibility_miles				= NULLIF(@max_visibility_miles,''),
	mean_visibility_miles				= NULLIF(@mean_visibility_miles,''),
	min_visibility_miles 				= NULLIF(@min_visibility_miles,''),
    max_temperature_f 					= NULLIF(@max_temperature_f,''),
    mean_temperature_f 					= NULLIF(@mean_temperature_f,''),
    min_temperature_f 					= NULLIF(@min_temperature_f,''),
    max_sea_level_pressure_inches 		= NULLIF(@max_sea_level_pressure_inches,''),
    mean_sea_level_pressure_inches 		= NULLIF(@mean_sea_level_pressure_inches,''),
    min_sea_level_pressure_inches 		= NULLIF(@min_sea_level_pressure_inches,''),
    max_wind_Speed_mph 					= NULLIF(@max_wind_Speed_mph,''),
    mean_wind_speed_mph 				= NULLIF(@mean_wind_speed_mph,''),
    precipitation_inches 				= NULLIF(@precipitation_inches,''), #show T in it
    wind_dir_degrees 					= NULLIF(@wind_dir_degrees,''),
    zip_code 							= NULLIF(@zip_code,'');

  
ALTER TABLE weather
DROP mean_dew_point_f;

ALTER TABLE weather
DROP mean_humidity;

ALTER TABLE weather
DROP mean_sea_level_pressure_inches;

ALTER TABLE weather
DROP mean_temperature_f;

ALTER TABLE weather
DROP mean_visibility_miles;

ALTER TABLE weather
DROP mean_wind_speed_mph;

ALTER TABLE weather
DROP min_dew_point_f;

ALTER TABLE weather
DROP max_dew_point_f;

ALTER TABLE weather
DROP max_gust_speed_mph;


ALTER TABLE weather
DROP cloud_cover;


SELECT * FROM weather;


ALTER TABLE weather
MODIFY COLUMN precipitation_inches INT;

UPDATE WEATHER
SET precipitation_inches = REPLACE(precipitation_inches,'T',0.001) ;

SELECT  DISTINCT zip_code, count(zip_code) FROM weather group by zip_code order by zip_code;


  
  