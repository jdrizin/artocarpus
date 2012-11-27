###############################################################################
#looks like I'll be normalizing out the herbarium data, too 

# begin by building the new table
CREATE TABLE herbarium (herbID INT(6),
   HerbGenus VARCHAR(500), HerbSpecies VARCHAR(500),
   HerbSpeciesAuthority VARCHAR(500), HerbSubspVar VARCHAR(500),
   HerbSubspeciesAuthority VARCHAR(500),
   DeterminedBy VARCHAR(500), HerbariumCollection VARCHAR(500),
   Collector VARCHAR(500), CollectionNumber VARCHAR(500),
   Vernacular VARCHAR(500), CollectionDate VARCHAR(500),
   CollectionDateGood VARCHAR(15), VoucherLocations VARCHAR(500),
   SheetScanNumber VARCHAR(50), AccessionNumber VARCHAR(500),
   PlantDescription VARCHAR(5000), Reproductive VARCHAR(500),
   Type VARCHAR(500), LocationInfo VARCHAR(5000), Habitat VARCHAR(5000))
   ENGINE=Innodb;

#now we need a select query to fill in all of this data
INSERT INTO herbarium
	SELECT ID, Genus, Species, SpeciesAuthority, SubspVar, SubspeciesAuthority, 
	DeterminedBy, HerbariumCollection, Collector, CollectionNumber, Vernacular,
	CollectionDate, CollectionDateGood, VoucherLocations, SheetScanNumber,
	AcessionNumber, PlantDescription, Reproductive, Type, LocationInfo, 
	Habitat
	FROM collectiondata;

#now add the new columns
ALTER TABLE herbarium
   ADD OnLoan VARCHAR(10), 
   ADD DateLoanedOut VARCHAR(15),
   ADD DateReturned VARCHAR(15),
   ADD fk_herbarium_collection_ID INT(6);

#update the foreign key data
UPDATE herbarium
	set fk_herbarium_collection_ID = herbID;

ALTER TABLE herbarium
	ADD FOREIGN KEY (fk_herbarium_collection_ID)
	REFERENCES collectiondata(ID);
