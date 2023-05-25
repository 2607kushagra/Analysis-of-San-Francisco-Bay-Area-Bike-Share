SELECT * FROM sfbikeshare.station ;
#truncate  sfbikeshare.station ;


SHOW GLOBAL VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = true;

#SAFE UPDATES to 0
SET SQL_SAFE_UPDATES = 0;

#safe directory
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/station.csv' 
INTO TABLE sfbikeshare.station 
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id,name,latitude,longitude,dock_count,city,@installation_date)
SET installation_date 		= STR_TO_DATE(@installation_date,'%m/%d/%Y');


SELECT * FROM sfbikeshare.station ;



#long lat to DECIMAL(10,6)

#Update date format
UPDATE sfbikeshare.station
SET installation_date = DATE(STR_TO_DATE(installation_date, '%m/%d/%Y'))
WHERE DATE(STR_TO_DATE(installation_date, '%m/%d/%Y')) <> '0000-00-00';
