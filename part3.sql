SELECT 	date,
		AVG(max_temperature_f) as max_temperature_f,
        AVG(min_temperature_f) as min_temperature_f,
		AVG(max_humidity)  as max_humidity,
        AVG(min_humidity) as min_humidity,
        AVG(max_sea_level_pressure_inches) as max_sea_level_pressure_inches,
        AVG(min_sea_level_pressure_inches) as min_sea_level_pressure_inches,
		AVG(max_visibility_miles) as max_visibility_miles,
        AVG(min_visibility_miles) as min_visibility_miles,
        AVG(max_wind_Speed_mph) as max_wind_Speed_mph,
        AVG(precipitation_inches) as precipitation_inches,
        events,
        AVG(wind_dir_degrees)    as wind_dir_degrees,
        zip_code
FROM weather
GROUP BY date
ORDER BY DATE
limit 10;

select * from weather;

# mean
SELECT 	AVG(max_temperature_f) as mean,
		MIN(max_temperature_f) as range_LL,
		MAX(max_temperature_f) AS range_UL, 
        COUNT(max_temperature_f) AS count,
		variance(max_temperature_f) as varience
FROM weather;

# MEDIAN
SET @row_index := -1;
SELECT AVG(subq.max_temperature_f) as median_value
FROM (
    SELECT @row_index:=@row_index + 1 AS row_index, max_temperature_f
    FROM weather
    ORDER BY max_temperature_f
  ) AS subq
  WHERE subq.row_index 
  IN (FLOOR(@row_index / 2) , CEIL(@row_index / 2));
  
#mode
  SELECT mode1, occurance_times
FROM (SELECT max_temperature_f as mode1,count(*) as occurance_times
      FROM weather
      GROUP BY max_temperature_f
      LIMIT 1
     ) T1
     