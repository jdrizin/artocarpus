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
	Notes VARCHAR(5000),Project VARCHAR(500)); 
load data local infile '/home/josh/csvs/collectiondata.txt' 
	into table collectiondata fields terminated by ',' 
	enclosed by '"' lines terminated by '\r\n';

CREATE TABLE geneticproject (GeneticProjectID INT(6),GeneticID INT(6),
	SampleTypeExtractedFrom VARCHAR(500),LeafTakenDNA VARCHAR(500),
	Extractor VARCHAR(500),ExtractionCode VARCHAR (500),
	ExtractionDate VARCHAR(500),ExtractionMethod VARCHAR(500));
load data local infile '/home/josh/csvs/geneticproject.txt' 
	into table geneticproject fields terminated by ',' 
	enclosed by '"' lines terminated by '\r\n';

CREATE TABLE colbydatasummary (ID INT (6),Value INT(6), Primer1 INT(6),
	Blue VARCHAR(30),Primer2 INT(5),Black VARCHAR(30),Primer3 INT(5),
	Green VARCHAR(30),Primer4 INT(5),AdditionalColor VARCHAR(500));
load data local infile '/home/josh/csvs/colbydatasummary.txt' 
	into table colbydatasummary fields terminated by ',' 
	enclosed by '"' lines terminated by '\r\n';

CREATE TABLE annotations (AnnotationID INT(6),Annotation VARCHAR(5000));
load data local infile '/home/josh/csvs/annotations.txt' 
	into table annotations fields terminated by ',' 
	enclosed by '"' lines terminated by '\r\n';


