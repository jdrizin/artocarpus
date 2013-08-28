ALTER TABLE collectiondata
	ADD COLUMN herbGenus VARCHAR(500),
	ADD COLUMN herbSpecies VARCHAR(500),
	ADD COLUMN herbSpeciesAuthority VARCHAR(500),
	ADD COLUMN herbSubspVar VARCHAR(500),
	ADD COLUMN herbSubspeciesAuthority VARCHAR(500),
	ADD COLUMN herbDeterminedBy VARCHAR(500),
	ADD COLUMN herbariumCollection VARCHAR(500),
	ADD COLUMN herbCollector VARCHAR(500),
	ADD COLUMN herbCollectionNumber VARCHAR(500),
	ADD COLUMN herbVernacular VARCHAR(500),
	ADD COLUMN herbCollectionDateUgly VARCHAR(500),
	ADD COLUMN herbCollectionDateGood VARCHAR(15),
	ADD COLUMN herbVoucherLocations VARCHAR(500),
	ADD COLUMN herbSheetScanNumber VARCHAR(50),
	ADD COLUMN herbAccessionNumber VARCHAR(500),
	ADD COLUMN herbPlantDescription VARCHAR(5000),
	ADD COLUMN herbReproductive VARCHAR(500),
	ADD COLUMN herbType VARCHAR(500),
	ADD COLUMN herbLocationInfo VARCHAR(5000),
	ADD COLUMN herbHabitat VARCHAR(5000),
	ADD COLUMN herbStateDepProv VARCHAR(500),
	ADD COLUMN herbCountry VARCHAR(500),
	ADD COLUMN herbOnLoan VARCHAR(250),
	ADD COLUMN herbDateLoanedOut VARCHAR(25),
	ADD COLUMN herbDateReturned VARCHAR(25),
	ADD COLUMN herbNotes VARCHAR(25),
	ADD COLUMN GPS VARCHAR(5000),
	ADD COLUMN Latitude VARCHAR(500),
	ADD COLUMN Longitude VARCHAR(500),
	ADD COLUMN Elevation VARCHAR(500),
	ADD COLUMN LatLongEstAccuracy VARCHAR(500),
	ADD COLUMN LatLongEstNotes VARCHAR(500),
	ADD COLUMN Notes VARCHAR(5000);

