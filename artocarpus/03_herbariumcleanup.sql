###############################################################################
#looks like I''ll be normalizing out the herbarium data, too 

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

ALTER TABLE herbarium            
   ADD COLUMN herbKEY int(6) AUTO_INCREMENT NOT NULL FIRST,
   ADD PRIMARY KEY(herbKEY);

#now remove the old data from collectiondata
ALTER TABLE collectiondata
	DROP COLUMN Genus,
	DROP COLUMN Species,
	DROP COLUMN SpeciesAuthority,
	DROP COLUMN SubspVar,
	DROP COLUMN SubspeciesAuthority,
	DROP COLUMN DeterminedBy,
	DROP COLUMN HerbariumCollection,
	DROP COLUMN Collector,
	DROP COLUMN CollectionNumber,
	DROP COLUMN Vernacular,
	DROP COLUMN CollectionDate,
	DROP COLUMN CollectionDateGood,
	DROP COLUMN VoucherLocations,
	DROP COLUMN SheetScanNumber,
	DROP COLUMN AcessionNumber,
	DROP COLUMN PlantDescription,
	DROP COLUMN Reproductive,
	DROP COLUMN Type,
	DROP COLUMN LocationInfo,
	DROP COLUMN Habitat,
	DROP COLUMN Image_location;

#naturally, i missed a few columns. fixed 2012 dec 17
ALTER TABLE herbarium
    ADD COLUMN StateDepProv VARCHAR(500), 
    ADD COLUMN Country VARCHAR(500),
    ADD COLUMN Notes VARCHAR(5000);

UPDATE herbarium t2, collectiondata t1
    set t2.StateDepProv = t1.StateDepProv;
UPDATE herbarium t2, collectiondata t1
    set t2.Country = t1.Country;
UPDATE herbarium t2, collectiondata t1
    set t2.Notes = t1.Notes;

ALTER TABLE collectiondata
    DROP COLUMN StateDepProv,
    DROP COLUMN Country,
    DROP COLUMN Notes;

#elevation data turns out to be herbarium data, not geospatial. sigh.
ALTER TABLE herbarium
    ADD COLUMN Elevation VARCHAR(500);

UPDATE herbarium t2, geospatial t1
    set t2.Elevation = t1.Elevation;

ALTER TABLE geospatial
    DROP COLUMN Elevation;
