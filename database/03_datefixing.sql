#this script will alter the collectiondata table to insert the fixed date data

#create the new column
ALTER TABLE collectiondata
	ADD CollectionDateGood VARCHAR (25)
	AFTER CollectionDate;

#make a temporary table
CREATE TABLE temp_date (CollectionDateGood VARCHAR(25))
	ENGINE=memory;

#load the data; LOCAL is important
LOAD DATA LOCAL INFILE '/home/josh/csvs/fixeddate.txt'
	INTO TABLE temp_date
	LINES TERMINATED BY '\n';

#update the data in the table
UPDATE collectiondata t1, temp_date t2
set t1.CollectionDateGood=t2.CollectionDateGood;

#drop temp_date
DROP TABLE temp_date;
