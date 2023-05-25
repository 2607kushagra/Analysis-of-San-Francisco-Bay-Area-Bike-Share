SELECT * FROM sfbikeshare.status
LIMIT 5;

truncate sfbikeshare.status;

#safe directory
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/status3.csv' 
INTO TABLE sfbikeshare.status	
FIELDS TERMINATED BY ',' 
#ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@station_id,@bikes_available,@docks_available,@time)
SET station_id 			= NULLIF(@station_id,''),
	bikes_available		= NULLIF(@bikes_available,''),
    docks_available 	= NULLIF(@docks_available,''),
    time 				= NULLIF(@time,'');
select * from status
Where time is NULL;
    
/*    
UPDATE sfbikeshare.status
SET time = DATE(STR_TO_DATE(time, '%Y/%m/%d %H:%i:%s'))
WHERE DATE(STR_TO_DATE(time, '%Y/%m/%d %H:%i:%s')) OR DATE(STR_TO_DATE(time, '%Y-%m-%d %H:%i:%s'));
    
UPDATE sfbikeshare.status
SET time = DATE(STR_TO_DATE(time, '%Y/%m/%d %H:%i:%s'))
WHERE DATE(STR_TO_DATE(time, '%Y/%m/%d %H:%i:%s')) OR DATE(STR_TO_DATE(time, '%Y-%m-%d %H:%i:%s'));    
*/

#On Mac Preferences -> SQL Editor -> Go to MySQL Session -> set connection read timeout interval to 0.
SELECT time 
from status
where time like "%-%";
# we can replace - with / and then change data type



