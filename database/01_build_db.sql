#database creation script

#create the database
CREATE DATABASE artocarpus;

# change the password before running
GRANT ALL ON artocarpus.* TO artoadmin IDENTIFIED BY 'PASSWORD'

#create the tables and add the data from the CSV files
CREATE TABLE collectiondata (ID INT(6),AnnotationID INT(6),GeneticID INT(6),
	MostRecentFamily VARCHAR(500),MostRecentGenus VARCHAR(500),
	MostRecentSpecies VARCHAR(500),QuestionedID VARCHAR(50),
	MostRecentAltID VARCHAR(5000), MostRecentIDNotes VARCHAR(5000),
	Genus VARCHAR(500),
	Species VARCHAR(500),SpeciesAuthority VARCHAR(500),
	SubspVar VARCHAR(500),SubspeciesAuthority VARCHAR(500),
	DeterminedBy VARCHAR(500),HerbariumCollection VARCHAR(500),
	Collector VARCHAR(500),CollectionNumber VARCHAR(500),
	Vernacular VARCHAR(500),Month VARCHAR(50),Day VARCHAR(50),
	Year VARCHAR(50),CollectionDate VARCHAR(500),
	VoucherLocations VARCHAR(500),SheetScanNumber VARCHAR(50),
	Image_location VARCHAR(500),AcessionNumber VARCHAR(500),
	PlantDescription VARCHAR(5000),Reproductive VARCHAR(500),
	Type VARCHAR(500),LocationInfo VARCHAR(5000),Habitat VARCHAR(5000),
	StateDepProv VARCHAR(500),Country VARCHAR(500),GPS VARCHAR(5000),
	Latitude VARCHAR(500),Longitude VARCHAR(500),Elevation VARCHAR(500),
	LatLongEstAccuracy VARCHAR(500),LatLongEstNotes VARCHAR(500),
	Notes VARCHAR(5000),Project VARCHAR(500))
	ENGINE=Innodb; 
load data local infile '/home/josh/csvs/collectiondata.txt' 
	into table collectiondata fields terminated by ',' 
	enclosed by '"' lines terminated by '\r\n';

CREATE TABLE geneticproject (GeneticProjectID INT(6),GeneticID INT(6),
	SampleTypeExtractedFrom VARCHAR(500),LeafTakenDNA VARCHAR(500),
	Extractor VARCHAR(500),ExtractionCode VARCHAR (500),
	ExtractionDate VARCHAR(500),ExtractionMethod VARCHAR(500))
	ENGINE=Innodb; 
load data local infile '/home/josh/csvs/geneticproject.txt' 
	into table geneticproject fields terminated by ',' 
	enclosed by '"' lines terminated by '\r\n';

CREATE TABLE colbydatasummary (ID INT (6),Value INT(6), Primer1 INT(6),
	Blue VARCHAR(30),Primer2 INT(5),Black VARCHAR(30),Primer3 INT(5),
	Green VARCHAR(30),Primer4 INT(5),AdditionalColor VARCHAR(500))
	ENGINE=Innodb; 
load data local infile '/home/josh/csvs/colbydatasummary.txt' 
	into table colbydatasummary fields terminated by ',' 
	enclosed by '"' lines terminated by '\r\n';

CREATE TABLE annotations (AnnotationID INT(6),Annotation VARCHAR(5000))
	ENGINE=Innodb; 
load data local infile '/home/josh/csvs/annotations.txt' 
	into table annotations fields terminated by ',' 
	enclosed by '"' lines terminated by '\r\n';

#################################################
#now for some light normalization
#normalize out the geospatial data
CREATE TABLE geospatial (geoID INT(6), GPS VARCHAR(5000),
	Latitude VARCHAR(500),Longitude VARCHAR(500),
   Elevation VARCHAR(500),LatLongEstAccuracy VARCHAR(500),
   LatLongEstNotes VARCHAR(500))
	ENGINE=Innodb; 

#insert the old data
INSERT INTO geospatial
	SELECT  ID, GPS, Latitude, Longitude, Elevation, 
	LatLongEstAccuracy, LatLongEstNotes
   FROM collectiondata;

ALTER TABLE geospatial
ADD fk_geospatial_collection_ID INT(6);

UPDATE geospatial
SET fk_geospatial_collection_ID=geoID;

ALTER TABLE geospatial
ADD FOREIGN KEY (fk_geospatial_collection_ID)
REFERENCES collectiondata(ID);

#now, remove that data from collectiondata so it isn't duplicated

#now remove the data from from collectiondata
ALTER TABLE collectiondata
DROP GPS,
DROP Latitude,
DROP Longitude,
DROP Elevation,
DROP LatLongEstAccuracy,
DROP LatLongEstNotes;

#oh, and of course they all need primary keys? according to xataface they
#should. guess i'll add them.

ALTER TABLE annotations
ADD COLUMN annotationKEY int(6) AUTO_INCREMENT NOT NULL FIRST,
ADD PRIMARY KEY(annotationKEY);

ALTER TABLE colbydatasummary
ADD COLUMN colbyKEY int(6) AUTO_INCREMENT NOT NULL FIRST,
ADD PRIMARY KEY(colbyKEY);

ALTER TABLE geneticproject
ADD COLUMN geneticKEY int(6) AUTO_INCREMENT NOT NULL FIRST,
ADD PRIMARY KEY(geneticKEY);

ALTER TABLE geospatial 
ADD COLUMN geospatialKEY int(6) AUTO_INCREMENT NOT NULL FIRST,
ADD PRIMARY KEY(geospatialKEY);





