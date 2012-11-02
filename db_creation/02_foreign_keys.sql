#start setting up foreign keys and inputting the data
#for now, the database is remaining fairly un-normalized until I get some of the sequence
#data to start incorporating that into their own tables

#the main table is collectiondata, the primary key should be ID
ALTER TABLE collectiondata
ADD PRIMARY KEY (ID)
MODIFY COLUMN ID INT AUTO_INCREMENT PRIMARY KEY
;

#add the foreign key to the geneticproject table
ALTER TABLE geneticproject
ADD FOREIGN KEY (fk_genetic_collection_ID)
REFERENCES collectiondata(ID)
;

#add it to annotations
ALTER TABLE annotations
ADD FOREIGN KEY (fk_annotations_collection_ID)
REFERENCES collectiondata(ID)
;

