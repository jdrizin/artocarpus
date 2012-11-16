# dump out the annotation table to a csv. i had to do this as root for some
# reason, even if my user should have the right grants.
SELECT * 
	INTO OUTFILE '/home/josh/csvs/annotationfix.csv'
	FIELDS TERMINATED BY ','
	ENCLOSED BY '"'
	ESCAPED BY '\\'
	LINES TERMINATED BY '\n'
	FROM annotations;

#some shell code to split the csv fields
#cat annotationfix.csv | sed 's/\ /\",\"/2' > annotationsplit.csv
#tac annotationsplit.csv|sed 's/\ /\",\"/1' |tac> annotationdone.csv

#drop the old table
DROP TABLE annotations;
#create a new table for this data
CREATE TABLE annotations (annotationID INT(6), Genus VARCHAR(50),
								Species VARCHAR(50), Annotation VARCHAR(5000), AnnoDate
								VARCHAR(25))
	ENGINE=Innodb;

#insert the new data
LOAD DATA LOCAL INFILE '/home/josh/csvs/annotationdone.csv'
	into table annotations fields terminated by ','
	enclosed by '"' lines terminated by '\n';

#set the foreign key
#add the foreign key to annotations
ALTER TABLE annotations
ADD fk_annotations_collection_ID INT(6);

UPDATE annotations
SET fk_annotations_collection_ID=AnnotationID;

ALTER TABLE annotations
ADD FOREIGN KEY (fk_annotations_collection_ID)
REFERENCES collectiondata(ID);
