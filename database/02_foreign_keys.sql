#start setting up foreign keys and inputting the data
#for now, the database is remaining fairly un-normalized until I get some of the sequence
#data to start incorporating that into their own tables

#########################################################################################
# begin altering the tables 

#the main table is collectiondata, the primary key should be ID
ALTER TABLE collectiondata
ADD PRIMARY KEY (ID);

#make it increment
ALTER TABLE collectiondata
MODIFY COLUMN ID INT(6) AUTO_INCREMENT;

#########################################################################################
# add new foreign keys 

#add the foreign key to the geneticproject table
ALTER TABLE geneticproject
ADD fk_genetic_collection_ID INT(6);

UPDATE geneticproject
SET fk_genetic_collection_ID=GeneticID;

ALTER TABLE geneticproject
ADD FOREIGN KEY (fk_genetic_collection_ID)
REFERENCES collectiondata(ID);

#add the foreign key to annotations
ALTER TABLE annotations
ADD fk_annotations_collection_ID INT(6);

UPDATE annotations
SET fk_annotations_collection_ID=AnnotationID;

ALTER TABLE annotations
ADD FOREIGN KEY (fk_annotations_collection_ID)
REFERENCES collectiondata(ID);

#add the foreign key to geospatial 
ALTER TABLE geospatial 
ADD fk_geospatial_collection_ID INT(6);

UPDATE geospatial
SET fk_geospatial_collection_ID=geoID;

ALTER TABLE geospatial
ADD FOREIGN KEY (fk_geospatial_collection_ID)
REFERENCES collectiondata(ID);

#don't add colby's data yet, as I don't think her IDs match the main database

