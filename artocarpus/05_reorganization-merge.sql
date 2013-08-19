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
	ADD COLUMN herbOnLoan
	ADD COLUMN herbDateLoanedOut
	ADD COLUMN herbDateReturned
	ADD COLUMN herbNotes
	ADD COLUMN GPS VARCHAR(5000),
	ADD COLUMN Latitude VARCHAR(500),
	ADD COLUMN Longitude VARCHAR(500),
	ADD COLUMN Elevation VARCHAR(500),
	ADD COLUMN LatLongEstAccuracy VARCHAR(500),
	ADD COLUMN LatLongEstNotes VARCHAR(500),
	ADD COLUMN Notes VARCHAR(5000),
	ADD COLUMN Project VARCHAR(500) ;

UPDATE collectiondata as c1, herbarium as h1
	SET c1.herbGenus = h1.HerbGenus,
	c1.herbSpecies = h1.HerbSpecies ,
	c1.herbSpeciesAuthority = h1.HerbSpeciesAuthority ,
	c1.herbSubspVar = h1.HerbSubspVar ,
	c1.herbSubspeciesAuthority = h1.HerbSubspeciesAuthority ,
	c1.herbDeterminedBy = h1.DeterminedBy ,
	c1.herbariumCollection = h1.HerbariumCollection ,
	c1.herbCollector = h1.Collector ,
	c1.herbCollectionNumber = h1.CollectionNumber ,
	c1.herbVernacular = h1.Vernacular ,
	c1.herbCollectionDateUgly = h1.CollectionDate ,
	c1.herbCollectionDateGood = h1.CollectionDateGood ,
	c1.herbVoucherLocations = h1.VoucherLocations ,
	c1.herbSheetScanNumber = h1.SheetScanNumber ,
	c1.herbAccessionNumber = h1.AccessionNumber ,
	c1.herbPlantDescription = h1.PlantDescription ,
	c1.herbReproductive = h1.Reproductive ,
	c1.herbType = h1.Type ,
	c1.herbLocationInfo = h1.LocationInfo ,
	c1.herbElevation = h1.Elevation ,
	c1.herbHabitat = h1.Habitat ,
	c1.herbStateDepProv = h1.StateDepProv ,
	c1.herbCountry = h1.Country ,
	c1.herbOnLoan = h1.OnLoan ,
	c1.herbDateLoanedOut = h1.DateLoanedOut ,
	c1.herbDateReturned = h1.DateReturned ,
	c1.herbNotes = h1.Notes ;

UPDATE collectiondata as c1, geospatial as g1
	SET c1.GPS = g1.GPS ,
	c1.Latitude = g1.Latitude ,
	c1.Longitude = g1.Longitude ,
	c1.LatLongEstAccuracy = g1.LatLongEstAccuracy ,
	c1.LatLongEstNotes = g1.LatLongEstNotes ;

#DROP TABLE herbarium, geospatial;