SELECT DISTINCT zip_code, count(zip_code) from trip
GROUP BY zip_code
Order by count(zip_code) DESC;
/*
94041
94063
94107 w
94301 
95113
*/
SELECT * FROM trip;
truncate trip;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/trip.csv' 
INTO TABLE sfbikeshare.trip 
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
( id, duration, @start_date, start_station_name, start_station_id, @end_date, end_station_name, end_station_id, bike_id, subscription_type, @zip_code)
SET zip_code 		= NULLIF(@zip_code,''), #for null #94103-2585???do text and then scrape rest ALSO remove nil//ALSO remove v6z2x
	start_date		= STR_TO_DATE(@start_date,'%m/%d/%Y %H:%i'),
    end_date 		= STR_TO_DATE(@end_date,'%m/%d/%Y %H:%i');

UPDATE sfbikeshare.trip
SET zip_code = NULL
WHERE zip_code = 'nil' ;

SELECT * 
FROM trip 
WHERE zip_code REGEXP '[a-zA-Z]';
#used regular expression to find this non-numeric value

UPDATE sfbikeshare.trip
SET zip_code = NULL
WHERE zip_code REGEXP '[a-zA-Z]';

########################################################################
SELECT zip_code 
FROM trip
WHERE zip_code like "%-%";


UPDATE sfbikeshare.trip
SET zip_code = left(zip_code,LOCATE('-',zip_code) - 1);


SELECT DISTINCT zip_code
FROM trip;

########################################################################
ALTER TABLE trip
DROP COLUMN zipcode;



UPDATE sfbikeshare.trip
SET start_date = DATE(STR_TO_DATE(start_date, '%m/%d/%Y %H:%i:%s'))
WHERE DATE(STR_TO_DATE(start_date, '%m/%d/%Y %H:%i'));
