# this will create a new table with the image data. it's currently in the form
# of ID, Filename (no file ending. sure hope they're all the same). the table
# will be the many to the collection one.

#create initial table
CREATE TABLE images (imageID INT(6), filename VARCHAR(500))
	ENGINE=InnoDB;

#load in data
LOAD DATA LOCAL INFILE '/home/josh/csvs/imagelocationfixed.csv'
	INTO TABLE images 
	FIELDS TERMINATED BY ','
	LINES TERMINATED BY '\n';

#add a primary key for the table
ALTER TABLE images 
	ADD COLUMN imagesKEY int(6) AUTO_INCREMENT NOT NULL FIRST,
	ADD PRIMARY KEY(imagesKEY);

#set up the foreign key
ALTER TABLE images
	ADD COLUMN fk_images_collection_ID INT(6);

UPDATE images
	SET fk_images_collection_ID = imageID;

ALTER TABLE images
   ADD FOREIGN KEY (fk_images_collection_ID)
   REFERENCES collectiondata(ID);