UPDATE collectiondata c1, herbarium h1
	SET c1.herbGenus = h1.HerbGenus
	WHERE c1.ID = h1.fk_herbarium_collection_ID;


	UPDATE collectiondata c1, herbarium h1 
 SET c1.herbSpecies = h1.HerbSpecies  
 WHERE c1.ID = h1.fk_herbarium_collection_ID;
	UPDATE collectiondata c1, herbarium h1 
 SET c1.herbSpeciesAuthority = h1.HerbSpeciesAuthority  
 WHERE c1.ID = h1.fk_herbarium_collection_ID;
	UPDATE collectiondata c1, herbarium h1 
 SET c1.herbSubspVar = h1.HerbSubspVar  
 WHERE c1.ID = h1.fk_herbarium_collection_ID;
	UPDATE collectiondata c1, herbarium h1 
 SET c1.herbSubspeciesAuthority = h1.HerbSubspeciesAuthority  
 WHERE c1.ID = h1.fk_herbarium_collection_ID;
	UPDATE collectiondata c1, herbarium h1 
 SET c1.herbDeterminedBy = h1.DeterminedBy  
 WHERE c1.ID = h1.fk_herbarium_collection_ID;
	UPDATE collectiondata c1, herbarium h1 
 SET c1.herbariumCollection = h1.HerbariumCollection  
 WHERE c1.ID = h1.fk_herbarium_collection_ID;
	UPDATE collectiondata c1, herbarium h1 
 SET c1.herbCollector = h1.Collector  
 WHERE c1.ID = h1.fk_herbarium_collection_ID;
	UPDATE collectiondata c1, herbarium h1 
 SET c1.herbCollectionNumber = h1.CollectionNumber  
 WHERE c1.ID = h1.fk_herbarium_collection_ID;
	UPDATE collectiondata c1, herbarium h1 
 SET c1.herbVernacular = h1.Vernacular  
 WHERE c1.ID = h1.fk_herbarium_collection_ID;
	UPDATE collectiondata c1, herbarium h1 
 SET c1.herbCollectionDateUgly = h1.CollectionDate  
 WHERE c1.ID = h1.fk_herbarium_collection_ID;
	UPDATE collectiondata c1, herbarium h1 
 SET c1.herbCollectionDateGood = h1.CollectionDateGood  
 WHERE c1.ID = h1.fk_herbarium_collection_ID;
	UPDATE collectiondata c1, herbarium h1 
 SET c1.herbVoucherLocations = h1.VoucherLocations  
 WHERE c1.ID = h1.fk_herbarium_collection_ID;
	UPDATE collectiondata c1, herbarium h1 
 SET c1.herbSheetScanNumber = h1.SheetScanNumber  
 WHERE c1.ID = h1.fk_herbarium_collection_ID;
	UPDATE collectiondata c1, herbarium h1 
 SET c1.herbAccessionNumber = h1.AccessionNumber  
 WHERE c1.ID = h1.fk_herbarium_collection_ID;
	UPDATE collectiondata c1, herbarium h1 
 SET c1.herbPlantDescription = h1.PlantDescription  
 WHERE c1.ID = h1.fk_herbarium_collection_ID;
	UPDATE collectiondata c1, herbarium h1 
 SET c1.herbReproductive = h1.Reproductive  
 WHERE c1.ID = h1.fk_herbarium_collection_ID;
	UPDATE collectiondata c1, herbarium h1 
 SET c1.herbType = h1.Type  
 WHERE c1.ID = h1.fk_herbarium_collection_ID;
	UPDATE collectiondata c1, herbarium h1 
 SET c1.herbLocationInfo = h1.LocationInfo  
 WHERE c1.ID = h1.fk_herbarium_collection_ID;
	UPDATE collectiondata c1, herbarium h1 
 SET c1.Elevation = h1.Elevation  
 WHERE c1.ID = h1.fk_herbarium_collection_ID;
	UPDATE collectiondata c1, herbarium h1 
 SET c1.herbHabitat = h1.Habitat  
 WHERE c1.ID = h1.fk_herbarium_collection_ID;
	UPDATE collectiondata c1, herbarium h1 
 SET c1.herbStateDepProv = h1.StateDepProv  
 WHERE c1.ID = h1.fk_herbarium_collection_ID;
	UPDATE collectiondata c1, herbarium h1 
 SET c1.herbCountry = h1.Country  
 WHERE c1.ID = h1.fk_herbarium_collection_ID;
	UPDATE collectiondata c1, herbarium h1 
 SET c1.herbOnLoan = h1.OnLoan  
 WHERE c1.ID = h1.fk_herbarium_collection_ID;
	UPDATE collectiondata c1, herbarium h1 
 SET c1.herbDateLoanedOut = h1.DateLoanedOut  
 WHERE c1.ID = h1.fk_herbarium_collection_ID;
	UPDATE collectiondata c1, herbarium h1 
 SET c1.herbDateReturned = h1.DateReturned  
 WHERE c1.ID = h1.fk_herbarium_collection_ID;
	
	UPDATE collectiondata c1, herbarium h1 
	SET c1.herbNotes = h1.Notes 
 WHERE c1.ID = h1.fk_herbarium_collection_ID;


UPDATE collectiondata c1, geospatial g1

 SET c1.GPS = g1.GPS  
 WHERE c1.ID = h1.fk_herbarium_collection_ID;

UPDATE collectiondata c1, geospatial g1 
 SET c1.Latitude = g1.Latitude  
 WHERE c1.ID = g1.fk_geospatial_collection_ID;
UPDATE collectiondata c1, geospatial g1 
 SET c1.Longitude = g1.Longitude  
 WHERE c1.ID = g1.fk_geospatial_collection_ID;
UPDATE collectiondata c1, geospatial g1 
 SET c1.LatLongEstAccuracy = g1.LatLongEstAccuracy  
 WHERE c1.ID = g1.fk_geospatial_collection_ID;
UPDATE collectiondata c1, geospatial g1 
SET c1.LatLongEstNotes = g1.LatLongEstNotes 
 WHERE c1.ID = g1.fk_geospatial_collection_ID;

#DROP TABLE herbarium, geospatial;